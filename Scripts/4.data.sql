DELETE FROM RENT;
DELETE FROM CAR;
DELETE FROM BRAND;
DELETE FROM KIND;
DELETE FROM MEMBER;
DELETE FROM INSURANCE;

CREATE OR REPLACE VIEW VW_CAR AS
SELECT CAR_NO,CAR_NAME,KIND_CODE,BRAND_CODE,REMARK,IS_RENT,COUNTING,c.IMAGE,.NAME,PRICE,NAME,IMAGE
FROM CAR c LEFT OUTER JOIN KIND k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE;

SELECT * FROM CAR;
SELECT * FROM KIND;
SELECT * FROM BRAND b ;

INSERT INTO KIND VALUES (6, '몰라', 1000);
UPDATE KIND SET NAME = '알아', PRICE = 5000 WHERE KIND_CODE = 6;
DELETE FROM KIND WHERE KIND_CODE = 6;

-- 회원
INSERT INTO MEMBER(ID, PWD, NAME, TEL, LICENSE, EMAIL, ADDRESS)
VALUES ('dong', '1234', '동자승', '010-1234-1234', '22-15-061904-90', 'aa@aa.com', '대구시 서구');
INSERT INTO MEMBER(ID, PWD, NAME, TEL, LICENSE, EMAIL, ADDRESS)
VALUES ('one', '1111', '원', '010-1111-1111', '22-15-061904-91','bb@bb.com', '서울시 서구');
INSERT INTO MEMBER(ID, PWD, NAME, TEL, LICENSE, EMAIL, ADDRESS)
VALUES ('two', '2222', '투', '010-2222-2222', '22-15-061904-92','cc@cc.com', '부산시 서구');

-- 차량 분류
INSERT INTO KIND VALUES (1, '소형', 50000);
INSERT INTO KIND VALUES (2, '중형', 60000);
INSERT INTO KIND VALUES (3, '승합차', 70000);
INSERT INTO KIND VALUES (4, '지프', 80000);
INSERT INTO KIND VALUES (5, '버스', 100000);

-- 브랜드 분류
INSERT INTO BRAND VALUES (1, '기아', 0);
INSERT INTO BRAND VALUES (2, '현대', 0);
INSERT INTO BRAND VALUES (3, '벤츠', 0);

-- 차량
INSERT INTO CAR VALUES (TRUNC(DBMS_RANDOM.VALUE(10, 100)) || '하' || TRUNC(DBMS_RANDOM.VALUE(1, 10000)), '아반떼', 2, 2, '침수차량', 'Y', 3, 0);
INSERT INTO CAR VALUES (TRUNC(DBMS_RANDOM.VALUE(10, 100)) || '헤' || TRUNC(DBMS_RANDOM.VALUE(1, 10000)), '소렌토', 3, 1, '잘구른다', 'Y', 5, 0);
INSERT INTO CAR VALUES (TRUNC(DBMS_RANDOM.VALUE(10, 100)) || '히' || TRUNC(DBMS_RANDOM.VALUE(1, 10000)), '제네시스', 2, 2, '마! 내가낸데', 'Y', 1, 0);
INSERT INTO CAR VALUES (TRUNC(DBMS_RANDOM.VALUE(10, 100)) || '호' || TRUNC(DBMS_RANDOM.VALUE(1, 10000)), 'Jeep', 4, 2, '빵빵', 'N', 2, 0);
INSERT INTO CAR VALUES (TRUNC(DBMS_RANDOM.VALUE(10, 100)) || '후' || TRUNC(DBMS_RANDOM.VALUE(1, 10000)), '15인 버스', 5, 2, '뿡빵', 'N', 4, 0);


-- 보험
INSERT INTO INSURANCE VALUES ('보험', 5000);


-- 대여
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES ('test', NULL, '12하4219', '보험', '2020/10/15', '2020/10/17', 1, 0, 0, '절도범');
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES ('test2', NULL, '52하6437', '보험', '2020/10/15', '2020/10/20', 1, 0, 0, '사고');
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES ('test3', NULL, '38허4532', '보험', '2020/10/15', '2020/10/18', 1, 1, 0, '이상무');
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES ('test4', NULL, '29허9435', '보험', '2020/10/15', '2020/10/16', 1, 1, 0, '빵상');
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES ('test5', NULL, '19호2362', '보험', '2020/10/12', '2020/10/15', 1, 0, 0, '장발장');
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES ('test6', NULL, '06호8254', '보험', '2020/10/20', '2020/10/22', 1, 0, 0, '차량파손');
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES ('test7', NULL, '03호8254', '보험', '2020/10/23', '2020/10/25', 1, 0, 1, '차량파손');
INSERT INTO RENT(ID,NON_TEL,CAR_NO,INS_NAME,RENT_DATE,RETURN_DATE,PRICE,IS_RENT,IS_RESERVATE,REMARK) VALUES ('test7', NULL, '03호8254', '보험', '2020/10/29', '2020/11/25', 1, 0, 1, '차량파손');
UPDATE RENT r SET PRICE = TO_CHAR(TO_DATE(RETURN_DATE)-TO_DATE(RENT_DATE)) * (SELECT PRICE FROM CAR WHERE CAR_NO = r.CAR_NO);

--장기렌트

--INSERT INTO LONGRENT VALUES (1,'제목', '내용', '외관/내장', '안전', '편의/멀티미디어', '시트', 5000000, NULL, NULL, 1, SYSDATE);
--INSERT INTO LONGRENT(NO, title, CONTENTS, EXTERIOR, SAFETY, MULTI, SHEET, FARE) VALUES (1, '제목', '내용', '외관/내장', '안전', '편의/멀티미디어', '시트', 5000000);
INSERT INTO LONGRENT(NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT)

INSERT INTO LONGRENT(NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS)
VALUES(LONGRENT_NO_SEQ.NEXTVAL,'제목','내용',1, SYSDATE,'30일','김창동','010-1234-1111','1111','옵션없음');
INSERT INTO LONGRENT(NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS)
VALUES(LONGRENT_NO_SEQ.NEXTVAL,'제목2','내용2',DEFAULT, SYSDATE,'100일','이창동','010-1234-2222','1111','옵션없음');
INSERT INTO LONGRENT(NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS)
VALUES(LONGRENT_NO_SEQ.NEXTVAL,'제목3','내용3',DEFAULT, SYSDATE,'100일','김창동','010-1234-3333','3333','옵션없음');

-- 이벤트
INSERT INTO EVENT(NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT) VALUES('10월 월렌트 이벤트', '1000', '1_thumbnail.png', '1_view.png', 'y');
INSERT INTO EVENT(NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT) VALUES('11월 월렌트 이벤트', '1000', '1_thumbnail.png', '1_view.png', 'n');
INSERT INTO EVENT(NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT) VALUES('12월 월렌트 이벤트', '1000', '1_thumbnail.png', '1_view.png', 'y');

-- 조회
SELECT * FROM CAR;
SELECT * FROM KIND;
SELECT * FROM BRAND;

SELECT * FROM CUSTOMER;
SELECT * FROM RENT;
SELECT * FROM LONGRENT;
SELECT * FROM MEMBER;

SELECT CAR_NO
  FROM RENT
 WHERE TO_CHAR(TO_DATE(RETURN_DATE)-TO_DATE('2020/10/18')) <= 0;  TO_CHAR(TO_DATE(RENT_DATE)-TO_DATE('2020/10/21')) <=0;


SELECT CAR_NO
  FROM RENT
 WHERE NOT TO_DATE('2020/10/18') BETWEEN TO_DATE(RENT_DATE) AND TO_DATE(RETURN_DATE)
		AND TO_DATE('2020/10/21') BETWEEN to_date; 

	
SELECT min(return_date)
  FROM RENT r 
 WHERE CAR_NO = '03호8254';