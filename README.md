# arm-ios-sdk

A description of this package.

ArmSDK.start(
    armURL: "http://domain.url",
    app: "TEST_LIB",
    appVersion: Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "")

ArmSDK.setUtm("https://just.ru/goods/rols?campaign=ccampaing&content=ccontent&medium=mmedium&source=ssource&term=tterm")

ArmSDK.setPhone("79998777787")

ArmSDK.event(code: "TEST_START")
ArmSDK.event(code: "OPEN_STRING", value: "just value")
ArmSDK.event(code: "OPEN_INT", value: 11)
ArmSDK.event(code: "OPEN_ANY", valueAny: "<xml></xml>")
