import SwiftUI

public struct ArticleCardModel {

    let title: String
    let subtitle: String
    let coverImage: Image

    public init(
        title: String,
        description: String,
        coverImage: Image
    ) {
        self.title = title
        self.subtitle = description
        self.coverImage = coverImage
    }

}
