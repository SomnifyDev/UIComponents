// Copyright (c) 2021 Sleepy.

import Foundation

extension Date {
    public enum StringFormatType: String {
        case days = "dd.MM"
        case time = "HH:mm"
    }
    
	/// Returns the amount of minutes from another date
	func minutes(from date: Date) -> Int {
		return abs(Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0)
	}

	/// Returns date in some special string format
	func getFormattedDate(format: StringFormatType) -> String {
		let dateformat = DateFormatter()
        dateformat.dateFormat = format.rawValue
		return dateformat.string(from: self)
	}

}
