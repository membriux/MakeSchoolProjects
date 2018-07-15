//
//  MainTabBarController.swift
//  MakeStagram
//
//  Created by Memo on 7/12/18.
//  Copyright © 2018 Memo. All rights reserved.
//

import UIKit
import Foundation

class MainTabBarController: UITabBarController {
    
    let photoHelper = MGPhotoHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoHelper.completionHandler = { image in
            PostService.create(for: image)
        }
        
        // Set the MainTabBarController as the delegate of its tab bar
        delegate = self
        tabBar.unselectedItemTintColor = .black
    }
    
}

extension MainTabBarController: UITabBarControllerDelegate {
    // Handles which tabBarItem is selected, specifically the photo button
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
            //present photo taking action sheet
            photoHelper.presentActionSheet(from: self)
            return false
        } else {
            return true
        }
        
    }
}
