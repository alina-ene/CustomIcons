//
//  CustomIconsApp.swift
//  CustomIcons
//
//  Created by Alina Ene on 14/05/2021.
//

import SwiftUI

@main
struct CustomIconsApp: App {
    @StateObject private var iconsService: IconsService
    
    init() {
        let network = NetworkService()
        _iconsService = StateObject(wrappedValue: IconsService(networkService: network))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(iconsService)
        }
    }
}
