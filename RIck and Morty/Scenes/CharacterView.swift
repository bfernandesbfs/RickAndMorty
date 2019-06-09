//
//  CharacterView.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/8/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import SwiftUI

struct CharacterView : View {
    var body: some View {
        List {

            VStack {
                Image("1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            }

            Section(header: Text("Characteristics").font(.subheadline)) {

                HStack {
                    Text("Status")
                        .font(.headline)
                    Spacer()

                    Text("Alive")
                        .font(.body)
                }

                HStack {
                    Text("Species")
                        .font(.headline)
                    Spacer()
                    Text("Human")
                }

                HStack {
                    Text("Type")
                        .font(.headline)
                    Spacer()
                    Text("")
                }

                HStack {
                    Text("Gender")
                        .font(.headline)
                    Spacer()
                    Text("Male")
                }

                HStack {
                    Text("Origin")
                        .font(.headline)
                    Spacer()
                    Text("Earth")
                }
            }
            .padding(.top, 16)
        }
        .listStyle(.grouped)
        .navigationBarTitle(Text("Rick Sanchez"), displayMode: .large)
    }
}

#if DEBUG
struct CharacterView_Previews : PreviewProvider {
    static var previews: some View {

        NavigationView {
            CharacterView()
        }
    }
}
#endif
