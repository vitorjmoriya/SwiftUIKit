//
//  MainController.swift
//  SwiftUIKit
//
//  Created by Vitor Moriya on 24/08/22.
//

import SwiftUI
import Combine

class MainController: UIHostingController<ContentView>, UITableViewDelegate {

    let viewModel: ContentView.ViewModel

    var cancellable: AnyCancellable? = nil

    init() {
        let viewModel: ContentView.ViewModel = .init()

        self.viewModel = viewModel

        super.init(rootView: .init(viewModel: viewModel))

        viewModel.tableDelegate = self

        cancellable = viewModel.$name.debounce(for: 0.3, scheduler: DispatchQueue.main).sink { name in
            print(name)
        }
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Table cell number \(indexPath.row) was tapped!")
    }
}
