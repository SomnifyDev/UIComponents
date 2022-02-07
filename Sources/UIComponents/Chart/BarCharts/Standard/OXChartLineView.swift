// Copyright (c) 2021 Sleepy.

import SwiftUI

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

public struct OXChartLineView: View {
    let chartLineType: OXChartLineType

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
    
}
