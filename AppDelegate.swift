//
//  AppDelegate.swift
//  MedTech
//
//  Created by Rachel Sacdalan on 4/2/22.
//

import UIKit
import Parse

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let parseConfig = ParseClientConfiguration {
            //mDx1kdQ2LaIJ8Rc2VfuveF1lQFITLiqgez9R5YEg
            //D4UffoX0LZu0N2Vg3RbluKVyAjqyk5R9VqRwPJLf
            //$0.applicationId = "yKnwHAkGC1bx1j3m5G7ECfbJ2g9qaWaGcsNrY3ks"// <- UPDATE
            //$0.clientKey = "BXNeZuJh1ZosOEii0Itinw8HsEVEEdKK9FsPRn6s" // <- UPDATE
            $0.applicationId = "mDx1kdQ2LaIJ8Rc2VfuveF1lQFITLiqgez9R5YEg"
            $0.clientKey = "D4UffoX0LZu0N2Vg3RbluKVyAjqyk5R9VqRwPJLf"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: parseConfig)
        
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


}

