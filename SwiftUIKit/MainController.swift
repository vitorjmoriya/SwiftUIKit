//
//  MainController.swift
//  SwiftUIKit
//
//  Created by Vitor Moriya on 24/08/22.
//

import SwiftUI
class MainController: UIHostingController<ContentView> {

    let viewModel: ContentView.ViewModel

    init() {
        let viewModel: ContentView.ViewModel = .init(text: "Hello world")

        let view = ContentView(viewModel: viewModel)

        self.viewModel = viewModel

        super.init(rootView: view)

        self.viewModel.state = .initial

        Task { [weak self] in
            do {
                guard let self = self else { return }
                self.viewModel.state = .loading
                let data = try await URLSession.shared.data(from: .init(string:     "https://meowfacts.herokuapp.com/?count=3")!)
                let facts = try JSONDecoder().decode(CatFact.self, from: data.0)
                self.viewModel.state = .finish(facts)
            } catch {
                print(error)
            }
        }
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
