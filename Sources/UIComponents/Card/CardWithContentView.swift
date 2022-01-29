// Copyright (c) 2021 Sleepy.

import SwiftUI

public struct CardWithContentView<Content: View>: View {

    // MARK: - Properties

    private let viewModel: CardTitleViewModel
    private let content: () -> Content

    public var body: some View {
        VStack(alignment: .leading) {
            CardTitleView(with: viewModel)
            content()
        }
    }

    // MARK: - Init

    public init(
        with viewModel: CardTitleViewModel,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.viewModel = viewModel
        self.content = content
    }

}
