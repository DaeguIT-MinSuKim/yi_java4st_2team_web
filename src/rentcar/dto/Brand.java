package rentcar.dto;

public class Brand {
	private int code;
	private String name;
	private String image;

	public Brand() {
		super();
	}

	public Brand(int code) {
		super();
		this.code = code;
	}

	public Brand(int code, String name, String image) {
		super();
		this.code = code;
		this.name = name;
		this.image = image;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return String.format("Brand [code=%s, name=%s, image=%s]", code, name, image);
	}

}
