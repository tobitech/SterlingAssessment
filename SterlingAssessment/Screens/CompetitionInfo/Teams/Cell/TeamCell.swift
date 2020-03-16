//
//  TeamCell.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit
import SDWebImageSVGCoder

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
        guard let url = URL(string: vm.crest) else { return }
        if #available(iOS 13.0, *) {
            let coder = SDImageSVGCoder.shared
            SDImageCodersManager.shared.addCoder(coder)
            let imageSize = CGSize(width: 100, height: 100)
            crestImageView.sd_setImage(with: url, placeholderImage: nil, options: [], context: [.svgImageSize: imageSize])
        } else {
            // Fallback on earlier versions
            crestImageView.tintColor = .gray
        }
    }

}
