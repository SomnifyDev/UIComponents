import SwiftUI

public struct ImageWithActionView: View {

    // MARK: - Properties

    let image: Image
    let action: () -> ()

    public var body: some View {
        Button(action: action) {
            image
        }
        .frame(minHeight: 0)
    }

    // MARK: - Init

    public init(
        image: Image,
        action: @escaping () -> ()
    ) {
        self.image = image
        self.action = action
    }

}
