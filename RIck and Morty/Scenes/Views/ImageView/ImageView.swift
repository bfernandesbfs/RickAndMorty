//
//  ImageView.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 22/06/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import SwiftUI

struct ImageView : View {
    @State var viewModel: ImageViewModel
        
    var body: some View {
        
        Image(uiImage: viewModel.image ?? UIImage(named: "portal")!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .onAppear(perform: viewModel.fetch)
    }
}
