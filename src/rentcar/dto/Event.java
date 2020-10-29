package rentcar.dto;

import java.time.LocalDateTime;
import java.util.Date;

public class Event {
	private String eventCode;
	private String name;
	private int sale;
	private String thumImage;
	private String viewImage;
	private Date startDate;
	private Date endDate;
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getIsEvent() {
		return isEvent;
	}

	public void setIsEvent(String isEvent) {
		this.isEvent = isEvent;
	}

	@Override
	public String toString() {
		return String.format(
				"Event [eventCode=%s, name=%s, sale=%s, thumImage=%s, viewImage=%s, startDate=%s, endDate=%s, isEvent=%s]",
				eventCode, name, sale, thumImage, viewImage, startDate, endDate, isEvent);
	}
}
