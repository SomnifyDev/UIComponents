// Copyright (c) 2021 Sleepy.

import SwiftUI

struct TimeLineView: View {

    let startTime: Date
    let endTime: Date

	var body: some View {
		HStack {
			Text(startTime.getFormattedDate(format: "HH:mm"))
                .regularTextModifier(color: ColorsRepository.Text.standard, size: 10, opacity: 0.4)
			Spacer()
			Text(endTime.getFormattedDate(format: "HH:mm"))
                .regularTextModifier(color: ColorsRepository.Text.standard, size: 10, opacity: 0.4)
		}
	}
    
}
