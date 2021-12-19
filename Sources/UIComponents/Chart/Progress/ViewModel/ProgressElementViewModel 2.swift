import Foundation

public struct ProgressElementViewModel {

    // MARK: - Properties

    public let title: String
    public let payloadText: String
    public let value: Int

    // MARK: - Init

    public init(
        title: String,
        payloadText: String,
        value: Int
    ) {
        self.title = title
        self.payloadText = payloadText
        self.value = value
    }

}
