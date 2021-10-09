//
//  KingsCupUITests.swift
//  KingsCupUITests
//
//  Created by Allan Aranzaso on 2021-10-08.
//

import XCTest

class KingsCupUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let letsPlayButton = app.buttons.element
        
        XCTAssert(letsPlayButton.isEnabled)
        XCTAssert(letsPlayButton.exists)
        letsPlayButton.tap()
        
        let shuffle = UIButton()
        shuffle.accessibilityIdentifier = "shuffle"
//        let shuffleButton = app.buttons
//        XCTAssert(shuffleButton.exists)
    }
    
    func testEx() throws {
        
        let app = XCUIApplication()
//        let closeButton = UIButton()
        let letsPlayButton = app/*@START_MENU_TOKEN@*/.buttons["Let's Play"].staticTexts["Let's Play"]/*[[".buttons[\"Let's Play\"].staticTexts[\"Let's Play\"]",".buttons[\"letsPlayBtn\"].staticTexts[\"Let's Play\"]",".staticTexts[\"Let's Play\"]"],[[[-1,2],[-1,1],[-1,0]]],[2]]@END_MENU_TOKEN@*/
        let shuffleButton = app.buttons["Shuffle"]
        let drawButton = app.buttons["Draw"]
        let closeModalButton = app.buttons["closeButton"]
        
        app.launch()
        
        letsPlayButton.tap()
        shuffleButton.tap()
        for index in 1...51  {
            print("Loop iteration: \(index)")
            drawButton.tap()
//            closeModalButton.tap()
            app.swipeDown(velocity: XCUIGestureVelocity.fast)
        }
                

    }
    
    func testLetsPlay() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let btn = UIButton()
        btn.accessibilityIdentifier = "letsPlayBtn"
        XCTAssert(app.buttons["Let's Play"].exists)
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
