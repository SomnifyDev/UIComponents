// Copyright (c) 2021 Sleepy.

import SwiftUI

public struct CardBottomSimpleDescriptionView: View {

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

                }.padding(.top, 4)
            }
        }
        .frame(minHeight: 0)
    }

}
