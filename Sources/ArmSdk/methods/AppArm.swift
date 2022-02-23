//
//  File.swift
//  
//
//  Created by Rostislav Maslov on 23.02.2022.
//

import Foundation

class AppArm{
    static var APP:String = "NO_APP"
    static var APP_VERSION: String = "NO_APP_VERSION"
    static var APP_TOKEN: String = ""
    
    static func initApp(_ app: String, _ appVersion: String){
        AppArm.APP = app
        AppArm.APP_VERSION = appVersion
        
        LogArm.log("APP: \(APP)")
        LogArm.log("APP: \(APP_VERSION)")
    }        

}
