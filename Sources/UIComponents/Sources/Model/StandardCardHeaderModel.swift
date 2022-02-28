import SwiftUI

public struct StandardCardHeaderModel {
    
    let leadIcon: Image
    let title: String
    let titleColor: Color
    let trailIcon: Image?
    let trailIconAction: ActionHandler?
    let trailText: String?
    let description: String?
    let descriptionColor: Color?
    let shouldShowSeparator: Bool

    public init(
        leadIcon: Image,
        title: String,
        titleColor: Color,
        trailIcon: Image?,
        trailIconAction: ActionHandler?,
        trailText: String?,
        description: String?,
        descriptionColor: Color?,
        shouldShowSeparator: Bool
    ) {
        self.leadIcon = leadIcon
        self.title = title
        self.titleColor = titleColor
        self.trailIcon = trailIcon
        self.trailIconAction = trailIconAction
        self.trailText = trailText
        self.description = description
        self.descriptionColor = descriptionColor
        self.shouldShowSeparator = shouldShowSeparator
    }

    /* Convenience init */
    public init(
        leadIcon: Image,
        title: String,
        titleColor: Color,
        shouldShowSeparator: Bool
    ) {
        self.init(
            leadIcon: leadIcon,
            title: title,
            titleColor: titleColor,
            trailIcon: nil,
            trailIconAction: nil,
            trailText: nil,
            description: nil,
            descriptionColor: nil,
            shouldShowSeparator: shouldShowSeparator
        )
    }

}
