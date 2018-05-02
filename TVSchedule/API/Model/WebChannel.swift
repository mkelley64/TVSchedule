//
//  WebChannel.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/2/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import Foundation

/*
 "webChannel":{"id":123,"name":"WATCH Disney XD","country":{"name":"United States","code":"US","timezone":"America/New_York"}}
 */

struct WebChannel: Decodable {
    var id: Int
    var name: String
    var country: Country
}
