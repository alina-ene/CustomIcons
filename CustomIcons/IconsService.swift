//
//  IconsService.swift
//  CustomIcons
//
//  Created by Alina Ene on 14/05/2021.
//

import Foundation

final class IconsService: ObservableObject {
    
    @Published var icons = [Icon]()
    
    func fetchIcons() {
        icons = [Icon(title: "test", subtitle: "ggggg", image: "mmm"), Icon(title: "teste", subtitle: "ggggg", image: "mmm")]
    }
}
