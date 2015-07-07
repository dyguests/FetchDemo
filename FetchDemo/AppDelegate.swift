//
//  AppDelegate.swift
//  FetchDemo
//
//  Created by 范鸿麟 on 15/7/7.
//  Copyright (c) 2015年 范鸿麟. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        application.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
        
        return true
    }
    
    func application(application: UIApplication, performFetchWithCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        
        var fetchStart:NSDate = NSDate()
        
        let viewController:ViewController = self.window?.rootViewController as! ViewController
        viewController.fetchNewDataWithCompletionHandler { (result:UIBackgroundFetchResult) -> Void in
            completionHandler(result)

            application.applicationIconBadgeNumber = 0

            //显示执行时间
            var fetchEnd:NSDate = NSDate()
            var timeElapsed:NSTimeInterval = fetchEnd.timeIntervalSinceDate(fetchStart)
            
            NSLog("Background Fetch Duration: %f seconds", timeElapsed)
        }
    }
}

