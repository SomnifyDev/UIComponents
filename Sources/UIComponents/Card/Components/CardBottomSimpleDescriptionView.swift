// Copyright (c) 2021 Sleepy.

import SwiftUI

public struct CardBottomSimpleDescriptionView: View {

    // MARK: - Properties

    private let description: String

    public var body: some View {
        HStack {
            Text(description)
                .cardBottomTextModifier(color: ColorsRepository.Text.standard)
            Spacer()
        }
        .padding(.top, 4)
        .frame(minHeight: 0)
    }

    // MARK: - Init

    public init(with description: String) {
        self.description = description
    }

}
