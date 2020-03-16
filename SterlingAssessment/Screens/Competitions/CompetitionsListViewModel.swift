//
//  CompetitionsListViewModel.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

class CompetitionsListViewModel {
    
    // MARK: Output
    private var competitions: [Competition] {
        didSet {
            self.didLoadCompetitions?(competitions, nil)
        }
    }
    
    var didLoadCompetitions: (([Competition]?, String?) -> Void)?
    
    // MARK: Private
    private let service: NetworkService
    
    // MARK: Init
    init(service: NetworkService = NetworkService()) {
        self.service = service
        self.competitions = []
        
        service.request(.getCompetitions()) {[weak self] result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(CompetitionsResponse.self, from: data)
                    self?.competitions = response.competitions
                } catch {
                    self?.didLoadCompetitions?(nil, error.localizedDescription)
                }
            case .failure(let error):
                self?.didLoadCompetitions?(nil, error.localizedDescription)
            }
        }
    }
    
    // MARK: Public Methods
    func competition(at index: Int) -> Competition? {
        guard index < competitions.count else { return nil }
        return competitions[index]
    }
    
    func numberOfItems() -> Int {
        return self.competitions.count
    }
    
    func titleForCompetition(at indexPath: IndexPath) -> String? {
        guard let competition = competition(at: indexPath.row) else { return nil }
        
        return competition.name ?? ""
    }
    
}
