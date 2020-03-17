//
//  FixturesInfoCell.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 17/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class FixturesInfoCell: UICollectionViewCell,
NibIdentifiable & ClassIdentifiable {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: FixturesInfoViewModel? {
        didSet {
            setupViewModel()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupTableView()
    }
    
    private func setupViewModel() {
        viewModel?.didLoadFixtures = {[weak self] fixtures, error in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                if let error = error {
                    print(error)
                }
            }
        }
    }
    
    private func setupTableView() {
        tableView.register(cellType: MatchTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }

}

extension FixturesInfoCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueResuableCell(withCellType: MatchTableViewCell.self, forIndexPath: indexPath)
        
        if let cellViewModel = viewModel?.viewModelForCell(at: indexPath) {
            cell.viewModel = cellViewModel
        }
        
        return cell
    }
    
    
}
