//
//  TeamCell.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class TeamCell: UICollectionViewCell,
NibIdentifiable & ClassIdentifiable {
    
    @IBOutlet weak var crestImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel: TeamViewModel! {
        didSet {
            configureCell(vm: viewModel)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func configureCell(vm: TeamViewModel) {
        nameLabel.text = vm.name
    }

}
