import Foundation

// MARK: - Typealiases

public typealias SectionName = String
public typealias ContentDashboardSectionElementTypeIdentifier = String
public typealias ContentDashboardRegistry = [ContentDashboardSectionElementTypeIdentifier: Any]

// MARK: - ContentDashboardSection

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

// MARK: - ContentDashboardSectionElement

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

// MARK: - ContentDashboardSkeleton

public struct ContentDashboardBasis {

    public let registry: [ContentDashboardSectionElementTypeIdentifier: Any]
    public let sections: [ContentDashboardSection]

    public init(
        registry: [ContentDashboardSectionElementTypeIdentifier: Any],
        sections: [ContentDashboardSection]
    ) {
        self.registry = registry
        self.sections = sections
    }

}

// MARK: - UIProviderRepresentableViewContent

public struct UIProviderRepresentableViewContent {

    public let sectionNumber: Int
    public let element: ContentDashboardSectionElement

    public init(
        sectionNumber: Int,
        element: ContentDashboardSectionElement
    ) {
        self.sectionNumber = sectionNumber
        self.element = element
    }

}
