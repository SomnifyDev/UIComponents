//
//  SwiftUIView.swift
//  
//
//  Created by Никита Казанцев on 29.11.2021.
//

import SwiftUI

public struct StatsIndicatorView: View {
    public struct StatsIndicatorModel: Hashable {
        let name: String
        let description: String
        let value: Double
        let valueNormInterval: ClosedRange<Double>
        let unit: String
        let feedback: String

        public init(name: String, description: String, value: Double, valueNormInterval: ClosedRange<Double>, unit: String, feedback: String) {
            self.name = name
            self.description = description
            self.value = value
            self.valueNormInterval = valueNormInterval
            self.unit = unit
            self.feedback = feedback
        }

        public static func == (lhs: StatsIndicatorModel, rhs: StatsIndicatorModel) -> Bool {
            return lhs.name == rhs.name
        }
    }

    @State private var showShowPopover = false

    var model: StatsIndicatorModel

    public init(model: StatsIndicatorModel) {
        self.model = model
    }

    public var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(model.name)
                    .bold()
                    .font(.system(size: 20))

                Spacer()

                Image(systemName: "questionmark.circle")
                    .onTapGesture {
                        self.showShowPopover = true
                    }
//                    .popover(isPresented: self.$showShowPopover, content: {
//                        Text("popover")
//                    })

            }

            Divider()
                .padding(.top, 4)

            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(String(format: "%.1f", model.value))
                        .foregroundColor(model.value >= model.valueNormInterval.lowerBound &&
                                         model.value <= model.valueNormInterval.upperBound
                                         ? .green : .red)
                        .bold()
                        .font(.system(size: 18))
                        .padding(.top, 8)

                    Text("(norm is - \(String(format: "%.1f", model.valueNormInterval.lowerBound)) - \(String(format: "%.1f", model.valueNormInterval.upperBound)))")
                        .foregroundColor(Color(.lightGray))
                        .font(.system(size: 12))

                    Text(model.feedback)
                        .padding(.top, 8)
                        .font(.system(size: 12))
                }
                Spacer()
            }
        }
    }
}

struct StatsIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        StatsIndicatorView(model: .init(name: "SSDN",
                                        description: "some description some description some description some description",
                                        value: 12,
                                        valueNormInterval: 10...11,
                                        unit: "ms",
                                        feedback: "Looks like you’re in good shape, but there are some signs of fatigue. The agerage time lapsed betweeen your heartbeats is a bit low, though still within the norn"))
    }
}
