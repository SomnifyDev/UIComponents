import SwiftUI

public struct BasicCellCollectionView: View {

    // MARK: - Private properties

    private let model: BasicCellCollectionModel

    // MARK: - Public properties

    public var body: some View {
        VStack(spacing: 8) {
            ForEach(self.model.cells, id: \.id) { viewModel in
                BasicCell(model: viewModel)
            }
        }
    }

    // MARK: - Init

    public init(model: BasicCellCollectionModel) {
        self.model = model
    }

}
