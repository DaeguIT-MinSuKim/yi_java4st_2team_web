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
DROP TABLE LONGRENT 
	CASCADE CONSTRAINTS;

/* 옵션 */
DROP TABLE OPTIONS 
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

/* 이벤트보관함 */
DROP TABLE EVENT_BOX 
	CASCADE CONSTRAINTS;

/* 옵션 보관함 */
DROP TABLE OPT_BOX 
	CASCADE CONSTRAINTS;

/* 공지사항 */
DROP TABLE notice
	CASCADE CONSTRAINTS;

/* 차량 */
CREATE TABLE CAR (
	car_no VARCHAR2(20) NOT NULL, /* 차량번호 */
	car_name VARCHAR2(50), /* 차량명 */
	kind_code INTEGER, /* 분류코드 */
	brand_code INTEGER, /* 브랜드코드 */
	remark VARCHAR2(500), /* 차량비고 */
	is_rentcar CHAR(1), /* 차량반납여부 */
	car_count INTEGER, /* 차량대여횟수 */
	car_image VARCHAR(50) /* 차량이미지 */
);

COMMENT ON TABLE CAR IS '차량';

COMMENT ON COLUMN CAR.car_no IS '차량번호';

COMMENT ON COLUMN CAR.car_name IS '차량명';

COMMENT ON COLUMN CAR.kind_code IS '분류코드';

COMMENT ON COLUMN CAR.brand_code IS '브랜드코드';

COMMENT ON COLUMN CAR.remark IS '차량비고';

COMMENT ON COLUMN CAR.is_rentcar IS '차량반납여부';

COMMENT ON COLUMN CAR.car_count IS '차량대여횟수';

COMMENT ON COLUMN CAR.car_image IS '차량이미지';

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
	gender CHAR(1), /* 성별 */
	birth DATE, /* 생년월일 */
	name VARCHAR2(50), /* 이름 */
	tel VARCHAR2(20), /* 연락처 */
	li_class VARCHAR2(20), /* 면허종류 */
	li_number VARCHAR2(20), /* 면허번호 */
	email VARCHAR2(50), /* 이메일 */
	address VARCHAR2(500), /* 주소 */
	is_black CHAR(1) DEFAULT 'N', /* 블랙리스트 */
	counting INTEGER, /* 회원대여횟수 */
	reason VARCHAR2(500), /* 이유 */
	content VARCHAR2(500), /* 내용 */
	login_date DATE, /* 시각 */
	try_counting INTEGER DEFAULT 0, /* 시도횟수 */
	is_lock CHAR(1) DEFAULT 'N', /* 제한여부 */
	lock_counting INTEGER DEFAULT 0 /* 제한횟수 */
);

COMMENT ON TABLE MEMBER IS '회원';

COMMENT ON COLUMN MEMBER.id IS '아이디';

COMMENT ON COLUMN MEMBER.pwd IS '비밀번호';

COMMENT ON COLUMN MEMBER.name IS '이름';

COMMENT ON COLUMN MEMBER.tel IS '연락처';

COMMENT ON COLUMN MEMBER.li_number IS '면허번호';

COMMENT ON COLUMN MEMBER.email IS '이메일';

COMMENT ON COLUMN MEMBER.address IS '주소';

COMMENT ON COLUMN MEMBER.is_black IS '블랙리스트';

COMMENT ON COLUMN MEMBER.counting IS '회원대여횟수';

COMMENT ON COLUMN MEMBER.birth IS '생년월일';

COMMENT ON COLUMN MEMBER.login_date IS '시각';

COMMENT ON COLUMN MEMBER.try_counting IS '시도횟수';

COMMENT ON COLUMN MEMBER.is_lock IS '제한여부';

COMMENT ON COLUMN MEMBER.lock_counting IS '제한횟수';

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

COMMENT ON TABLE ADMIN IS '관리자';

COMMENT ON COLUMN ADMIN.id IS '아이디';

COMMENT ON COLUMN ADMIN.pwd IS '비밀번호';

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
CREATE TABLE RENT (
	rent_no NUMBER NOT NULL, /* 대여번호 */
	id VARCHAR2(50), /* 아이디 */
	car_no VARCHAR2(20), /* 차량번호 */
	ins_code INTEGER, /* 보험코드 */
	rent_date DATE, /* 대여일 */
	return_date DATE, /* 반납일 */
	is_rent CHAR(1), /* 대여반납여부 */
	rent_fare INTEGER, /* 금액 */
	rent_remark VARCHAR2(500) /* 비고 */
);

COMMENT ON TABLE RENT IS '대여관리';

COMMENT ON COLUMN RENT.rent_no IS '대여번호';

COMMENT ON COLUMN RENT.id IS '아이디';

COMMENT ON COLUMN RENT.car_no IS '차량번호';

COMMENT ON COLUMN RENT.ins_code IS '보험코드';

COMMENT ON COLUMN RENT.rent_date IS '대여일';

COMMENT ON COLUMN RENT.return_date IS '반납일';

COMMENT ON COLUMN RENT.is_rent IS '대여반납여부';

COMMENT ON COLUMN RENT.rent_fare IS '금액';

COMMENT ON COLUMN RENT.rent_remark IS '비고';

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
	ins_code INTEGER, /* 보험코드 */
	ins_name VARCHAR2(50), /* 보험이름 */
	ins_fare INTEGER /* 보험금액 */
);

COMMENT ON TABLE INSURANCE IS '보험';

COMMENT ON COLUMN INSURANCE.ins_code IS '보험코드';

COMMENT ON COLUMN INSURANCE.ins_name IS '보험이름';

COMMENT ON COLUMN INSURANCE.ins_fare IS '보험금액';

CREATE UNIQUE INDEX PK_INSURANCE
	ON INSURANCE (
		ins_code ASC
	);

ALTER TABLE INSURANCE
	ADD
		CONSTRAINT PK_INSURANCE
		PRIMARY KEY (
			ins_code
		);

/* 장기렌트요청게시판 */
CREATE TABLE LONGRENT (
	no VARCHAR2(20) NOT NULL, /* 번호 */
	title VARCHAR2(50), /* 제목 */
	contents VARCHAR2(4000), /* 내용 */
	rep_yn CHAR(1) DEFAULT 1, /* 답변여부 */
	write_date DATE DEFAULT SYSDATE, /* 날짜 */
	rent_term VARCHAR2(50), /* 대여 */
	name VARCHAR2(50), /* 이름 */
	tel VARCHAR2(20), /* 연락처 */
	pwd VARCHAR2(50), /* 비밀번호 */
	rep_content VARCHAR2(4000), /* 답변내용 */
	options VARCHAR2(500) /* 옵션목록 */
);

ALTER TABLE LONGRENT MODIFY (WRITE_DATE DEFAULT SYSDATE);
ALTER TABLE LONGRENT MODIFY (REP_YN DEFAULT 1);


COMMENT ON TABLE LONGRENT IS '장기렌트요청게시판';

COMMENT ON COLUMN LONGRENT.no IS '번호';

COMMENT ON COLUMN LONGRENT.title IS '제목';

COMMENT ON COLUMN LONGRENT.contents IS '내용';

COMMENT ON COLUMN LONGRENT.rep_yn IS '답변여부';

COMMENT ON COLUMN LONGRENT.write_date IS '날짜';

COMMENT ON COLUMN LONGRENT.rent_term IS '대여';

COMMENT ON COLUMN LONGRENT.name IS '이름';

COMMENT ON COLUMN LONGRENT.tel IS '연락처';

COMMENT ON COLUMN LONGRENT.pwd IS '비밀번호';

COMMENT ON COLUMN LONGRENT.rep_content IS '답변내용';

COMMENT ON COLUMN LONGRENT.options IS '옵션목록';

ALTER TABLE LONGRENT
	ADD
		CONSTRAINT PK_LONGRENT
		PRIMARY KEY (
			no
		);


/* 공지사항게시판 */
CREATE TABLE notice (
	no VARCHAR2(20) NOT NULL, /* 번호 */
	title VARCHAR2(50), /* 제목 */
	contents VARCHAR2(2000), /* 내용 */
	write_date DATE DEFAULT sysdate, /*등록일 */
	is_top INTEGER DEFAULT 1 /*공지여부*/
);

ALTER TABLE NOTICE MODIFY (write_date DEFAULT SYSDATE);
ALTER TABLE NOTICE MODIFY (IS_TOP DEFAULT 1);

SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'LONGRENT';

ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			no
		);


/* 옵션 */
CREATE TABLE OPTIONS (
	opt_code INTEGER NOT NULL, /* 옵션코드 */
	name VARCHAR2(50), /* 옵션명 */
	fare INTEGER /* 옵션금액 */
);

COMMENT ON TABLE OPTIONS IS '옵션';

COMMENT ON COLUMN OPTIONS.opt_code IS '옵션코드';

COMMENT ON COLUMN OPTIONS.name IS '옵션명';

COMMENT ON COLUMN OPTIONS.fare IS '옵션금액';

CREATE UNIQUE INDEX PK_OPTIONS
	ON OPTIONS (
		opt_code ASC
	);

ALTER TABLE OPTIONS
	ADD
		CONSTRAINT PK_OPTIONS
		PRIMARY KEY (
			opt_code
		);

/* 차량 분류 */
CREATE TABLE KIND (
	kind_code INTEGER NOT NULL, /* 분류코드 */
	kind_name VARCHAR2(50), /* 분류명 */
	kind_fare INTEGER /* 분류별금액 */
);

COMMENT ON TABLE KIND IS '차량 분류';

COMMENT ON COLUMN KIND.kind_code IS '분류코드';

COMMENT ON COLUMN KIND.kind_name IS '분류명';

COMMENT ON COLUMN KIND.kind_fare IS '분류별금액';

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
CREATE TABLE EVENT (
	event_code INTEGER NOT NULL, /* 이벤트코드 */
	name VARCHAR2(500), /* 이벤트명 */
	sale INTEGER, /* 이벤트할인율 */
	thum_image VARCHAR2(50), /* 썸네일이미지 */
	view_image VARCHAR2(50), /* 뷰이미지 */
	start_date DATE, -- 시작일
	end_date DATE, -- 종료일
	is_event CHAR(1) /* 사용여부 */
);

COMMENT ON TABLE EVENT IS '이벤트';

COMMENT ON COLUMN EVENT.event_code IS '이벤트코드';

COMMENT ON COLUMN EVENT.name IS '이벤트명';

COMMENT ON COLUMN EVENT.sale IS '이벤트할인율';

COMMENT ON COLUMN EVENT.thum_image IS '썸네일이미지';

COMMENT ON COLUMN EVENT.view_image IS '뷰이미지';

COMMENT ON COLUMN EVENT.is_event IS '사용여부';

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

/* 브랜드 분류 */
CREATE TABLE BRAND (
	brand_code INTEGER NOT NULL, /* 브랜드코드 */
	brand_name VARCHAR2(50), /* 브랜드명 */
	brand_image VARCHAR(50) /* 브랜드이미지 */
);

COMMENT ON TABLE BRAND IS '브랜드 분류';

COMMENT ON COLUMN BRAND.brand_code IS '브랜드코드';

COMMENT ON COLUMN BRAND.brand_name IS '브랜드명';

COMMENT ON COLUMN BRAND.brand_image IS '브랜드이미지';

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

/* 이벤트보관함 */
CREATE TABLE EVENT_BOX (
	event_box INTEGER NOT NULL, /* 이벤트보관함번호 */
	event_code INTEGER, /* 이벤트코드 */
	id VARCHAR2(50), /* 아이디 */
	is_event CHAR(1) DEFAULT 'n' /* 사용여부 */
);

COMMENT ON TABLE EVENT_BOX IS '이벤트보관함';

COMMENT ON COLUMN EVENT_BOX.event_box IS '이벤트보관함번호';

COMMENT ON COLUMN EVENT_BOX.event_code IS '이벤트코드';

COMMENT ON COLUMN EVENT_BOX.id IS '아이디';

COMMENT ON COLUMN EVENT_BOX.is_event IS '사용여부';

CREATE UNIQUE INDEX PK_EVENT_BOX
	ON EVENT_BOX (
		event_box ASC
	);

ALTER TABLE EVENT_BOX
	ADD
		CONSTRAINT PK_EVENT_BOX
		PRIMARY KEY (
			event_box
		);

/* 옵션 보관함 */
CREATE TABLE OPT_BOX (
	opt_box INTEGER NOT null, /* 옵션보관함번호 */
	opt_code INTEGER, /* 옵션코드 */
	rent_no NUMBER, /* 대여번호 */
	is_opt CHAR(1) /* 사용여부 */
);

COMMENT ON TABLE OPT_BOX IS '옵션 보관함';

COMMENT ON COLUMN OPT_BOX.opt_box IS '옵션보관함번호';

COMMENT ON COLUMN OPT_BOX.opt_code IS '옵션코드';

COMMENT ON COLUMN OPT_BOX.rent_no IS '대여번호';

COMMENT ON COLUMN OPT_BOX.is_opt IS '사용여부';

CREATE UNIQUE INDEX PK_OPT_BOX
	ON OPT_BOX (
		opt_box ASC
	);

ALTER TABLE OPT_BOX
	ADD
		CONSTRAINT PK_OPT_BOX
		PRIMARY KEY (
			opt_box
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
			ins_code
		)
		REFERENCES INSURANCE (
			ins_code
		);

ALTER TABLE EVENT_BOX
	ADD
		CONSTRAINT FK_EVENT_TO_EVENT_BOX
		FOREIGN KEY (
			event_code
		)
		REFERENCES EVENT (
			event_code
		) ON DELETE CASCADE;

ALTER TABLE EVENT_BOX
	ADD
		CONSTRAINT FK_MEMBER_TO_EVENT_BOX
		FOREIGN KEY (
			id
		)
		REFERENCES MEMBER (
			id
		);

ALTER TABLE OPT_BOX
	ADD
		CONSTRAINT FK_OPTIONS_TO_OPT_BOX
		FOREIGN KEY (
			opt_code
		)
		REFERENCES OPTIONS (
			opt_code
		);

ALTER TABLE OPT_BOX
	ADD
		CONSTRAINT FK_RENT_TO_OPT_BOX
		FOREIGN KEY (
			rent_no
		)
		REFERENCES RENT (
			rent_no
		);