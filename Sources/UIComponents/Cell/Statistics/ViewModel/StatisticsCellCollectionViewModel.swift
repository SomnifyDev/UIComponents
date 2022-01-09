import Foundation

public struct StatisticsCellCollectionViewModel {

    // MARK: - Properties

    public let cellModels: [StatisticsCellViewModel]

    // MARK: - Init

    public init(with cellModels: [StatisticsCellViewModel]) {
        self.cellModels = cellModels
    }

}
