//
//  Endpoints.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    static func getTodaysFixtures() -> Endpoint {
        return Endpoint(
            path: "matches",
            queryItems: []
        )
    }
    
    static func getCompetitions() -> Endpoint {
        return Endpoint(
            path: "competitions",
            queryItems: []
        )
    }
    
    static func competitionStandings(competitionId: Int) -> Endpoint {
        return Endpoint(
            path: "competitions/\(competitionId)/standings",
            queryItems: []
        )
    }
    
    static func competitionTeams(competitionId: Int) -> Endpoint {
        return Endpoint (
            path: "competitions/\(competitionId)/teams",
            queryItems: []
        )
    }
    
    static func competitionMatches(competitionId: Int) -> Endpoint {
        return Endpoint (
            path: "competitions/\(competitionId)/matches",
            queryItems: []
        )
    }
}

extension Endpoint {
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.football-data.org"
        urlComponents.path = "/v2/" + path
        urlComponents.queryItems = queryItems
        
        return urlComponents.url
    }
    
    var request: URLRequest? {
        guard let url = url else { return nil }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        return URLRequest(url: url)
    }
}
