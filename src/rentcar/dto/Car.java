package rentcar.dto;

public class Car {
	// 차량dto
	private String No;		// 차번호(기본키)
	private String Name;	// 차량이름
	private int kind;		// 차량분류
	private int brand;	// 브랜드분류
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
		No = no;
	}

	public Car(String no, String name, int kind, int brand, String remark, String is_rent, int counting,
			String image) {
		super();
		No = no;
		Name = name;
		this.kind = kind;
		this.brand = brand;
		this.remark = remark;
		this.is_rent = is_rent;
		this.counting = counting;
		this.image = image;
	}

	public String getNo() {
		return No;
	}

	public void setNo(String no) {
		No = no;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public int getBrand() {
		return brand;
	}

	public void setBrand(int brand) {
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
		return String.format("Car [No=%s, Name=%s, Kind=%s, Brand=%s, remark=%s, is_rent=%s, counting=%s, image=%s]",
				No, Name, kind, brand, remark, is_rent, counting, image);
	}


}
