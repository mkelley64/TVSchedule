//
//  Listing.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/3/18.
//  Copyright © 2018 Kelley. All rights reserved.
//
/*
 {"id":339141,"url":"http://www.tvmaze.com/episodes/339141/clarence-1x26-rough-riders-elementary","name":"Rough Riders Elementary","season":1,"number":26,"airdate":"2014-12-01","airtime":"07:30","airstamp":"2014-12-01T12:30:00+00:00","runtime":11,"image":null,"summary":"","show":{"id":5617,"url":"http://www.tvmaze.com/shows/5617/clarence","name":"Clarence","type":"Animation","language":"English","genres":["Comedy","Family"],"status":"Running","runtime":15,"premiered":"2014-02-17","officialSite":null,"schedule":{"time":"16:00","days":["Monday","Tuesday","Wednesday","Thursday"]},"rating":{"average":null},"weight":0,"network":{"id":11,"name":"Cartoon Network","country":{"name":"United States","code":"US","timezone":"America/New_York"}},"webChannel":null,"externals":{"tvrage":null,"thetvdb":271421,"imdb":"tt3061050"},"image":{"medium":"http://static.tvmaze.com/uploads/images/medium_portrait/22/56691.jpg","original":"http://static.tvmaze.com/uploads/images/original_untouched/22/56691.jpg"},"summary":"<p>The series revolves around <b>Clarence</b>, an optimistic boy who wants to do everything because everything is amazing.</p>","updated":1525043018,"_links":{"self":{"href":"http://api.tvmaze.com/shows/5617"},"previousepisode":{"href":"http://api.tvmaze.com/episodes/1346509"}}},"_links":{"self":{"href":"http://api.tvmaze.com/episodes/339141"}}}
 */
import Foundation

struct Listing: Decodable {
    var id: Int
    var url: URL
    var name: String
    var season: Int
    var number: Int?
    var airdate: String
    var airtime: String
    var airstamp: String
    var runtime: Int?
    var image: Image?
    var summary: String?
    var show: Show
}


