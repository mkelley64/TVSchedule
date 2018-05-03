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

typealias ApiCompletionBlock<T : Decodable> = (ApiResult<T>) -> Void

class TVMazeClient {
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func fetchListings(for date: Date,
                       country: String = "US",
                       completion: @escaping ApiCompletionBlock<[Listing]>) {
        let dateString = date.tvMazeDateString()
        let url = Router.Schedule(country, dateString).url()
        let req = URLRequest(url: url)
        
        let task = session.dataTask(with: req) { (data, response, error) in
            if let err = error {
                DispatchQueue.main.async {
                    completion(.failure(.connectionError(err)))
                }
            } else {
                let httpResponse = response as! HTTPURLResponse
                
                switch httpResponse.statusCode {
                case 200:
                    let decoder = JSONDecoder()
                    
                    do {
                        let listings = try decoder.decode([Listing].self, from: data!)
                         DispatchQueue.main.async {
                            completion(.success(listings))
                        }
                    } catch let e {
                        DispatchQueue.main.async {
                            completion(.failure(.responseFormatInvalid(e.localizedDescription)))
                        }
                    }
                default:
                    DispatchQueue.main.async {
                        completion(.failure(.serverError(httpResponse.statusCode)))
                    }
                }
            }
        }
        
        task.resume()
    }
    
    func fetchQueryResults(for query: String,
                           completion: @escaping ApiCompletionBlock<[SearchResult]>) {
        let url = Router.Search(query).url()
        let req = URLRequest(url: url)
        
        let task = session.dataTask(with: req) { (data, response, error) in
            if let err = error {
                DispatchQueue.main.async {
                    completion(.failure(.connectionError(err)))
                }
            } else {
                let httpResponse = response as! HTTPURLResponse
                
                switch httpResponse.statusCode {
                case 200:
                    let decoder = JSONDecoder()
                    
                    do {
                        let results = try decoder.decode([SearchResult].self, from: data!)
                        DispatchQueue.main.async {
                            completion(.success(results))
                        }
                    } catch let e {
                        DispatchQueue.main.async {
                            completion(.failure(.responseFormatInvalid(e.localizedDescription)))
                        }
                    }
                default:
                    DispatchQueue.main.async {
                        completion(.failure(.serverError(httpResponse.statusCode)))
                    }
                }
            }
        }
        
        task.resume()
        
    }
}
