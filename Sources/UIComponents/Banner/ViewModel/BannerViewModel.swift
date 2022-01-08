import SwiftUI

public struct BannerViewModel<Content: View> {

    // MARK: - Properties

    public let cardTitleViewModel: CardTitleViewModel
    /// Identifier of banner. Is needed to save banners data uniquely in UserDefaults
    public let bannerIdentifier: String

    // MARK: - Init

    public init(
        with cardTitleViewModel: CardTitleViewModel,
        bannerIdentifier: String
    ) {
        self.cardTitleViewModel = cardTitleViewModel
        self.bannerIdentifier = bannerIdentifier
    }

}
