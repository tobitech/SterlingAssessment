//
//  FixturesListViewModel.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

class FixturesListViewModel {
    
    // MARK: Output
    private var fixtures: [Match] {
        didSet {
            self.didLoadFixtures?(fixtures, nil)
        }
    }
    var didLoadFixtures: (([Match]?, String?) -> Void)?
    
    // MARK: Private Properties
    private let service: NetworkService
    
    // MARK: Init
    init(service: NetworkService = NetworkService()) {
        self.service = service
        self.fixtures = []
        
        service.request(.getTodaysFixtures()) {[weak self] result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(MatchesResponse.self, from: data)
                    self?.fixtures = response.matches
                } catch {
                    print(error)
                    self?.didLoadFixtures?(nil, error.localizedDescription)
                }
            case .failure(let error):
                self?.didLoadFixtures?(nil, error.localizedDescription)
            }
        }
    }
    
    // MARK: Public Methods
    func numberOfItems() -> Int {
        return self.fixtures.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> MatchViewModel? {
        guard indexPath.row < fixtures.count else { return nil }
        let match = fixtures[indexPath.row]
        let vm = MatchViewModel(
            homeTeam: match.homeTeam?.name ?? "",
            awayTeam: match.awayTeam?.name ?? "",
            homeTeamScore: "\(match.score?.fullTime.homeTeam ?? 0)",
            awayTeamScore: "\(match.score?.fullTime.awayTeam ?? 0)",
            matchTime: formatDate(utcDate: match.utcDate ?? "") ?? "-:-",
            currentTime: "00\""
        )
        return vm
    }
    
    // MARK: Helpers
    private func formatDate(utcDate: String) -> String? {
        guard let date = DateFormatter.football.date(from: utcDate) else { return nil }
        return DateFormatter.fixture.string(from: date)
    }
}
