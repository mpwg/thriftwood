# Data Models Specification

## Core Data Structures

### Profile System

#### Profile Entity
```json
{
  "id": "string (unique identifier)",
  "name": "string (display name)",
  "created": "datetime",
  "updated": "datetime",
  "services": {
    "radarr": "ServiceConfiguration",
    "sonarr": "ServiceConfiguration", 
    "lidarr": "ServiceConfiguration",
    "nzbget": "ServiceConfiguration",
    "sabnzbd": "ServiceConfiguration",
    "tautulli": "ServiceConfiguration",
    "overseerr": "ServiceConfiguration"
  },
  "settings": {
    "theme": "string (midnight|amoled)",
    "language": "string (default: en)",
    "notifications": "NotificationSettings"
  }
}
```

#### Service Configuration
```json
{
  "enabled": "boolean",
  "host": "string (URL)",
  "apiKey": "string (encrypted)",
  "username": "string (optional)",
  "password": "string (encrypted, optional)",
  "customHeaders": "object (key-value pairs)",
  "testConnection": "boolean",
  "ssl": {
    "enabled": "boolean",
    "validateCertificate": "boolean",
    "customCA": "string (optional)"
  }
}
```

### Media Management Data Models

#### Radarr (Movie Management)

##### Movie Entity
```json
{
  "id": "integer",
  "title": "string",
  "originalTitle": "string",
  "sortTitle": "string",
  "overview": "string",
  "year": "integer",
  "runtime": "integer (minutes)",
  "certification": "string",
  "genres": "array[string]",
  "tags": "array[integer]",
  "ratings": {
    "imdb": "Rating",
    "tmdb": "Rating", 
    "rottenTomatoes": "Rating"
  },
  "externalIds": {
    "imdbId": "string",
    "tmdbId": "integer",
    "titleSlug": "string"
  },
  "images": "array[Image]",
  "path": "string",
  "folderName": "string",
  "qualityProfileId": "integer",
  "minimumAvailability": "string (announced|inCinemas|released|preDB)",
  "monitored": "boolean",
  "hasFile": "boolean",
  "movieFile": "MovieFile (optional)",
  "sizeOnDisk": "integer (bytes)",
  "status": "string",
  "collection": "Collection (optional)",
  "releaseInfo": {
    "inCinemas": "datetime",
    "digitalRelease": "datetime", 
    "physicalRelease": "datetime"
  },
  "statistics": {
    "sizeOnDisk": "integer",
    "releaseGroupCount": "integer"
  }
}
```

##### Quality Profile
```json
{
  "id": "integer",
  "name": "string",
  "upgradeAllowed": "boolean",
  "cutoff": "integer",
  "items": "array[QualityItem]"
}
```

##### Quality Item
```json
{
  "id": "integer",
  "name": "string",
  "source": "string (bluray|web|dvd|television)",
  "resolution": "integer",
  "allowed": "boolean"
}
```

##### Movie File
```json
{
  "id": "integer",
  "movieId": "integer",
  "relativePath": "string",
  "path": "string",
  "size": "integer (bytes)",
  "dateAdded": "datetime",
  "quality": "Quality",
  "mediaInfo": "MediaInfo",
  "originalFilePath": "string"
}
```

##### Release Entity
```json
{
  "guid": "string",
  "quality": "Quality",
  "qualityWeight": "integer",
  "age": "integer (days)",
  "ageHours": "number",
  "ageMinutes": "number",
  "size": "integer (bytes)",
  "indexerId": "integer",
  "indexer": "string",
  "releaseGroup": "string",
  "title": "string",
  "fullSeason": "boolean",
  "sceneSource": "boolean",
  "releaseWeight": "integer",
  "downloadUrl": "string",
  "infoUrl": "string",
  "approved": "boolean",
  "temporarilyRejected": "boolean",
  "rejected": "boolean",
  "rejections": "array[string]",
  "publishDate": "datetime"
}
```

#### Sonarr (TV Series Management)

##### Series Entity
```json
{
  "id": "integer",
  "title": "string",
  "alternateTitles": "array[AlternateTitle]",
  "sortTitle": "string",
  "overview": "string",
  "status": "string (continuing|ended|upcoming|deleted)",
  "ended": "boolean",
  "network": "string",
  "airTime": "string",
  "images": "array[Image]",
  "originalLanguage": "Language",
  "seasons": "array[Season]",
  "year": "integer",
  "path": "string",
  "qualityProfileId": "integer",
  "languageProfileId": "integer",
  "seasonFolder": "boolean",
  "monitored": "boolean",
  "useSceneNumbering": "boolean",
  "runtime": "integer (minutes)",
  "tvdbId": "integer",
  "tvRageId": "integer",
  "tvMazeId": "integer",
  "imdbId": "string",
  "titleSlug": "string",
  "certification": "string",
  "genres": "array[string]",
  "tags": "array[integer]",
  "added": "datetime",
  "ratings": "Ratings",
  "statistics": {
    "seasonCount": "integer",
    "episodeFileCount": "integer",
    "episodeCount": "integer",
    "totalEpisodeCount": "integer",
    "sizeOnDisk": "integer",
    "percentOfEpisodes": "number"
  }
}
```

##### Season Entity
```json
{
  "seasonNumber": "integer",
  "monitored": "boolean",
  "statistics": {
    "episodeFileCount": "integer",
    "episodeCount": "integer",
    "totalEpisodeCount": "integer",
    "sizeOnDisk": "integer",
    "percentOfEpisodes": "number",
    "previousAiring": "datetime",
    "nextAiring": "datetime"
  }
}
```

##### Episode Entity
```json
{
  "id": "integer",
  "seriesId": "integer",
  "tvdbId": "integer",
  "episodeFileId": "integer",
  "seasonNumber": "integer",
  "episodeNumber": "integer",
  "title": "string",
  "airDate": "date",
  "airDateUtc": "datetime",
  "overview": "string",
  "hasFile": "boolean",
  "monitored": "boolean",
  "absoluteEpisodeNumber": "integer",
  "sceneAbsoluteEpisodeNumber": "integer",
  "sceneEpisodeNumber": "integer",
  "sceneSeasonNumber": "integer",
  "unverifiedSceneNumbering": "boolean",
  "series": "Series",
  "episodeFile": "EpisodeFile"
}
```

#### Lidarr (Music Management)

##### Artist Entity
```json
{
  "id": "integer",
  "nameSlug": "string",
  "name": "string",
  "sortName": "string",
  "overview": "string",
  "disambiguation": "string",
  "artistType": "string",
  "status": "string",
  "images": "array[Image]",
  "path": "string",
  "qualityProfileId": "integer",
  "metadataProfileId": "integer",
  "monitored": "boolean",
  "rootFolderPath": "string",
  "genres": "array[string]",
  "cleanName": "string",
  "tags": "array[integer]",
  "added": "datetime",
  "ratings": "Ratings",
  "statistics": {
    "albumCount": "integer",
    "trackFileCount": "integer",
    "trackCount": "integer",
    "totalTrackCount": "integer",
    "sizeOnDisk": "integer",
    "percentOfTracks": "number"
  }
}
```

##### Album Entity
```json
{
  "id": "integer",
  "title": "string",
  "disambiguation": "string",
  "overview": "string",
  "artistId": "integer",
  "foreignAlbumId": "string",
  "monitored": "boolean",
  "anyReleaseOk": "boolean",
  "profileId": "integer",
  "duration": "integer",
  "albumType": "string",
  "releases": "array[Release]",
  "genres": "array[string]",
  "media": "array[Medium]",
  "artist": "Artist",
  "images": "array[Image]",
  "links": "array[Link]",
  "statistics": {
    "trackFileCount": "integer",
    "trackCount": "integer",
    "totalTrackCount": "integer",
    "sizeOnDisk": "integer",
    "percentOfTracks": "number"
  },
  "releaseDate": "date",
  "ratings": "Ratings",
  "cleanTitle": "string",
  "tags": "array[integer]"
}
```

### Download Client Data Models

#### NZBGet Queue Item
```json
{
  "nzbId": "integer",
  "nzbName": "string",
  "filename": "string",
  "destDir": "string",
  "finalDir": "string",
  "category": "string",
  "totalMB": "integer",
  "remainingMB": "integer",
  "downloadedMB": "integer",
  "downloadRate": "integer (KB/s)",
  "status": "string",
  "priority": "integer",
  "estimatedTimeLeft": "integer (seconds)",
  "postTotalTimeSec": "integer",
  "postStageTimeSec": "integer",
  "postStageProgress": "integer (%)",
  "parameters": "array[Parameter]"
}
```

#### SABnzbd Queue Item
```json
{
  "nzoId": "string",
  "name": "string",
  "filename": "string",
  "mbleft": "number (MB)",
  "mb": "number (MB)",
  "size": "string (formatted)",
  "sizeleft": "string (formatted)",
  "percentage": "string",
  "mbpermin": "number",
  "eta": "string (formatted time)",
  "priority": "string (High|Normal|Low|Paused)",
  "status": "string",
  "timeleft": "string",
  "category": "string",
  "unpackopts": "integer",
  "script": "string"
}
```

### Monitoring Data Models

#### Tautulli Activity
```json
{
  "sessionKey": "integer",
  "sessionId": "string", 
  "userId": "integer",
  "userName": "string",
  "userThumb": "string",
  "friendlyName": "string",
  "player": "string",
  "platform": "string",
  "platformName": "string",
  "product": "string",
  "productVersion": "string",
  "ipAddress": "string",
  "mediaType": "string (movie|episode|track)",
  "ratingKey": "integer",
  "parentRatingKey": "integer",
  "grandparentRatingKey": "integer",
  "title": "string",
  "parentTitle": "string",
  "grandparentTitle": "string",
  "originalTitle": "string",
  "sortTitle": "string",
  "mediaIndex": "integer",
  "parentMediaIndex": "integer",
  "studio": "string",
  "contentRating": "string",
  "summary": "string",
  "tagline": "string",
  "rating": "number",
  "ratingImage": "string",
  "audienceRating": "number",
  "audienceRatingImage": "string",
  "userRating": "integer",
  "duration": "integer (ms)",
  "viewOffset": "integer (ms)",
  "transcodeDecision": "string (directplay|copy|transcode)",
  "width": "integer",
  "height": "integer",
  "container": "string",
  "videoCodec": "string",
  "videoResolution": "string",
  "videoFramerate": "string",
  "aspectRatio": "string",
  "videoProfile": "string",
  "audioCodec": "string",
  "audioChannels": "integer",
  "audioProfile": "string",
  "optimizedVersion": "integer",
  "channelStream": "integer",
  "subtitleCodec": "string",
  "stream": "string",
  "optimizedVersionProfile": "string",
  "optimizedVersionTitle": "string",
  "syncedVersion": "integer",
  "syncedVersionProfile": "string",
  "sourceMedia": "string",
  "state": "string (playing|paused|buffering|stopped)",
  "progressPercent": "integer",
  "etaStr": "string",
  "downloadedPercent": "integer",
  "throttled": "integer",
  "bandwidthKbps": "integer"
}
```

### Search and Indexer Models

#### Newznab Category
```json
{
  "id": "integer",
  "name": "string",
  "description": "string",
  "subcategories": "array[NewznabSubcategory]"
}
```

#### Search Result
```json
{
  "title": "string",
  "link": "string",
  "size": "integer (bytes)",
  "category": "integer",
  "date": "datetime",
  "description": "string",
  "comments": "integer",
  "downloadUrl": "string",
  "indexer": "string",
  "guid": "string"
}
```

### System Data Models

#### Application Settings
```json
{
  "appearance": {
    "theme": "string (midnight|amoled)",
    "accentColor": "string (hex)",
    "amoledBorder": "boolean",
    "navbarHeight": "integer"
  },
  "behavior": {
    "clearLogs": "boolean",
    "enableFirebase": "boolean"
  },
  "networking": {
    "requestTimeout": "integer (seconds)",
    "validateSSL": "boolean"
  }
}
```

#### Log Entry
```json
{
  "id": "string (uuid)",
  "timestamp": "datetime",
  "level": "string (debug|info|warning|error|critical)",
  "message": "string",
  "error": "string (optional)",
  "stackTrace": "string (optional)",
  "module": "string (optional)",
  "metadata": "object (optional)"
}
```

#### External Module
```json
{
  "id": "string (uuid)",
  "displayName": "string",
  "host": "string (URL)",
  "headers": "object (key-value pairs)",
  "enabled": "boolean"
}
```

### Notification Models

#### Webhook Event
```json
{
  "eventType": "string (download|grab|health|rename|test)",
  "service": "string (radarr|sonarr|lidarr)",
  "timestamp": "datetime",
  "data": "object (service-specific payload)",
  "processed": "boolean"
}
```

#### Push Notification
```json
{
  "id": "string",
  "title": "string",
  "body": "string",
  "icon": "string (optional)",
  "data": "object (optional)",
  "actions": "array[NotificationAction] (optional)"
}
```

### Validation Rules

#### Data Constraints
- **URLs**: Must be valid HTTP/HTTPS URLs
- **API Keys**: Non-empty strings, encrypted at rest
- **File Paths**: Valid file system paths for target platform
- **Dates**: ISO 8601 datetime format
- **IDs**: Positive integers or UUID strings
- **Sizes**: Non-negative integers in bytes
- **Percentages**: 0-100 integer range
- **Ratings**: 0.0-10.0 decimal range

#### Business Rules
- **Profile Names**: Must be unique within application
- **Service Configuration**: Host and API key required for enabled services
- **Media Monitoring**: Cannot monitor items without valid quality profiles
- **Download Priorities**: Must be within service-defined ranges
- **File Operations**: Require valid file paths and permissions

### Data Migration Schema

#### Migration Information
```json
{
  "version": "string (semantic version)",
  "timestamp": "datetime",
  "description": "string",
  "changes": "array[MigrationChange]"
}
```

#### Migration Change
```json
{
  "type": "string (add|remove|modify|rename)",
  "entity": "string (table/collection name)",
  "field": "string (optional)",
  "oldValue": "any (optional)",
  "newValue": "any (optional)",
  "required": "boolean"
}
```

This comprehensive data model specification provides the foundation for implementing consistent data structures across any technology stack while maintaining type safety and data integrity.