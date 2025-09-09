# Radarr Integration Specification

## Overview

Radarr is a movie management service that automatically monitors, downloads, and organizes movies. This specification defines the integration requirements for implementing Radarr functionality in the Thitftwood application.

## Service Configuration

### Connection Requirements
- **API Version**: v3 minimum required
- **Base URL**: `{host}/api/v3/` (with automatic trailing slash handling)
- **Authentication**: API key passed as query parameter `?apikey={key}`
- **Protocol**: HTTPS recommended, HTTP supported with warnings
- **Custom Headers**: Optional user-defined headers for proxy/authentication

### Configuration Schema
```json
{
  "enabled": "boolean",
  "host": "string (URL with optional path)",
  "apiKey": "string (minimum 32 characters)",
  "customHeaders": {
    "header-name": "string value"
  },
  "ssl": {
    "validateCertificate": "boolean",
    "customCA": "string (PEM certificate, optional)"
  },
  "connection": {
    "timeout": "integer (seconds, default: 10)",
    "retries": "integer (default: 3)",
    "retryDelay": "integer (seconds, default: 1)"
  }
}
```

## Core Functionality

### Movie Management

#### Add Movie Operation
**Purpose**: Add a new movie to the Radarr library for monitoring and downloading.

**Input Parameters**:
- Movie metadata (title, year, TMDB ID, etc.)
- Quality profile ID (required)
- Root folder path (required)  
- Minimum availability setting (announced|inCinemas|released|preDB)
- Monitoring enabled flag (default: true)
- Search for movie flag (default: false)

**API Mapping**:
```
POST /api/v3/movie
Body: {
  title: string,
  year: number,
  tmdbId: number,
  qualityProfileId: number,
  rootFolderPath: string,
  minimumAvailability: string,
  monitored: boolean,
  searchForMovie: boolean
}
```

**Business Rules**:
- Cannot add duplicate movies (same TMDB ID)
- Quality profile must exist and be valid
- Root folder must be accessible and have sufficient space
- Minimum availability affects when movie becomes eligible for download

#### Remove Movie Operation  
**Purpose**: Remove movie from library with optional file deletion.

**Input Parameters**:
- Movie ID (required)
- Delete files flag (default: false)
- Add exclusion flag (default: false)

**API Mapping**:
```
DELETE /api/v3/movie/{id}?deleteFiles={bool}&addImportExclusion={bool}
```

**Business Rules**:
- Deleting files is irreversible
- Exclusion prevents accidental re-adding
- Active downloads should be cancelled before deletion

#### Update Movie Operation
**Purpose**: Modify existing movie settings including monitoring and quality.

**Input Parameters**:
- Movie ID (required)
- Updated movie object with changes
- Move files flag (if path changed)

**API Mapping**:
```
PUT /api/v3/movie/{id}?moveFiles={bool}
Body: Updated movie object
```

**Business Rules**:
- Path changes require move files confirmation
- Quality profile changes may trigger upgrade searches
- Monitoring changes affect future availability checks

### Search Operations

#### Manual Search
**Purpose**: Manually search for releases for a specific movie.

**Input Parameters**:
- Movie ID (required)

**API Mapping**:
```
POST /api/v3/command
Body: {
  name: "MoviesSearch",
  movieIds: [number]
}
```

**Business Rules**:
- Searches all configured indexers
- Results filtered by quality profile
- Only monitored movies eligible for automatic grab

#### Missing Movies Search
**Purpose**: Search for all monitored movies that are missing and available.

**API Mapping**:
```
POST /api/v3/command
Body: {
  name: "MissingMoviesSearch"
}
```

**Business Rules**:
- Only searches monitored movies
- Respects minimum availability settings
- Can be resource intensive - implement throttling

#### Interactive Search
**Purpose**: Present manual release selection interface to user.

**Input Parameters**:
- Movie ID (required)

**API Mapping**:
```
GET /api/v3/release?movieId={id}
```

**Business Rules**:
- Shows all available releases regardless of quality
- User must manually approve download
- Useful for troubleshooting failed automatic searches

### File Management

#### Manual Import
**Purpose**: Import downloaded movie files with quality selection.

**Input Parameters**:
- File paths (array of strings)
- Movie ID (optional, for specific mapping)
- Quality override (optional)
- Language override (optional)

**API Mapping**:
```
POST /api/v3/manualimport
Body: {
  files: [{
    path: string,
    movieId: number,
    quality: object,
    languages: array
  }]
}
```

**Business Rules**:
- Files must be accessible to Radarr
- Quality detection automatic unless overridden
- Existing files replaced if better quality

#### Refresh Movie
**Purpose**: Refresh movie metadata and scan for new files.

**Input Parameters**:
- Movie ID (required)

**API Mapping**:
```
POST /api/v3/command
Body: {
  name: "RefreshMovie",
  movieId: number
}
```

**Business Rules**:
- Updates metadata from TMDB/IMDb
- Scans for new files in movie folder
- May trigger quality upgrades if enabled

### Quality Management

#### Quality Profiles
**Purpose**: Manage quality preferences and upgrade rules.

**Data Structure**:
```json
{
  id: number,
  name: string,
  upgradeAllowed: boolean,
  cutoff: number,
  items: [{
    quality: {
      id: number,
      name: string,
      source: string,
      resolution: number
    },
    allowed: boolean
  }]
}
```

**API Mapping**:
```
GET /api/v3/qualityprofile
GET /api/v3/qualityprofile/{id}
POST /api/v3/qualityprofile
PUT /api/v3/qualityprofile/{id}
DELETE /api/v3/qualityprofile/{id}
```

**Business Rules**:
- At least one quality must be allowed
- Cutoff quality must be in allowed list
- Cannot delete profiles in use by movies

#### Root Folders
**Purpose**: Manage storage locations for movie libraries.

**Data Structure**:
```json
{
  id: number,
  path: string,
  accessible: boolean,
  freeSpace: number,
  unmappedFolders: array
}
```

**API Mapping**:
```
GET /api/v3/rootfolder
POST /api/v3/rootfolder
DELETE /api/v3/rootfolder/{id}
```

**Business Rules**:
- Paths must be writable by Radarr service
- Cannot delete folders containing movies
- Free space monitoring for storage alerts

### Queue Management

#### Queue Monitoring
**Purpose**: Monitor active downloads and post-processing.

**Data Structure**:
```json
{
  movieId: number,
  title: string,
  size: number,
  sizeleft: number,
  timeleft: string,
  estimatedCompletionTime: datetime,
  status: string,
  trackedDownloadStatus: string,
  downloadClient: string,
  downloadId: string,
  indexer: string,
  outputPath: string
}
```

**API Mapping**:
```
GET /api/v3/queue
DELETE /api/v3/queue/{id}
POST /api/v3/queue/grab/{id}
```

**Operations**:
- **Remove from Queue**: Cancel download and remove from queue
- **Blacklist**: Add release to blacklist and remove from queue  
- **Grab**: Force grab a specific release

### System Operations

#### Health Monitoring
**Purpose**: Monitor system health and configuration issues.

**Data Structure**:
```json
{
  source: string,
  type: string,
  message: string,
  wikiUrl: string
}
```

**API Mapping**:
```
GET /api/v3/health
```

**Health Types**:
- `error`: Critical issues requiring attention
- `warning`: Non-critical issues or recommendations
- `notice`: Informational messages

#### System Status
**Purpose**: Get system information and version details.

**Data Structure**:
```json
{
  version: string,
  buildTime: datetime,
  isDebug: boolean,
  isProduction: boolean,
  isAdmin: boolean,
  isUserInteractive: boolean,
  startupPath: string,
  appData: string,
  osName: string,
  osVersion: string,
  isNetCore: boolean,
  isMono: boolean,
  isLinux: boolean,
  isOsx: boolean,
  isWindows: boolean,
  branch: string,
  authentication: string,
  sqliteVersion: string,
  urlBase: string,
  runtimeVersion: string
}
```

**API Mapping**:
```
GET /api/v3/system/status
```

#### Backup Management
**Purpose**: Create and manage configuration backups.

**API Mapping**:
```
POST /api/v3/command
Body: {
  name: "Backup"
}
```

**Business Rules**:
- Backups include database and configuration
- Automatic cleanup of old backups
- Critical for disaster recovery

### Webhook Configuration

#### Event Types
- **Download**: Movie successfully downloaded and imported
- **Grab**: Movie grabbed by download client
- **Health**: System health status changes
- **MovieDelete**: Movie removed from library  
- **MovieFileDelete**: Movie file deleted
- **Rename**: Movie files renamed/organized
- **Test**: Webhook connection testing

#### Webhook Payload Example
```json
{
  "eventType": "Download",
  "movie": {
    "id": 1,
    "title": "Movie Title",
    "year": 2021,
    "releaseDate": "2021-01-01",
    "folderPath": "/movies/Movie Title (2021)"
  },
  "movieFile": {
    "id": 1,
    "relativePath": "Movie Title (2021).mkv",
    "path": "/movies/Movie Title (2021)/Movie Title (2021).mkv",
    "size": 1234567890,
    "quality": "Blu-ray 1080p",
    "qualityVersion": 1
  },
  "downloadClient": "SABnzbd",
  "downloadId": "abc123"
}
```

#### Webhook Configuration
```json
{
  "url": "https://notify.lunasea.app/v1/radarr/user/{firebase_uid}",
  "method": "POST",
  "username": "{profile_name}",
  "password": "{webhook_password}",
  "events": ["Download", "Grab", "Health"],
  "includeHealthWarnings": false
}
```

### Error Handling

#### API Error Responses
```json
{
  "message": "Error description",
  "description": "Detailed error information",
  "validationErrors": [{
    "propertyName": "fieldName",
    "errorMessage": "Validation error",
    "attemptedValue": "invalid_value"
  }]
}
```

#### Common Error Scenarios
1. **Authentication Failures**: Invalid API key or expired credentials
2. **Network Issues**: Connection timeouts, DNS resolution failures
3. **Configuration Errors**: Invalid quality profiles, missing root folders
4. **Resource Conflicts**: Duplicate additions, file system permissions
5. **Service Unavailable**: Radarr offline, database locked, maintenance mode

#### Retry Logic
- **Network Errors**: Exponential backoff with 3 retry attempts
- **Rate Limiting**: Honor 429 responses with retry-after header
- **Server Errors**: Retry 5xx errors, fail fast on 4xx errors
- **Timeout Handling**: Increase timeout for large operations

### Performance Considerations

#### Caching Strategy
- **Movie List**: Cache with 5-minute TTL, invalidate on changes
- **Quality Profiles**: Cache indefinitely, invalidate on configuration changes
- **System Status**: Cache with 1-minute TTL for health monitoring
- **Queue Data**: No caching due to frequent updates

#### Optimization Techniques
- **Pagination**: Use page size limits for large movie libraries (50-100 items)
- **Filtering**: Apply server-side filters before client processing
- **Batch Operations**: Group multiple operations when possible
- **Lazy Loading**: Load detailed data only when needed

### Security Considerations

#### API Key Management
- Store API keys encrypted at rest
- Transmit API keys securely (HTTPS only)
- Provide key rotation capabilities
- Log authentication failures for monitoring

#### Input Validation
- Validate all user inputs before API submission
- Sanitize file paths and folder names
- Check URL formats and protocols
- Validate quality profile selections

#### Data Protection
- Never log sensitive information (API keys, file paths)
- Respect user privacy in error reporting
- Secure communication channels (HTTPS/TLS)
- Regular security audits of integration code

This specification provides comprehensive coverage of Radarr integration requirements while remaining technology-agnostic and suitable for implementation in any programming language or framework.