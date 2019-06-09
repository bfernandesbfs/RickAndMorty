//
//  CardCell.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/8/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import SwiftUI

struct CardCell : View {
    var body: some View {

        let gradient = LinearGradient(gradient: Gradient(colors: [.clear, .black]),
                                      startPoint: UnitPoint(x: 0.0, y: 0.2),
                                      endPoint: UnitPoint(x: 0.0, y: 1.2))

        return ZStack(alignment: .bottomLeading) {
            Image("1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .overlay(Rectangle().fill(gradient))

            VStack(alignment: .leading) {
                Text("Rick Rick Rick Rick Rick Rick Rick Rick RickRE d")
                    .color(.white)
                    .font(.title)
                Text("Status")
                    .color(.white)
                    .font(.caption)
            }
            .padding()
        }
        .clipped()
        .cornerRadius(8)
    }
}

#if DEBUG
struct CardCell_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            CardCell()
        }
        .previewLayout(.fixed(width: 375, height: 200))
    }
}
#endif
