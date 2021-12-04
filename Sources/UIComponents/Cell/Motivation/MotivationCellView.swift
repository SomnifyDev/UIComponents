// Copyright (c) 2021 Sleepy.

import SwiftUI

public struct MotivationCellView: View {

    // MARK: - Properties

    @Environment(\.openURL) var openURL
    private let viewModel: MotivationCellViewModel

    public var body: some View {
        VStack {
            CardTitleView(with: viewModel.cardTitleViewModel)
            Text(viewModel.url.path)
                .linkTextModifier()
                .padding(.top, 4)
        }
        .onTapGesture {
            openURL(viewModel.url)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .roundedCardBackground(color: ColorsRepository.Card.cardBackground)
    }

    // MARK: - Init

    public init(with viewModel: MotivationCellViewModel) {
        self.viewModel = viewModel
    }

}
