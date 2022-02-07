import SwiftUI

public struct CardTitleViewModel {

    // MARK: - Properties

    public let leadIcon: Image
    public let title: String
    public let description: String?
    public let trailIcon: Image?
    public let trailText: String?
    public let titleColor: Color
    public let descriptionColor: Color?
    public let shouldShowSeparator: Bool
    

    // MARK: - Init

    public init(
        leadIcon: Image,
        title: String,
        description: String?,
        trailIcon: Image?,
        trailText: String?,
        titleColor: Color,
        descriptionColor: Color?,
        shouldShowSeparator: Bool
    ) {
        self.leadIcon = leadIcon
        self.title = title
        self.titleColor = titleColor
        self.trailText = trailText
        self.trailIcon = trailIcon
        self.description = description
        self.descriptionColor = descriptionColor
        self.shouldShowSeparator = shouldShowSeparator
    }

}
