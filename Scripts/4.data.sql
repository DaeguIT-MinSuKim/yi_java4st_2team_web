DELETE FROM RENT;
DELETE FROM CAR;
DELETE FROM BRAND;
DELETE FROM KIND;
DELETE FROM MEMBER;
DELETE FROM INSURANCE;
DELETE FROM OPT_BOX;
DELETE FROM ADMIN;
DELETE FROM LONGRENT;
DELETE FROM OPTIONS;
DELETE FROM EVENT;
DELETE FROM EVENT_BOX;

-- 회원
INSERT INTO MEMBER(ID, PWD, NAME, TEL, LICENSE, EMAIL, ADDRESS)
VALUES ('dong', '1234', '동자승', '010-1234-1234', '22-15-061904-90', 'aa@aa.com', '대구시 서구');
SELECT * FROM "MEMBER";

-- 차량 분류
INSERT INTO KIND VALUES (1, '소형', 50000);
INSERT INTO KIND VALUES (2, '중형', 60000);
INSERT INTO KIND VALUES (3, '승합차', 70000);
INSERT INTO KIND VALUES (4, '지프', 80000);
INSERT INTO KIND VALUES (5, '버스', 100000);
SELECT * FROM KIND;

-- 브랜드 분류
INSERT INTO BRAND VALUES (1, '기아', 0);
INSERT INTO BRAND VALUES (2, '현대', 0);
INSERT INTO BRAND VALUES (3, '벤츠', 0);
SELECT * FROM BRAND;

-- 차량
INSERT INTO CAR VALUES ('11하1234', '아반떼', 2, 2, '침수차량', 'Y', 3, 0);
INSERT INTO CAR VALUES ('12헤1234', '소렌토', 3, 1, '잘구른다', 'Y', 5, 0);
INSERT INTO CAR VALUES ('13히1234', '제네시스', 2, 2, '마! 내가낸데', 'Y', 1, 0);
INSERT INTO CAR VALUES ('14호1234', 'Jeep', 4, 2, '빵빵', 'N', 2, 0);
INSERT INTO CAR VALUES ('15후1234', '15인 버스', 5, 2, '뿡빵', 'N', 4, 0);
SELECT * FROM CAR;

-- 보험
INSERT INTO INSURANCE VALUES (1, '자차보험', 5000);
INSERT INTO INSURANCE VALUES (2, '완전보험', 5000);
INSERT INTO INSURANCE VALUES (3, '슈퍼보험', 5000);

-- 대여
--UPDATE RENT r SET PRICE = TO_CHAR(TO_DATE(RETURN_DATE)-TO_DATE(RENT_DATE)) * (SELECT PRICE FROM CAR WHERE CAR_NO = r.CAR_NO);
INSERT INTO RENT(ID, CAR_NO, INS_CODE, RENT_DATE, RETURN_DATE, IS_RENT, RENT_FARE, RENT_REMARK) values('dong', '11하1234', 1, '2020/10/10', '2020/10/15', 'Y', 500000, '동자동자');
INSERT INTO RENT(ID, CAR_NO, INS_CODE, RENT_DATE, RETURN_DATE, IS_RENT, RENT_FARE, RENT_REMARK) values('dong', '12헤1234', 1, '2020/10/11', '2020/10/16', 'Y', 500000, '동자동자');
INSERT INTO RENT(ID, CAR_NO, INS_CODE, RENT_DATE, RETURN_DATE, IS_RENT, RENT_FARE, RENT_REMARK) values('dong', '13히1234', 1, '2020/10/18', '2020/10/21', 'Y', 500000, '동자동자');
INSERT INTO RENT(ID, CAR_NO, INS_CODE, RENT_DATE, RETURN_DATE, IS_RENT, RENT_FARE, RENT_REMARK) values('dong', '14호1234', 1, '2020/10/22', '2020/10/23', 'Y', 500000, '동자동자');
INSERT INTO RENT(ID, CAR_NO, INS_CODE, RENT_DATE, RETURN_DATE, IS_RENT, RENT_FARE, RENT_REMARK) values('dong', '15후1234', 1, '2020/10/22', '2020/10/30', 'Y', 500000, '동자동자');

SELECT * FROM rent;
-- 옵션
INSERT INTO OPTIONS VALUES (1, '후방카메라', 5000);
INSERT INTO OPTIONS VALUES (2, '블루투스', 5000);
INSERT INTO OPTIONS VALUES (3, '카시트', 5000);
INSERT INTO OPTIONS VALUES (4, '내비게이션', 5000);
INSERT INTO OPTIONS VALUES (5, '하이패스', 5000);
SELECT * FROM OPTIONS;

-- 옵션 보관함
INSERT INTO OPT_BOX(OPT_CODE, RENT_NO) VALUES (2, 3);
DELETE FROM OPT_BOX WHERE RENT_NO = 3;
SELECT * FROM OPT_BOX;
--장기렌트

--INSERT INTO LONGRENT VALUES (1,'제목', '내용', '외관/내장', '안전', '편의/멀티미디어', '시트', 5000000, NULL, NULL, 1, SYSDATE);
--INSERT INTO LONGRENT(NO, title, CONTENTS, EXTERIOR, SAFETY, MULTI, SHEET, FARE) VALUES (1, '제목', '내용', '외관/내장', '안전', '편의/멀티미디어', '시트', 5000000);
INSERT INTO LONGRENT(NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS)
VALUES(LONGRENT_NO_SEQ.NEXTVAL,'제목','내용',1, SYSDATE,'30일','김창동','010-1234-1111','1111','옵션없음');
INSERT INTO LONGRENT(NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS)
VALUES(LONGRENT_NO_SEQ.NEXTVAL,'제목2','내용2',DEFAULT, SYSDATE,'100일','이창동','010-1234-2222','1111','옵션없음');
INSERT INTO LONGRENT(NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS)
VALUES(LONGRENT_NO_SEQ.NEXTVAL,'제목3','내용3',DEFAULT, SYSDATE,'100일','김창동','010-1234-3333','3333','옵션없음');
SELECT * FROM LONGRENT;

-- 이벤트
INSERT INTO EVENT(NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT) VALUES('10월 월렌트 이벤트', '1000', '1_thumbnail.png', '1_view.png', 'y');
INSERT INTO EVENT(NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT) VALUES('11월 월렌트 이벤트', '1000', '1_thumbnail.png', '1_view.png', 'n');
INSERT INTO EVENT(NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT) VALUES('12월 월렌트 이벤트', '1000', '1_thumbnail.png', '1_view.png', 'y');