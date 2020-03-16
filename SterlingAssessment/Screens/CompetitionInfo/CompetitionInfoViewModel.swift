//
//  CompetitionInfoViewModel.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

class CompetitionInfoViewModel {
    
    // MARK: Output
    var name: String
    
    // MARK: Private
    private let competition: Competition
    
    // MARK: Init
    init(competition: Competition) {
        self.competition = competition
        self.name = competition.name ?? ""
    }
    
}
