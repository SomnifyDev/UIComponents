import Foundation

public struct ProgressChartViewModel {

    // MARK: - Properties

    public let cardTitleViewModel: CardTitleViewModel
    public let description: String
    public let beforeProgressViewModel: ProgressElementViewModel
    public let currentProgressViewModel: ProgressElementViewModel

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
