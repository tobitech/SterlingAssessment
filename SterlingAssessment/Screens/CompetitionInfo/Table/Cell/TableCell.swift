//
//  TableCell.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell,
NibIdentifiable & ClassIdentifiable {
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var machesPlayedLabel: UILabel!
    @IBOutlet weak var goalDifferenceLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    var viewModel: TableViewModel! {
        didSet {
            configureCell(vm: viewModel)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func configureCell(vm: TableViewModel) {
        positionLabel.text = vm.position
        teamLabel.text = vm.teamName
        machesPlayedLabel.text = vm.matchPlayed
        goalDifferenceLabel.text = vm.goalDifference
        pointsLabel.text = vm.points
    }
    
}
