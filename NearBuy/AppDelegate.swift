//
//  AppDelegate.swift
//  NearBuy
//
//  Created by Tarun Khurana on 01/06/24.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    var window: UIWindow?
    
    fileprivate let navigationCtrl = UINavigationController()
    
    class var shared: AppDelegate {
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return AppDelegate() }
        
        return appDelegate
        
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        
        //createWindow()
        
        moveToHome()
        
        return true
        
    }
    
    
    
}



 

extension AppDelegate{
    func createWindow() {

        self.window = UIWindow(frame: UIScreen.main.bounds)

        self.window?.makeKeyAndVisible()

        self.window?.rootViewController = navigationCtrl

    }

    func moveToHome() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "NearBuyVC") as! NearBuyVC
        

        navigationCtrl.pushViewController(vc, animated: true)

    }

    

}
