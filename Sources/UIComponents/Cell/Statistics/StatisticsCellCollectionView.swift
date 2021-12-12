import SwiftUI

public struct StatisticsCellCollectionView: View {

    // MARK: - Properties

    let viewModel: StatisticsCellCollectionViewModel

    public var body: some View {
        VStack(spacing: -8) {
            ForEach(viewModel.cellModels) { viewModel in
                StatisticsCellView(with: viewModel)
            }
        }
        .roundedCardBackground(color: ColorsRepository.Card.cardBackground)
    }

    // MARK: - Init

    public init(with viewModel: StatisticsCellCollectionViewModel) {
        self.viewModel = viewModel
    }

}
