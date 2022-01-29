import SwiftUI

public struct ArticleCardView<Content: View>: View {

    // MARK: - Properties

    @Binding var shouldOpenDestinationView: Bool
    private let viewModel: ArticleCardViewModel
    private let destinationView: Content

    public var body: some View {
        Button(
            action: {
                shouldOpenDestinationView.toggle()
            }, label: {
                VStack {
                    viewModel.coverImage
                        .resizable()
                        .frame(height: 235)
                    VStack(spacing: 16) {
                        HStack {
                            Text(viewModel.title)
                                .fontWeight(.bold)
                                .font(.title2)
                            Spacer()
                        }
                        HStack {
                            Text(viewModel.description)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.none)
                            Spacer()
                        }
                    }
                    .padding()
                    Spacer()
                }
                .cornerRadius(10)
            }
        )
            .buttonStyle(PlainButtonStyle())
            .sheet(
                isPresented: $shouldOpenDestinationView,
                content: {
                    destinationView
                }
            )
    }

    // MARK: - Init

    public init(
        with viewModel: ArticleCardViewModel,
        shouldOpenDestinationView: Binding<Bool>,
        destinationView: Content
    ) {
        self.destinationView = destinationView
        self.viewModel = viewModel
        self._shouldOpenDestinationView = shouldOpenDestinationView
    }

}
