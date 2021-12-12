// Copyright (c) 2021 Sleepy.

import SwiftUI

public struct CardWithContentView<T: View, U: View>: View {

    // MARK: - Properties

    private let viewModel: CardTitleViewModel
    private let content: () -> T

    public var body: some View {
        VStack(alignment: .leading) {
            CardTitleView(with: viewModel)
            content()
        }
        .frame(minHeight: 0)
    }

    // MARK: - Init

    public init(
        with viewModel: CardTitleViewModel,
        @ViewBuilder content: @escaping () -> T
    ) {
        self.viewModel = viewModel
        self.content = content
    }

}
