import Foundation
import SwiftUI

public struct StatisticsCellView: View {

    // MARK: - Properties

    private let viewModel: StatisticsCellViewModel

    public var body: some View {
        HStack {
            Text(viewModel.title)
            Spacer()
            Text(viewModel.value)
        }
    }

    // MARK: - Init

    public init(with viewModel: StatisticsCellViewModel) {
        self.viewModel = viewModel
    }
    
}
