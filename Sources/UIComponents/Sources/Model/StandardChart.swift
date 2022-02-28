import SwiftUI

// MARK: - StandardChartElementModel

struct StandardChartElementModel {

    let cornerRadius: Double = 50
    let width: CGFloat
    let height: CGFloat
    let type: ChartType

    init(
        width: CGFloat,
        height: CGFloat,
        type: ChartType
    ) {
        self.width = width
        self.height = height
        self.type = type
    }

}

// MARK: - StandardChartType

public enum StandardChartType {

    case phasesChart
    case defaultChart(barType: ChartType, stringFormatter: String = "%.1f")
    case verticalProgress(foregroundElementColor: Color, backgroundElementColor: Color, max: Double)

    public enum ChartType {
        case rectangular(color: Color)
        case rectangularFilled(foregroundElementColor: Color, backgroundElementColor: Color, fillPercentage: Double)
        case circular(color: Color)
    }

}

// MARK: - ChartPointModel

public struct ChartPointModel {

    public let date: Date
    public let value: Double

    public init(date: Date, value: Double) {
        self.date = date
        self.value = value
    }

}
