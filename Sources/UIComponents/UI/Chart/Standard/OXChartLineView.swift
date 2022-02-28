// Copyright (c) 2021 Sleepy.

import SwiftUI

// MARK: - OXChartLineType

public enum OXChartLineType {

    case some(dateInterval: DateInterval?, formatType: Date.StringFormatType?)
    case none

    var isOXLineNeeded: Bool {
        switch self {
        case .some:
            return true
        case .none:
            return false
        }
    }

    var isTimeLineNeeded: Bool {
        switch self {
        case .some(let dateInterval, let formatType):
            return dateInterval != nil && formatType != nil
        case .none:
            return false
        }
    }

}

// MARK: - OXChartLineView

public struct OXChartLineView: View {

    // MARK: - Private properties

    private let chartLineType: OXChartLineType

    // MARK: - Public properties

    public var body: some View {
        if case .some(let dateInterval, let formatType) = chartLineType,
           let dateInterval = dateInterval,
           let formatType = formatType {
            HStack {
                Text(dateInterval.start.getFormattedDate(format: formatType))
                    .regularTextModifier(color: ColorsRepository.Text.standard, size: 10, opacity: 0.4)

                Spacer()

                Text(dateInterval.end.getFormattedDate(format: formatType))
                    .regularTextModifier(color: ColorsRepository.Text.standard, size: 10, opacity: 0.4)
            }
        }
    }

    // MARK: - Init

    public init(chartLineType: OXChartLineType) {
        self.chartLineType = chartLineType
    }

}
