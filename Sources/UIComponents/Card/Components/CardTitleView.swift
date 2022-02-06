import SwiftUI

public struct CardTitleView: View {

    // MARK: - Properties

    private let viewModel: CardTitleViewModel
    private let trailIconAction: (() -> ())?

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                viewModel.leadIcon
                    .foregroundColor(viewModel.titleColor)
                Text(viewModel.title)
                    .cardTitleTextModifier(color: viewModel.titleColor)
                Spacer()
                if let trailText = viewModel.trailText {
                    Text(trailText)
                        .cardTitleTextModifier(color: viewModel.titleColor)
                }
                if let trailIcon = viewModel.trailIcon {
                    Button(action: trailIconAction ?? {}) {
                        trailIcon
                            .foregroundColor(viewModel.titleColor)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            if let description = viewModel.description,
               let descriptionColor = viewModel.descriptionColor {
                Text(description)
                    .cardDescriptionTextModifier(color: descriptionColor)
                    .multilineTextAlignment(.leading)
            }
            if viewModel.shouldShowSeparator {
                Divider()
                    .padding(.top, 4)
            }
        }
        .frame(minHeight: 0)
    }

    // MARK: - Init

    public init(
        with viewModel: CardTitleViewModel,
        trailIconAction: (() -> ())? = nil
    ) {
        self.viewModel = viewModel
        self.trailIconAction = trailIconAction
    }

}
