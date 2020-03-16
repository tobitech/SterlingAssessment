//
//  MatchTableViewCell.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell, NibIdentifiable & ClassIdentifiable {
    
    
    @IBOutlet weak var matchTimeLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    
    var viewModel: MatchViewModel! {
        didSet {
            self.configureCell(with: viewModel)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func configureCell(with vm: MatchViewModel) {
        matchTimeLabel.text = vm.matchTime
        homeTeamLabel.text = vm.homeTeam
        awayTeamLabel.text = vm.awayTeam
        homeTeamScoreLabel.text = vm.homeTeamScore
        awayTeamScoreLabel.text = vm.awayTeamScore
        currentTimeLabel.text = vm.currentTime
    }
    
}
