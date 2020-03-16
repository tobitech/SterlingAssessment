//
//  CompetitionTableInfoViewModel.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

class TableInfoViewModel {
    
    // MARK: Output
    private var tables: [Table] {
        didSet {
            self.didLoadTable?(tables, nil)
        }
    }
    var didLoadTable: (([Table]?, String?) -> Void)?
    
    let competitionId: Int
    
    // MARK: Private Properties
    private let service: NetworkService
        
    // MARK: Init
    init(competitionId: Int,
         service: NetworkService = NetworkService()) {
        self.service = service
        self.competitionId = competitionId
        self.tables = []
        
        service.request(.competitionStandings(competitionId: competitionId)) {[weak self] result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(StandingsResponse.self, from: data)
                    self?.tables = response.standings?[0].table ?? []
                } catch {
                    print(error)
                    self?.didLoadTable?(nil, error.localizedDescription)
                }
            case .failure(let error):
                self?.didLoadTable?(nil, error.localizedDescription)
            }
        }
    }
    
    // MARK: Public Methods
    func numberOfItems() -> Int {
        return self.tables.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> TableViewModel? {
        guard indexPath.row < tables.count else { return nil }
        let table = tables[indexPath.row]
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
