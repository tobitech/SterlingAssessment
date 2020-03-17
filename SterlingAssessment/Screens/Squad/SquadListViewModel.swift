//
//  SquadListViewModel.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 17/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

class SquadListViewModel {
    
    // MARK: Outputs
    var teamTitle: String
    var teamCrest: String
    var didLoadSquad: (([SquadMember]?, String?) -> Void)?
    
    // MARK: Private Properties
    private var squad: [SquadMember] {
        didSet {
            self.didLoadSquad?(squad, nil)
        }
    }
    private let service: NetworkService
    private let team: Team
    
    // MARK: Init
    init(team: Team, service: NetworkService = NetworkService()) {
        self.team = team
        self.teamTitle = team.name ?? ""
        self.teamCrest = team.crestUrl ?? ""
        self.service = service
        self.squad = []
        
        service.request(.teamSquad(teamId: team.id ?? 0)) {[weak self] result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(SquadResponse.self, from: data)
                    self?.squad = response.squad ?? []
                } catch {
                    self?.didLoadSquad?(nil, error.localizedDescription)
                }
            case .failure(let error):
                self?.didLoadSquad?(nil, error.localizedDescription)
            }
        }
    }
    
    // MARK: Public Methods
    func numberOfItems() -> Int {
        return self.squad.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> SquadMemberViewModel? {
        guard indexPath.row < self.squad.count else {
            return nil
        }
        
        let member = squad[indexPath.row]
        
        return SquadMemberViewModel(
            shirtNumber: "\(member.shirtNumber ?? 0)",
            name: member.name ?? "",
            position: member.position ?? ""
        )
    }
    
}
