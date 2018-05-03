//
//  Show.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/2/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import Foundation
/*
 {"id":5617,"url":"http://www.tvmaze.com/shows/5617/clarence","name":"Clarence","type":"Animation","language":"English","genres":["Comedy","Family"],"status":"Running","runtime":15,"premiered":"2014-02-17","officialSite":null,"schedule":{"time":"16:00","days":["Monday","Tuesday","Wednesday","Thursday"]},"rating":{"average":null},"weight":0,"network":{"id":11,"name":"Cartoon Network","country":{"name":"United States","code":"US","timezone":"America/New_York"}},"webChannel":null,"externals":{"tvrage":null,"thetvdb":271421,"imdb":"tt3061050"},"image":{"medium":"http://static.tvmaze.com/uploads/images/medium_portrait/22/56691.jpg","original":"http://static.tvmaze.com/uploads/images/original_untouched/22/56691.jpg"},"summary":"<p>The series revolves around <b>Clarence</b>, an optimistic boy who wants to do everything because everything is amazing.</p>","updated":1525043018,"_links":{"self":{"href":"http://api.tvmaze.com/shows/5617"},"previousepisode":{"href":"http://api.tvmaze.com/episodes/1346509"}}}
 */

struct Show: Decodable {
    var id: Int
    var url: String
    var name: String
    var type: String?
    var language: String
    var genres: [String]
    var status: String
    var runtime: Int?
    var premiered: String?
    var officialSite: String?
    var schedule: Schedule
    var rating: Rating
    var weight: Int
    var network: Network?
    var webChannel: WebChannel?
    var externals: Externals
    var image: Image?
    var summary: String?  //TODO:  create a display string
    //_links
    //previousepisode
    
    var showURL: URL? {
        return URL(string: url)
    }
    
    var officialSiteURL: URL? {
        if let officialSite = officialSite {
            return URL(string: officialSite)
        }
        
        return nil
    }
}
