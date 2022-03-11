import SwiftUI

public protocol ViewFactory {
    associatedtype Content: View
    func build(with element: ContentDashboardSectionElement) -> Content
}

public extension ViewFactory {
    func internalBuild(with element: ContentDashboardSectionElement) -> AnyView {
        return AnyView(build(with: element))
    }
}
