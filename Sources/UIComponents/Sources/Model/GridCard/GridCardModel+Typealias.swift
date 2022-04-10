import Foundation
import SwiftUI

public typealias GridPlacement = (vertical: Int, horizontal: Int)

// MARK: - GridCardModel

public struct GridCardModel {

    let header: StandardCardHeaderModel?
    let content: GridCardContentModel

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
        content: GridCardContentModel
    ) {
        self.header = header
        self.rowSpacing = rowSpacing
        self.columnSpacing = columnSpacing
        self.shouldAddSpacersBetweenColumns = shouldAddSpacersBetweenColumns
        self.content = content
    }

}

// MARK: - GridCardContentModel

public struct GridCardContentModel {

    let placement: GridPlacement
    let elements: [GridCardContentElementModel]

    public init(
        placement: GridPlacement,
        elements: [GridCardContentElementModel]
    ) {
        self.placement = placement
        self.elements = elements
    }

}

// MARK: - GridCardContentElementModel

public enum GridCardContentElementModel: Identifiable {

    case fulfilled(AnyView)
    case empty

    public var id: UUID {
        get { UUID() }
    }

    public init(
        @ViewBuilder content: @escaping () -> AnyView?
    ) {
        if let content = content() {
            self = .fulfilled(content)
        } else {
            self = .empty
        }
    }

}
