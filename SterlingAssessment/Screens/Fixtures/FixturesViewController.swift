//
//  ViewController.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class FixturesViewController: UIViewController {
    
    var viewModel: FixturesListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = FixturesListViewModel()
        viewModel.didLoadFixtures = {[weak self] matches, message in
            print(matches?.count ?? 0)
            DispatchQueue.main.async {
                if let message = message {
                    self?.showAlert(title: "Error", message: message)
                }
            }
        }
        
        view.backgroundColor = .white
        
        title = "Fixtures"
        
        let label = UILabel()
        label.text = "Welcome to the new app."
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }


}

