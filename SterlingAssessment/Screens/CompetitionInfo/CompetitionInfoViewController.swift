//
//  CompetitionViewController.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class CompetitionInfoViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: CompetitionInfoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = " "

        navigationItem.title = viewModel.name
        segmentedControl.addTarget(self, action: #selector(handleSegmentChanged(_:)), for: .valueChanged)
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(cellType: CompetitionTableInfoCell.self)
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: Action Methods
    @objc func handleSegmentChanged(_ sender: UISegmentedControl) {
        collectionView.scrollToItem(at: IndexPath(item: sender.selectedSegmentIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension CompetitionInfoViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            let cellViewModel = CompetitionTableInfoViewModel(competitionId: viewModel.competition.id ?? 0)
            let cell = collectionView.dequeueReusableCell(withCellType: CompetitionTableInfoCell.self, forIndexPath: indexPath)
            cell.viewModel = cellViewModel
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / view.frame.width)
        self.segmentedControl.selectedSegmentIndex = index
    }
}
