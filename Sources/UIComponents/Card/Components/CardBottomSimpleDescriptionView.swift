// Copyright (c) 2021 Sleepy.

import SwiftUI

public struct CardBottomSimpleDescriptionView: View {

    // MARK: - Properties

    let descriptionText: String

    public var body: some View {
        HStack {
            Text(descriptionText)
                .cardBottomTextModifier(color: ColorsRepository.Text.standard)
            Spacer()
        }
        .padding(.top, 4)
        .frame(minHeight: 0)
    }

    // MARK: - Init

    public init(with descriptionText: String) {
        self.descriptionText = descriptionText
    }

}
