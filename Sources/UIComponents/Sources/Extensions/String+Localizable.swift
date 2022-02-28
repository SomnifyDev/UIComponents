// Copyright (c) 2021 Sleepy.

import Foundation

extension String {

	public var localized: String {
		return NSLocalizedString(self, comment: "\(self)_comment")
	}

}
