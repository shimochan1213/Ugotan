//
//  AppDelegate.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/05/06.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

//import UIKit
//import GoogleMobileAds
//import Firebase
//import FirebaseMessaging
//import UserNotifications
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
//
//    var window: UIWindow?
//    var notificationGranted = true
//
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//
//        //広告の初期設定
//        GADMobileAds.sharedInstance().start(completionHandler: nil)
//
//        //Firebase初期設定
//     FirebaseApp.configure()
//              // 通知に必要なのはここからしたの処理
//              if #available(iOS 10.0, *) {
//                  // For iOS 10 display notification (sent via APNS)
//                  UNUserNotificationCenter.current().delegate = self
//
//                  let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//                  UNUserNotificationCenter.current().requestAuthorization(
//                      options: authOptions,
//                      completionHandler: {_, _ in })
//              } else {
//                  let settings: UIUserNotificationSettings =
//                      UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
//                  application.registerUserNotificationSettings(settings)
//              }
//
//              application.registerForRemoteNotifications()
//
//
//
//        return true
//    }
//
//
//
//
//
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
//        // Print message ID.
//        if let messageID = userInfo["gcm.message_id"] {
//            print("Message ID: \(messageID)")
//        }
//
//        // Print full message.
//        print(userInfo)
//    }
//
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
//                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//        // Print message ID.
//        if let messageID = userInfo["gcm.message_id"] {
//            print("Message ID: \(messageID)")
//        }
//
//        // Print full message.
//        print(userInfo)
//
//        completionHandler(UIBackgroundFetchResult.newData)
//    }
//
//
//
//
//
//
//
//
//
//
//
//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//
//
//
//
//
//
//
//
// @available(iOS 10, *)
//    extension AppDelegate : UNUserNotificationCenterDelegate {
//       func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                   willPresent notification: UNNotification,
//                                   withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//           let userInfo = notification.request.content.userInfo
//
//           if let messageID = userInfo["gcm.message_id"] {
//               print("Message ID: \(messageID)")
//           }
//
//           print(userInfo)
//
//           completionHandler([])
//       }
//
//       func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                   didReceive response: UNNotificationResponse,
//                                   withCompletionHandler completionHandler: @escaping () -> Void) {
//           let userInfo = response.notification.request.content.userInfo
//           if let messageID = userInfo["gcm.message_id"] {
//               print("Message ID: \(messageID)")
//           }
//
//           print(userInfo)
//
//           completionHandler()
//       }
//    }
//
//
//
//
//}

import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications

import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    //広告の初期設定
    GADMobileAds.sharedInstance().start(completionHandler: nil)
    
       // Override point for customization after application launch.
       FirebaseApp.configure()
       if #available(iOS 10.0, *) {
           // For iOS 10 display notification (sent via APNS)
           UNUserNotificationCenter.current().delegate = self

           let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
           UNUserNotificationCenter.current().requestAuthorization(
               options: authOptions,
               completionHandler: {_, _ in })
       } else {
           let settings: UIUserNotificationSettings =
               UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
           application.registerUserNotificationSettings(settings)
       }

       application.registerForRemoteNotifications()
       
       return true
   }

   // MARK: UISceneSession Lifecycle

   func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
       // Called when a new scene session is being created.
       // Use this method to select a configuration to create the new scene with.
       return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
   }

   func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
       // Called when the user discards a scene session.
       // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
       // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
   }
   
   func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
       // Print message ID.
       if let messageID = userInfo["gcm.message_id"] {
           print("Message ID: \(messageID)")
       }

       // Print full message.
       print(userInfo)
   }

   func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                    fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
       // Print message ID.
       if let messageID = userInfo["gcm.message_id"] {
           print("Message ID: \(messageID)")
       }

       // Print full message.
       print(userInfo)

       completionHandler(UIBackgroundFetchResult.newData)
   }


}

@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
   func userNotificationCenter(_ center: UNUserNotificationCenter,
                               willPresent notification: UNNotification,
                               withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
       let userInfo = notification.request.content.userInfo

       if let messageID = userInfo["gcm.message_id"] {
           print("Message ID: \(messageID)")
       }

       print(userInfo)

       completionHandler([])
   }

   func userNotificationCenter(_ center: UNUserNotificationCenter,
                               didReceive response: UNNotificationResponse,
                               withCompletionHandler completionHandler: @escaping () -> Void) {
       let userInfo = response.notification.request.content.userInfo
       if let messageID = userInfo["gcm.message_id"] {
           print("Message ID: \(messageID)")
       }

       print(userInfo)

       completionHandler()
   }
}
