//
//  CustomIconsTests.swift
//  CustomIconsTests
//
//  Created by Alina Ene on 14/05/2021.
//

import XCTest
@testable import CustomIcons

class CustomIconsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLocalJson() throws {
        let iconsService = IconsService()
        iconsService.fetchLocalIcons()
        assert(!iconsService.icons.isEmpty, "icons list should not be empty")
        assert(iconsService.icons.count == 16, "icons list should hold 16 elements")
        
        assert(iconsService.icons[0].title == "Lime Green")
        assert(iconsService.icons[0].subtitle == "#A5EA9B")
        assert(iconsService.icons[0].image == "https://irapps.github.io/wzpsolutions/tests/ios-custom-icons/LimeGreen.png")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
