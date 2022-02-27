import SwiftUI

public struct ArticleCardModel {

    let title: String
    let subtitle: String
    let coverImage: Image

    public init(
        title: String,
        subtitle: String,
        coverImage: Image
    ) {
        self.title = title
        self.subtitle = subtitle
        self.coverImage = coverImage
    }

}
