import SwiftUI

public struct ContentDashboard: View {

    // MARK: - Private properties

    private let sections: [ContentDashboardSection]
    private let registry: [ContentDashboardSectionElementTypeIdentifier: Any]

    // MARK: - Public properties

    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 32) {
                ForEach(sections) { section in
                    ContentSectionView(sectionName: section.name) {
                        VStack(spacing: 8) {
                            ForEach(section.elements) { element in
                                (registry[element.type] as! ViewFactory).internalBuild(with: element)
                            }
                        }
                    }
                }
            }
        }
    }

    // MARK: - Init

    public init(
        registry: [ContentDashboardSectionElementTypeIdentifier: Any],
        sections: [ContentDashboardSection]
    ) {
        self.registry = registry
        self.sections = sections
    }

}

// MARK: - ContentSectionView

struct ContentSectionView<Content: View>: View {

    let sectionName: String
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(sectionName)
                    .cardNameTextModifier(color: ColorsRepository.Text.standard)
                Spacer()
            }
            content()
        }
    }

}
