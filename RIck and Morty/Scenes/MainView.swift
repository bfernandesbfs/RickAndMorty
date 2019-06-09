//
//  MainView.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/8/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import SwiftUI

struct MainView : View {

    @State var isLoading: Bool = false

    var title: Text = Text("Rick am Morty")

    var body: some View {

        NavigationView {
            
            VStack {
                if self.isLoading {
                    LoadingView()
                        .edgesIgnoringSafeArea(.top)
                } else {
                    List {
                        SeachView(text: .constant(""))

                        ForEach(0 ..< 5) { _ in

                            NavigationButton(destination: CharacterView()) {
                                CardCell()
                                    .padding([.top, .bottom], 8)
                                    .shadow(radius: 10)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(title, displayMode: .large)
        }
        .onAppear(perform: appear)
    }

    func appear() {

//        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
//            self.isLoading = false
//        }
    }
}

#if DEBUG
struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
