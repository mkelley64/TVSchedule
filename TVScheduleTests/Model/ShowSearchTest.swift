//
//  ShowSearchTest.swift
//  TVScheduleTests
//
//  Created by Mark Kelley on 5/3/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import XCTest
@testable import TVSchedule

class ShowSearchTest: XCTestCase {
    
    var json: Data!
    
    override func setUp() {
        super.setUp()
        
        guard json == nil else { return }
        
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "ShowSearch", withExtension: "json") else {
            XCTFail("Missing file: ShowSearch.json")
            return
        }
        
        do {
            json = try Data(contentsOf: url)
        } catch {}
    }
    
    func testShowSearchResultsDecode() {
        let decoder = JSONDecoder()
        
        do {
            let schedule = try decoder.decode([SearchResult].self, from: json)            
            XCTAssertNotNil(schedule)
        } catch (let error) {
            print(error)
            XCTFail("Parse failed")
        }
    }
}
