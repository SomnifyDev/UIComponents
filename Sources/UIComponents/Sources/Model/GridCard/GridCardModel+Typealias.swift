import Foundation
import SwiftUI

public typealias GridPlacement = (vertical: Int, horizontal: Int)

// MARK: - GridCardModel

public struct GridCardModel<Content: View> {

    let header: StandardCardHeaderModel?
    let content: GridCardContentModel<Content>

    /// Spacing between rows
    let rowSpacing: CGFloat?
    /// Spacing between columns
    let columnSpacing: CGFloat?
    /// Determines if horizontal pozitions should be defined by spacers. This has bigger prioriry than `columnSpacing` if both were specified.
    let shouldAddSpacersBetweenColumns: Bool

    public init(
        header: StandardCardHeaderModel?,
        rowSpacing: CGFloat? = 16,
        columnSpacing: CGFloat? = nil,
        shouldAddSpacersBetweenColumns: Bool = true,
        content: GridCardContentModel<Content>
    ) {
        self.header = header
        self.rowSpacing = rowSpacing
        self.columnSpacing = columnSpacing
        self.shouldAddSpacersBetweenColumns = shouldAddSpacersBetweenColumns
        self.content = content
    }

}

// MARK: - GridCardContentModel

public struct GridCardContentModel<Content: View> {

    let placement: GridPlacement
    let elements: [GridCardContentElementModel<Content>]

    public init(
        placement: GridPlacement,
        elements: [GridCardContentElementModel<Content>]
    ) {
        self.placement = placement
        self.elements = elements
    }

}

// MARK: - GridCardContentElementModel

public struct GridCardContentElementModel<Content: View>: Identifiable {

    public let id = UUID()
    let content: () -> Content

    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }

}
