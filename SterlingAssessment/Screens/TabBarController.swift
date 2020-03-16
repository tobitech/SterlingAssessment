//
//  TabBarController.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        // Fixtures
        let fixturesNavController = templateNavController(unselectedImage: UIImage(), selectedImage: UIImage(), rootViewController: ViewController())
        
        // Competitions
        let competitionsNavController = templateNavController(unselectedImage: UIImage(), selectedImage: UIImage(), rootViewController: ViewController())
        
        viewControllers = [fixturesNavController, competitionsNavController]
    }
    
    private func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.barTintColor = .white
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        
        return navController
    }
    
}
