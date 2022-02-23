//
//  File.swift
//  
//
//  Created by Rostislav Maslov on 23.02.2022.
//

import Foundation

struct BaseApiResponse<T: Codable>: Codable {
    var result:T
}
