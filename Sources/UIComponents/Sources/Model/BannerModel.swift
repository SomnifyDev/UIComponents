import SwiftUI

public struct BannerModel {
    
    let cardHeader: StandardCardHeaderModel
    /// Identifier of banner. Is needed to save banners data uniquely in UserDefaults
    let bannerIdentifier: String

    public init(
        cardHeader: StandardCardHeaderModel,
        bannerIdentifier: String
    ) {
        self.cardHeader = cardHeader
        self.bannerIdentifier = bannerIdentifier
    }

}
