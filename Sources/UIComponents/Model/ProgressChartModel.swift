import SwiftUI

public struct ProgressChartModel {

    let cardHeaderModel: CardHeaderModel
    let description: String
    let beforeProgressViewModel: ProgressChartElementModel
    let currentProgressViewModel: ProgressChartElementModel
    var beforeTrailingPaddingValue: CGFloat {
        return beforeProgressViewModel.value > currentProgressViewModel.value ? 0 : 64
    }
    var currentTrailingPaddingValue: CGFloat {
        return beforeProgressViewModel.value > currentProgressViewModel.value ? 64 : 0
    }

    public init(
        cardHeaderModel: CardHeaderModel,
        description: String,
        beforeProgressViewModel: ProgressChartElementModel,
        currentProgressViewModel: ProgressChartElementModel
    ) {
        self.cardHeaderModel = cardHeaderModel
        self.description = description
        self.beforeProgressViewModel = beforeProgressViewModel
        self.currentProgressViewModel = currentProgressViewModel
    }

}
