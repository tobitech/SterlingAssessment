//
//  CompetitionsViewController.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class CompetitionsViewController: UITableViewController {
        
    var viewModel: CompetitionsListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        setupTableView()
    }
    
    private func setupViewModel() {
        viewModel = CompetitionsListViewModel()
        viewModel.didLoadCompetitions = {[weak self] competitions, message in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                
                if let message = message {
                    self?.showAlert(title: "Error", message: message)
                }
            }
        }
    }
    
    private func setupTableView() {
        tableView.register(cellType: CompetitionCell.self)
        tableView.tableFooterView = UIView()
    }
    
}

extension CompetitionsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueResuableCell(withCellType: CompetitionCell.self, forIndexPath: indexPath)
        cell.textLabel?.text = viewModel.titleForCompetition(at: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let competition = viewModel.competition(at: indexPath.row) else { return }
        let vm = CompetitionInfoViewModel(competition: competition)
        let vc = CompetitionInfoViewController.initFromNib()
        vc.viewModel = vm

        self.navigationController?.pushViewController(vc, animated: true)
    }
}
