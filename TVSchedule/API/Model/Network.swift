//
//  Network.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/2/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import Foundation
/*
 "network":{"id":11,"name":"Cartoon Network","country":{"name":"United States","code":"US","timezone":"America/New_York"}}
 */

struct Network: Decodable {
    var id: Int
    var name: String
    var country: Country
}
