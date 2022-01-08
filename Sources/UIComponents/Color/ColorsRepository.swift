import SwiftUI

public enum ColorsRepository {

	public enum General {
        public static let appBackground = Color("backgroundColor")
		public static let mainSleepy = Color("mainColor")
		public static let health = Color("healthColor")
	}

	public enum Card {
		public static let cardBackground = Color("cardsBackground")
	}

	public enum Calendar {
		public static let emptyDay = Color("calendarEmptyColor")
		public static let negativeDay = Color("calendarNegativityColor")
		public static let neutralDay = Color("calendarNeutralColor")
		public static let positiveDay = Color("calendarPositivityColor")
		public static let calendarCurrentDate = Color("calendarCurrentDateColor")
	}

	public enum Phase {
		public static let wakeUp = Color("wakingColor")
		public static let lightSleep = Color("lightSleepColor")
		public static let deepSleep = Color("deepSleepColor")
	}

	public enum Heart {
		public static let heart = Color("heartColor")
	}

	public enum Energy {
		public static let energy = Color("energyColor")
	}

	public enum SummaryCard {
		public static let awake = Color("awakeColor")
		public static let moon = Color("moonColor")
		public static let sleepDuration = Color("sleepDurationColor")
		public static let fallAsleepDuration = Color("fallAsleepDurationColor")
	}

	public enum Text {
		public static let standard = Color("SleepyStandartTexts")
		public static let secondary = Color("SecondaryText")
		public static let advice = Color("AdviceText")
	}

	public enum Chart {
		public static let verticalProgressChartElement = Color("VerticalProgressChartElementBackground")
	}
    
}
