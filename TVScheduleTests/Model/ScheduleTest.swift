//
//  ScheduleTest.swift
//  TVScheduleTests
//
//  Created by Mark Kelley on 5/2/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import XCTest
@testable import TVSchedule

class ScheduleTest: XCTestCase {
    
    var json: Data!
    
    override func setUp() {
        super.setUp()
        
        guard json == nil else { return }
        
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "Schedule", withExtension: "json") else {
            XCTFail("Missing file: Schedule.json")
           return
        }
        
        do {
            json = try Data(contentsOf: url)
        } catch {}
    }
    
    
    func testScheduleDecode() {
        let decoder = JSONDecoder()
        
        do {
            let schedule = try decoder.decode([Listing].self, from: json)
            print(schedule.count)
            
            XCTAssertNotNil(schedule)
        } catch (let error) {
            print(error)
            XCTFail("Parse failed")
        }
    }
}
