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
        switch viewModel.state {
        case .initial:
            Text(viewModel.text)
                .padding()
        case .loading:
            EmptyView()
        case .finish:
            EmptyView()
        case .error:
            EmptyView()
        }
    }
}

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var state: State

        let text: String

        init(text: String) {
            self.text = text
        }
    }
}

extension ContentView.ViewModel {
    enum State: Equatable {
        case initial
        case finish
        case loading
        case error
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init(text: "Hello World"))
    }
}
