import SwiftUI

// MARK: - StatisticalIndicatorCardModel

public struct StatisticalIndicatorCardModel: Equatable {

    let indicator: IndicatorModel
    let description: String
    let feedback: String
    let isPositive: Bool

    public init(
        indicator: IndicatorModel,
        description: String,
        feedback: String,
        isPositive: Bool
    ) {
        self.indicator = indicator
        self.description = description
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
