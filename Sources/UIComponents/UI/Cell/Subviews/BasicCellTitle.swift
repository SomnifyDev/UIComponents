import SwiftUI

public struct BasicCellTitle: View {
    
    // MARK: - Private properties

    private let model: BasicCellLabelModel

    // MARK: - Public properties

    public var body: some View {
        Text(self.model.title)
            .lineLimit(1)
            .font(self.model.font)
            .foregroundColor(self.model.color)
    }

    // MARK: - Init

    public init(model: BasicCellLabelModel) {
        self.model = model
    }

}
