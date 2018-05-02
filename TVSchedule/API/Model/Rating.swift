//
//  Rating.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/2/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import Foundation

/*
 "rating":{"average":null}
 */

struct Rating: Decodable {
    var average: Float?
}
