import SwiftUI

public protocol ViewFactory {

    associatedtype Content: View

    func build(with element: UIDashboardSectionElement) -> Content

}

public extension ViewFactory {

    func internalBuild(with element: UIDashboardSectionElement) -> AnyView {
        return AnyView(build(with: element))
    }

}
