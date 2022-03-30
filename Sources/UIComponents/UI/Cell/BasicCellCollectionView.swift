import SwiftUI

public struct BasicCellCollectionView: View {

    // MARK: - Private properties

    private let collection: BasicCellCollectionModel

    // MARK: - Public properties

    public var body: some View {
        VStack(spacing: 8) {
            ForEach(collection.cells, id: \.id) { viewModel in
                BasicCell(info: viewModel)
            }
        }
    }

    // MARK: - Init

    public init(collection: BasicCellCollectionModel) {
        self.collection = collection
    }

}
