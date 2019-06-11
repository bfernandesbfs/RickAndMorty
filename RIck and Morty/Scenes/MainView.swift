//
//  MainView.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/8/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import SwiftUI

struct MainView : View {
    @ObjectBinding var service = Service()

    var body: some View {

        NavigationView {
            
            VStack {
                if service.isLoading {
                    LoadingView()
                        .edgesIgnoringSafeArea(.top)
                } else {
                    List {
                        SeachView(text: .constant(""))

                        ForEach(self.service.characterData.results) { character in

                            NavigationButton(destination: CharacterView()) {
                                CardCell(character: character)
                                    .padding([.top, .bottom], 8)
                                    .shadow(radius: 10)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Rick am Morty"), displayMode: .large)
        }
        .onAppear(perform: appear)
    }

    func appear() {
        self.service.characters()
    }
}

#if DEBUG
struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView(service: Service(isMock: true))
    }
}
#endif
