package rentcar.dto;

public class Event {
	private String eventCode;
	private String name;
	private int sale;
	private String thumImage;
	private String viewImage;
	private String isEvent;

	public Event() {
	}

	public Event(String eventCode) {
		this.eventCode = eventCode;
	}

	public Event(String eventCode, String name, int sale, String thumImage, String viewImage, String isEvent) {
		this.eventCode = eventCode;
		this.name = name;
		this.sale = sale;
		this.thumImage = thumImage;
		this.viewImage = viewImage;
		this.isEvent = isEvent;
	}
	
	public Event(String name, int sale) {
		this.name = name;
		this.sale = sale;
	}

	public String getEventCode() {
		return eventCode;
	}

	public void setEventCode(String eventCode) {
		this.eventCode = eventCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public String getThumImage() {
		return thumImage;
	}

	public void setThumImage(String thumImage) {
		this.thumImage = thumImage;
	}

	public String getViewImage() {
		return viewImage;
	}

	public void setViewImage(String viewImage) {
		this.viewImage = viewImage;
	}

	public String getIsEvent() {
		return isEvent;
	}

	public void setIsEvent(String isEvent) {
		this.isEvent = isEvent;
	}

	@Override
	public String toString() {
		return String.format("Event [eventCode=%s, name=%s, sale=%s, thumImage=%s, viewImage=%s, isEvent=%s]",
				eventCode, name, sale, thumImage, viewImage, isEvent);
	}
}
