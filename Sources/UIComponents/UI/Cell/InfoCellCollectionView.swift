import SwiftUI

public struct InfoCellCollectionView: View {

    // MARK: - Private properties

    private let collection: InfoCellCollectionModel

    // MARK: - Public properties

    public var body: some View {
        VStack(spacing: -8) {
            ForEach(collection.cells, id: \.title) { viewModel in
                InfoCell(info: viewModel)
            }
        }
    }

    // MARK: - Init

    public init(collection: InfoCellCollectionModel) {
        self.collection = collection
    }

}
