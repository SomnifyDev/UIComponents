import SwiftUI

public struct ArticleCardView: View {

    // MARK: - Private properties

    private let card: ArticleCardModel
    private let onTapAction: ActionHandler

    // MARK: - Public properties

    public var body: some View {
        Button(
            action: {
                onTapAction()
            }, label: {
                VStack {
                    card.coverImage
                        .resizable()
                        .frame(height: 235)
                    HStack {
                        VStack(alignment: .leading, spacing: 16) {
                            Text(card.title)
                                .fontWeight(.bold)
                                .font(.title2)
                            Text(card.subtitle)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.none)
                        }
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
                .contentShape(Rectangle())
            }
        )
        .buttonStyle(PlainButtonStyle())
        .background(ColorsRepository.Card.cardBackground)
        .cornerRadius(10)
    }

    // MARK: - Init

    public init(
        card: ArticleCardModel,
        onTapAction: @escaping ActionHandler
    ) {
        self.card = card
        self.onTapAction = onTapAction
    }

}
