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
        let fixtVC = FixturesViewController.initFromNib()
        let fixturesNavController = templateNavController(title: "Fixtures", image: UIImage(named: "soccer_icon") ?? UIImage(), rootViewController: fixtVC)
        
        // Competitions
        let compVC = CompetitionsViewController.initFromNib()
        
        let competitionsNavController = templateNavController(title: "Competitions", image: UIImage(named: "soccer-field_icon") ?? UIImage(), rootViewController: compVC)
        
        viewControllers = [fixturesNavController, competitionsNavController]
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
    }
    
    private func templateNavController(
        title: String,
        image: UIImage,
        rootViewController: UIViewController = UIViewController())
        -> UINavigationController {
        
        let viewController = rootViewController
        viewController.title = title
            
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.barTintColor = .white
        navController.tabBarItem.image = image
        
        return navController
    }
    
}
