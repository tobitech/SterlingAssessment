//
//  Fixture.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

// MARK: Service Resource Response Models
struct MatchesResponse: Decodable {
    let matches: [Match]
}

// MARK: Main Models
struct Match: Decodable {
    let id: Int?
    let competition: Competition?
    let score: Score?
    let utcDate: String?
    let homeTeam: Team?
    let awayTeam: Team?
}

struct Score: Decodable {
    let winner: String?
    let duration: String?
    let fullTime: ScoreTime
}

struct ScoreTime: Decodable {
    let homeTeam: Int?
    let awayTeam: Int?
}
