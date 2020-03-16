//
//  ViewController.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class FixturesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: FixturesListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Fixtures"
        
        setupViewModel()
        setupTableView()
    }

    private func setupViewModel() {
        viewModel = FixturesListViewModel()
        viewModel.didLoadFixtures = {[weak self] matches, message in
            print(matches?.count ?? 0)
            DispatchQueue.main.async {
                if let message = message {
                    self?.showAlert(title: "Error", message: message)
                }
            }
        }
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension FixturesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}
