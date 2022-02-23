//
//  File.swift
//  
//
//  Created by Rostislav Maslov on 23.02.2022.
//

import Foundation

public class DeepLink{
    var host: String = ""
    var path: String = ""
    var query:[String: String] = [:]
    
    init(_ urlString: String){
        
        do{
            let url = URL(
                string: urlString
            )
            
            if url == nil {
                return
            }
            
            if url!.host != nil {
                self.host = url!.host!
            }
            
            self.path = url!.path
            
            let components = URLComponents(
                url: url!,
                resolvingAgainstBaseURL: false
            )
                                    
            if components!.queryItems != nil {
                for item in components!.queryItems! {
                    self.query[item.name] = item.value
                }
            }
            
        }catch{
            print("")
        }
        
    }
}
