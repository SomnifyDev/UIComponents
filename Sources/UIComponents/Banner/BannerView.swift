import SwiftUI

public struct BannerView<Content: View>: View {

    // MARK: - Properties

    @State private var shouldShowAdvice: Bool = true
    private let viewModel: BannerViewModel<Content>
    private let content: () -> Content

    public var body: some View {
        if shouldShowAdvice {
            VStack(spacing: 8) {
                CardTitleView(with: viewModel.cardTitleViewModel)
                content()
            }
            .frame(minWidth: 0)
        }
    }

    // MARK: - Init

    public init(
        with viewModel: BannerViewModel<Content>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.viewModel = viewModel
        self.content = content
        shouldShowAdvice = hideAdviceIfNeeded()
    }

    // MARK: - Private methods

    private func hideAdviceIfNeeded() -> Bool {
        return UserDefaults.standard.object(forKey: viewModel.bannerIdentifier) == nil
    }

}
