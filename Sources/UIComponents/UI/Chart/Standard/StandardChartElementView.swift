// Copyright (c) 2021 Sleepy.

import SwiftUI

// MARK: - Internal types

typealias ChartType = StandardChartType.ChartType

// MARK: - StandardChartElementViewModel

struct StandardChartElementModel {

    // MARK: - Properties

    let cornerRadius: Double = 50
    let width: CGFloat
    let height: CGFloat
    let type: ChartType

    // MARK: - Init

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

// MARK: - StandardChartElementView

struct StandardChartElementView: View {

    // MARK: - Private properties

    private let chartElement: StandardChartElementModel

    // MARK: - Internal properties

    var body: some View {
        VStack {
            switch chartElement.type {
            case let .rectangular(color):
                RectangularChartElementView(
                    color: color,
                    cornerRadius: chartElement.cornerRadius
                )

            case let .circular(color):
                CircularChartElementView(
                    color: color,
                    size: chartElement.width
                )

            case let .rectangularFilled(foregroundElementColor, backgroundElementColor, percentage):
                RectangularFilledChartElementView(
                    backgroundElementColor: backgroundElementColor,
                    foregroundElementColor: foregroundElementColor,
                    height: chartElement.height,
                    percentage: percentage,
                    cornerRadius: chartElement.cornerRadius
                )
            }
        }
        .frame(width: chartElement.width, height: chartElement.height)
    }

    // MARK: - Init

    init(chartElement: StandardChartElementModel) {
        self.chartElement = chartElement
    }

}

// MARK: - RectangularChartElementView

struct RectangularChartElementView: View {

    let color: Color
    let cornerRadius: CGFloat

    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .cornerRadius(cornerRadius)
    }

}

// MARK: - CircularChartElementView

struct CircularChartElementView: View {

    let color: Color
    let size: CGFloat

    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(Color.clear)
            Circle()
                .foregroundColor(color)
                .frame(width: size, height: size)
        }
    }

}

// MARK: - RectangularFilledChartElementView

struct RectangularFilledChartElementView: View {

    let backgroundElementColor: Color
    let foregroundElementColor: Color
    let height: Double
    let percentage: Double
    let cornerRadius: CGFloat

    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .fill(backgroundElementColor)
                .cornerRadius(cornerRadius)

            Rectangle()
                .fill(foregroundElementColor)
                .frame(height: min(height * percentage, height))
                .cornerRadius(cornerRadius)
        }
    }

}
