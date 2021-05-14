//
//  CustomIconsUITests.swift
//  CustomIconsUITests
//
//  Created by Alina Ene on 14/05/2021.
//

import XCTest

class CustomIconsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLocalJson() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.staticTexts["Lime Green"].exists)
        XCTAssertTrue(app.staticTexts["#A5EA9B"].exists)
        XCTAssertTrue(app.otherElements["https://irapps.github.io/wzpsolutions/tests/ios-custom-icons/LimeGreen.png"].exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
