import SwiftUI

public struct GridCardView: View {

    let model: GridCardModel

    public var body: some View {
        StandardCardWithContentView(
            cardHeader: model.header
        ) {
            ForEach(0..<model.content.placement.vertical, id: \.self) { verticalPosition in
                HStack(
                    alignment: .bottom,
                    spacing: model.shouldAddSpacersBetweenColumns ? 0 : model.columnSpacing
                ) {
                    ForEach(0..<model.content.placement.horizontal, id: \.self) { horizontalPosition in
                        let element = model.content.elements[verticalPosition * model.content.placement.horizontal + horizontalPosition]
                        switch element {
                        case .fulfilled(let view):
                            view
                        case .empty:
                            EmptyView()
                        }
                        if model.shouldAddSpacersBetweenColumns,
                           !(horizontalPosition == model.content.placement.horizontal - 1) {
                            Spacer()
                        }
                    }
                }
            }
        }
    }

    public init(
        model: GridCardModel
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
                model: GridCardModel.init(
                    header: nil,
                    rowSpacing: 8,
                    columnSpacing: 20,
                    shouldAddSpacersBetweenColumns: false,
                    content: .init(
                        placement: (2, 4),
                        elements: [
                            .fulfilled(
                                AnyView(
                                    VStack {
                                        Text("title1")
                                        Text("subtitle")
                                    }
                                )
                            ),
                            .empty,
                            .fulfilled(
                                AnyView(
                                    VStack {
                                        Text("title2")
                                        Text("subtitle")
                                    }
                                )
                            ),
                            .empty,
                            .empty,
                            .empty,
                            .fulfilled(
                                AnyView(
                                    VStack {
                                        Text("title3")
                                        Text("subtitle")
                                    }
                                )
                            ),
                            .fulfilled(
                                AnyView(
                                    VStack {
                                        Text("title4")
                                        Text("subtitle")
                                    }
                                )
                            ),
                        ]
                    )
                )
            )
        }
    }
}
