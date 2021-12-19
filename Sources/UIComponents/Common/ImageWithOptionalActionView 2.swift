import SwiftUI

public struct ImageWithOptionalActionView: View {

    // MARK: - Properties

    let image: Image
    let action: (() -> ())?

    public var body: some View {
        Button(action: action ?? {}) {
            image
        }
    }

    // MARK: - Init

    public init(
        image: Image,
        action: (() -> ())?
    ) {
        self.image = image
        self.action = action
    }

}
