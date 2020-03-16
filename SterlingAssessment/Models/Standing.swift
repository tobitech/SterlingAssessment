//
//  Standing.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

struct StandingsResponse: Decodable {
    let standings: [Standing]?
}

struct Standing: Decodable {
    let type: String?
    let table: [Table]?
}

struct Table: Decodable {
    let position: Int?
    let team: Team?
    let playedGames: Int?
    let goalDifference: Int?
    let points: Int?
}
