// Copyright (c) 2021 Sleepy.

import SwiftUI

public struct StandardChartView: View {

    // MARK: - Private types

    private enum Constant {
        static let descriptionHeight: CGFloat = 13
        static let standardWidth: CGFloat = 14
        static let tapDescriptionHeight: CGFloat = 16
        static let stackSpacing: CGFloat = 4
    }

    // MARK: - Private properties

    @State private var selectedIndex = -1
    @State private var elemWidth: CGFloat = 14
    @State private var chartSpacing: CGFloat = 3

    private let model: StandardChartModel

    // MARK: - Public properties

    public var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: Constant.stackSpacing) {

                if model.dragGestureEnabled {
                    Text(self.selectedIndex >= 0 ? self.getTapDescription(for: self.selectedIndex) : "")
                        .frame(height: Constant.tapDescriptionHeight)
                }

                Spacer()

                HStack(alignment: .bottom, spacing: self.chartSpacing) {
                    ForEach(0 ..< model.points.count, id: \.self) { index in
                        VStack {
                            if selectedIndex == index {
                                self.getChartElement(value: model.points[index].value)
                                    .colorInvert()
                            } else {
                                self.getChartElement(value: model.points[index].value)
                            }

                            if model.timeLineType.isOXLineNeeded {
                                self.getOXLineElement()
                            }
                        }

                        switch model.chartType {
                        case .verticalProgress:
                            if index != model.points.count - 1 {
                                Spacer()
                            }
                        default:
                            EmptyView()
                        }
                    }
                }
                .allowsHitTesting(model.dragGestureEnabled)
                .gesture(
                    DragGesture(
                        minimumDistance: 5,
                        coordinateSpace: .global
                    ).onChanged { gesture in
                        let selected = Int(gesture.location.x / (geometry.size.width / (CGFloat(model.points.count) - self.chartSpacing)))

                        if selected != selectedIndex, selected < model.points.count {
                            selectedIndex = selected
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred(intensity: 0.6)
                        }
                    }.onEnded { _ in
                        selectedIndex = -1
                    }
                )

                OXChartLineView(chartLineType: model.timeLineType)
            }
            .onAppear {
                let chartWidth = CGFloat(model.points.count) * Constant.standardWidth + self.chartSpacing * CGFloat(model.points.count - 1)
                if chartWidth > geometry.size.width {
                    self.elemWidth = abs(geometry.size.width - self.chartSpacing * CGFloat(model.points.count - 1)) / CGFloat(model.points.count)
                }

                switch model.chartType {
                case .verticalProgress:
                    self.chartSpacing = 0
                default:
                    self.chartSpacing = 3
                }
            }
        }
        .frame(height: model.chartHeight + (model.timeLineType.isOXLineNeeded ? 30 : 0) + (model.timeLineType.isTimeLineNeeded ? 30 : 0) + (model.dragGestureEnabled ? 16 : 0))
    }

    // MARK: - Init

    public init(model: StandardChartModel) {
        self.model = model
    }

    // MARK: - Private methods

    private func getChartElement(value: Double) -> some View {
        let minimum = model.points.map{ $0.value}.min() ?? 0
        let maximum = model.points.map{ $0.value}.max() ?? 0

        let height = max(model.chartHeight * 0.2, model.chartHeight * ((value - minimum) / (maximum - minimum)))

        switch model.chartType {
        case .phasesChart:
            return StandardChartElementView(
                chartElement: StandardChartElementModel(
                    width: elemWidth,
                    height: height,
                    type: .rectangular(color: getPhaseColor(for: value))
                )
            )
        case .defaultChart(let barType, _):
            return StandardChartElementView(
                chartElement: StandardChartElementModel(
                    width: elemWidth,
                    height: height,
                    type: barType
                )
            )
        case let .verticalProgress(foregroundElementColor, backgroundElementColor, max):
            return StandardChartElementView(
                chartElement: StandardChartElementModel(
                    width: elemWidth,
                    height: model.chartHeight,
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
        let item = model.points[index]

        switch model.chartType {
        case .phasesChart:
            let phaseDescription = (item.value < 0.55
                                    ? "Deep sleep phase"
                                    : (item.value >= 1
                                       ? "Probably woke up"
                                       : "Light sleep phase"))
            return "\(phaseDescription), \(item.date.getFormattedDate(format: .time))"

        case .defaultChart(let barType, let stringFormatter):
            var format: Date.StringFormatType = .time

            if case .some(_, let formatType) = model.timeLineType,
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
