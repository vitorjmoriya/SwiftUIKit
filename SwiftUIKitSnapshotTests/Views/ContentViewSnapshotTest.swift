import SnapshotTesting
import XCTest
import SwiftUI

@testable import SwiftUIKit

class ContentViewSnapshotTests: XCTestCase {
    func testView() {
        let view = ContentView_Previews.previews
        let controller = UIHostingController(rootView: view)

        assertSnapshots(matching: controller, as: [.image])
    }
}
