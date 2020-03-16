//
//  NetworkService.swift
//  SterlingAssessment
//
//  Created by Oluwatobi Omotayo on 16/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidRequest
    case network(Error)
    case invalidData
}

class NetworkService {
    let urlSession = URLSession.shared
    
    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data, Error>) -> Void) {
        guard var request = endpoint.request else {
            return completion(.failure(NetworkError.invalidRequest))
        }
        
        request.allHTTPHeaderFields = [
            "X-Auth-Token": FootballApp.Credentials.APIToken
        ]
        
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                return completion(.failure(NetworkError.network(error)))
            }
            
            guard let data = data else {
                return completion(.failure(NetworkError.invalidData))
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
