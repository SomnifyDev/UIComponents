import SwiftUI

public enum ColorsRepository {

	public enum General {
        static let appBackground = Color("backgroundColor")
		static let mainSleepy = Color("mainColor")
		static let health = Color("healthColor")
	}

	public enum Card {
		static let cardBackground = Color("cardsBackground")
	}

	public enum Calendar {
		static let emptyDay = Color("calendarEmptyColor")
		static let negativeDay = Color("calendarNegativityColor")
		static let neutralDay = Color("calendarNeutralColor")
		static let positiveDay = Color("calendarPositivityColor")
		static let calendarCurrentDate = Color("calendarCurrentDateColor")
	}

	public enum Phase {
		static let wakeUp = Color("wakingColor")
		static let lightSleep = Color("lightSleepColor")
		static let deepSleep = Color("deepSleepColor")
	}

	public enum Heart {
		static let heart = Color("heartColor")
	}

	public enum Energy {
		static let energy = Color("energyColor")
	}

	public enum SummaryCard {
		static let awake = Color("awakeColor")
		static let moon = Color("moonColor")
		static let sleepDuration = Color("sleepDurationColor")
		static let fallAsleepDuration = Color("fallAsleepDurationColor")
	}

	public enum Text {
		static let standard = Color("SleepyStandartTexts")
		static let secondary = Color("SecondaryText")
		static let advice = Color("AdviceText")
	}

	public enum Chart {
		static let verticalProgressChartElement = Color("VerticalProgressChartElementBackground")
	}
    
}
