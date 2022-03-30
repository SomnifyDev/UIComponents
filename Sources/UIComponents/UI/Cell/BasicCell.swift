import Foundation
import SwiftUI

public struct BasicCell: View {

    // MARK: - Private properties

    private let info: BasicCellModel

    // MARK: - Public properties

    public var body: some View {
        HStack {
            BasicCellImage(configuration: info.leadingSystemImageConfiguration)

            VStack(alignment: .leading) {
                BasicCellTitle(configuration: info.titleConfiguration)

                if let subtitleConfiguration = info.subtitleConfiguration {
                    BasicCellTitle(configuration: subtitleConfiguration)
                }
            }

            Spacer()

            if let trailingConfiguration = info.trailingConfiguration {
                HStack {
                    if let trailingLabelConfiguration = trailingConfiguration.0 {
                        BasicCellTitle(configuration: trailingLabelConfiguration)
                    }

                    if let trailingImageConfiguration = trailingConfiguration.1 {
                        BasicCellImage(configuration: trailingImageConfiguration)
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

    public init(info: BasicCellModel) {
        self.info = info
    }
    
}

public struct BasicCellTitle: View {

    // MARK: - Private properties

    private let configuration: BasicCellModel.LabelConfiguration

    // MARK: - Public properties

    public var body: some View {
        Text(configuration.title)
            .lineLimit(1)
            .font(configuration.font)
            .foregroundColor(configuration.color)
    }

    // MARK: - Init

    public init(configuration: BasicCellModel.LabelConfiguration) {
        self.configuration = configuration
    }

}

public struct BasicCellImage: View {

    // MARK: - Private properties

    private let configuration: BasicCellModel.ImageConfiguration

    // MARK: - Public properties

    public var body: some View {
        configuration.image
            .font(configuration.font)
            .foregroundColor(configuration.color)
    }

    // MARK: - Init

    public init(configuration: BasicCellModel.ImageConfiguration) {
        self.configuration = configuration
    }

}
