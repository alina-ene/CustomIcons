//
//  CustomIconsUITests.swift
//  CustomIconsUITests
//
//  Created by Alina Ene on 14/05/2021.
//

import XCTest

class CustomIconsUITests: XCTestCase {

    func testLoadedData() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.staticTexts["Lime Green"].exists)
        XCTAssertTrue(app.staticTexts["#A5EA9B"].exists)
        XCTAssertTrue(app.images["https://irapps.github.io/wzpsolutions/tests/ios-custom-icons/LimeGreen.png"].exists)
    }

}
