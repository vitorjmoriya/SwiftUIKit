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
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
