import SwiftUI
import UIComponents

struct ContentView: View {
    var body: some View {
        ZStack {
            ColorsRepository.General.appBackground
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {

                    // MARK: - Banner

                    HStack {
                        Text("Banner").font(.title.bold())
                        Spacer()
                    }
                    .padding(.top)

                    BannerView(
                        banner: BannerModel(
                            cardHeader: StandardCardHeaderModel(
                                leadIcon: IconsRepository.heartFilled,
                                title: "This is banner's title!",
                                titleColor: ColorsRepository.Text.standard,
                                shouldShowSeparator: true
                            ),
                            bannerIdentifier: "banner_1"
                        )
                    ) {
                        Text("This is my awesome banner's content!")
                    }

                    // MARK: - Information cell

                    HStack {
                        Text("Information cell").font(.title.bold())
                        Spacer()
                    }
                    .padding(.top)

                    InfoCell(info: InfoCellModel(title: "Single cell", value: "value"))

                    InfoCellCollectionView(
                        collection: InfoCellCollectionModel(
                            cells: [
                                InfoCellModel(title: "Collection cell 1", value: "value"),
                                InfoCellModel(title: "Collection cell 2", value: "value"),
                                InfoCellModel(title: "Collection cell 3", value: "value"),
                                InfoCellModel(title: "Collection cell 4", value: "value")
                            ]
                        )
                    )

                    // MARK: - Cards

                    HStack {
                        Text("Card").font(.title.bold())
                        Spacer()
                    }
                    .padding(.top)

                    StatisticalIndicatorCardView(
                        indicatorCard: .init(
                            indicator: IndicatorModel(
                                name: "IndicatorName",
                                currentValue: 0.0,
                                expectedValueRange: 0...1,
                                unit: "unit"
                            ),
                            description: "Description",
                            feedback: "Feedback"
                        ),
                        onQuestionMarkTapAction: {
                            print("Question mark tapped!")
                        }
                    )

                    StandardCardWithContentView(
                        cardHeader: StandardCardHeaderModel(
                            leadIcon: IconsRepository.heartFilled,
                            title: "This is card's title!",
                            titleColor: ColorsRepository.Text.standard,
                            shouldShowSeparator: true
                        )
                    ) {
                        Text("This is my awesome card's content!")
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}
