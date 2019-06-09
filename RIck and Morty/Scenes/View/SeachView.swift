//
//  SeachView.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/8/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import SwiftUI

struct SeachView : View {
    @Binding var text: String
    @State var isSearching: Bool = false

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(isSearching ? .primary : .secondary)
            TextField($text,
                      placeholder: Text("Search here"),
                      onEditingChanged: editingChanged,
                      onCommit: commit)
                .textFieldStyle(.roundedBorder)

            }
            .padding([.top, .bottom], 8)
    }

    func editingChanged(_ change: Bool) {
        isSearching = change
    }

    func commit() {
        isSearching = !text.isEmpty
    }
}

#if DEBUG
struct SeachView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            SeachView(text: .constant(""))

        }
        .previewLayout(.fixed(width: 375, height: 60))
    }
}
#endif
