import SwiftUI

public struct ProgressElementView: View {

    // MARK: - Private properties

    private let viewModel: ProgressChartElementModel

    // MARK: - Public properties

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.title)
                .fontWeight(.semibold)

            ZStack(alignment: .leading) {
                Rectangle()
                    .cornerRadius(5)
                Text(viewModel.payloadText)
                    .fontWeight(.medium)
                    .font(.callout)
                    .foregroundColor(.white)
                    .padding(.leading, 8)
            }
            .frame(height: 30)
        }
        .frame(minHeight: 0)
    }

    // MARK: - Init

    public init(with viewModel: ProgressChartElementModel) {
        self.viewModel = viewModel
    }

}
