package rentcar.dto;

import java.util.Date;

public class Rent {
	private int rentNo;			//대여번호
	private String id;			//아이디
	private String carNo;			//차량번호
	private int insCode;		//보험코드
	private Date rent_date;		//대여일자
	private Date return_date;	//반납일자
	private String is_rent;		//반납여부
	private long fare;
	private String remark;
	public Rent() {
		super();
	}
	public Rent(int rentNo) {
		super();
		this.rentNo = rentNo;
	}
	public Rent(int rentNo, String id, String carNo, int insCode, Date rent_date, Date return_date, String is_rent,
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCarNo() {
		return carNo;
	}
	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
	public int getInsCode() {
		return insCode;
	}
	public void setInsCode(int insCode) {
		this.insCode = insCode;
	}
	public Date getRent_date() {
		return rent_date;
	}
	public void setRent_date(Date rent_date) {
		this.rent_date = rent_date;
	}
	public Date getReturn_date() {
		return return_date;
	}
	public void setReturn_date(Date return_date) {
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
