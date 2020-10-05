package rentcar.dto;

public class Car {
	// 차량dto
	private String carNo; // 차번호(기본키)
	private String carName; // 차량이름
	private String kind; // 차량종류
	private int price; // 금액
	private String remark; // 차량비고

	// 생성자
	public Car() {
		super();
	}

	public Car(String carNo) {
		super();
		this.carNo = carNo;
	}

	public Car(String carNo, String carName, String kind, int price, String remark) {
		super();
		this.carNo = carNo;
		this.carName = carName;
		this.kind = kind;
		this.price = price;
		this.remark = remark;
	}

	// getter & setter & toString
	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return String.format("Car [carNo=%s, carName=%s, kind=%s, price=%s, remark=%s]", carNo, carName, kind, price,
				remark);
	}

}
