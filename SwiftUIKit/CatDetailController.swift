import SwiftUI

class CatDetailController: UIHostingController<CatDetail> {

    init(catDetail: String) {
        super.init(rootView: .init(detail: catDetail))
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
