import Foundation

public protocol UIContentProvider: AnyObject {

    /// Should be marked with `@Published` property wrapper
    var content: ContentDashboardBasis { get }
    var registry: ContentDashboardRegistry { get }
    var replenishableLocalContent: [UIProviderRepresentableViewContent] { get }
    var sections: [SectionName] { get }

    func getContent()

}

public extension UIContentProvider {

    func getSections() -> [ContentDashboardSection] {
        let sectionsDictionary = Dictionary(grouping: replenishableLocalContent, by: { $0.sectionNumber })
        let sectionsArray = sectionsDictionary.sorted { $0.key < $1.key }.map { $0.value.map { $0.element } }
        return sectionsArray.enumerated().map { ContentDashboardSection(name: getSectionName(for: $0), elements: $1) }
    }

    func getSectionName(for index: Int) -> SectionName {
        return sections[index]
    }

}
