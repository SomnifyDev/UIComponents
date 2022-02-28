import SwiftUI

public extension Image {

    func modifiedImage(
        color: Color,
        size: CGFloat,
        width: CGFloat
    ) -> some View {
        foregroundColor(color)
            .font(.system(size: size, weight: .bold))
            .frame(width: width)
    }

}
