//
//  File.swift
//  
//
//  Created by Rostislav Maslov on 23.02.2022.
//

import Foundation

class EventArm{
    static var localTimeZoneIdentifier: String { return TimeZone.current.identifier }
    
    static func event(code: String){
        event(eventCode: code, eventNumberValue: nil, eventStringValue: nil, eventValueType: "NONE")
    }
    
    static func event(code: String, value: String){
        event(eventCode: code, eventNumberValue: nil, eventStringValue: value, eventValueType: "STRING")
    }
    
    static func event(code: String, value: Float){
        event(eventCode: code, eventNumberValue: value, eventStringValue: nil, eventValueType: "INTEGER")
    }
    
    static func event(code: String, valueAny: String){
        event(eventCode: code, eventNumberValue: nil, eventStringValue: valueAny, eventValueType: "ANY")
    }
    
    private static func event(
        eventCode: String,
        eventNumberValue: Float?,
        eventStringValue: String?,
        eventValueType: String
    ){
        let request: EventRequest = EventRequest(
            appInfo: AppInfoInEvent(app: AppArm.APP, appVersion: AppArm.APP_VERSION),
            device: DeviceInEvent(
                appToken: AppArm.APP_TOKEN,
                appVersion: AppArm.APP_VERSION,
                device: DeviceArm.device,
                deviceID: DeviceArm.deviceId,
                deviceVersion: DeviceArm.deviceVersion,
                ip: DeviceArm.ip,
                operationSystem: DeviceArm.operationSystem,
                operationSystemVersion: DeviceArm.operationSystemVersion,
                type: DeviceArm.type),
            event: EventInEvent(
                eventCode: eventCode,
                eventValueType: eventValueType,
                eventNumberValue: eventNumberValue,
                eventStringValue: eventStringValue                                
                ),
            sessionID: SessionArm.SESSION_ID,
            timeZone: localTimeZoneIdentifier,
            user: UserInEvent(anonymousID: SessionArm.anonymousId, phone: SessionArm.phone),
            utm: UtmInEvent(
                campaign: SessionArm.utm.campaign,
                content: SessionArm.utm.content,
                medium: SessionArm.utm.medium,
                source: SessionArm.utm.source,
                term: SessionArm.utm.term))
        
        ArmSDK.send(method: "/not-secure/api/v1/event", request: request)
    }
}
