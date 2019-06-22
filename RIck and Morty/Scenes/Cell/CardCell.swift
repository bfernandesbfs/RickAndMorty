//
//  CardCell.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/8/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import SwiftUI

struct CardCell : View {

    var character: Character

    var body: some View {

        let gradient = LinearGradient(gradient: Gradient(colors: [.clear, .black]),
                                      startPoint: UnitPoint(x: 0.0, y: 0.2),
                                      endPoint: UnitPoint(x: 0.0, y: 1.2))

        return ZStack(alignment: .bottomLeading) {
            
            ImageView(viewModel: ImageViewModel(url: character.image))
                .frame(height: 200)
                .overlay(Rectangle().fill(gradient))

            VStack(alignment: .leading) {
                Text(character.name)
                    .color(.white)
                    .font(.title)
                Text(character.status.rawValue)
                    .color(.white)
                    .font(.caption)
            }
            .padding()
        }
        .clipped()
        .cornerRadius(8)
    }
}

//#if DEBUG
//struct CardCell_Previews : PreviewProvider {
//
//    static var previews: some View {
//        Group {
//            CardCell(character: Service.mock[0])
//        }
//        .previewLayout(.fixed(width: 375, height: 200))
//    }
//}
//#endif
