//
//  firstNavigationController.swift
//  BrainFX
//
//  Created by Marco F.A. Corzani on 18.11.14.
//  Copyright (c) 2014 Alphaweb. All rights reserved.
//

import Foundation
import UIKit

class firstNavigationController: UINavigationController {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        UINavigationBar.appearance().backgroundColor = UIColor(red: 0.3153, green: 0.6914, blue: 0.6036, alpha: 1.0)
        UIBarButtonItem.appearance().tintColor = UIColor(red: 0.3153, green: 0.6914, blue: 0.6036, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGrayColor()]
        //UITabBar.appearance().backgroundColor = UIColor(red: 0.3153, green: 0.6914, blue: 0.6036, alpha: 1.0)
        
    }




}


