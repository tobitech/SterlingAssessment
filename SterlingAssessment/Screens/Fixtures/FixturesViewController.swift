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
    var refreshControl: UIRefreshControl!
    
    var viewModel: FixturesListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        setupTableView()
    }

    private func setupViewModel() {
        viewModel = FixturesListViewModel()
        viewModel.didLoadFixtures = {[weak self] matches, message in

            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing()
                self?.tableView.reloadData()
                
                if let message = message {
                    self?.showAlert(title: "Error", message: message)
                }
            }
        }
    }
    
    private func setupTableView() {
        self.refreshControl = UIRefreshControl(frame: .zero)
        tableView.refreshControl = self.refreshControl
        self.refreshControl.beginRefreshing()
        
        tableView.register(cellType: MatchTableViewCell.self)
        
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension FixturesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueResuableCell(withCellType: MatchTableViewCell.self, forIndexPath: indexPath)
        if let cellViewModel = viewModel.viewModelForCell(at: indexPath) {
            cell.viewModel = cellViewModel
        }
        return cell
    }
}
