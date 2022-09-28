import SwiftUI

struct CatDetail: View {
    let detail: String

    var onTapFact: (() -> Void)?

    var body: some View {
        Text(detail)
            .onTapGesture {
                onTapFact?()
            }
    }
}

