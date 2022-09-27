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
                .foregroundColor(.red)
                .padding()
        case .loading:
            EmptyView()
        case .finish(let fact):
            Text(fact.data.first!)
        case .error:
            EmptyView()
        }
    }
}

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var state: State = .initial

        let text: String

        init(text: String) {
            self.text = text
        }
    }
}

extension ContentView.ViewModel {
    enum State: Equatable {
        case initial
        case finish(CatFact)
        case loading
        case error
    }
}

public struct ContentView_Previews: PreviewProvider {
    public static var previews: some View {
        ContentView(viewModel: .init(text: "Hello World"))
    }
}
