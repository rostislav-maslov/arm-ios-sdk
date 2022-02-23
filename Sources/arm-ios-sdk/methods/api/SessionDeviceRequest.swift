// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct SessionDeviceRequest: Codable {
    let device: DeviceInSession
    let sessionID: String

    enum CodingKeys: String, CodingKey {
        case device
        case sessionID = "sessionId"
    }
}

// MARK: - Device
struct DeviceInSession: Codable {
    let appToken, appVersion, device, deviceID: String
    let deviceVersion, ip, operationSystem, operationSystemVersion: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case appToken, appVersion, device
        case deviceID = "deviceId"
        case deviceVersion, ip, operationSystem, operationSystemVersion, type
    }
}
