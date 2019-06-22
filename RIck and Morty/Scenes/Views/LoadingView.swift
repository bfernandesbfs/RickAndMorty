//
//  LoadingView.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/8/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import SwiftUI

struct LoadingView : View {

    @State var angle: Double = 0

    var body: some View {
        VStack {
            Image("portal")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .rotationEffect(.degrees(angle))
                .animation(Animation.basic(duration: 0.6,
                                           curve: .linear).repeatForever(autoreverses: false))
                .onAppear(perform: appear)
            Text("loading...")
                .font(.title)
                .padding()
            }
            .clipped()
    }

    func appear() {
        withAnimation {
            self.angle = -360
        }
    }
}

#if DEBUG
struct LoadingView_Previews : PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
#endif
