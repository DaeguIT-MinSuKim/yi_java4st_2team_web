/* 차량 */
DROP TABLE CAR 
	CASCADE CONSTRAINTS;

/* 회원 */
DROP TABLE MEMBER 
	CASCADE CONSTRAINTS;

/* 관리자 */
DROP TABLE ADMIN 
	CASCADE CONSTRAINTS;

/* 대여 */
DROP TABLE RENT 
	CASCADE CONSTRAINTS;

/* 보험 */
DROP TABLE INSURANCE 
	CASCADE CONSTRAINTS;

/* 이벤트 */
DROP TABLE EVENT 
	CASCADE CONSTRAINTS;

/* 장기렌트 */
DROP TABLE LONGRENT 
	CASCADE CONSTRAINTS;

/* 비회원 */
DROP TABLE NONMEMBER 
	CASCADE CONSTRAINTS;

/* 차량 */
CREATE TABLE CAR (
	car_no VARCHAR2(20) NOT NULL, /* 차량번호 */
	name VARCHAR2(50) NOT NULL, /* 이름 */
	kind VARCHAR2(50), /* 분류 */
	price INTEGER NOT NULL, /* 금액 */
	remark VARCHAR2(500) /* 비고 */
);

CREATE UNIQUE INDEX PK_CAR
	ON CAR (
		car_no ASC
	);

ALTER TABLE CAR
	ADD
		CONSTRAINT PK_CAR
		PRIMARY KEY (
			car_no
		);

/* 회원 */
CREATE TABLE MEMBER (
	id VARCHAR2(50) NOT NULL, /* 아이디 */
	pwd VARCHAR2(20), /* 비밀번호 */
	name VARCHAR2(50), /* 이름 */
	tel VARCHAR2(20), /* 연락처 */
	license VARCHAR2(20), /* 면허번호 */
	mileage INTEGER, /* 마일리지 */
	is_black CHAR(1), /* 블랙리스트 */
	address VARCHAR2(500), /* 주소 */
	remark VARCHAR2(500) /* 비고 */
);

CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER (
		id ASC
	);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			id
		);

/* 관리자 */
CREATE TABLE ADMIN (
	id VARCHAR2(50) NOT NULL, /* 아이디 */
	pwd VARCHAR2(20) /* 비밀번호 */
);

CREATE UNIQUE INDEX PK_ADMIN
	ON ADMIN (
		id ASC
	);

ALTER TABLE ADMIN
	ADD
		CONSTRAINT PK_ADMIN
		PRIMARY KEY (
			id
		);

/* 대여 */
CREATE TABLE RENT (
	rent_no VARCHAR2(20) NOT NULL, /* 대여번호 */
	id VARCHAR2(50), /* 아이디 */
	non_tel VARCHAR2(20), /* 비회원연락처 */
	car_no VARCHAR2(20), /* 차량번호 */
	ins_name VARCHAR2(50), /* 보험명 */
	rent_date DATE, /* 대여일 */
	return_date DATE, /* 반납일 */
	is_rent CHAR(1), /* 반납여부 */
	price INTEGER, /* 금액 */
	remark VARCHAR2(500) /* 비고 */
);

CREATE UNIQUE INDEX PK_RENT
	ON RENT (
		rent_no ASC
	);

ALTER TABLE RENT
	ADD
		CONSTRAINT PK_RENT
		PRIMARY KEY (
			rent_no
		);

/* 보험 */
CREATE TABLE INSURANCE (
	ins_name VARCHAR2(50) NOT NULL, /* 보험명 */
	ins_fare INTEGER /* 보험금액 */
);

CREATE UNIQUE INDEX PK_INSURANCE
	ON INSURANCE (
		ins_name ASC
	);

ALTER TABLE INSURANCE
	ADD
		CONSTRAINT PK_INSURANCE
		PRIMARY KEY (
			ins_name
		);

/* 이벤트 */
CREATE TABLE EVENT (
	sale INTEGER, /* 할인 */
	coupon VARCHAR2(500) /* 쿠폰 */
);

/* 장기렌트 */
CREATE TABLE LONGRENT (
	no VARCHAR2(20) NOT NULL, /* 번호 */
	title VARCHAR2(50), /* 제목 */
	contents VARCHAR2(500), /* 내용 */
	exterior VARCHAR2(500), /* 외관/내장 */
	safety VARCHAR2(500), /* 안전 */
	multi VARCHAR2(500), /* 편의/멀티미디어 */
	sheet VARCHAR2(500), /* 시트 */
	fare INTEGER, /* 금액 */
	id VARCHAR2(50), /* 아이디 */
	non_tel VARCHAR2(20), /* 비회원연락처 */
	rep_yn char(1) DEFAULT '1', /*답변여부*/ 
	write_date DATE DEFAULT sysdate /*작성일 */
);

CREATE UNIQUE INDEX PK_LONGRENT
	ON LONGRENT (
		no ASC
	);

ALTER TABLE LONGRENT
	ADD
		CONSTRAINT PK_LONGRENT
		PRIMARY KEY (
			no
		);

/* 비회원 */
CREATE TABLE NONMEMBER (
	non_tel VARCHAR2(20) NOT NULL, /* 비회원연락처 */
	name VARCHAR2(50), /* 이름 */
	license VARCHAR2(20), /* 면허번호 */
	address VARCHAR2(500), /* 주소 */
	remark VARCHAR2(500) /* 비고 */
);

CREATE UNIQUE INDEX PK_NONMEMBER
	ON NONMEMBER (
		non_tel ASC
	);

ALTER TABLE NONMEMBER
	ADD
		CONSTRAINT PK_NONMEMBER
		PRIMARY KEY (
			non_tel
		);

ALTER TABLE RENT
	ADD
		CONSTRAINT FK_MEMBER_TO_RENT
		FOREIGN KEY (
			id
		)
		REFERENCES MEMBER (
			id
		);

ALTER TABLE RENT
	ADD
		CONSTRAINT FK_CAR_TO_RENT
		FOREIGN KEY (
			car_no
		)
		REFERENCES CAR (
			car_no
		);

ALTER TABLE RENT
	ADD
		CONSTRAINT FK_INSURANCE_TO_RENT
		FOREIGN KEY (
			ins_name
		)
		REFERENCES INSURANCE (
			ins_name
		);

ALTER TABLE RENT
	ADD
		CONSTRAINT FK_NONMEMBER_TO_RENT
		FOREIGN KEY (
			non_tel
		)
		REFERENCES NONMEMBER (
			non_tel
		);

ALTER TABLE LONGRENT
	ADD
		CONSTRAINT FK_MEMBER_TO_LONGRENT
		FOREIGN KEY (
			id
		)
		REFERENCES MEMBER (
			id
		);

ALTER TABLE LONGRENT
	ADD
		CONSTRAINT FK_NONMEMBER_TO_LONGRENT
		FOREIGN KEY (
			non_tel
		)
		REFERENCES NONMEMBER (
			non_tel
		);