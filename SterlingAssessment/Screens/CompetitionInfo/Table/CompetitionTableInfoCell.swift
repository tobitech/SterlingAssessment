//
//  CompetitionTableInfoCell.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class CompetitionTableInfoCell: UICollectionViewCell,
NibIdentifiable & ClassIdentifiable {

    @IBOutlet weak var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    
    var viewModel: CompetitionTableInfoViewModel? {
        didSet {
            setupViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupTableView()
    }
    
    private func setupViewModel() {
        viewModel?.didLoadTable = {[weak self] tables, error in
            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing()
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setupTableView() {
        refreshControl = UIRefreshControl(frame: .zero)
        tableView.refreshControl = self.refreshControl
        refreshControl.beginRefreshing()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        
        tableView.register(cellType: TableCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    @objc func handleRefresh() {
        self.refreshControl.endRefreshing()
    }

}

extension CompetitionTableInfoCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueResuableCell(withCellType: TableCell.self, forIndexPath: indexPath)
        
        if let cellViewModel = viewModel?.viewModelForCell(at: indexPath) {
            cell.viewModel = cellViewModel
        }
        
        return cell
    }
    
    
}
