import SwiftUI

public struct CardTitleViewModel {

    // MARK: - Properties

    let leadIcon: Image
    let title: String
    let description: String?
    let trailIcon: Image?
    let trailIconAction: (() -> ())?
    let trailText: String?
    let titleColor: Color
    let descriptionColor: Color?
    let shouldShowSeparator: Bool
    

    // MARK: - Init

    public init(
        leadIcon: Image,
        title: String,
        description: String?,
        trailIcon: ImageExtended?,
        trailIconAction: (() -> ())?,
        trailText: String?,
        titleColor: Color,
        descriptionColor: Color?,
        shouldShowSeparator: Bool,
        
    ) {
        self.leadIcon = leadIcon
        self.title = title
        self.titleColor = titleColor
        self.trailText = trailText
        self.trailIcon = trailIcon
        self.trailIconAction = trailIconAction
        self.description = description
        self.descriptionColor = descriptionColor
        self.shouldShowSeparator = shouldShowSeparator
        
    }

}