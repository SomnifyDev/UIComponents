import SwiftUI

public struct BannerViewModel<Content: View> {

    // MARK: - Properties

    let cardTitleViewModel: CardTitleViewModel
    let bannerIdentifier: String

    // MARK: - Init

    public init(
        with cardTitleViewModel: CardTitleViewModel,
        bannerIdentifier: String
    ) {
        self.cardTitleViewModel = cardTitleViewModel
        self.bannerIdentifier = bannerIdentifier
    }

}
