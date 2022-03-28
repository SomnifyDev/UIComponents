import SwiftUI

// MARK: - UIDashboard

public struct UIDashboard: View {

    // MARK: - Private properties

    private let content: UIDashboardContent

    // MARK: - Public properties

    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 32) {
                ForEach(content.sections) { section in
                    UIDashboardSectionView(sectionName: section.name) {
                        VStack(spacing: 8) {
                            ForEach(section.elements) { element in
                                (content.registry[element.type] as! ViewFactory).internalBuild(with: element)
                            }
                        }
                    }
                }
            }
        }
    }

    // MARK: - Init

    public init(content: UIDashboardContent) {
        self.content = content
    }

}

// MARK: - UIDashboardSectionView

struct UIDashboardSectionView<Content: View>: View {

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
