import SwiftUI

public struct ArticleCardDetailViewModel {

    // MARK: - Properties

    let articleName: String
    let coverImage: Image
    let mainTitle: String
    let articleParagraphs: [String]

    // MARK: - Init

    public init(
        articleName: String,
        coverImage: Image,
        mainTitle: String,
        articleParagraphs: [String]
    ) {
        self.articleName = articleName
        self.coverImage = coverImage
        self.mainTitle = mainTitle
        self.articleParagraphs = articleParagraphs
    }
    
}
