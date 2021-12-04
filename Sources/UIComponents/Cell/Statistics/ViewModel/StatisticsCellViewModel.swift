import Foundation

public struct StatisticsCellViewModel: Identifiable {
    
    public var id: String { title }
    let title: String
    let value: String

    public init(title: String, value: String) {
        self.title = title
        self.value = value
    }

}
