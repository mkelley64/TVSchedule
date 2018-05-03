//
//  Router.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/2/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import Foundation

enum Router {
    case Schedule(String, String)
    case Search(String)
}

protocol Path {
    var baseURLString: String { get }
    func url() -> URL
}

extension Router: Path {
    var baseURLString: String { return "http://api.tvmaze.com" }

    func url() -> URL {
        switch self {
        case let .Schedule(country, date):
            return URL(string: "\(baseURLString)/schedule?country=\(country)&date=\(date)")!
        case .Search(let query):
            return URL(string: "\(baseURLString)/search/shows?q=\(query)")!
        }
    }
}
