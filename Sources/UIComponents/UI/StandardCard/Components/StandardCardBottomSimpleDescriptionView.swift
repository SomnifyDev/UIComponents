// Copyright (c) 2021 Sleepy.

import SwiftUI

public struct StandardCardBottomSimpleDescriptionView: View {

    // MARK: - Private properties

    private let description: String

    // MARK: - Public properties

    public var body: some View {
        HStack {
            Text(description)
                .cardBottomTextModifier(color: ColorsRepository.Text.standard)
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding(.top, 4)
        .frame(minHeight: 0)
    }

    // MARK: - Init

    public init(description: String) {
        self.description = description
    }

}
