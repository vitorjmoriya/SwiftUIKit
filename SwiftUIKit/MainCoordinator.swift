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
}
