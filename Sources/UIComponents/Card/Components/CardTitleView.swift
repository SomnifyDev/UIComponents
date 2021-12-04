import SwiftUI

public struct CardTitleView: View {

    // MARK: - Properties

    let viewModel: CardTitleViewModel

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
                    trailIcon
                        .foregroundColor(viewModel.titleColor)
                }
            }
            if let description = viewModel.description,
               let descriptionColor = viewModel.descriptionColor {
                Text(description)
                    .cardDescriptionTextModifier(color: descriptionColor)
            }
            if viewModel.shouldShowSeparator {
                Divider()
                    .padding(.top, 4)
            }
        }
        .frame(minHeight: 0)
    }

    // MARK: - Init

    public init(with viewModel: CardTitleViewModel) {
        self.viewModel = viewModel
    }

}
