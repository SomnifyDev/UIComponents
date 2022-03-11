import Foundation

public typealias ContentDashboardSectionElementTypeIdentifier = String

public struct ContentDashboardSection: Identifiable {

    public let id = UUID()
    public let name: String
    public let elements: [ContentDashboardSectionElement]

    public init(
        name: String,
        elements: [ContentDashboardSectionElement]
    ) {
        self.name = name
        self.elements = elements
    }

}

public struct ContentDashboardSectionElement: Identifiable {

    public let id = UUID()
    public let type: ContentDashboardSectionElementTypeIdentifier
    public let payload: Any

    public init(
        type: ContentDashboardSectionElementTypeIdentifier,
        payload: Any
    ) {
        self.type = type
        self.payload = payload
    }

}
