import XCTest
@testable import ArmSdk

final class ArmSdkTests: XCTestCase {
    func testExample() throws {
        
        let exp = expectation(description: "Loading")
        
        ArmSDK.start(
            armURL: "http://service.analytics.marketing.ftl-dev.ru",
            app: "TEST_LIB",
            appVersion: Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "")
            
        ArmSDK.setUtm("https://xn--80adjkr6adm9b.xn--p1ai/goods/rols?campaign=ccampaing&content=ccontent&medium=mmedium&source=ssource&term=tterm")
        ArmSDK.setPhone( "79608742027")
        ArmSDK.event(code: "TEST_START")
        ArmSDK.event(code: "OPEN_STRING", value: "just value")
        ArmSDK.event(code: "OPEN_INT", value: 11)
        ArmSDK.event(code: "OPEN_ANY", valueAny: "<xml></xml>")
        
        
        // wait three seconds for all outstanding expectations to be fulfilled
        waitForExpectations(timeout: 1000)
                
    }
}
