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
    static func getCompetitions() -> Endpoint {
        return Endpoint(
            path: "/competitions",
            queryItems: []
        )
    }
}

extension Endpoint {
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "api.football-data.org/v2"
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        
        return urlComponents.url
    }
}
