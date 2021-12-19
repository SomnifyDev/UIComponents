import Foundation

public struct MotivationCellViewModel {

    // MARK: - Properties

    let cardTitleViewModel: CardTitleViewModel
    let url: URL

    // MARK: - Init

    public init(
        cardTitleViewModel: CardTitleViewModel,
        url: URL
    ) {
        self.cardTitleViewModel = cardTitleViewModel
        self.url = url
    }

}
