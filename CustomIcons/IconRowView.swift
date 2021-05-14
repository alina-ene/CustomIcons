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
        Button(action: {
            //            onLoginTapped?(username, password)
        }) {
            HStack(alignment: .center) {
                itemImage
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                    .accessibility(identifier: image)
                VStack(alignment: .leading) {
                    
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .lineLimit(2)
                        .accessibility(identifier: title)
                    Text(subtitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                        .accessibility(identifier: subtitle)
                }
                .multilineTextAlignment(.leading)
                Spacer(minLength: 0)
            }
        }.background(Color(.white))
        .cornerRadius(8.0)
        .shadow(color: Color.gray.opacity(0.3), radius: 8.0, x: 0, y: 0)
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
