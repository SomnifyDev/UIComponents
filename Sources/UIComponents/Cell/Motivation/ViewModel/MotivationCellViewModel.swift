import SwiftUI

public struct MotivationCellViewModel {

    // MARK: - Properties

    let cardTitleViewModel: CardTitleViewModel
    let url: URL

    // MARK: - Init

    public init(
        leadIcon: Image,
        title: String,
        description: String?,
        url: URL
    ) {
        self.cardTitleViewModel = .init(leadIcon: leadIcon,
                                        title: title,
                                        description: description,
                                        trailIcon: IconsRepository.chevronRight,
                                        trailText: "Read more",
                                        titleColor: ColorsRepository.Text.standard,
                                        descriptionColor: ColorsRepository.Text.secondary,
                                        shouldShowSeparator: false)
        self.url = url
    }

}
