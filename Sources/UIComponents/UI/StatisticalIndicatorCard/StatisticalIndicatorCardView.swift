import SwiftUI

public struct StatisticalIndicatorCardView: View {

    private let indicatorCard: StatisticalIndicatorCardModel
    private let onQuestionMarkTapAction: ActionHandler?

    public var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text(indicatorCard.indicator.name)
                    .bold()
                    .font(.system(size: 20))

                Spacer()

                if let action = onQuestionMarkTapAction {
                    Button {
                        action()
                    } label: {
                        IconsRepository.questionMarkCircle
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }

            Divider()
                .padding(.top, 4)

            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(String(format: "%.1f", indicatorCard.indicator.currentValue))
                        .foregroundColor(indicatorCard.titleColor)
                        .bold()
                        .font(.system(size: 18))
                        .padding(.top, 8)

                    Text("(norm is - \(String(format: "%.1f", indicatorCard.indicator.expectedValueRange.lowerBound)) - \(String(format: "%.1f", indicatorCard.indicator.expectedValueRange.upperBound)))")
                        .foregroundColor(Color(.lightGray))
                        .font(.system(size: 12))

                    if let feedback = indicatorCard.feedback {
                        Text(feedback)
                            .padding(.top, 8)
                            .font(.system(size: 12))
                    }
                }
                Spacer()
            }
        }
        .roundedCardBackground(color: ColorsRepository.Card.cardBackground)
    }

    public init(
        indicatorCard: StatisticalIndicatorCardModel,
        onQuestionMarkTapAction: ActionHandler?
    ) {
        self.indicatorCard = indicatorCard
        self.onQuestionMarkTapAction = onQuestionMarkTapAction
    }

}
