//
//  File.swift
//  
//
//  Created by Rostislav Maslov on 23.02.2022.
//

import Foundation

typealias SendCallback = () -> Void

public class ArmSDK{
    public static var URL = ""
    static let service = RequestService()
    
    public static func start(
        armURL: String,
        app: String,
        appVersion: String){
            URL = armURL
            
            AppArm.initApp(app, appVersion)
            DeviceArm.initDevice()
            SessionArm.initSession()                                    
        }
    
    public static func setPhone(_ phone: String){
        SessionArm.setPhone(phone: phone)
    }
    
    public static func setUtm(_ url: String){
        SessionArm.setUtm(url: url)
    }
    
    public static func event(code: String){
        EventArm.event(code: code)
    }
    
    public static func event(code: String, value: String){
        EventArm.event(code: code, value: value)
    }
    
    public static func event(code: String, value: Float){
        EventArm.event(code: code, value: value)
    }
    
    public static func event(code: String, valueAny: String){
        EventArm.event(code: code, valueAny: valueAny)
    }
    
    static func send<R: Encodable>(method: String, request: R){
        let cb: SendCallback? = nil
        ArmSDK.sendWithCallback(method: method, request: request, callback: cb)
    }
    
    static func sendWithCallback<R: Encodable>(method: String, request: R, callback: SendCallback?){
        service.requestJson(url: URL + method, method: "POST", requestBody: request) { (success:String?, error:String?, isSuccess:Bool) in
            callback?()
        }
    }
}
