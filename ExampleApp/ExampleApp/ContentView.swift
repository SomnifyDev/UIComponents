import SwiftUI
import UIComponents

/*
 Файл с говнокодом. Но он, собственно, пока нужен только чтобы отображать компоненты
 Мб в будущем будет смысл как-то порефакторить и тут, но пока не вижу его
 */

struct ContentView: View {
    var body: some View {
        ZStack {
            ColorsRepository.General.appBackground
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    Group {
                        HStack {
                            Text("Chart").font(.title.bold())
                            Spacer()
                        }
                        .padding(.top)

                        StandardCardWithContentView(
                            cardHeader: .init(leadIcon: nil, title: "Title", titleColor: .black, shouldShowSeparator: true)
                        ) {
                            StandardChartView(
                                model: .init(
                                    chartType: .defaultChart(barType: .rectangular(color: .red)),
                                    points: [
                                        ChartPointModel(date: .now, value: 1),
                                        ChartPointModel(date: .now, value: 4),
                                        ChartPointModel(date: .now, value: 5),
                                        ChartPointModel(date: .now, value: 4),
                                        ChartPointModel(date: .now, value: 5),
                                        ChartPointModel(date: .now, value: 6),
                                        ChartPointModel(date: .now, value: 2),
                                        ChartPointModel(date: .now, value: 3),
                                        ChartPointModel(date: .now, value: 4),
                                        ChartPointModel(date: .now, value: 5),
                                        ChartPointModel(date: .now, value: 6),
                                        ChartPointModel(date: .now, value: 7),
                                        ChartPointModel(date: .now, value: 8),
                                        ChartPointModel(date: .now, value: 6),
                                        ChartPointModel(date: .now, value: 7),
                                        ChartPointModel(date: .now, value: 8),
                                        ChartPointModel(date: .now, value: 9),
                                        ChartPointModel(date: .now, value: 5),
                                        ChartPointModel(date: .now, value: 6),
                                        ChartPointModel(date: .now, value: 7),
                                        ChartPointModel(date: .now, value: 8),
                                        ChartPointModel(date: .now, value: 6),
                                        ChartPointModel(date: .now, value: 7),
                                        ChartPointModel(date: .now, value: 8),
                                        ChartPointModel(date: .now, value: 9),
                                        ChartPointModel(date: .now, value: 10),
                                        ChartPointModel(date: .now, value: 11)
                                    ],
                                    chartHeight: 70,
                                    timeLineType: .none,
                                    dragGestureEnabled: false
                                )
                            )
                            .padding(.vertical)
                        }

                        // MARK: - Banner

                        HStack {
                            Text("Banner").font(.title.bold())
                            Spacer()
                        }

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

                        // MARK: - Cards

                        HStack {
                            Text("Card").font(.title.bold())
                            Spacer()
                        }
                        .padding(.top)

                        StatisticalIndicatorCardView(
                            indicatorCard: StatisticalIndicatorCardModel(
                                titleLeadIcon: .init(systemName: "heart.fill"),
                                title: "Heart: Indicator",
                                indicator: IndicatorModel(
                                    name: "RSSDN",
                                    currentValue: 1.21,
                                    unit: "ms"
                                ),
                                feedback: "You should rest more during the day according to your RSSDN value.",
                                isPositive: false
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

                        // MARK: - Article

                        HStack {
                            Text("Article").font(.title.bold())
                            Spacer()
                        }
                        .padding(.top)

//                        ArticleCardView(
//                            card: ArticleCardModel(
//                                title: "Title",
//                                subtitle: "Subtitle",
//                                coverImage: Image("moscow")
//                            )
//                        ) {
//                            print("Article tapped!")
//                        }
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}
