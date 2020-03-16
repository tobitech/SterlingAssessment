//
//  Team.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

struct TeamsResponse: Decodable {
    let teams: [Team]?
}

struct Team: Decodable {
    let id: Int?
    let name: String?
    let crestUrl: String?
}
