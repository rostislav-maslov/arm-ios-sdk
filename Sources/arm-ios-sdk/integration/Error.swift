//
//  File.swift
//  
//
//  Created by Rostislav Maslov on 23.02.2022.
//

import Foundation

struct PresentationData: Codable {
    var title:String = ""
    var message:String = ""
}

struct Error: Codable {
    var presentationData:PresentationData = PresentationData()
    var domain:String = ""
    var reason:String = ""
    var details:String = ""
}
