import SwiftUI

// MARK: - StatisticalIndicatorCardModel

public struct StatisticalIndicatorCardModel: Equatable {

    let titleLeadIcon: Image?
    let title: String
    let indicator: IndicatorModel
    let feedback: String
    let isPositive: Bool

    public init(
        titleLeadIcon: Image?,
        title: String,
        indicator: IndicatorModel,
        feedback: String,
        isPositive: Bool
    ) {
        self.titleLeadIcon = titleLeadIcon
        self.title = title
        self.indicator = indicator
        self.feedback = feedback
        self.isPositive = isPositive
    }

    public static func == (lhs: StatisticalIndicatorCardModel, rhs: StatisticalIndicatorCardModel) -> Bool {
        return lhs.indicator.name == rhs.indicator.name
    }

}

// MARK: - IndicatorModel

public struct IndicatorModel {

    let name: String
    let currentValue: Double
    let unit: String

    public init(
        name: String,
        currentValue: Double,
        unit: String
    ) {
        self.name = name
        self.currentValue = currentValue
        self.unit = unit
    }

}
