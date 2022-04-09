import SwiftUI

public struct StatisticalIndicatorCardView: View {

    private let indicatorCard: StatisticalIndicatorCardModel
    private let onQuestionMarkTapAction: ActionHandler?

    public var body: some View {
        VStack(spacing: 4) {
            StandardCardHeaderView(
                cardHeader: .init(
                    leadIcon: indicatorCard.titleLeadIcon,
                    title: indicatorCard.title,
                    titleColor: ColorsRepository.Heart.heart,
                    shouldShowSeparator: true
                )
            )

            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(indicatorCard.indicator.name) – \(String(format: "%.2f \(indicatorCard.indicator.unit)", indicatorCard.indicator.currentValue))")
                        .foregroundColor(indicatorCard.isPositive ? .green.opacity(0.9) : .red.opacity(0.9))
                        .bold()
                        .font(.system(size: 24))
                        .padding(.top, 8)

                    if let feedback = indicatorCard.feedback {
                        Text(feedback)
                            .padding(.top, 8)
                            .font(.system(size: 14))
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

struct StatisticalIndicatorCardView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticalIndicatorCardView(
            indicatorCard: StatisticalIndicatorCardModel(
                titleLeadIcon: .init(systemName: "heart.filled"),
                title: "Heart: indicator",
                indicator: IndicatorModel(
                    name: "RSSDN",
                    currentValue: 1.21,
                    unit: "ms"
                ),
                feedback: "You should rest more during the day according to your RSSDN value.",
                isPositive: false
            ),
            onQuestionMarkTapAction: nil
        )
    }
}
