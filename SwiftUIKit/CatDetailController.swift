import SwiftUI

class CatDetailController: UIHostingController<CatDetail> {

    let coordinator: MainCoordinator

    init(coordinator: MainCoordinator, catDetail: String) {
        self.coordinator = coordinator

        let onTapCatFact: (() -> Void) = {
            coordinator.navigateToCatDetails(detail: "We must go deeper")
        }

        super.init(rootView: .init(
            detail: catDetail,
            onTapFact: onTapCatFact,
            onTapGoBack: { coordinator.rootNavigationController.popToRootViewController(animated: true) }
        ))
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
