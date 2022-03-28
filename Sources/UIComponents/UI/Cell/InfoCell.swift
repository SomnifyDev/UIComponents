import Foundation
import SwiftUI

public struct InfoCell: View {

    // MARK: - Private properties

    private let info: InfoCellModel

    // MARK: - Public properties

    public var body: some View {
        HStack {
            InfoCellImage(configuration: info.leadingSystemImageConfiguration)

            VStack(alignment: .leading) {
                InfoCellTitle(configuration: info.titleConfiguration)

                if let subtitleConfiguration = info.subtitleConfiguration {
                    InfoCellTitle(configuration: subtitleConfiguration)
                }
            }

            Spacer()

            if let trailingConfiguration = info.trailingConfiguration {
                HStack {
                    if let trailingLabelConfiguration = trailingConfiguration.0 {
                    InfoCellTitle(configuration: trailingLabelConfiguration)
                    }

                    if let trailingImageConfiguration = trailingConfiguration.1 {
                        InfoCellImage(configuration: trailingImageConfiguration)
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

    public init(info: InfoCellModel) {
        self.info = info
    }
    
}

public struct InfoCellTitle: View {

    // MARK: - Private properties

    private let configuration: InfoCellModel.LabelConfiguration

    // MARK: - Public properties

    public var body: some View {
        Text(configuration.title)
            .lineLimit(1)
            .font(configuration.font)
            .foregroundColor(configuration.color)
    }

    // MARK: - Init

    public init(configuration: InfoCellModel.LabelConfiguration) {
        self.configuration = configuration
    }

}

public struct InfoCellImage: View {

    // MARK: - Private properties

    private let configuration: InfoCellModel.ImageConfiguration

    // MARK: - Public properties

    public var body: some View {
        Image(systemName: configuration.systemImage)
            .font(configuration.font)
            .foregroundColor(configuration.color)
    }

    // MARK: - Init

    public init(configuration: InfoCellModel.ImageConfiguration) {
        self.configuration = configuration
    }

}
