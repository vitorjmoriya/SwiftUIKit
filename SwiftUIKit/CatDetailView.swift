import SwiftUI

struct CatDetail: View {
    let detail: String

    var onTapFact: (() -> Void)?

    var onTapGoBack: (() -> Void)?

    var body: some View {
        VStack(spacing: 32) {
            Text(detail)
                .onTapGesture {
                    onTapFact?()
                }
            Text("OK, GO BACK")
                .onTapGesture {
                    onTapGoBack?()
                }
                .foregroundColor(.green)
        }
    }
}

