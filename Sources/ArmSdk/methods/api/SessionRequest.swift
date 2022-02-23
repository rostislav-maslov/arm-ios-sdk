// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct SessionRequest: Codable {
    let user: UserInSession
    let uuid: String
}

// MARK: - User
struct UserInSession: Codable {
    let anonymousID, phone: String?

    enum CodingKeys: String, CodingKey {
        case anonymousID = "anonymousId"
        case phone
    }
}
