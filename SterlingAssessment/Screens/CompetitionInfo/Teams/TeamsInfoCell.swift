//
//  TeamsInfoCell.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class TeamsInfoCell: UICollectionViewCell,
NibIdentifiable & ClassIdentifiable {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: TeamsInfoViewModel? {
        didSet {
            setupViewModel()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
    }
    
    private func setupViewModel() {
        viewModel?.didLoadTeams = {[weak self] teams, error in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    private func setupCollectionView() {
        collectionView.register(cellType: TeamCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = .init(top: 0, left: 0, bottom: 88, right: 0)
    }

}

extension TeamsInfoCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withCellType: TeamCell.self, forIndexPath: indexPath)
        if let cellViewModel = viewModel?.viewModelForCell(at: indexPath) {
            cell.viewModel = cellViewModel
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 30) / 3
        return CGSize(width: width, height: 164)
    }
}
