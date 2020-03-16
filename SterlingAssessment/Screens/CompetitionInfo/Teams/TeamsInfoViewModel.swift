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
        
        service.request(.competitionStandings(competitionId: competitionId)) {[weak self] result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(StandingsResponse.self, from: data)
                    self?.teams = response.standings?[0].table ?? []
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
    
    func viewModelForCell(at indexPath: IndexPath) -> TableViewModel? {
        guard indexPath.row < teams.count else { return nil }
        let table = teams[indexPath.row]
        return TableViewModel(
            position: "\(table.position ?? 0)",
            crest: table.team?.crestUrl ?? "",
            teamName: table.team?.name ?? "",
            matchPlayed: "\(table.playedGames ?? 0)",
            goalDifference: "\(table.goalDifference ?? 0)",
            points: "\(table.points ?? 0)"
        )
    }
}
