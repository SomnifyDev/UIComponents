import Foundation
import SwiftUI

public struct InfoCell: View {

    // MARK: - Private properties

    private let info: InfoCellModel

    // MARK: - Public properties

    public var body: some View {
        HStack {
            Text(info.title)
            Spacer()
            Text(info.value)
        }
        .roundedCardBackground(color: ColorsRepository.Card.cardBackground)
    }

    // MARK: - Init

    public init(info: InfoCellModel) {
        self.info = info
    }
    
}
