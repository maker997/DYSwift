//
//  AppDelegate.swift
//  DYSwift
//
//  Created by maker on 2016/11/30.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UITabBar.appearance().tintColor = UIColor.orange
        

        return true
    }
}

func mprint<T>(message:T,file:String = #file,line:Int = #line){
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("\(fileName)---\(line)---\(message)")
    #endif
}

