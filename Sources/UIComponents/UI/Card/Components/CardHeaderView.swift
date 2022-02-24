import SwiftUI

public struct CardHeaderView: View {

    // MARK: - Private properties

    private let cardHeader: CardHeaderModel

    // MARK: - Public properties

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                cardHeader.leadIcon
                    .foregroundColor(cardHeader.titleColor)
                Text(cardHeader.title)
                    .cardTitleTextModifier(color: cardHeader.titleColor)
                Spacer()
                if let trailText = cardHeader.trailText {
                    Text(trailText)
                        .cardTitleTextModifier(color: cardHeader.titleColor)
                }
                if let trailIcon = cardHeader.trailIcon {
                    Button {
                        if let trailIconAction = cardHeader.trailIconAction {
                            trailIconAction()
                        }
                    } label: {
                        trailIcon
                            .foregroundColor(cardHeader.titleColor)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            if let description = cardHeader.description,
               let descriptionColor = cardHeader.descriptionColor {
                Text(description)
                    .cardDescriptionTextModifier(color: descriptionColor)
                    .multilineTextAlignment(.leading)
            }
            if cardHeader.shouldShowSeparator {
                Divider()
                    .padding(.top, 4)
            }
        }
        .frame(minHeight: 0)
    }

    // MARK: - Init

    public init(
        cardHeader: CardHeaderModel
    ) {
        self.cardHeader = cardHeader
    }

}
