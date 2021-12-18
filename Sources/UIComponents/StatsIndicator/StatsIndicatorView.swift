//
//  SwiftUIView.swift
//  
//
//  Created by Никита Казанцев on 29.11.2021.
//

import SwiftUI

public struct StatsIndicatorView: View {
    @State private var shouldShowPopover = false

    private var viewModel: StatsIndicatorViewModel

    public init(viewModel: StatsIndicatorViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(viewModel.name)
                    .bold()
                    .font(.system(size: 20))

                Spacer()

                Image(systemName: "questionmark.circle")
                    .onTapGesture {
                        self.shouldShowPopover = true
                    }
                // TODO: добавить поповер - пока этот компонент swiftui работает не как надо
//                   .popover(isPresented: self.$shouldShowPopover, content: {})

            }

            Divider()
                .padding(.top, 4)

            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(String(format: "%.1f", viewModel.value))
                        .foregroundColor(viewModel.titleColor)
                        .bold()
                        .font(.system(size: 18))
                        .padding(.top, 8)

                    Text("(norm is - \(String(format: "%.1f", viewModel.healthyValueRange.lowerBound)) - \(String(format: "%.1f", viewModel.healthyValueRange.upperBound)))")
                        .foregroundColor(Color(.lightGray))
                        .font(.system(size: 12))

                    Text(viewModel.feedback)
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
        StatsIndicatorView(viewModel: .init(name: "SSDN",
                                        description: "some description some description some description some description",
                                        value: 12,
                                        valueNormInterval: 10...11,
                                        unit: "ms",
                                        feedback: "Looks like you’re in good shape, but there are some signs of fatigue. The agerage time lapsed betweeen your heartbeats is a bit low, though still within the norn"))
    }
}
