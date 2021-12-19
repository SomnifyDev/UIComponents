import SwiftUI

public struct ArticleCardDetailView: View {

    // MARK: - Properties
    
    @Binding var showSleepImportanceView: Bool
    private let viewModel: ArticleCardDetailViewModel

    public var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    viewModel.coverImage
                        .resizable()
                        .frame(height: 250)
                    Text(viewModel.mainTitle)
                        .font(.title)
                        .bold()
                    ForEach(viewModel.articleParagraphs, id: \.self) { paragraph in
                        Text(paragraph)
                            .padding(.top)
                    }
                    Spacer()
                }
                .padding([.top, .trailing, .leading])
            }
            .navigationTitle(viewModel.articleName)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing:
                    Button(
                        action: {
                            self.showSleepImportanceView = false
                        }, label: {
                            Text("Done")
                                .fontWeight(.regular)
                        }
                    )
            )
        }
    }

    // MARK: - Init

    public init(
        with viewModel: ArticleCardDetailViewModel,
        showSleepImportanceView: Binding<Bool>
    ) {
        self.viewModel = viewModel
        self._showSleepImportanceView = showSleepImportanceView
    }


}
