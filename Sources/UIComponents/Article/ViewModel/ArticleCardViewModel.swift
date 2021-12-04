import SwiftUI

public struct ArticleCardViewModel {

    // MARK: - Properties

    let title: String
    let description: String
    let coverImage: Image

    // MARK: - Init

    public init(
        title: String,
        description: String,
        coverImage: Image
    ) {
        self.title = title
        self.description = description
        self.coverImage = coverImage
    }

}
