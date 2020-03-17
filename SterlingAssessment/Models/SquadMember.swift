//
//  SquadMember.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 17/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

struct SquadResponse: Decodable {
    let squad: [SquadMember]?
}

struct SquadMember: Decodable {
    let shirtNumber: Int?
    let name: String?
    let position: String?
}
