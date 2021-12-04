// Copyright (c) 2021 Sleepy.

import SwiftUI

struct TimeLineView: View {
	private 
	private let startTime: Date
	private let endTime: Date

	init(, startTime: Date, endTime: Date) {
		
		self.startTime = startTime
		self.endTime = endTime
	}

	var body: some View {
		HStack {
			Text(startTime.getFormattedDate(format: "HH:mm"))
				.regularTextModifier(color: colorProvider.sleepyColorScheme.getColor(of: .textsColors(.standartText)), size: 10, opacity: 0.4)

			Spacer()

			Text(endTime.getFormattedDate(format: "HH:mm"))
				.regularTextModifier(color: colorProvider.sleepyColorScheme.getColor(of: .textsColors(.standartText)), size: 10, opacity: 0.4)
		}
	}
}
