//
//  MainController.swift
//  SwiftUIKit
//
//  Created by Vitor Moriya on 24/08/22.
//

import SwiftUI
class MainController: UIHostingController<ContentView> {

    let coordinator: MainCoordinator

    let viewModel: ContentView.ViewModel

    init(coordinator: MainCoordinator) {

        let viewModel: ContentView.ViewModel = .init(text: "Hello world")

        let view = ContentView(viewModel: viewModel)

        self.coordinator = coordinator

        self.viewModel = viewModel

        super.init(rootView: view)

        self.viewModel.state = .initial


        self.viewModel.onTapText = { (number, detail) in
            switch number {
            case 0:
                coordinator.navigateTo(route: .red)
            case 1:
                coordinator.navigateTo(route: .blue)
            case 2:
                coordinator.navigateTo(route: .purple)
            case 3:
                coordinator.navigateTo(route: .normal(detail))
            default:
                print("nope")
            }
        }

        Task { [weak self] in
            do {
                guard let self = self else { return }
                self.viewModel.state = .loading
                let data = try await URLSession.shared.data(from: .init(string:     "https://meowfacts.herokuapp.com/?count=4")!)
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
