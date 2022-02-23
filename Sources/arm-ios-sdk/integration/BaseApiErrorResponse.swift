//
//  File.swift
//  
//
//  Created by Rostislav Maslov on 23.02.2022.
//

import Foundation

struct BaseApiErrorResponse: Codable {
    var errors: [Error] = []
    var status: Int = 0
    var path: String = ""
    var timestamp: String = ""
    var traceId: String = ""
}
