//
//  AppDelegate.swift
//  NestedData
//
//  Created by Bhawna on 02/02/18.
//  Copyright © 2018 Bhawna. All rights reserved.
//

import UIKit


class AppDependency {

    var appWireframe: AppWireframe!

    init() {
        self.appWireframe = AppWireframe()
    }

    func attachRootViewControllerInWindow(_ window: UIWindow!) {
             let vc = HomeWireFrame.createHomeModule()
            let homeWireframe = HomeWireFrame(root: appWireframe, view: vc as! HomeProtocol)
            homeWireframe.root = appWireframe
            homeWireframe.attachRoot(with: vc, in: window)
    }
}
