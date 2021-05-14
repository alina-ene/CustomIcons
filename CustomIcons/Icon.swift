//
//  Icon.swift
//  CustomIcons
//
//  Created by Alina Ene on 14/05/2021.
//

import Foundation

struct Icon: Codable {
    let title: String
    let subtitle: String
    let image: String
}

struct Icons: Codable {
    let icons: [Icon]
}
