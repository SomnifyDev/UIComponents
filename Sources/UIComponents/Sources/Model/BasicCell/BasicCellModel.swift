import Foundation
import UIKit
import SwiftUI

public typealias BasicCellTrailingItemModel = (labelModel: BasicCellTextModel?, imageModel: BasicCellImageModel?)?

public struct BasicCellModel {

    let id: UUID = UUID()
    let leadingSystemImageModel: BasicCellImageModel
    let titleModel: BasicCellTextModel
    let subtitleModel: BasicCellTextModel?
    let trailingItemModel: BasicCellTrailingItemModel

    public init(
        leadingSystemImageModel: BasicCellImageModel,
        titleModel: BasicCellTextModel,
        subtitleModel: BasicCellTextModel?,
        trailingItemModel: BasicCellTrailingItemModel
    ) {
        self.leadingSystemImageModel = leadingSystemImageModel
        self.titleModel = titleModel
        self.subtitleModel = subtitleModel
        self.trailingItemModel = trailingItemModel
    }

}

public struct BasicCellTextModel {

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
