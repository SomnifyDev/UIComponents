import SwiftUI

public struct StatsIndicatorViewModel: Hashable {

    let name: String
    let description: String
    let value: Double
    let healthyValueRange: ClosedRange<Double>
    let unit: String
    let feedback: String
    var titleColor: Color {
        return healthyValueRange.contains(value) ? .green : .red
    }

    public init(
        name: String,
        description: String,
        value: Double,
        valueNormInterval: ClosedRange<Double>,
        unit: String,
        feedback: String
    ) {
        self.name = name
        self.description = description
        self.value = value
        self.healthyValueRange = valueNormInterval
        self.unit = unit
        self.feedback = feedback
    }

    public static func == (lhs: StatsIndicatorViewModel, rhs: StatsIndicatorViewModel) -> Bool {
        return lhs.name == rhs.name
    }

}
