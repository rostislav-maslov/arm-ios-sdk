//
//  File.swift
//  
//
//  Created by Rostislav Maslov on 23.02.2022.
//

import Foundation

struct Utm: Codable {
    var campaign, content, medium, source: String
    var term: String
    
    init(url: String){
        let utm = Utm.tryParse(url: url)
        self.campaign = utm.campaign
        self.content = utm.content
        self.medium = utm.medium
        self.source = utm.source
        self.term = utm.term
    }
    
    init(){
        self.campaign = ""
        self.content = ""
        self.medium = ""
        self.source = ""
        self.term = ""
    }
    
    static func tryParse(url: String) ->  Utm {
        var utm = Utm()
        let deepLink: DeepLink = DeepLink(url)
        
        if deepLink.query["campaign"] != nil{
            utm.campaign = deepLink.query["campaign"]!
        }
        if deepLink.query["content"] != nil{
            utm.content =  deepLink.query["content"]!
        }
        if deepLink.query["medium"] != nil {
            utm.medium =  deepLink.query["medium"]!
        }
        if deepLink.query["source"] != nil{
            utm.source =  deepLink.query["source"]!
        }
        if deepLink.query["term"] != nil{
            utm.term =  deepLink.query["term"]!
        }
        
        return utm
        
    }
}
