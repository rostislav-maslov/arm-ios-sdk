//
//  File.swift
//  
//
//  Created by Rostislav Maslov on 23.02.2022.
//

import Foundation


class LogArm{
    private static let showLog = true
    
    static func log(_ log: String){
        if showLog == true {
            print(log)
        }        
    }
    
}
