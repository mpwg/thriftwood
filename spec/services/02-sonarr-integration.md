# Sonarr Integration Specification

## Overview

Sonarr is a TV series management service that automatically monitors, downloads, and organizes television shows and episodes. This specification defines the integration requirements for implementing Sonarr functionality in the Thitftwood application.

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

### Series Management

#### Add Series Operation
**Purpose**: Add a new TV series to the Sonarr library for monitoring and downloading.

**Input Parameters**:
- Series metadata (title, TVDB ID, year, etc.)
- Quality profile ID (required)
- Language profile ID (required)
- Root folder path (required)
- Series type (standard|anime|daily)
- Monitor type (all|future|missing|existing|pilot|firstSeason|latestSeason|none)
- Season folder organization (default: true)
- Search for cutoff unmet (default: false)

**API Mapping**:
```
POST /api/v3/series
Body: {
  title: string,
  tvdbId: number,
  year: number,
  qualityProfileId: number,
  languageProfileId: number,
  rootFolderPath: string,
  seriesType: string,
  monitored: boolean,
  monitor: string,
  seasonFolder: boolean,
  searchForCutoffUnmetEpisodes: boolean,
  searchForMissingEpisodes: boolean
}
```

**Business Rules**:
- Cannot add duplicate series (same TVDB ID)
- Quality and language profiles must exist and be valid
- Root folder must be accessible and have sufficient space
- Monitor type determines which episodes are automatically tracked

#### Remove Series Operation
**Purpose**: Remove series from library with optional file deletion.

**Input Parameters**:
- Series ID (required)
- Delete files flag (default: false)
- Add exclusion flag (default: false)

**API Mapping**:
```
DELETE /api/v3/series/{id}?deleteFiles={bool}&addImportExclusion={bool}
```

**Business Rules**:
- Deleting files removes entire series folder
- Exclusion prevents accidental re-adding
- Active downloads should be cancelled before deletion

#### Update Series Operation
**Purpose**: Modify existing series settings including monitoring and quality.

**Input Parameters**:
- Series ID (required)
- Updated series object with changes
- Move files flag (if path changed)

**API Mapping**:
```
PUT /api/v3/series/{id}?moveFiles={bool}
Body: Updated series object
```

**Business Rules**:
- Path changes require move files confirmation
- Quality profile changes may trigger upgrade searches
- Monitoring changes affect future episode availability

### Episode Management

#### Episode Details
**Purpose**: Get detailed episode information including file status.

**Data Structure**:
```json
{
  id: number,
  seriesId: number,
  tvdbId: number,
  episodeFileId: number,
  seasonNumber: number,
  episodeNumber: number,
  title: string,
  airDate: string,
  airDateUtc: datetime,
  overview: string,
  hasFile: boolean,
  monitored: boolean,
  absoluteEpisodeNumber: number,
  sceneEpisodeNumber: number,
  sceneSeasonNumber: number,
  unverifiedSceneNumbering: boolean,
  episodeFile: {
    id: number,
    seriesId: number,
    seasonNumber: number,
    relativePath: string,
    path: string,
    size: number,
    dateAdded: datetime,
    quality: object,
    mediaInfo: object
  }
}
```

**API Mapping**:
```
GET /api/v3/episode
GET /api/v3/episode/{id}
PUT /api/v3/episode/{id}
```

#### Toggle Episode Monitoring
**Purpose**: Enable or disable monitoring for specific episodes.

**Input Parameters**:
- Episode ID or array of episode IDs
- Monitored status (boolean)

**API Mapping**:
```
PUT /api/v3/episode/{id}
Body: { monitored: boolean }

PUT /api/v3/episode/monitor
Body: {
  episodeIds: [number],
  monitored: boolean
}
```

**Business Rules**:
- Unmonitored episodes won't be automatically downloaded
- Can monitor individual episodes or entire seasons
- Monitoring changes take effect on next availability check

#### Delete Episode Files
**Purpose**: Delete episode files while preserving series entry.

**Input Parameters**:
- Episode file ID or array of episode file IDs

**API Mapping**:
```
DELETE /api/v3/episodefile/{id}
DELETE /api/v3/episodefile/bulk
Body: { episodeFileIds: [number] }
```

**Business Rules**:
- File deletion is irreversible
- Episode entry remains for future monitoring
- Bulk operations support multiple episode deletions

### Season Management

#### Season Overview
**Purpose**: Get season-level statistics and monitoring status.

**Data Structure**:
```json
{
  seasonNumber: number,
  monitored: boolean,
  statistics: {
    episodeFileCount: number,
    episodeCount: number,
    totalEpisodeCount: number,
    sizeOnDisk: number,
    percentOfEpisodes: number,
    previousAiring: datetime,
    nextAiring: datetime
  }
}
```

**API Mapping**:
```
GET /api/v3/series/{id} (includes season data)
```

#### Toggle Season Monitoring
**Purpose**: Enable or disable monitoring for entire seasons.

**Input Parameters**:
- Series ID (required)
- Season number (required)
- Monitored status (boolean)

**API Mapping**:
```
PUT /api/v3/series/{id}
Body: {
  seasons: [{
    seasonNumber: number,
    monitored: boolean
  }]
}
```

**Business Rules**:
- Season monitoring affects all episodes in season
- Special seasons (season 0) handled separately
- Monitoring changes cascade to individual episodes

### Search Operations

#### Series Search
**Purpose**: Search for all monitored missing episodes in a series.

**Input Parameters**:
- Series ID (required)

**API Mapping**:
```
POST /api/v3/command
Body: {
  name: "SeriesSearch",
  seriesId: number
}
```

**Business Rules**:
- Only searches monitored episodes
- Respects cutoff quality settings
- Can be resource intensive for large series

#### Season Search
**Purpose**: Search for all monitored missing episodes in a specific season.

**Input Parameters**:
- Series ID (required)
- Season number (required)

**API Mapping**:
```
POST /api/v3/command
Body: {
  name: "SeasonSearch",
  seriesId: number,
  seasonNumber: number
}
```

**Business Rules**:
- Limited to specific season episodes
- Faster than full series search
- Useful for newly aired seasons

#### Episode Search
**Purpose**: Search for specific episode releases.

**Input Parameters**:
- Episode ID (required)

**API Mapping**:
```
POST /api/v3/command
Body: {
  name: "EpisodeSearch",
  episodeIds: [number]
}
```

**Business Rules**:
- Most granular search option
- Useful for troubleshooting specific episodes
- Can search multiple episodes simultaneously

#### Missing Episodes Search
**Purpose**: Search for all monitored missing episodes across all series.

**API Mapping**:
```
POST /api/v3/command
Body: {
  name: "MissingEpisodeSearch"
}
```

**Business Rules**:
- System-wide missing episode search
- Can be very resource intensive
- Should be used sparingly

#### Interactive Search
**Purpose**: Present manual release selection interface for episodes.

**Input Parameters**:
- Episode ID (required)

**API Mapping**:
```
GET /api/v3/release?episodeId={id}
```

**Business Rules**:
- Shows all available releases regardless of quality
- User must manually approve download
- Useful for troubleshooting failed automatic searches

### File Management

#### Manual Import
**Purpose**: Import downloaded episode files with quality and language selection.

**Input Parameters**:
- File paths (array of strings)
- Series ID (optional, for specific mapping)
- Season number (optional)
- Episode numbers (optional array)
- Quality override (optional)
- Language override (optional)

**API Mapping**:
```
POST /api/v3/manualimport
Body: {
  files: [{
    path: string,
    seriesId: number,
    seasonNumber: number,
    episodes: [number],
    quality: object,
    languages: array
  }]
}
```

**Business Rules**:
- Files must be accessible to Sonarr
- Quality and language detection automatic unless overridden
- Existing files replaced if better quality
- Supports multi-episode files

#### Refresh Series
**Purpose**: Refresh series metadata and scan for new files.

**Input Parameters**:
- Series ID (required)

**API Mapping**:
```
POST /api/v3/command
Body: {
  name: "RefreshSeries",
  seriesId: number
}
```

**Business Rules**:
- Updates metadata from TVDB/IMDb
- Scans for new episodes and files
- May trigger quality upgrades if enabled
- Updates episode air dates and titles

#### Rescan Series
**Purpose**: Scan series folder for new or changed files.

**Input Parameters**:
- Series ID (required)

**API Mapping**:
```
POST /api/v3/command
Body: {
  name: "RescanSeries",
  seriesId: number
}
```

**Business Rules**:
- Scans file system without metadata refresh
- Faster than full refresh
- Useful after manual file organization
- Updates file sizes and quality detection

### Quality and Language Management

#### Quality Profiles
**Purpose**: Manage quality preferences and upgrade rules for series.

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
  }],
  minFormatScore: number,
  cutoffFormatScore: number,
  formatItems: array
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

#### Language Profiles
**Purpose**: Manage language preferences for series.

**Data Structure**:
```json
{
  id: number,
  name: string,
  upgradeAllowed: boolean,
  cutoff: {
    id: number,
    name: string
  },
  languages: [{
    language: {
      id: number,
      name: string
    },
    allowed: boolean
  }]
}
```

**API Mapping**:
```
GET /api/v3/languageprofile
GET /api/v3/languageprofile/{id}
POST /api/v3/languageprofile
PUT /api/v3/languageprofile/{id}
DELETE /api/v3/languageprofile/{id}
```

#### Root Folders
**Purpose**: Manage storage locations for series libraries.

**Data Structure**:
```json
{
  id: number,
  path: string,
  accessible: boolean,
  freeSpace: number,
  unmappedFolders: [{
    name: string,
    path: string
  }]
}
```

**API Mapping**:
```
GET /api/v3/rootfolder
POST /api/v3/rootfolder
DELETE /api/v3/rootfolder/{id}
```

### Queue Management

#### Queue Monitoring
**Purpose**: Monitor active episode downloads and post-processing.

**Data Structure**:
```json
{
  seriesId: number,
  episodeId: number,
  language: object,
  quality: object,
  size: number,
  title: string,
  sizeleft: number,
  timeleft: string,
  estimatedCompletionTime: datetime,
  status: string,
  trackedDownloadStatus: string,
  statusMessages: array,
  downloadId: string,
  protocol: string,
  downloadClient: string,
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

### Calendar and Scheduling

#### Calendar View
**Purpose**: Get upcoming and recently aired episodes.

**Input Parameters**:
- Start date (optional, default: today - 7 days)
- End date (optional, default: today + 7 days)
- Include unmonitored (optional, default: false)

**Data Structure**:
```json
[{
  id: number,
  seriesId: number,
  tvdbId: number,
  episodeFileId: number,
  seasonNumber: number,
  episodeNumber: number,
  title: string,
  airDate: string,
  airDateUtc: datetime,
  overview: string,
  hasFile: boolean,
  monitored: boolean,
  series: {
    id: number,
    title: string,
    sortTitle: string,
    status: string,
    overview: string,
    network: string,
    airTime: string,
    images: array
  }
}]
```

**API Mapping**:
```
GET /api/v3/calendar?start={date}&end={date}&unmonitored={bool}
```

**Business Rules**:
- Default 14-day window (7 days past, 7 days future)
- Timezone handling for accurate air dates
- Supports filtering by series or monitoring status

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

**API Mapping**:
```
GET /api/v3/system/status
```

#### History Tracking
**Purpose**: Track episode download and processing history.

**Data Structure**:
```json
{
  episodeId: number,
  seriesId: number,
  sourceTitle: string,
  language: object,
  quality: object,
  date: datetime,
  eventType: string,
  data: object
}
```

**API Mapping**:
```
GET /api/v3/history?page={num}&pageSize={size}&sortKey={key}&sortDirection={asc|desc}
```

**Event Types**:
- `grabbed`: Episode grabbed by download client
- `downloadFolderImported`: Episode successfully imported
- `downloadFailed`: Download failed
- `episodeFileDeleted`: Episode file deleted
- `episodeFileRenamed`: Episode file renamed

### Webhook Configuration

#### Event Types
- **Download**: Episode successfully downloaded and imported
- **EpisodeFileDelete**: Episode file deleted  
- **Grab**: Episode grabbed by download client
- **Health**: System health status changes
- **Rename**: Episode files renamed/organized
- **SeriesDelete**: Series removed from library
- **Test**: Webhook connection testing

#### Webhook Payload Example
```json
{
  "eventType": "Download",
  "series": {
    "id": 1,
    "title": "Series Title",
    "path": "/tv/Series Title",
    "tvdbId": 12345
  },
  "episodes": [{
    "id": 1,
    "episodeNumber": 1,
    "seasonNumber": 1,
    "title": "Episode Title",
    "airDate": "2021-01-01",
    "hasFile": true
  }],
  "episodeFile": {
    "id": 1,
    "relativePath": "Season 01/Series Title - S01E01 - Episode Title.mkv",
    "path": "/tv/Series Title/Season 01/Series Title - S01E01 - Episode Title.mkv",
    "quality": "HDTV-720p",
    "qualityVersion": 1,
    "size": 1234567890
  },
  "downloadClient": "SABnzbd",
  "downloadId": "abc123"
}
```

#### Webhook Configuration
```json
{
  "url": "https://notify.lunasea.app/v1/sonarr/user/{firebase_uid}",
  "method": "POST",
  "username": "{profile_name}",
  "password": "{webhook_password}",
  "events": ["Download", "Grab", "Health"],
  "includeHealthWarnings": false
}
```

### Error Handling

#### Common Error Scenarios
1. **Authentication Failures**: Invalid API key or expired credentials
2. **Network Issues**: Connection timeouts, DNS resolution failures
3. **Configuration Errors**: Invalid quality/language profiles, missing root folders
4. **Resource Conflicts**: Duplicate additions, file system permissions
5. **Service Unavailable**: Sonarr offline, database locked, maintenance mode
6. **Episode Conflicts**: Scene numbering mismatches, duplicate episodes

#### Retry Logic
- **Network Errors**: Exponential backoff with 3 retry attempts
- **Rate Limiting**: Honor 429 responses with retry-after header
- **Server Errors**: Retry 5xx errors, fail fast on 4xx errors
- **Timeout Handling**: Increase timeout for large operations

### Performance Considerations

#### Caching Strategy
- **Series List**: Cache with 5-minute TTL, invalidate on changes
- **Episode Data**: Cache individual episodes with 1-minute TTL
- **Quality/Language Profiles**: Cache indefinitely, invalidate on changes
- **Calendar Data**: Cache with 15-minute TTL
- **Queue Data**: No caching due to frequent updates

#### Optimization Techniques
- **Pagination**: Use page size limits for large series libraries
- **Filtering**: Apply server-side filters before client processing
- **Lazy Loading**: Load episode details only when needed
- **Batch Operations**: Group multiple episode operations

### Security Considerations

#### Data Validation
- Validate episode and season numbers
- Check file paths for directory traversal
- Sanitize series titles and episode names
- Validate date formats and ranges

#### Access Control
- Respect Sonarr's authentication requirements
- Handle unauthorized access gracefully
- Log security-related events
- Implement proper session management

This specification provides comprehensive coverage of Sonarr integration requirements while remaining technology-agnostic and suitable for implementation in any programming language or framework.