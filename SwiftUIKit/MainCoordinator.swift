import SwiftUI

class MainCoordinator {
    let rootNavigationController: UINavigationController

    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }

    func start() {
        let controller = MainController(coordinator: self)
        self.rootNavigationController.pushViewController(controller, animated: true)
    }

    func navigateToCatDetails(detail: String) {
        let catDetailController = CatDetailController(coordinator: self, catDetail: detail)
        self.rootNavigationController.pushViewController(catDetailController, animated: false)
    }

    func navigateTo(route: Routes) {
        switch route {
        case .red:
            let controller: UIHostingController = .init(rootView: Color.red)
            self.rootNavigationController.pushViewController(controller, animated: false)
        case .blue:
            let controller: UIHostingController = .init(rootView: Color.blue)
            self.rootNavigationController.pushViewController(controller, animated: false)
        case .purple:
            let controller: UIHostingController = .init(rootView: Color.purple)
            self.rootNavigationController.pushViewController(controller, animated: false)
        case .normal(let detail):
            navigateToCatDetails(detail: detail)
        }
    }

    enum Routes {
        case red
        case blue
        case purple
        case normal(String)
    }
}
