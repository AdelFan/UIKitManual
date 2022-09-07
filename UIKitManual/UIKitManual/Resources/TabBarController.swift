//
//  TabBarController.swift
//  UIKitManual
//
//  Created by Адель Ахметшин on 05.09.2022.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = FirstViewController()
        
        vc1.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: vc1)
        
        nav1.navigationBar.tintColor = .white
        
        nav1.tabBarItem = UITabBarItem(title: "Main", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        nav1.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1], animated: false)
    }
}
