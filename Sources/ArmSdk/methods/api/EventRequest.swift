// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct EventRequest: Codable {
    let appInfo: AppInfoInEvent
    let device: DeviceInEvent
    let event: EventInEvent
    let sessionID, timeZone: String
    let user: UserInEvent
    let utm: UtmInEvent

    enum CodingKeys: String, CodingKey {
        case appInfo, device, event
        case sessionID = "sessionId"
        case timeZone, user, utm
    }
}

// MARK: - AppInfo
struct AppInfoInEvent: Codable {
    let app, appVersion: String
}

// MARK: - Device
struct DeviceInEvent: Codable {
    let appToken, appVersion, device, deviceID: String
    let deviceVersion, ip, operationSystem, operationSystemVersion: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case appToken, appVersion, device
        case deviceID = "deviceId"
        case deviceVersion, ip, operationSystem, operationSystemVersion, type
    }
}

// MARK: - Event
struct EventInEvent: Codable {
    let eventCode, eventValueType: String
    let eventNumberValue: Float?
    let eventStringValue: String?

    enum CodingKeys: String, CodingKey {        
        case eventCode, eventNumberValue, eventStringValue, eventValueType
    }
}

// MARK: - User
struct UserInEvent: Codable {
    let anonymousID: String?
    let phone: String?

    enum CodingKeys: String, CodingKey {
        case anonymousID = "anonymousId"
        case phone
    }
}

// MARK: - Utm
struct UtmInEvent: Codable {
    let campaign, content, medium, source: String
    let term: String
}
