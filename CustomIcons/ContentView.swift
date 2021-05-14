//
//  ContentView.swift
//  CustomIcons
//
//  Created by Alina Ene on 14/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    private var icons: [Icon] = [Icon(title: "test", subtitle: "ggggg", image: "mmm"), Icon(title: "teste", subtitle: "ggggg", image: "mmm")]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 8) {
                if !icons.isEmpty {
                    ForEach(icons, id: \.title) { icon in
                        IconRowView(title: icon.title, subtitle: icon.subtitle, imageURL: nil)
                    }
                } else {
                    IconRowView.placeholderIcons
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
