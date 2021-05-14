//
//  IconRowView.swift
//  CustomIcons
//
//  Created by Alina Ene on 14/05/2021.
//

import SwiftUI

struct IconRowView: View {
    let title: String
    let subtitle: String
    let image: String
    
    var body: some View {
        HStack(alignment: .center) {
            itemImage
                .accessibility(identifier: image)
            VStack(alignment: .leading) {
                
                Text(title)
                    .lineLimit(2)
                    .accessibility(identifier: title)
                Text(subtitle)
                    .lineLimit(1)
                    .accessibility(identifier: subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .multilineTextAlignment(.leading)
            Spacer(minLength: 0)
        }
    }
    
    @ViewBuilder
    var itemImage: some View {
        if let url = URL(string: image), let data = try? Data(contentsOf: url), let imageObj = UIImage(data: data) {
            Image(uiImage: imageObj)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(8)
        } else {
        Color.secondary
            .frame(width: 50, height: 50)
            .cornerRadius(8)
        }
    }
    
    static let placeholderIcons: some View = {
        ForEach(0 ..< 15) { item in
            IconRowView(title: "Title",
                        subtitle: "subtitle",
                        image: "image")
                .redacted(reason: .placeholder)
        }
    }()
}

struct IconRowView_Previews: PreviewProvider {
    static var previews: some View {
        IconRowView(title: "Title", subtitle: "Subtitle", image: "image")
    }
}
