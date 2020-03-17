//
//  CompetitionTeamsInfoViewModel.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

class TeamsInfoViewModel {
    
    // MARK: Output
    private var teams: [Team] {
        didSet {
            self.didLoadTeams?(teams, nil)
        }
    }
    var didLoadTeams: (([Team]?, String?) -> Void)?
    
    let competitionId: Int
    
    // MARK: Private Properties
    private let service: NetworkService
        
    // MARK: Init
    init(competitionId: Int,
         service: NetworkService = NetworkService()) {
        self.service = service
        self.competitionId = competitionId
        self.teams = []
        
        service.request(.competitionTeams(competitionId: competitionId)) {[weak self] result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(TeamsResponse.self, from: data)
                    self?.teams = response.teams ?? []
                } catch {
                    print(error)
                    self?.didLoadTeams?(nil, error.localizedDescription)
                }
            case .failure(let error):
                self?.didLoadTeams?(nil, error.localizedDescription)
            }
        }
    }
    
    // MARK: Public Methods
    func numberOfItems() -> Int {
        return self.teams.count
    }
    
    func team(at index: Int) -> Team? {
        guard index < self.teams.count else { return nil }
        return teams[index]
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> TeamViewModel? {
        guard let team = team(at: indexPath.row) else { return nil }
        return TeamViewModel(
            name: team.name ?? "",
            crest: team.crestUrl ?? ""
        )
    }
}
