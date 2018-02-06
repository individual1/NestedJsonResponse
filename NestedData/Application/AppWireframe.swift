//
//  AppWireframe.swift
//  NestedData
//
//  Created by Bhawna on 02/02/18.
//  Copyright © 2018 Bhawna. All rights reserved.
//
import UIKit

class AppWireframe: RootWireframeInterface, RootWireframe {
    
    var window: UIWindow!
    
    func showRoot(with viewController: UIViewController, in window: UIWindow) {
        let nav = UINavigationController(rootViewController: viewController)
        nav.setNavigationBarHidden(false, animated: false)
        window.rootViewController = nav
       
    }
}
