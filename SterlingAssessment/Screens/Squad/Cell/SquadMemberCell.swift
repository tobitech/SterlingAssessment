//
//  SquadMemberCell.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 17/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class SquadMemberCell: UITableViewCell, NibIdentifiable & ClassIdentifiable {

    @IBOutlet weak var shirtNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    var viewModel: SquadMemberViewModel! {
        didSet {
            self.configureCell(vm: viewModel)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func configureCell(vm: SquadMemberViewModel) {
        shirtNumberLabel.text = vm.shirtNumber
        nameLabel.text = vm.name
        positionLabel.text = vm.position
    }
    
}
