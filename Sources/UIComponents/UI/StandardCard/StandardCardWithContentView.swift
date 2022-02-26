// Copyright (c) 2021 Sleepy.

import SwiftUI

public struct StandardCardWithContentView<Content: View>: View {

    // MARK: - Private properties

    private let cardHeader: StandardCardHeaderModel
    private let content: () -> Content

    // MARK: - Public properties

    public var body: some View {
        VStack(alignment: .leading) {
            StandardCardHeaderView(cardHeader: cardHeader)
            content()
        }
        .roundedCardBackground(color: ColorsRepository.Card.cardBackground)
    }

    // MARK: - Init

    public init(
        cardHeader: StandardCardHeaderModel,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.cardHeader = cardHeader
        self.content = content
    }

}
