//
//  Competition.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

struct CompetitionsResponse: Decodable {
    let competitions: [Competition]
}

struct Competition: Decodable {
    let id: Int?
    let name: String?
    let code: String?
    let currentSeason: CurrentSeason?
}

struct CurrentSeason: Decodable {
    let startDate: String?
    let endDate: String?
}
