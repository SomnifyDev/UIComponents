// Copyright (c) 2021 Sleepy.

import SwiftUI

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

public struct StandardChartView: View {
    public struct DisplayItem {
        public let date: Date
        public let value: Double

        public init(date: Date, value: Double) {
            self.date = date
            self.value = value
        }
    }

    enum Constants {
        static let descriptionHeight: CGFloat = 13
        static let standardWidth: CGFloat = 14
        static let tapDescriptionHeight: CGFloat = 16
        static let stackSpacing: CGFloat = 4
    }

    @State private var selectedIndex = -1
    @State private var elemWidth: CGFloat = 14
    @State private var chartSpacing: CGFloat = 3

    private let chartType: StandardChartType
    private let points: [DisplayItem]
    private let chartHeight: CGFloat
    private let timeLineType: OXChartLineType
    private let dragGestureEnabled: Bool

    public init(
        chartType: StandardChartType,
        points: [DisplayItem],
        chartHeight: CGFloat,
        timeLineType: OXChartLineType,
        dragGestureEnabled: Bool = true
    ) {
        self.chartType = chartType
        self.points = points
        self.chartHeight = chartHeight
        self.timeLineType = timeLineType
        self.dragGestureEnabled = dragGestureEnabled
    }

    public var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: Constants.stackSpacing) {

                if self.dragGestureEnabled {
                    Text(self.selectedIndex >= 0 ? self.getTapDescription(for: self.selectedIndex) : "")
                        .frame(height: Constants.tapDescriptionHeight)
                }

                Spacer()

                HStack(alignment: .bottom, spacing: self.chartSpacing) {
                    ForEach(0 ..< self.points.count, id: \.self) { index in
                        VStack {
                            if selectedIndex == index {
                                self.getChartElement(value: points[index].value)
                                    .colorInvert()
                            } else {
                                self.getChartElement(value: points[index].value)
                            }

                            if self.timeLineType.isOXLineNeeded {
                                self.getOXLineElement()
                            }
                        }

                        switch self.chartType {
                        case .verticalProgress:
                            if index != self.points.count - 1 {
                                Spacer()
                            }
                        default:
                            EmptyView()
                        }
                    }
                }
                .allowsHitTesting(dragGestureEnabled)
                .gesture(
                    DragGesture(
                        minimumDistance: 5,
                        coordinateSpace: .global
                    ).onChanged { gesture in
                        let selected = Int(gesture.location.x / (geometry.size.width / (CGFloat(points.count) - self.chartSpacing)))

                        if selected != selectedIndex, selected < points.count {
                            selectedIndex = selected
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred(intensity: 0.6)
                        }
                    }.onEnded { _ in
                        selectedIndex = -1
                    }
                )

                OXChartLineView(chartLineType: self.timeLineType)
            }
            .onAppear {
                let chartWidth = CGFloat(points.count) * Constants.standardWidth + self.chartSpacing * CGFloat(points.count - 1)
                if chartWidth > geometry.size.width {
                    self.elemWidth = abs(geometry.size.width - self.chartSpacing * CGFloat(points.count - 1)) / CGFloat(points.count)
                }

                switch self.chartType {
                case .verticalProgress:
                    self.chartSpacing = 0
                default:
                    self.chartSpacing = 3
                }
            }
        }
        .frame(height: chartHeight + (self.timeLineType.isOXLineNeeded ? 30 : 0) + (self.timeLineType.isTimeLineNeeded ? 30 : 0) + (dragGestureEnabled ? 16 : 0))
    }

    private func getChartElement(value: Double) -> some View {
        let minimum = self.points.map{ $0.value}.min() ?? 0
        let maximum = self.points.map{ $0.value}.max() ?? 0

        let height = max(chartHeight * 0.2, chartHeight * ((value - minimum) / (maximum - minimum)))

        switch chartType {
        case .phasesChart:
            return StandardChartElementView(
                viewModel: StandardChartElementViewModel(
                    width: elemWidth,
                    height: height,
                    type: .rectangular(color: getPhaseColor(for: value))
                )
            )
        case .defaultChart(let barType, _):
            return StandardChartElementView(
                viewModel: StandardChartElementViewModel(
                    width: elemWidth,
                    height: height,
                    type: barType
                )
            )
        case let .verticalProgress(foregroundElementColor, backgroundElementColor, max):
            return StandardChartElementView(
                viewModel: StandardChartElementViewModel(
                    width: elemWidth,
                    height: chartHeight,
                    type: .rectangularFilled(
                        foregroundElementColor: foregroundElementColor,
                        backgroundElementColor: backgroundElementColor,
                        fillPercentage: value / max
                    )
                )
            )
        }
    }

    private func getPhaseColor(for value: Double) -> Color {
        return value < 0.55
        ? ColorsRepository.Phase.deepSleep
        : value >= 1
        ? ColorsRepository.Phase.wakeUp
        : ColorsRepository.Phase.lightSleep
    }

    private func getTapDescription(for index: Int) -> String {
        let item = self.points[index]

        switch self.chartType {
        case .phasesChart:
            let phaseDescription = (item.value < 0.55
                                    ? "Deep sleep phase"
                                    : (item.value >= 1
                                       ? "Probably woke up"
                                       : "Light sleep phase"))
            return "\(phaseDescription), \(item.date.getFormattedDate(format: .time))"

        case .defaultChart(let barType, let stringFormatter):
            var format: Date.StringFormatType = .time

            if case .some(_, let formatType) = self.timeLineType,
               let dateFormatType = formatType {
                format = dateFormatType
            }
            return "\(String(format: stringFormatter, item.value)), \(item.date.getFormattedDate(format: format))"

        default:
            return String(item.value)
        }
        return ""
    }
    
    private func getOXLineElement() -> some View {
        let width: CGFloat = 2,
            height: CGFloat = 3,
            topPadding: CGFloat = 4,
            opacity: CGFloat = 0.1

        return Rectangle()
            .frame(width: width, height: height, alignment: .center)
            .opacity(opacity)
            .padding(.top, topPadding)
    }

}
