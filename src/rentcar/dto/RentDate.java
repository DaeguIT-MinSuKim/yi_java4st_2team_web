package rentcar.dto;

public class RentDate {
	String minYear;
	String minMonth;
	String minDay;
	String minHour;
	
	String maxYear;
	String maxMonth;
	String maxDay;
	String maxHour;
	
	String carNo;
	
	public RentDate() {
		// TODO Auto-generated constructor stub
	}
	
	public RentDate(String minYear, String minMonth, String minDay, String minHour) {
		this.minYear = minYear;
		this.minMonth = minMonth;
		this.minDay = minDay;
		this.minHour = minHour;
	}

	public RentDate(String minYear, String minMonth, String minDay, String minHour, String maxYear, String maxMonth,
			String maxDay, String maxHour) {
		this.minYear = minYear;
		this.minMonth = minMonth;
		this.minDay = minDay;
		this.minHour = minHour;
		this.maxYear = maxYear;
		this.maxMonth = maxMonth;
		this.maxDay = maxDay;
		this.maxHour = maxHour;
	}

	public String getMinYear() {
		return minYear;
	}

	public void setMinYear(String minYear) {
		this.minYear = minYear;
	}

	public String getMinMonth() {
		return minMonth;
	}

	public void setMinMonth(String minMonth) {
		this.minMonth = minMonth;
	}

	public String getMinDay() {
		return minDay;
	}



	public void setMinDay(String minDay) {
		this.minDay = minDay;
	}



	public String getMinHour() {
		return minHour;
	}



	public void setMinHour(String minHour) {
		this.minHour = minHour;
	}



	public String getMaxYear() {
		return maxYear;
	}



	public void setMaxYear(String maxYear) {
		this.maxYear = maxYear;
	}



	public String getMaxMonth() {
		return maxMonth;
	}



	public void setMaxMonth(String maxMonth) {
		this.maxMonth = maxMonth;
	}



	public String getMaxDay() {
		return maxDay;
	}



	public void setMaxDay(String maxDay) {
		this.maxDay = maxDay;
	}



	public String getMaxHour() {
		return maxHour;
	}



	public void setMaxHour(String maxHour) {
		this.maxHour = maxHour;
	}

	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}

	@Override
	public String toString() {
		return String.format(
				"RentDate [minYear=%s, minMonth=%s, minDay=%s, minHour=%s, maxYear=%s, maxMonth=%s, maxDay=%s, maxHour=%s]",
				minYear, minMonth, minDay, minHour, maxYear, maxMonth, maxDay, maxHour);
	}
	
	
	
}
