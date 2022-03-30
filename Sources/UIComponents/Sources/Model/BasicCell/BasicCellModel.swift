import Foundation
import UIKit
import SwiftUI

public struct BasicCellModel {
    let id: UUID = UUID()
    let leadingSystemImageConfiguration: BasicCellImageModel
    let titleConfiguration: BasicCellLabelModel
    let subtitleConfiguration: BasicCellLabelModel?
    let trailingConfiguration: (labelConfiguration: BasicCellLabelModel?, imageConfiguration: BasicCellImageModel?)?

    public init(
        leadingSystemImageConfiguration: BasicCellImageModel,
        titleConfiguration: BasicCellLabelModel,
        subtitleConfiguration: BasicCellLabelModel?,
        trailingConfiguration: (labelConfiguration: BasicCellLabelModel?, imageConfiguration: BasicCellImageModel?)?
    ) {
        self.leadingSystemImageConfiguration = leadingSystemImageConfiguration
        self.titleConfiguration = titleConfiguration
        self.subtitleConfiguration = subtitleConfiguration
        self.trailingConfiguration = trailingConfiguration
    }

}

public struct BasicCellLabelModel {
    let title: String
    let font: Font?
    let color: Color?

    public init(title: String, font: Font?, color: Color?) {
        self.title = title
        self.font = font
        self.color = color
    }
}

public struct BasicCellImageModel {
    let image: Image
    let font: Font?
    let color: Color?

    public init(image: Image, font: Font?, color: Color?) {
        self.image = image
        self.font = font
        self.color = color
    }
}
