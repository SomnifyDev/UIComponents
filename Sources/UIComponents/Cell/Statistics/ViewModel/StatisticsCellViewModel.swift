import Foundation

public struct StatisticsCellViewModel: Identifiable {

    // MARK: - Properties
    
    public var id: String { title }
    let title: String
    let value: String

    // MARK: - Init

    public init(title: String, value: String) {
        self.title = title
        self.value = value
    }

}
