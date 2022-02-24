// Copyright (c) 2021 Sleepy.

import SwiftUI

public struct CardWithContentView<Content: View>: View {

    // MARK: - Private properties

    private let cardHeader: CardHeaderModel
    private let content: () -> Content

    // MARK: - Public properties

    public var body: some View {
        VStack(alignment: .leading) {
            CardHeaderView(cardHeader: cardHeader)
            content()
        }
        .roundedCardBackground(color: ColorsRepository.Card.cardBackground)
    }

    // MARK: - Init

    public init(
        cardHeader: CardHeaderModel,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.cardHeader = cardHeader
        self.content = content
    }

}
