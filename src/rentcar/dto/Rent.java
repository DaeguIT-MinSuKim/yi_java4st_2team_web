package rentcar.dto;

import java.time.LocalDateTime;

public class Rent {
	private int rentNo; // 대여번호
	private Member id; // 아이디
	private Car carNo; // 차량번호
	private Ins insCode; // 보험코드
	private LocalDateTime rent_date; // 대여일자
	private LocalDateTime return_date; // 반납일자
	private String is_rent; // 반납여부
	private long fare;
	private String remark;

	public Rent() {
		super();
	}

	public Rent(int rentNo) {
		super();
		this.rentNo = rentNo;
	}

	public Rent(Member id, Car carNo, Ins insCode, LocalDateTime rent_date, LocalDateTime return_date, String is_rent, long fare,
			String remark) {
		super();
		this.id = id;
		this.carNo = carNo;
		this.insCode = insCode;
		this.rent_date = rent_date;
		this.return_date = return_date;
		this.is_rent = is_rent;
		this.fare = fare;
		this.remark = remark;
	}

	public Rent(int rentNo, Member id, Car carNo, Ins insCode, LocalDateTime rent_date, LocalDateTime return_date, String is_rent,
			long fare, String remark) {
		super();
		this.rentNo = rentNo;
		this.id = id;
		this.carNo = carNo;
		this.insCode = insCode;
		this.rent_date = rent_date;
		this.return_date = return_date;
		this.is_rent = is_rent;
		this.fare = fare;
		this.remark = remark;
	}

	public int getRentNo() {
		return rentNo;
	}

	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
	}

	public Member getId() {
		return id;
	}

	public void setId(Member id) {
		this.id = id;
	}

	public Car getCarNo() {
		return carNo;
	}

	public void setCarNo(Car carNo) {
		this.carNo = carNo;
	}

	public Ins getInsCode() {
		return insCode;
	}

	public void setInsCode(Ins insCode) {
		this.insCode = insCode;
	}

	public LocalDateTime getRent_date() {
		return rent_date;
	}

	public void setRent_date(LocalDateTime rent_date) {
		this.rent_date = rent_date;
	}

	public LocalDateTime getReturn_date() {
		return return_date;
	}

	public void setReturn_date(LocalDateTime return_date) {
		this.return_date = return_date;
	}

	public String getIs_rent() {
		return is_rent;
	}

	public void setIs_rent(String is_rent) {
		this.is_rent = is_rent;
	}

	public long getFare() {
		return fare;
	}

	public void setFare(long fare) {
		this.fare = fare;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return String.format(
				"Rent [rentNo=%s, id=%s, carNo=%s, insCode=%s, rent_date=%s, return_date=%s, is_rent=%s, fare=%s, remark=%s]",
				rentNo, id, carNo, insCode, rent_date, return_date, is_rent, fare, remark);
	}
}
