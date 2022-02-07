// Copyright (c) 2021 Sleepy.

import SwiftUI

public struct CardWithContentView<Content: View>: View {

    // MARK: - Properties

    private let viewModel: CardTitleViewModel
    private let trailIconAction: (() -> ())?
    private let content: () -> Content

    public var body: some View {
        VStack(alignment: .leading) {
            CardTitleView(with: viewModel, trailIconAction: trailIconAction)
            content()
        }
    }

    // MARK: - Init

    public init(
        with viewModel: CardTitleViewModel,
        trailIconAction: (() -> ())? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.viewModel = viewModel
        self.trailIconAction = trailIconAction
        self.content = content
    }

}
