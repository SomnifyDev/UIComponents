import SwiftUI

// MARK: - StatisticalIndicatorCardModel

public struct StatisticalIndicatorCardModel: Equatable {

    let indicator: IndicatorModel
    let description: String?
    let feedback: String?
    var titleColor: Color {
        return indicator.expectedValueRange.contains(indicator.currentValue) ? .green : .red
    }

    public init(
        indicator: IndicatorModel,
        description: String,
        feedback: String
    ) {
        self.indicator = indicator
        self.description = description
        self.feedback = feedback
    }

    public static func == (lhs: StatisticalIndicatorCardModel, rhs: StatisticalIndicatorCardModel) -> Bool {
        return lhs.indicator.name == rhs.indicator.name
    }

}

// MARK: - IndicatorModel

public struct IndicatorModel {

    let name: String
    let currentValue: Double
    let expectedValueRange: ClosedRange<Double>
    let unit: String

    public init(
        name: String,
        currentValue: Double,
        expectedValueRange: ClosedRange<Double>,
        unit: String
    ) {
        self.name = name
        self.currentValue = currentValue
        self.expectedValueRange = expectedValueRange
        self.unit = unit
    }

}
