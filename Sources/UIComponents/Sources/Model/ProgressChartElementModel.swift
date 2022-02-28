import Foundation

public struct ProgressChartElementModel {

    let title: String
    let payloadText: String
    let value: Int

    public init(
        title: String,
        payloadText: String,
        value: Int
    ) {
        self.title = title
        self.payloadText = payloadText
        self.value = value
    }

}
