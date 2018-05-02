//
//  Country.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/2/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import Foundation

/*
 "country":{"name":"United States","code":"US","timezone":"America/New_York"}
 */

struct Country: Decodable {
    var name: String
    var code: String
    var timezone: String
}
