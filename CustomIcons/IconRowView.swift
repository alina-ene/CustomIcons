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
    let imageURL: URL?

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(title)
                    .lineLimit(2)
                Text(subtitle)
                    .lineLimit(1)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .multilineTextAlignment(.leading)
            Spacer(minLength: 0)
        }
    }
    
    static let placeholderIcons: some View = {
        ForEach(0 ..< 5) { item in
            IconRowView(title: "video.name",
                            subtitle: "video.artistName",
                            imageURL: nil)
                .redacted(reason: .placeholder)
        }
    }()
}

struct IconRowView_Previews: PreviewProvider {
    static var previews: some View {
        IconRowView(title: "Title", subtitle: "Subtitle", imageURL: URL(string: "")!)
    }
}
