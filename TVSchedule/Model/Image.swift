//
//  Image.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/2/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import Foundation

/*
 "image":{"medium":"http://static.tvmaze.com/uploads/images/medium_portrait/22/56691.jpg","original":"http://static.tvmaze.com/uploads/images/original_untouched/22/56691.jpg"}
 */

struct Image: Decodable {
    var medium: URL
    var original: URL
}
