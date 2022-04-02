import Foundation
import SwiftUI

public struct BasicCell: View {

    // MARK: - Private properties

    private let model: BasicCellModel

    // MARK: - Public properties

    public var body: some View {
        HStack {
            BasicCellImage(model: self.model.leadingSystemImageModel)

            VStack(alignment: .leading) {
                BasicCellText(model: self.model.titleModel)

                if let subtitleModel = self.model.subtitleModel {
                    BasicCellText(model: subtitleModel)
                }
            }

            Spacer()

            if let trailingItemModel = self.model.trailingItemModel {
                HStack {
                    if let trailingLabelModel = trailingItemModel.0 {
                        BasicCellText(model: trailingLabelModel)
                    }

                    if let trailingImageModel = trailingItemModel.1 {
                        BasicCellImage(model: trailingImageModel)
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
