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
        case .loading:
            EmptyView()
        case .finish(let facts):
            VStack {
                ForEach(facts.data, id: \.self) { fact in
                    Text(fact)
                        .foregroundColor(.red)
                        .padding()
                        .onTapGesture {
                            viewModel.onTapText?(fact)
                        }
                }
            }
        case .error:
            EmptyView()
        }
    }
}

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var state: State = .initial

        var onTapText: ((String) -> Void)?

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
