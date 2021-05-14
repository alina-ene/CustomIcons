//
//  CustomIconsTests.swift
//  CustomIconsTests
//
//  Created by Alina Ene on 14/05/2021.
//

import XCTest
@testable import CustomIcons

class CustomIconsTests: XCTestCase {

    func testLocalJson() throws {
        let iconsService = IconsService(networkService: NetworkService())
        iconsService.fetchLocalIcons()
        assert(!iconsService.icons.isEmpty, "icons list should not be empty")
        assert(iconsService.icons.count == 16, "icons list should hold 16 elements")
        
        assert(iconsService.icons[0].title == "Lime Green")
        assert(iconsService.icons[0].subtitle == "#A5EA9B")
        assert(iconsService.icons[0].image == "https://irapps.github.io/wzpsolutions/tests/ios-custom-icons/LimeGreen.png")
    }

}
