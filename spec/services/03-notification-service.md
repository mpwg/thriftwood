# Notification Service Specification

## Overview

The notification service provides real-time push notifications for media management events across all integrated services. It acts as a centralized webhook receiver and push notification gateway, enabling users to receive instant updates on their mobile devices when media is downloaded, grabbed, or when system issues occur.

## Architecture Overview

### Service Components
1. **Webhook API**: Receives events from media services (Radarr, Sonarr, etc.)
2. **Push Notification Engine**: Sends notifications to mobile devices via Firebase FCM
3. **Device Management**: Manages user device registration and notification preferences
4. **Profile System**: Supports multiple user profiles with isolated notifications
5. **Caching Layer**: Redis-based caching for performance optimization

### Technology Requirements
- **Runtime**: Node.js 18+ with TypeScript support
- **Web Framework**: Express.js or equivalent HTTP framework
- **Push Service**: Firebase Cloud Messaging (FCM) or alternative push service
- **Caching**: Redis or equivalent key-value store
- **Database**: Firestore, MongoDB, or equivalent document database
- **Authentication**: Firebase Auth or equivalent identity provider

## API Specifications

### Base Configuration
```
Base URL: https://notify.{domain}/v1
Authentication: Basic Auth (profile:password)
Content-Type: application/json
```

### Supported Service Endpoints

#### Media Management Services
```
POST /radarr/user/{user_id}          # Send to all user devices
POST /radarr/device/{device_token}   # Send to specific device
POST /sonarr/user/{user_id}
POST /sonarr/device/{device_token}
POST /lidarr/user/{user_id}
POST /lidarr/device/{device_token}
```

#### Monitoring and Request Services
```
POST /tautulli/user/{user_id}
POST /tautulli/device/{device_token}
POST /overseerr/user/{user_id}
POST /overseerr/device/{device_token}
```

#### Generic Webhook
```
POST /custom/user/{user_id}
POST /custom/device/{device_token}
```

### Request Format

#### Headers
```
Authorization: Basic {base64(profile_name:password)}
Content-Type: application/json
```

#### Query Parameters
- `sound`: boolean (default: true) - Enable notification sound
- `interruption_level`: string (passive|active|time-sensitive) - iOS interruption level

#### Request Body
Service-specific JSON payload (see individual service specifications)

### Response Format

#### Success Response
```json
{
  "status": "success",
  "message": "Notification sent successfully",
  "recipients": 2,
  "timestamp": "2024-01-01T00:00:00Z"
}
```

#### Error Response
```json
{
  "status": "error",
  "message": "Failed to send notification",
  "error": "Invalid user ID or no registered devices",
  "timestamp": "2024-01-01T00:00:00Z"
}
```

## Event Processing

### Webhook Processing Flow
1. **Authentication**: Validate Basic Auth credentials
2. **Profile Extraction**: Extract profile name from username
3. **User Resolution**: Map profile to Firebase user ID
4. **Device Retrieval**: Get registered devices for user (cached)
5. **Payload Processing**: Parse service-specific event data
6. **Notification Building**: Create platform-specific notification
7. **Delivery**: Send via push notification service
8. **Response**: Return success/error status

### Event Types by Service

#### Radarr Events
- **Download**: Movie successfully downloaded and imported
- **Grab**: Movie grabbed by download client
- **Health**: System health status changes
- **MovieDelete**: Movie removed from library
- **MovieFileDelete**: Movie file deleted
- **Rename**: Movie files renamed/organized
- **Test**: Connection testing

#### Sonarr Events
- **Download**: Episode successfully downloaded and imported
- **EpisodeFileDelete**: Episode file deleted
- **Grab**: Episode grabbed by download client
- **Health**: System health status changes
- **Rename**: Episode files renamed/organized
- **SeriesDelete**: Series removed from library
- **Test**: Connection testing

#### Lidarr Events
- **Download**: Music downloaded and imported
- **Grab**: Music grabbed by download client
- **Health**: System health status changes
- **AlbumDelete**: Album removed from library
- **TrackFileDelete**: Music file deleted
- **Rename**: Music files renamed/organized
- **Test**: Connection testing

#### Tautulli Events
- **Playback Events**: play, pause, resume, stop, buffer
- **System Events**: intdown, intup, extdown, extup
- **User Events**: newdevice, concurrent, watched
- **Media Events**: created (recently added)
- **System Updates**: pmsupdate, plexpyupdate

#### Overseerr Events
- **Request Lifecycle**: MEDIA_PENDING, MEDIA_APPROVED, MEDIA_AVAILABLE
- **Issue Management**: ISSUE_CREATED, ISSUE_RESOLVED, ISSUE_COMMENT
- **Admin Actions**: MEDIA_DECLINED, MEDIA_FAILED

## Notification Format

### Universal Notification Structure
```json
{
  "title": "string (max 100 characters)",
  "body": "string (max 500 characters)",
  "image": "url? (poster/thumbnail)",
  "data": {
    "module": "string (radarr|sonarr|lidarr|tautulli|overseerr)",
    "profile": "string (profile name)",
    "event": "string (event type)",
    "id": "string? (resource ID for deep linking)",
    "timestamp": "ISO 8601 datetime"
  },
  "android": {
    "notification": {
      "sound": "default|custom",
      "icon": "notification_icon",
      "color": "#4ECCA3"
    },
    "priority": "high",
    "ttl": 2419200
  },
  "apns": {
    "payload": {
      "aps": {
        "mutable-content": true,
        "sound": "default",
        "content-available": true,
        "interruption-level": "active|passive|time-sensitive"
      }
    }
  }
}
```

### Notification Templates

#### Download Completion
```
Title: "{Service} ({Profile}): Download Complete"
Body: "{Media Title} has finished downloading"
Image: Poster/thumbnail URL from TMDB/FanArt
Data: { module, profile, event: "download", id: media_id }
```

#### Grab Notification
```
Title: "{Service} ({Profile}): Media Grabbed"
Body: "{Media Title} has been sent to download client"
Image: Poster/thumbnail URL
Data: { module, profile, event: "grab", id: media_id }
```

#### Health Issues
```
Title: "{Service} ({Profile}): Health Issue"
Body: "{Error Message}"
Image: Service icon
Data: { module, profile, event: "health" }
```

#### Playback Events (Tautulli)
```
Title: "Plex ({Profile}): Now Playing"
Body: "{User} is watching {Media Title}"
Image: Media poster
Data: { module: "tautulli", profile, event: "play", id: session_id }
```

## Device Management

### Device Registration

#### Registration Flow
1. Mobile app generates FCM registration token
2. App authenticates with Firebase Auth
3. App calls registration endpoint with token
4. Service stores token in user document
5. Token cached in Redis for performance

#### Registration API
```
POST /register
Authorization: Bearer {firebase_jwt_token}
Content-Type: application/json

{
  "deviceToken": "string (FCM registration token)",
  "platform": "ios|android",
  "appVersion": "string",
  "deviceInfo": {
    "model": "string",
    "osVersion": "string"
  }
}
```

### Device Storage Schema

#### Firestore User Document
```json
{
  "uid": "firebase_user_id",
  "devices": [
    {
      "token": "fcm_registration_token",
      "platform": "ios|android",
      "registered": "timestamp",
      "lastUsed": "timestamp",
      "appVersion": "string",
      "deviceInfo": {
        "model": "string",
        "osVersion": "string"
      }
    }
  ],
  "preferences": {
    "enabledServices": ["radarr", "sonarr", "lidarr"],
    "quietHours": {
      "enabled": false,
      "start": "22:00",
      "end": "08:00",
      "timezone": "UTC"
    }
  }
}
```

#### Redis Cache Keys
```
DEVICES:{user_id} -> ["token1", "token2", ...] (TTL: 30 seconds)
IMAGE_CACHE:{service}:{type}:{id} -> "image_url" (TTL: 7 days)
```

### Token Management

#### Token Refresh
- Automatic token refresh handled by Firebase SDK
- Invalid tokens removed from user device list
- Graceful handling of expired or revoked tokens
- Periodic cleanup of inactive devices (30+ days)

#### Token Validation
```javascript
// Pseudo-code for token validation
async function validateAndCleanTokens(userId, tokens) {
  const validTokens = [];
  
  for (const token of tokens) {
    try {
      await fcm.send({ token, data: { test: true }, dryRun: true });
      validTokens.push(token);
    } catch (error) {
      // Remove invalid token from user document
      await removeTokenFromUser(userId, token);
    }
  }
  
  return validTokens;
}
```

## Caching Strategy

### Cache Layers

#### Device Token Cache
- **Key Pattern**: `DEVICES:{user_id}`
- **TTL**: 30 seconds
- **Purpose**: Reduce Firestore reads for frequent notifications
- **Invalidation**: Manual invalidation on device registration changes

#### Image Cache
- **Key Pattern**: `IMAGE_CACHE:{service}:{type}:{id}`
- **TTL**: 7 days
- **Purpose**: Cache poster/thumbnail URLs from external APIs
- **Source**: TMDB, FanArt.tv, or service-provided images

#### User Profile Cache
- **Key Pattern**: `PROFILE:{profile_name}`
- **TTL**: 5 minutes
- **Purpose**: Cache profile to Firebase UID mapping
- **Invalidation**: On authentication or profile changes

### Cache Management

#### Cache Miss Handling
```javascript
// Pseudo-code for cache miss handling
async function getDeviceTokens(userId) {
  // Try cache first
  let tokens = await redis.get(`DEVICES:${userId}`);
  
  if (!tokens) {
    // Cache miss - fetch from Firestore
    const userDoc = await firestore.doc(`users/${userId}`).get();
    tokens = userDoc.data()?.devices?.map(d => d.token) || [];
    
    // Cache for next time
    await redis.setex(`DEVICES:${userId}`, 30, JSON.stringify(tokens));
  }
  
  return JSON.parse(tokens);
}
```

#### Cache Invalidation
- Automatic expiration via TTL
- Manual invalidation on data changes
- Bulk invalidation for system maintenance
- Graceful degradation when cache unavailable

## Security

### Authentication and Authorization

#### Basic Auth for Webhooks
- Profile name as username
- Configurable password per profile
- Rate limiting per profile/IP combination
- Request signing for enhanced security (optional)

#### Firebase Auth for Device Management
- JWT token validation for registration endpoints
- User-based device isolation
- Service account authentication for server operations
- Regular token refresh and validation

### Input Validation and Sanitization

#### Webhook Payload Validation
- JSON schema validation for known event types
- String length limits for title/body content
- URL validation for image URLs
- HTML sanitization for user-generated content

#### Security Headers
```
Content-Security-Policy: default-src 'self'
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
Strict-Transport-Security: max-age=31536000; includeSubDomains
```

### Rate Limiting

#### Per-Profile Rate Limits
- 100 requests per minute per profile
- Burst allowance of 20 requests
- Exponential backoff on rate limit exceeded
- Different limits for different event types

#### DDoS Protection
- IP-based rate limiting
- Request size limits (1MB maximum)
- Connection limits per IP
- Automatic blocking of suspicious patterns

## Error Handling

### Error Categories

#### Client Errors (4xx)
- **400 Bad Request**: Invalid JSON payload or missing required fields
- **401 Unauthorized**: Invalid or missing Basic Auth credentials
- **403 Forbidden**: Valid auth but insufficient permissions
- **404 Not Found**: Invalid endpoint or user not found
- **429 Too Many Requests**: Rate limit exceeded

#### Server Errors (5xx)
- **500 Internal Server Error**: Unexpected server error
- **502 Bad Gateway**: Upstream service unavailable
- **503 Service Unavailable**: Temporary server overload
- **504 Gateway Timeout**: Upstream service timeout

### Error Response Format
```json
{
  "status": "error",
  "error": {
    "code": "INVALID_USER",
    "message": "User not found or no registered devices",
    "details": "Firebase UID 'xyz123' has no registered devices",
    "timestamp": "2024-01-01T00:00:00Z",
    "requestId": "req_abc123"
  }
}
```

### Error Recovery

#### Retry Logic
- Exponential backoff for transient failures
- Circuit breaker pattern for external services
- Dead letter queue for failed notifications
- Manual retry interface for administrators

#### Graceful Degradation
- Continue processing other notifications on partial failures
- Cache bypass when Redis unavailable
- Fallback notification without images
- Basic notification format when enrichment fails

## Monitoring and Observability

### Metrics Collection

#### Business Metrics
- Notifications sent per service per hour
- Delivery success/failure rates
- Average processing time per notification
- Active users and devices count

#### Technical Metrics
- API request latency percentiles
- Error rates by endpoint and status code
- Cache hit/miss ratios
- Database connection pool utilization

#### System Metrics
- CPU and memory utilization
- Network I/O and bandwidth usage
- Disk space and Redis memory usage
- Concurrent connection counts

### Logging Strategy

#### Structured Logging
```json
{
  "timestamp": "2024-01-01T00:00:00Z",
  "level": "info",
  "service": "notification-service",
  "requestId": "req_abc123",
  "userId": "firebase_uid",
  "profile": "home",
  "event": "notification_sent",
  "module": "radarr",
  "eventType": "download",
  "recipients": 2,
  "processingTime": 150,
  "success": true
}
```

#### Log Levels
- **DEBUG**: Detailed execution flow for development
- **INFO**: Normal operational events (notifications sent)
- **WARN**: Recoverable errors or unusual conditions
- **ERROR**: Error conditions that need attention
- **CRITICAL**: System-threatening errors requiring immediate action

### Health Checks

#### Service Health Endpoint
```
GET /health
Response: {
  "status": "healthy|degraded|unhealthy",
  "timestamp": "2024-01-01T00:00:00Z",
  "services": {
    "redis": "healthy",
    "firestore": "healthy",
    "fcm": "healthy"
  },
  "metrics": {
    "uptime": 86400,
    "notificationsSent24h": 1250,
    "errorRate24h": 0.02
  }
}
```

## Deployment and Scaling

### Container Specifications

#### Docker Configuration
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
EXPOSE 9000
CMD ["node", "dist/index.js"]
```

#### Environment Variables
```
# Firebase Configuration
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_CLIENT_EMAIL=service-account-email
FIREBASE_PRIVATE_KEY=service-account-private-key

# Redis Configuration  
REDIS_HOST=redis.example.com
REDIS_PORT=6379
REDIS_PASSWORD=redis-password
REDIS_USE_TLS=true

# External API Keys
THEMOVIEDB_API_KEY=tmdb-api-key
FANART_TV_API_KEY=fanart-api-key

# Service Configuration
PORT=9000
NODE_ENV=production
LOG_LEVEL=info
```

### Scaling Considerations

#### Horizontal Scaling
- Stateless service design for easy horizontal scaling
- Redis for shared state across instances
- Load balancer with health checks
- Auto-scaling based on CPU/memory metrics

#### Performance Optimization
- Connection pooling for external services
- Batch processing for multiple device notifications
- Async processing with job queues
- CDN for static assets (icons, default images)

### High Availability

#### Redundancy
- Multi-zone deployment
- Redis cluster for cache high availability
- Database replication and failover
- External service circuit breakers

#### Disaster Recovery
- Regular database backups
- Configuration backup and versioning
- Monitoring and alerting for service degradation
- Documented recovery procedures

This comprehensive notification service specification provides the foundation for implementing a robust, scalable push notification system that can be adapted to various technology stacks while maintaining reliability and performance.