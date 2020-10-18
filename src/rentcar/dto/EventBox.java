package rentcar.dto;

public class EventBox {
	private int eventBox;
	private Event eventCode;
	private Member id;
	private String isEvent;

	public int getEventBox() {
		return eventBox;
	}

	public void setEventBox(int eventBox) {
		this.eventBox = eventBox;
	}

	public Event getEventCode() {
		return eventCode;
	}

	public void setEventCode(Event eventCode) {
		this.eventCode = eventCode;
	}

	public Member getId() {
		return id;
	}

	public void setId(Member id) {
		this.id = id;
	}

	public String getIsEvent() {
		return isEvent;
	}

	public void setIsEvent(String isEvent) {
		this.isEvent = isEvent;
	}

	@Override
	public String toString() {
		return String.format("EventBox [eventBox=%s, eventCode=%s, id=%s, isEvent=%s]", eventBox, eventCode, id, isEvent);
	}
}
