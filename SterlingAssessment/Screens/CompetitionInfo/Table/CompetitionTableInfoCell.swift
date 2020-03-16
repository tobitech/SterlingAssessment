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
    
    var viewModel: CompetitionTableInfoViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel.didLoadTable = {[weak self] tables, error in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setupTableView() {
        tableView.register(cellType: TableCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }

}

extension CompetitionTableInfoCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueResuableCell(withCellType: TableCell.self, forIndexPath: indexPath)
        return cell
    }
    
    
}
