//
//  ContentView.swift
//  SwiftUIKit
//
//  Created by Vitor Moriya on 24/08/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        Text(viewModel.text)
            .padding()
    }
}

extension ContentView {
    class ViewModel: ObservableObject {
        let text: String

        init(text: String) {
            self.text = text
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init(text: "Hello World"))
    }
}
