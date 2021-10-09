//
//  KingsCupTests.swift
//  KingsCupTests
//
//  Created by Allan Aranzaso on 2021-10-08.
//

import XCTest
@testable import KingsCup

class KingsCupTests: XCTestCase {
   

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJSONLoad() throws {
        // given
        let fileName = "CardData"
        let cards: [Card]
        
        // when
        cards = loadJSON(fileName)
        
        // then
        print(cards.debugDescription)
        XCTAssert(!cards.isEmpty)
    }
    
    func testBadJSONLoad() throws {
        // Given
//        let fileName = "cardData"
//        let cards: [Card]
//
//        // When
//        cards = loadJSON(fileName)
//
//        // Then
//        XCTAssertThrowsError(try cards = loadJSON(fileName), "JSON file: \(fileName) could not be loaded. Check the file name.") {
//            (error) in
//
//        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
