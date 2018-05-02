//
//  TVMazeClient.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/2/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import Foundation

enum ApiResult<T : Decodable> {
    case success(T)
    case failure(ApiError)
}

enum ApiError : Error {
    case connectionError(Error)
    case serverError(Int)
    case responseFormatInvalid(String)
}

class TVMazeClient {
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    //2014-05-02
    func fetchShowList(for date: String, completion: @escaping (ApiResult<[Show]>) -> Void) {
        let url = URL(string: "http://api.tvmaze.com/schedule?country=US&date=\(date)")!
        let req = URLRequest(url: url)
        
        let task = session.dataTask(with: req) { (data, response, error) in
            if let err = error {
                completion(.failure(.connectionError(err)))
            } else {
                let httpResponse = response as! HTTPURLResponse
                
                switch httpResponse.statusCode {
                case 200:
                    let decoder = JSONDecoder()
                    
                    do {
                        let shows = try decoder.decode([Show].self, from: data!)
                        completion(.success(shows))
                    } catch let e {
                        completion(.failure(.responseFormatInvalid(e.localizedDescription)))
                    }
                default:
                    completion(.failure(.serverError(httpResponse.statusCode)))
                }
            }
        }
        
        task.resume()
    }
}
