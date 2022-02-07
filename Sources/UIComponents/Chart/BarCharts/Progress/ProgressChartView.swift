// Copyright (c) 2021 Sleepy.

import SwiftUI

public struct ProgressChartView: View {

    // MARK: - Properties

    private let viewModel: ProgressChartViewModel

    public var body: some View {
        VStack(alignment: .leading) {
            CardTitleView(with: viewModel.cardTitleViewModel)

            ProgressElementView(with: viewModel.currentProgressViewModel)
                .padding(.top, 8)
                .padding(.trailing, viewModel.currentTrailingPaddingValue)
                .foregroundColor(ColorsRepository.General.mainSleepy)

            ProgressElementView(with: viewModel.beforeProgressViewModel)
                .padding(.top, 8)
                .padding(.trailing, viewModel.beforeTrailingPaddingValue)
                .foregroundColor(ColorsRepository.General.mainSleepy.opacity(0.5))

            CardBottomSimpleDescriptionView(with: viewModel.description)
        }
        .frame(minHeight: 0)
    }

    // MARK: - Init

    public init(with viewModel: ProgressChartViewModel) {
        self.viewModel = viewModel
    }

}
