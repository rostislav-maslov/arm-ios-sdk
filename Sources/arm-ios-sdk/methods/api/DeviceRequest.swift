// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct DeviceRequest: Codable {
    let device: DeviceDataRequest
    let phone: String?
}

// MARK: - Device
struct DeviceDataRequest: Codable {
    let appToken, appVersion, device, deviceID: String
    let deviceVersion, ip, operationSystem, operationSystemVersion: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case appToken, appVersion, device
        case deviceID = "deviceId"
        case deviceVersion, ip, operationSystem, operationSystemVersion, type
    }
}
