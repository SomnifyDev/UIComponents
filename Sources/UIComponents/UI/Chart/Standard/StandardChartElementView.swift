// Copyright (c) 2021 Sleepy.

import SwiftUI

// MARK: - Internal types

typealias ChartType = StandardChartType.ChartType

// MARK: - StandardChartElementViewModel

struct StandardChartElementViewModel {

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

    private let viewModel: StandardChartElementViewModel

    // MARK: - Internal properties

    var body: some View {
        VStack {
            switch viewModel.type {
            case let .rectangular(color):
                RectangularChartElementView(
                    color: color,
                    cornerRadius: viewModel.cornerRadius
                )

            case let .circular(color):
                CircularChartElementView(
                    color: color,
                    size: viewModel.width
                )

            case let .rectangularFilled(foregroundElementColor, backgroundElementColor, percentage):
                RectangularFilledChartElementView(
                    backgroundElementColor: backgroundElementColor,
                    foregroundElementColor: foregroundElementColor,
                    height: viewModel.height,
                    percentage: percentage,
                    cornerRadius: viewModel.cornerRadius
                )
            }
        }
        .frame(width: viewModel.width, height: viewModel.height)
    }

    // MARK: - Init

    init(viewModel: StandardChartElementViewModel) {
        self.viewModel = viewModel
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
