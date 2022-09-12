//
//  ContentView.swift
//  SwiftUIKit
//
//  Created by Vitor Moriya on 24/08/22.
//

import Introspect
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        Form {
            TextField("Enter your name", text: $viewModel.name)
            Text("Your name is \(viewModel.name)")
                .foregroundColor(viewModel.color)
        }
        .introspectTableView { tableView in
            tableView.delegate = viewModel.tableDelegate
        }
    }
}

extension ContentView {
    class ViewModel: ObservableObject {
        var tableDelegate: UITableViewDelegate?

        @Published var name: String = ""
        @Published var color: Color = .black
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
