//
//  UIViewController+Utils.swift
//  FeedStarTests
//
//  Created by 小田和哉 on 2018/03/24.
//  Copyright © 2018年 K.oda. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static func topViewController(from vc: UIViewController = UIApplication.shared.keyWindow!.rootViewController!) -> UIViewController {
        if let tab = vc as? UITabBarController {
            let selectedVC = (tab.selectedViewController ?? tab.viewControllers!.first!)
            return topViewController(from: selectedVC)
        } else if let nav = vc as? UINavigationController {
            return topViewController(from: nav.topViewController!)
        } else if let presented = vc.presentedViewController {
            return topViewController(from: presented)
        } else {
            return vc
        }
    }
    
}
