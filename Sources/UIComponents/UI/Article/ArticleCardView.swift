import SwiftUI

public struct ArticleCardView<Content: View>: View {

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
                    VStack(spacing: 16) {
                        HStack {
                            Text(card.title)
                                .fontWeight(.bold)
                                .font(.title2)
                            Spacer()
                        }
                        HStack {
                            Text(card.subtitle)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.none)
                            Spacer()
                        }
                    }
                    .padding()
                    Spacer()
                }
                .cornerRadius(10)
            }
        )
        .buttonStyle(PlainButtonStyle())
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
