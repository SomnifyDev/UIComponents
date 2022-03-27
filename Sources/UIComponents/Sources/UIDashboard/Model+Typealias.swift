import Foundation

// MARK: - Typealiases

public typealias SectionName = String
public typealias UIDashboardSectionElementTypeIdentifier = String
public typealias ContentDashboardRegistry = [UIDashboardSectionElementTypeIdentifier: Any]

// MARK: - UIDashboardSection

public struct UIDashboardSection: Identifiable {

    public let id = UUID()
    public let name: String
    public let elements: [UIDashboardSectionElement]

    public init(
        name: String,
        elements: [UIDashboardSectionElement]
    ) {
        self.name = name
        self.elements = elements
    }

}

// MARK: - UIDashboardSectionElement

public struct UIDashboardSectionElement: Identifiable {

    public let id = UUID()
    public let type: UIDashboardSectionElementTypeIdentifier
    public let payload: Any

    public init(
        type: UIDashboardSectionElementTypeIdentifier,
        payload: Any
    ) {
        self.type = type
        self.payload = payload
    }

}

// MARK: - UIDashboardContent

public struct UIDashboardContent {

    public let registry: [UIDashboardSectionElementTypeIdentifier: Any]
    public let sections: [UIDashboardSection]

    public init(
        registry: [UIDashboardSectionElementTypeIdentifier: Any],
        sections: [UIDashboardSection]
    ) {
        self.registry = registry
        self.sections = sections
    }

}

// MARK: - UIProviderRepresentableContent

public struct UIProviderRepresentableContent {

    public let sectionNumber: Int
    public let element: UIDashboardSectionElement

    public init(
        sectionNumber: Int,
        element: UIDashboardSectionElement
    ) {
        self.sectionNumber = sectionNumber
        self.element = element
    }

}
