//
//  SearchResult.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/3/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    var score: Float
    var show: Show
}
