//
//  File.swift
//  
//
//  Created by Rostislav Maslov on 23.02.2022.
//

import Foundation


typealias ApiResponseProtocol<T:Codable, E: Codable> = (_ success: T?, _ error: E?, _ isSuccess: Bool) -> Void
