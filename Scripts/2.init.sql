/* 차량 */
DROP TABLE CAR 
	CASCADE CONSTRAINTS;

/* 회원 */
DROP TABLE MEMBER 
	CASCADE CONSTRAINTS;

/* 관리자 */
DROP TABLE ADMIN 
	CASCADE CONSTRAINTS;

/* 대여관리 */
DROP TABLE RENT 
	CASCADE CONSTRAINTS;

/* 보험 */
DROP TABLE INSURANCE 
	CASCADE CONSTRAINTS;

/* 장기렌트요청게시판 */
DROP TABLE LONGRENTBOARD 
	CASCADE CONSTRAINTS;

/* 옵션 */
DROP TABLE OPTION 
	CASCADE CONSTRAINTS;

/* 차량 분류 */
DROP TABLE KIND 
	CASCADE CONSTRAINTS;

/* 이벤트 */
DROP TABLE EVENT 
	CASCADE CONSTRAINTS;

/* 브랜드 분류 */
DROP TABLE BRAND 
	CASCADE CONSTRAINTS;

/* 차량 */
CREATE TABLE CAR (
	car_no VARCHAR2(20) NOT NULL, /* 차량번호 */
	kind_code VARCHAR2(20), /* 분류 */
	brand_code VARCHAR2(20), /* 브랜드코드 */
	remark VARCHAR2(500), /* 비고 */
	is_rent CHAR(1), /* 반납여부 */
	counting INTEGER, /* 대여횟수 */
	image VARCHAR2(50) /* 이미지 */
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
--CREATE TABLE MEMBER (
--	id VARCHAR2(50) NOT NULL, /* 아이디 */
--	pwd VARCHAR2(20), /* 비밀번호 */
--	name VARCHAR2(50), /* 이름 */
--	tel VARCHAR2(20), /* 연락처 */
--	license VARCHAR2(20), /* 면허번호 */
--	COL2 <지정 되지 않음>, /* 이메일 */
--	is_black CHAR(1) DEFAULT 'N', /* 블랙리스트 */
--	address VARCHAR2(500), /* 주소 */
--	remark VARCHAR2(500), /* 비고 */
--	COL <지정 되지 않음>, /* 대여횟수 */
--	COL3 <지정 되지 않음> /* 이벤트코드 */
--);
--
--CREATE UNIQUE INDEX PK_MEMBER
--	ON MEMBER (
--		id ASC
--	);
--
--ALTER TABLE MEMBER
--	ADD
--		CONSTRAINT PK_MEMBER
--		PRIMARY KEY (
--			id
--		);

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

/* 대여관리 */
--CREATE TABLE RENT (
--	rent_no VARCHAR2(20) NOT NULL, /* 대여번호 */
--	id VARCHAR2(50), /* 아이디 */
--	car_no VARCHAR2(20), /* 차량번호 */
--	rent_date DATE, /* 대여일 */
--	return_date DATE, /* 반납일 */
--	is_rent CHAR(1), /* 반납여부 */
--	price INTEGER, /* 금액 */
--	remark VARCHAR2(500), /* 비고 */
--	COL <지정 되지 않음>, /* 이벤트코드 */
--	no <지정 되지 않음>, /* 옵션코드 */
--	COL2 <지정 되지 않음> /* 보험코드 */
--);
--
--CREATE UNIQUE INDEX PK_RENT
--	ON RENT (
--		rent_no ASC
--	);
--
--ALTER TABLE RENT
--	ADD
--		CONSTRAINT PK_RENT
--		PRIMARY KEY (
--			rent_no
--		);

/* 보험 */
--CREATE TABLE INSURANCE (
--	COL <지정 되지 않음> NOT NULL, /* 보험코드 */
--	insurancename VARCHAR2(50), /* 보험명 */
--	ins_fare INTEGER /* 보험금액 */
--);
--
--CREATE UNIQUE INDEX PK_INSURANCE
--	ON INSURANCE (
--		COL ASC
--	);
--
--ALTER TABLE INSURANCE
--	ADD
--		CONSTRAINT PK_INSURANCE
--		PRIMARY KEY (
--			COL
--		);

/* 장기렌트요청게시판 */
CREATE TABLE LONGRENTBOARD (
	no VARCHAR2(20) NOT NULL, /* 번호 */
	title VARCHAR2(50), /* 제목 */
	contents VARCHAR2(500), /* 내용 */
	rep_yn CHAR(1), /* 답변여부 */
	write_date DATE, /* 날짜 */
	rent_term VARCHAR2(50), /* 대여 */
	name VARCHAR2(50), /* 이름 */
	tel VARCHAR2(20), /* 연락처 */
	pwd VARCHAR2(50), /* 비밀번호 */
	rep_content VARCHAR2(500), /* 답변내용 */
	options VARCHAR2(500) /* 옵션목록 */
);

CREATE UNIQUE INDEX PK_LONGRENTBOARD
	ON LONGRENTBOARD (
		no ASC
	);

ALTER TABLE LONGRENTBOARD
	ADD
		CONSTRAINT PK_LONGRENTBOARD
		PRIMARY KEY (
			no
		);


/* 차량 분류 */
CREATE TABLE KIND (
	kind_code VARCHAR2(20) NOT NULL, /* 분류 */
	name VARCHAR2(50), /* 이름 */
	price INTEGER /* 금액 */
);

CREATE UNIQUE INDEX PK_KIND
	ON KIND (
		kind_code ASC
	);

ALTER TABLE KIND
	ADD
		CONSTRAINT PK_KIND
		PRIMARY KEY (
			kind_code
		);

/* 이벤트 */
<<<<<<< HEAD
CREATE TABLE EVENT (
	event_code varchar2(20) NOT NULL, /* 이벤트코드 */
	name varchar2(300), /* 이름 */
	sale integer, /* 할인 */
	thum_image varchar2(50), /* 썸네일이미지 */
	view_image varchar2(50), /* 뷰이미지 */
	is_event char(1) /* 사용여부 */
);

CREATE UNIQUE INDEX PK_EVENT
	ON EVENT (
		event_code ASC
	);

ALTER TABLE EVENT
	ADD
		CONSTRAINT PK_EVENT
		PRIMARY KEY (
			event_code
		);
=======
--CREATE TABLE EVENT (
--	COL <지정 되지 않음> NOT NULL, /* 이벤트코드 */
--	name <지정 되지 않음>, /* 이름 */
--	sale <지정 되지 않음>, /* 할인 */
--	COL2 <지정 되지 않음>, /* 썸네일이미지 */
--	COL3 <지정 되지 않음>, /* 뷰이미지 */
--	COL4 <지정 되지 않음> /* 사용여부 */
--);
--
--CREATE UNIQUE INDEX PK_EVENT
--	ON EVENT (
--		COL ASC
--	);
--
--ALTER TABLE EVENT
--	ADD
--		CONSTRAINT PK_EVENT
--		PRIMARY KEY (
--			COL
--		);
>>>>>>> branch 'master' of https://github.com/DaeguIT-MinSuKim/yi_java4st_2team_web.git

/* 브랜드 분류 */
CREATE TABLE BRAND (
	brand_code VARCHAR2(20) NOT NULL, /* 브랜드코드 */
	name VARCHAR2(50), /* 이름 */
<<<<<<< HEAD
	image VARCHAR2(50) /* 브랜드이미지 */
=======
	image VARCHAR(50) /* 브랜드이미지 */
>>>>>>> branch 'master' of https://github.com/DaeguIT-MinSuKim/yi_java4st_2team_web.git
);

CREATE UNIQUE INDEX PK_BRAND
	ON BRAND (
		brand_code ASC
	);

ALTER TABLE BRAND
	ADD
		CONSTRAINT PK_BRAND
		PRIMARY KEY (
			brand_code
		);

ALTER TABLE CAR
	ADD
		CONSTRAINT FK_KIND_TO_CAR
		FOREIGN KEY (
			kind_code
		)
		REFERENCES KIND (
			kind_code
		);

ALTER TABLE CAR
	ADD
		CONSTRAINT FK_BRAND_TO_CAR
		FOREIGN KEY (
			brand_code
		)
		REFERENCES BRAND (
			brand_code
		);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT FK_EVENT_TO_MEMBER
		FOREIGN KEY (
			COL3
		)
		REFERENCES EVENT (
			COL
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
			COL2
		)
		REFERENCES INSURANCE (
			COL
		);

ALTER TABLE RENT
	ADD
		CONSTRAINT FK_EVENT_TO_RENT
		FOREIGN KEY (
			COL
		)
		REFERENCES EVENT (
			COL
		);

ALTER TABLE RENT
	ADD
		CONSTRAINT FK_OPTION_TO_RENT
		FOREIGN KEY (
			no
		)
		REFERENCES OPTION (
			no
		);