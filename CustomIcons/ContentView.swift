//
//  ContentView.swift
//  CustomIcons
//
//  Created by Alina Ene on 14/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var iconsService: IconsService
    
    private var icons: [Icon] {
        iconsService.icons
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 8) {
                if !icons.isEmpty {
                    ForEach(icons, id: \.title) { icon in
                        IconRowView(title: icon.title, subtitle: icon.subtitle, image: icon.image)
                    }
                } else {
                    IconRowView.placeholderIcons
                }
            }
            .padding(20)
            
        }
        .onAppear(perform: iconsService.fetchIcons)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(IconsService())
    }
}
