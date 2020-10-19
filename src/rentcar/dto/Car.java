package rentcar.dto;

public class Car {
	// 차량dto
	private String no;		// 차번호(기본키)
	private String name;	// 차량이름
	private Kind kind;		// 차량분류
	private Brand brand;		// 브랜드분류
	private String remark;	// 차량비고
	private String is_rent;	// 반납여부
	private int counting;	// 대여횟수
	private String image;	// 이미지

	// 생성자
	public Car() {
		super();
	}

	public Car(String no) {
		super();
		no = no;
	}

	public Car(String no, String name, Kind kind, Brand brand, String remark, String is_rent, int counting,
			String image) {
		super();
		this.no = no;
		this.name = name;
		this.kind = kind;
		this.brand = brand;
		this.remark = remark;
		this.is_rent = is_rent;
		this.counting = counting;
		this.image = image;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Kind getKind() {
		return kind;
	}

	public void setKind(Kind kind) {
		this.kind = kind;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getIs_rent() {
		return is_rent;
	}

	public void setIs_rent(String is_rent) {
		this.is_rent = is_rent;
	}

	public int getCounting() {
		return counting;
	}

	public void setCounting(int counting) {
		this.counting = counting;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return String.format("Car [no=%s, name=%s, Kind=%s, Brand=%s, remark=%s, is_rent=%s, counting=%s, image=%s]",
				no, name, kind, brand, remark, is_rent, counting, image);
	}


}
