//
//  Externals.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/2/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import Foundation

/*
 "externals":{"tvrage":null,"thetvdb":271421,"imdb":"tt3061050"}
 */

struct Externals: Decodable {
    var tvrage: Int?
    var thetvdb:  Int?
    var imdb: String?
}
