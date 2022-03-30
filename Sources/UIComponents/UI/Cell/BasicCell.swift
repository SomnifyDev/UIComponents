import Foundation
import SwiftUI

public struct BasicCell: View {

    // MARK: - Private properties

    private let model: BasicCellModel

    // MARK: - Public properties

    public var body: some View {
        HStack {
            BasicCellImage(model: self.model.leadingSystemImageConfiguration)

            VStack(alignment: .leading) {
                BasicCellTitle(model: self.model.titleConfiguration)

                if let subtitleConfiguration = self.model.subtitleConfiguration {
                    BasicCellTitle(model: subtitleConfiguration)
                }
            }

            Spacer()

            if let trailingConfiguration = self.model.trailingConfiguration {
                HStack {
                    if let trailingLabelConfiguration = trailingConfiguration.0 {
                        BasicCellTitle(model: trailingLabelConfiguration)
                    }

                    if let trailingImageConfiguration = trailingConfiguration.1 {
                        BasicCellImage(model: trailingImageConfiguration)
                    }
                }
            }
        }
        .roundedCardBackground(
            color: ColorsRepository.Card.cardBackground,
            horizontalPadding: 16,
            verticalPadding: 8
        )
    }

    // MARK: - Init

    public init(model: BasicCellModel) {
        self.model = model
    }
    
}
