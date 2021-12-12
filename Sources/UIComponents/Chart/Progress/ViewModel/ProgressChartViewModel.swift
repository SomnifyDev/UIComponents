import SwiftUI

public struct ProgressChartViewModel {

    // MARK: - Properties

    let cardTitleViewModel: CardTitleViewModel
    let description: String
    let beforeProgressViewModel: ProgressElementViewModel
    let currentProgressViewModel: ProgressElementViewModel
    var trailingPaddingValue: CGFloat {
        return beforeProgressViewModel.value >= currentProgressViewModel.value ? 0 : 64
    }
    
    // MARK: - Init

    public init(
        cardTitleViewModel: CardTitleViewModel,
        description: String,
        beforeProgressViewModel: ProgressElementViewModel,
        currentProgressViewModel: ProgressElementViewModel
    ) {
        self.cardTitleViewModel = cardTitleViewModel
        self.description = description
        self.beforeProgressViewModel = beforeProgressViewModel
        self.currentProgressViewModel = currentProgressViewModel
    }

}
