import SwiftUI

public struct BannerView<Content: View>: View {

    // MARK: - Properties

    private let viewModel: BannerViewModel<Content>
    private let trailIconAction: (() -> ())?
    private let content: () -> Content

    public var body: some View {
        CardWithContentView(with: viewModel.cardTitleViewModel, trailIconAction: trailIconAction) {
            content()
        }
    }

    // MARK: - Init

    public init(
        with viewModel: BannerViewModel<Content>,
        trailIconAction: (() -> ())?,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.viewModel = viewModel
        self.trailIconAction = trailIconAction
        self.content = content
    }

}
