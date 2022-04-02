import SwiftUI

public struct BasicCellText: View {
    
    // MARK: - Private properties

    private let model: BasicCellTextModel

    // MARK: - Public properties

    public var body: some View {
        Text(self.model.title)
            .lineLimit(1)
            .font(self.model.font)
            .foregroundColor(self.model.color)
    }

    // MARK: - Init

    public init(model: BasicCellTextModel) {
        self.model = model
    }

}
