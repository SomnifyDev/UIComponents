import SwiftUI
import UIComponents

struct ContentView: View {
    var body: some View {
        ZStack {
            ColorsRepository.General.appBackground
                .ignoresSafeArea()
            VStack(spacing: 16) {
                HStack {
                    Text("Banner").font(.title.bold())
                    Spacer()
                }
                .padding(.top)

                InfoCell(info: InfoCellModel(title: "ashjsa", value: "13x"))

                BannerView(
                    banner: BannerModel(
                        with: CardHeaderModel(
                            leadIcon: IconsRepository.heartFilled,
                            title: "This is banner's title!",
                            titleColor: ColorsRepository.Text.standard,
                            shouldShowSeparator: true
                        ),
                        bannerIdentifier: "banner_1"
                    )
                ) {
                    Text("This is my awesome banner!")
                }

                Spacer()
            }
            .padding()
        }
    }
}
