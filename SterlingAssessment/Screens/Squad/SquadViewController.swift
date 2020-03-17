//
//  SquadViewController.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 17/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class SquadViewController: UITableViewController {
        
    var viewModel: SquadListViewModel! {
        didSet {
            setupViewModel()
            navigationItem.title = viewModel.teamTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    private func setupViewModel() {
        viewModel.didLoadSquad = { [weak self] squad, error in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                
                if let error = error {
                    self?.showAlert(title: "Error", message: error)
                }
            }
        }
    }
    
    private func setupTableView() {
        tableView.register(cellType: SquadMemberCell.self)
    }
    
}

extension SquadViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueResuableCell(withCellType: SquadMemberCell.self, forIndexPath: indexPath)
        
        if let cellViewModel = viewModel.viewModelForCell(at: indexPath) {
            cell.viewModel = cellViewModel
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = SquadHeaderView()
        header.crestUrl = viewModel.teamCrest
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100.0
    }
}
