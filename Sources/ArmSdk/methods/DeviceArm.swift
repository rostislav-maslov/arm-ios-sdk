//
//  File.swift
//  
//
//  Created by Rostislav Maslov on 23.02.2022.
//

import Foundation



class DeviceArm{
    static let device:String = UIDevice.device
    static var deviceId:String = ""
    static let deviceVersion:String = UIDevice.deviceVersion
    
    static var ip:String = ""
    
    static let operationSystem:String = "IOS"
    static let operationSystemVersion:String = "\(ProcessInfo.processInfo.operatingSystemVersion.majorVersion).\(ProcessInfo.processInfo.operatingSystemVersion.minorVersion).\(ProcessInfo.processInfo.operatingSystemVersion.patchVersion)"
    // operationSystemVersion// ""operatingSystemVersion
    static let type:String = "IOS"
    
    static func initDevice(){
        initDeviceId()
        initIp()
        registerDevice()
        
        LogArm.log("Device: \(DeviceArm.device)")
        LogArm.log("DeviceId: \(DeviceArm.deviceId)")
        LogArm.log("DeviceVersion: \(DeviceArm.deviceVersion)")
        LogArm.log("IP: \(DeviceArm.ip)")
        LogArm.log("OperationSystem: \(DeviceArm.operationSystem)")
        LogArm.log("OperationSystemVersion: \(DeviceArm.operationSystemVersion)")
        LogArm.log("Type: \(DeviceArm.type)")
    }
    
    static func initDeviceId(){
        var id = UserDefaults.standard.string(forKey: "DEVICE_ARM_DEVICE_ID")
        if id == nil {
            id = UUID().uuidString
            UserDefaults.standard.set(id, forKey: "DEVICE_ARM_DEVICE_ID")
        }
        DeviceArm.deviceId = id!
    }
    
    static func initIp(){
        LogArm.log("initIp")
        RequestService().requestFormUrl(url: "https://api.myip.com/", method: "GET") { (success:IPResponse?, error:String?, isSuccess:Bool) in
            DeviceArm.ip = (success != nil && success?.ip != nil) ? success!.ip! : ""
            LogArm.log("IP: \(DeviceArm.ip)")
            registerDevice()
        }
    }
    
    static func registerDevice(){
        let request: DeviceRequest = DeviceRequest(
            device: DeviceDataRequest(
                appToken: AppArm.APP_TOKEN,
                appVersion: AppArm.APP_VERSION,
                device: DeviceArm.device,
                deviceID: DeviceArm.deviceId,
                deviceVersion: DeviceArm.deviceVersion,
                ip: DeviceArm.ip,
                operationSystem: DeviceArm.operationSystem,
                operationSystemVersion: DeviceArm.operationSystemVersion,
                type: DeviceArm.type),
            phone: SessionArm.phone)
        ArmSDK.send(method: "/not-secure/api/v1/device", request: request)
    }
    
    
}




