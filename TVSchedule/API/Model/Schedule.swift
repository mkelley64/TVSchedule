//
//  Schedule.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/2/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import Foundation

/*
 {"time":"16:00","days":["Monday","Tuesday","Wednesday","Thursday"]}
 */
struct Schedule: Decodable {
    var time: String
    var days: [String]
}
