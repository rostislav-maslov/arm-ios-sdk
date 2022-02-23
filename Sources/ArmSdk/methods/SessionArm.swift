//
//  File.swift
//  
//
//  Created by Rostislav Maslov on 23.02.2022.
//

import Foundation

class SessionArm {
    public static let SESSION_ID:String  = UUID().uuidString
    public static var SESSION_DID_OPEN = false
    
    public static var anonymousId: String = ""
    public static var phone: String?
    public static var utm:Utm = Utm()
    
    
    static func initSession(){
        initAnonimousId()
        registration()
    }
    
    static func setPhone(phone: String){
        if SessionArm.phone != phone {
            SessionArm.phone = phone
            UserDefaults.standard.set(phone, forKey: "SESSION_ARM_PHONE")
            SessionArm.registerUser()
        }
    }
    
    static func initAnonimousId(){
        var id = UserDefaults.standard.string(forKey: "SESSION_ARM_ANONIMOUS_ID")
        if id == nil {
            id = UUID().uuidString
            UserDefaults.standard.set(id, forKey: "SESSION_ARM_ANONIMOUS_ID")
        }
        SessionArm.anonymousId = id!
        
        /// ---------------
        let phone = UserDefaults.standard.string(forKey: "SESSION_ARM_PHONE")
        SessionArm.phone = phone
        
    }
    
    static func registration(){
        let request = SessionRequest(user: UserInSession(anonymousID: SessionArm.anonymousId, phone: SessionArm.phone), uuid: SessionArm.SESSION_ID)
        ArmSDK.sendWithCallback(method: "/not-secure/api/v1/session", request: request) {
            SessionArm.SESSION_DID_OPEN = true
            registerDeviceInSession()
            registerUtm()
            registerUser()
        }
    }
    
    static func setUtm(url: String){
        let utm = Utm(url: url)
        SessionArm.utm = utm
        registerUtm()
    }
    
    static func registerDeviceInSession(){
        let request = SessionDeviceRequest(
            device: DeviceInSession(
                appToken: AppArm.APP_TOKEN,
                appVersion: AppArm.APP_VERSION,
                device: DeviceArm.device,
                deviceID: DeviceArm.deviceId,
                deviceVersion: DeviceArm.deviceVersion,
                ip: DeviceArm.ip,
                operationSystem: DeviceArm.operationSystem,
                operationSystemVersion: DeviceArm.operationSystemVersion,
                type: DeviceArm.type),
            sessionID: SessionArm.SESSION_ID)
        ArmSDK.send(method: "/not-secure/api/v1/session/device", request: request)
    }
    
    static func registerUser(){
        let request = SessionRequest(user: UserInSession(anonymousID: SessionArm.anonymousId, phone: SessionArm.phone), uuid: SessionArm.SESSION_ID)
        ArmSDK.send(method: "/not-secure/api/v1/session/user", request: request)
    }
    
    static func registerUtm(){
        let request = SessionUtmRequest(utm: SessionArm.utm, sessionId: SessionArm.SESSION_ID)
        ArmSDK.send(method: "/not-secure/api/v1/utm", request: request)
    }
}
