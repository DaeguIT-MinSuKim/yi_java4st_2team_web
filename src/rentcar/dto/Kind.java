package rentcar.dto;

public class Kind {
	private int code;
	private String name;
	private int fare;

	public Kind() {
		super();
	}

	public Kind(int code) {
		super();
		this.code = code;
	}

	public Kind(int code, String name, int fare) {
		super();
		this.code = code;
		this.name = name;
		this.fare = fare;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getFare() {
		return fare;
	}

	public void setFare(int fare) {
		this.fare = fare;
	}

	@Override
	public String toString() {
		return String.format("Kind [code=%s, name=%s, fare=%s]", code, name, fare);
	}
}
