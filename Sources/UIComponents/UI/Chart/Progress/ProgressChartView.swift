// Copyright (c) 2021 Sleepy.

import SwiftUI

public struct ProgressChartView: View {

    // MARK: - Private properties

    private let viewModel: ProgressChartModel

    // MARK: - Public properties

    public var body: some View {
        VStack(alignment: .leading) {
            CardHeaderView(cardHeader: viewModel.cardHeaderModel)

            ProgressElementView(with: viewModel.currentProgressViewModel)
                .padding(.top, 8)
                .padding(.trailing, viewModel.currentTrailingPaddingValue)
                .foregroundColor(ColorsRepository.General.mainSleepy)

            ProgressElementView(with: viewModel.beforeProgressViewModel)
                .padding(.top, 8)
                .padding(.trailing, viewModel.beforeTrailingPaddingValue)
                .foregroundColor(ColorsRepository.General.mainSleepy.opacity(0.5))

            CardBottomSimpleDescriptionView(description: viewModel.description)
        }
        .frame(minHeight: 0)
    }

    // MARK: - Init

    public init(with viewModel: ProgressChartModel) {
        self.viewModel = viewModel
    }

}
