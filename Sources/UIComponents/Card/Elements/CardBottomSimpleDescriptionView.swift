// Copyright (c) 2021 Sleepy.

import SwiftUI

public struct CardBottomSimpleDescriptionView: View {

    // MARK: - Properties

    let descriptionText: Text
    let colorProvider: ColorSchemeProvider
    let showChevron: Bool

    public var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    descriptionText
                        .cardBottomTextModifier(color: colorProvider.sleepyColorScheme.getColor(of: .textsColors(.standartText)))
                    Spacer()
                    if showChevron {
                        Image(systemName: "chevron.right")
                    }

                }
                .padding(.top, 4)
            }
        }
        .frame(minHeight: 0)
    }

    // MARK: - Init

    public init(
        descriptionText: Text,
        colorProvider: ColorSchemeProvider,
        showChevron: Bool
    ) {
        self.descriptionText = descriptionText
        self.colorProvider = colorProvider
        self.showChevron = showChevron
    }

}
