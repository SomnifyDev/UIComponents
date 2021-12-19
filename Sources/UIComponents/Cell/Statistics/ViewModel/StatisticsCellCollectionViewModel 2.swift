import Foundation

public struct StatisticsCellCollectionViewModel {

    // MARK: - Properties

    let cellModels: [StatisticsCellViewModel]

    // MARK: - Init

    public init(with cellModels: [StatisticsCellViewModel]) {
        self.cellModels = cellModels
    }

}
