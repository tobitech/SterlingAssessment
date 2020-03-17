//
//  SquadHeaderView.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 17/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit
import SDWebImageSVGCoder

class SquadHeaderView: UIView {
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    var crestUrl: String? {
        didSet {
            guard let url = URL(string: crestUrl ?? "") else { return }
            if #available(iOS 13.0, *) {
                let coder = SDImageSVGCoder.shared
                SDImageCodersManager.shared.addCoder(coder)
                let imageSize = CGSize(width: 100, height: 100)
                imageView.sd_setImage(with: url, placeholderImage: nil, options: [], context: [.svgImageSize: imageSize])
            } else {
                // Fallback on earlier versions
                imageView.tintColor = .gray
            }
        }
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(imageView)
        imageView.anchor(top: topAnchor, leading: nil, bottom: bottomAnchor, trailing: nil)
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
