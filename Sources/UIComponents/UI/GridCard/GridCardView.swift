import SwiftUI

public struct GridCardView<Content: View>: View {

    let model: GridCardModel<Content>

    public var body: some View {
        StandardCardWithContentView(
            cardHeader: model.header
        ) {
            VStack(
                alignment: .leading,
                spacing: model.rowSpacing
            ) {
                ForEach(0..<model.content.placement.vertical, id: \.self) { verticalPosition in
                    HStack(
                        alignment: .bottom,
                        spacing: model.shouldAddSpacersBetweenColumns ? 0 : model.columnSpacing
                    ) {
                        ForEach(0..<model.content.placement.horizontal, id: \.self) { horizontalPosition in
                            model.content.elements[verticalPosition * model.content.placement.vertical + horizontalPosition].content()
                            if model.shouldAddSpacersBetweenColumns,
                               !(horizontalPosition == model.content.placement.horizontal - 1) {
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
    }

    public init(
        model: GridCardModel<Content>
    ) {
        self.model = model
    }

}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            GridCardView(
                model: GridCardModel<AnyView>.init(
                    header: nil,
                    rowSpacing: 8,
                    columnSpacing: 20,
                    shouldAddSpacersBetweenColumns: false,
                    content: .init(
                        placement: (1, 4),
                        elements: [
                            .init(content: {
                                AnyView(
                                    VStack(alignment: .leading) {
                                        Text("Title")
                                        Text("Subtitile")
                                    }
                                )
                            }),
                            .init(content: {
                                AnyView(Text("Text2"))
                            }),
                            .init(content: {
                                AnyView(Text("Text3"))
                            }),
                            .init(content: {
                                AnyView(Text("Text4"))
                            }),
                        ]
                    )
                )
            )
        }
    }
}
