import SwiftUI

public enum ColorsRepository {

	public enum General {
        public static let appBackground = Color("backgroundColor", bundle: .module)
		public static let mainSleepy = Color("mainColor", bundle: .module)
		public static let health = Color("healthColor", bundle: .module)
	}

	public enum Card {
		public static let cardBackground = Color("cardsBackground", bundle: .module)
	}

	public enum Calendar {
        public static let emptyDay = Color("calendarEmptyColor", bundle: .module)
		public static let negativeDay = Color("calendarNegativityColor", bundle: .module)
		public static let neutralDay = Color("calendarNeutralColor", bundle: .module)
		public static let positiveDay = Color("calendarPositivityColor", bundle: .module)
		public static let calendarCurrentDate = Color("calendarCurrentDateColor", bundle: .module)
	}

	public enum Phase {
		public static let wakeUp = Color("wakingColor", bundle: .module)
		public static let lightSleep = Color("lightSleepColor", bundle: .module)
		public static let deepSleep = Color("deepSleepColor", bundle: .module)
	}

	public enum Heart {
		public static let heart = Color("heartColor", bundle: .module)
	}

	public enum Energy {
		public static let energy = Color("energyColor", bundle: .module)
	}

	public enum SummaryCard {
		public static let awake = Color("awakeColor", bundle: .module)
		public static let moon = Color("moonColor", bundle: .module)
		public static let sleepDuration = Color("sleepDurationColor", bundle: .module)
		public static let fallAsleepDuration = Color("fallAsleepDurationColor", bundle: .module)
	}

	public enum Text {
		public static let standard = Color("SleepyStandartTexts", bundle: .module)
		public static let secondary = Color("SecondaryText", bundle: .module)
		public static let advice = Color("AdviceText", bundle: .module)
	}

	public enum Chart {
		public static let verticalProgressChartElement = Color("VerticalProgressChartElementBackground", bundle: .module)
	}
    
}
