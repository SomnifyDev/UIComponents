// Copyright (c) 2021 Sleepy.

import SwiftUI

public struct OXChartLineView: View {
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

    let chartLineType: OXChartLineType

    public var body: some View {
        HStack {
            if case .some(let dateInterval, let formatType) = chartLineType,
               let dateInterval = dateInterval,
               let formatType = formatType {
                Text(dateInterval.start.getFormattedDate(format: formatType))
                    .regularTextModifier(color: ColorsRepository.Text.standard, size: 10, opacity: 0.4)

                Spacer()

                Text(dateInterval.end.getFormattedDate(format: formatType))
                    .regularTextModifier(color: ColorsRepository.Text.standard, size: 10, opacity: 0.4)
            } else {
                EmptyView()
            }
        }
    }
    
}
