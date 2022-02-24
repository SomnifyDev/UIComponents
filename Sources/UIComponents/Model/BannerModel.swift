import SwiftUI

public struct BannerModel {
    
    let cardHeaderModel: CardHeaderModel
    /// Identifier of banner. Is needed to save banners data uniquely in UserDefaults
    let bannerIdentifier: String

    public init(
        with cardHeaderModel: CardHeaderModel,
        bannerIdentifier: String
    ) {
        self.cardHeaderModel = cardHeaderModel
        self.bannerIdentifier = bannerIdentifier
    }

}
