import Foundation
import UIKit
import SwiftUI

public struct BasicCellModel {
    public struct LabelConfiguration {
        let title: String
        let font: Font?
        let color: Color?

        public init(title: String, font: Font?, color: Color?) {
            self.title = title
            self.font = font
            self.color = color
        }
    }

    public struct ImageConfiguration {
        let image: Image
        let font: Font?
        let color: Color?

        public init(image: Image, font: Font?, color: Color?) {
            self.image = image
            self.font = font
            self.color = color
        }
    }

    let id: UUID = UUID()
    let leadingSystemImageConfiguration: ImageConfiguration
    let titleConfiguration: LabelConfiguration
    let subtitleConfiguration: LabelConfiguration?
    let trailingConfiguration: (labelConfiguration: LabelConfiguration?, imageConfiguration: ImageConfiguration?)?

    public init(
        leadingSystemImageConfiguration: ImageConfiguration,
        titleConfiguration: LabelConfiguration,
        subtitleConfiguration: LabelConfiguration?,
        trailingConfiguration: (labelConfiguration: LabelConfiguration?, imageConfiguration: ImageConfiguration?)?
    ) {
        self.leadingSystemImageConfiguration = leadingSystemImageConfiguration
        self.titleConfiguration = titleConfiguration
        self.subtitleConfiguration = subtitleConfiguration
        self.trailingConfiguration = trailingConfiguration
    }

}
