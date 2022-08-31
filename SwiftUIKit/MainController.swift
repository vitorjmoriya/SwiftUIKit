//
//  MainController.swift
//  SwiftUIKit
//
//  Created by Vitor Moriya on 24/08/22.
//

import SwiftUI
class MainController: UIHostingController<ContentView>, UITableViewDelegate {

    let viewModel: ContentView.ViewModel

    init() {
        let viewModel: ContentView.ViewModel = .init()

        self.viewModel = viewModel

        super.init(rootView: .init(viewModel: viewModel))

        viewModel.tableDelegate = self
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Table cell number \(indexPath.row) was tapped!")
    }
}
