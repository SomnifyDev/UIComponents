import SwiftUI

public struct BannerView<Content: View>: View {

    // MARK: - Private properties

    private let banner: BannerModel
    private let content: () -> Content

    // MARK: - Public properties

    public var body: some View {
        StandardCardWithContentView(cardHeader: banner.cardHeader) {
            content()
        }
    }

    // MARK: - Init

    public init(
        banner: BannerModel,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.banner = banner
        self.content = content
    }

}
