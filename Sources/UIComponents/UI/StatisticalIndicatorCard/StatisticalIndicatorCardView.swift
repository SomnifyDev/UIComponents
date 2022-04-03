import SwiftUI

public struct StatisticalIndicatorCardView: View {

    private let indicatorCard: StatisticalIndicatorCardModel
    private let onQuestionMarkTapAction: ActionHandler?

    public var body: some View {
        VStack(spacing: 4) {
            StandardCardHeaderView(
                cardHeader: StandardCardHeaderModel(
                    leadIcon: nil,
                    title: indicatorCard.indicator.name,
                    titleColor: ColorsRepository.Text.standard,
                    trailIcon: onQuestionMarkTapAction == nil ? nil : IconsRepository.questionMarkCircle,
                    trailIconAction: onQuestionMarkTapAction,
                    trailText: nil,
                    description: indicatorCard.description,
                    descriptionColor: ColorsRepository.Text.secondary,
                    shouldShowSeparator: true
                )
            )

            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(String(format: "%.2f \(indicatorCard.indicator.unit)", indicatorCard.indicator.currentValue))
                        .foregroundColor(indicatorCard.isPositive ? .green : .red)
                        .bold()
                        .font(.system(size: 26))

                    if let feedback = indicatorCard.feedback {
                        Text(feedback)
                            .padding(.top, 8)
                            .font(.system(size: 16))
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
                indicator: IndicatorModel(
                    name: "RSSDN",
                    currentValue: 1.21,
                    unit: "ms"
                ),
                description: "An indicator that shows whether or not the body has had a chance to recover.",
                feedback: "You should rest more during the day according to your RSSDN value.",
                isPositive: false
            ),
            onQuestionMarkTapAction: nil
        )
    }
}
