//
//  CustomIconsUITests.swift
//  CustomIconsUITests
//
//  Created by Alina Ene on 14/05/2021.
//

import XCTest

class CustomIconsUITests: XCTestCase {

    func testLoadedData() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.buttons["Lime Green"].exists)
        XCTAssertTrue(app.buttons["Peaceful Green"].exists)
        XCTAssertTrue(app.buttons["Royal Purple"].exists)
    }

}
