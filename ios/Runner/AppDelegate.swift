import UIKit
import Flutter
import OneSignal

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)
    OneSignal.initWithLaunchOptions(launchOptions)
    OneSignal.setAppId("75e7a5f7-a8f1-4ef0-964c-49b0978f48e4")
    
    OneSignal.promptForPushNotifications(userResponse: { accepted in
        print("User accepted notifications: \(accepted)")
    })
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
