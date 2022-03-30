import SwiftUI

public struct BasicCellImage: View {

    // MARK: - Private properties

    private let model: BasicCellImageModel

    // MARK: - Public properties

    public var body: some View {
        self.model.image
            .font(self.model.font)
            .foregroundColor(self.model.color)
    }

    // MARK: - Init

    public init(model: BasicCellImageModel) {
        self.model = model
    }

}
