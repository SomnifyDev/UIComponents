import Foundation

public protocol UIContentProvider: AnyObject {

    /// Should be marked with `@Published` property wrapper
    var content: UIDashboardContent? { get }
    var registry: ContentDashboardRegistry { get }
    var replenishableLocalContent: [UIProviderRepresentableContent] { get }
    var sectionNames: [SectionName] { get }

    func getContent() async

}

public extension UIContentProvider {

    func getSections() -> [UIDashboardSection] {
        let sectionsDictionary = Dictionary(grouping: replenishableLocalContent, by: { $0.sectionNumber })
        let sectionsArray = sectionsDictionary.sorted { $0.key < $1.key }.map { $0.value.map { $0.element } }
        return sectionsArray.enumerated().map { UIDashboardSection(name: getSectionName(for: $0), elements: $1) }
    }

    func getSectionName(for index: Int) -> SectionName {
        return sectionNames[index]
    }

}
