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
INSERT INTO KIND VALUES (1, '소형', 60000);
INSERT INTO KIND VALUES (2, '중형', 70000);
INSERT INTO KIND VALUES (3, '대형', 100000);
INSERT INTO KIND VALUES (4, '승합', 120000);
INSERT INTO KIND VALUES (5, '수입', 250000);
SELECT * FROM KIND;

-- 브랜드 분류
INSERT INTO BRAND VALUES (1, '기아', 'kia.png');
INSERT INTO BRAND VALUES (2, '현대', 'hyundai.png');
INSERT INTO BRAND VALUES (3, '쉐보레', 'che.png');
INSERT INTO BRAND VALUES (4, '르노삼성', 'renault.png');
INSERT INTO BRAND VALUES (5, 'BMW', 'bmw.png');
INSERT INTO BRAND VALUES (6, 'DS오토모빌', 'ds.png');
INSERT INTO BRAND VALUES (7, '미니', 'mini.png');
INSERT INTO BRAND VALUES (8, '테슬라', 'tesla.png');
SELECT * FROM BRAND;

-- 차량 ------------------------------------------
-- 차량 (소형)
INSERT INTO CAR VALUES ('11하1234', '모닝', 1, 1, '', 'Y', 0, 'morning.png');
INSERT INTO CAR VALUES ('11하5678', '모닝AllNew', 1, 1, '', 'Y', 0, 'morningAllNew.png');
INSERT INTO CAR VALUES ('11하9012', '뉴소울EV', 1, 1, '', 'Y', 0, 'newsoulEV.png');
INSERT INTO CAR VALUES ('11하3456', '레이', 1, 1, '', 'Y', 0, 'ray.png');
INSERT INTO CAR VALUES ('11하6789', '레이TheNew', 1, 1, '', 'Y', 0, 'rayTheNew.png');
INSERT INTO CAR VALUES ('11하0123', '스파크TheNew', 1, 1, '', 'Y', 0, 'sparkTheNew.png');
INSERT INTO CAR VALUES ('11하4567', '볼트EV', 1, 1, '', 'Y', 0, 'voltEV.png');

-- 차량 (중형)
INSERT INTO CAR VALUES ('21가1234', '아반떼AD', 2, 2, '', 'Y', 0, 'avanteAD.png');
INSERT INTO CAR VALUES ('21가5678', 'i30', 2, 2, '', 'Y', 0, 'i30.png');
INSERT INTO CAR VALUES ('21가9012', '아이오닉EV', 2, 2, '', 'Y', 0, 'ionicEV.png');
INSERT INTO CAR VALUES ('21가3456', 'K3', 2, 1, '', 'Y', 0, 'k3.png');
INSERT INTO CAR VALUES ('21가6789', 'K3AllNew', 2, 1, '', 'Y', 0, 'K3AllNew.png');
INSERT INTO CAR VALUES ('21가0123', 'K3TheNew', 2, 1, '', 'Y', 0, 'K3TheNew.png');
INSERT INTO CAR VALUES ('21가4567', '뉴아반떼7', 2, 2, '', 'Y', 0, 'newAvante7.png');

-- 차량 (대형)
INSERT INTO CAR VALUES ('31나1234', 'k5', 3, 1, '', 'Y', 0, 'k5.png');
INSERT INTO CAR VALUES ('31나5678', 'k5TheNew', 3, 1, '', 'Y', 0, 'k5TheNew.png');
INSERT INTO CAR VALUES ('31나9012', '말리부', 3, 3, '', 'Y', 0, 'malribu.png');
INSERT INTO CAR VALUES ('31나3456', '말리부AllNew', 3, 3, '', 'Y', 0, 'malribuAllNew.png');
INSERT INTO CAR VALUES ('31나7890', '말리부TheNew', 3, 3, '', 'Y', 0, 'malribuTheNew.png');
INSERT INTO CAR VALUES ('31나1212', 'SM6', 3, 4, '', 'Y', 0, 'sm6.png');
INSERT INTO CAR VALUES ('31나1357', '쏘나타DN8', 3, 2, '', 'Y', 0, 'sonataDN8.png');

-- 차량 (승합)
INSERT INTO CAR VALUES ('41다1234', '카니발4 9인승', 4, 1, '', 'Y', 0, 'carnival4_9.png');
INSERT INTO CAR VALUES ('41다5678', '카니발 그랜드 11인승', 4, 1, '', 'Y', 0, 'carnivalGrand11.png');
INSERT INTO CAR VALUES ('41다9012', '카니발 리무진 7인승', 4, 1, '', 'Y', 0, 'carnivalLimousine7.png');
INSERT INTO CAR VALUES ('41다3456', '카니발 TheNew 11인승', 4, 1, '', 'Y', 0, 'carnivalTheNew11.png');
INSERT INTO CAR VALUES ('41다1212', '카니발 TheNew 리무진 7인승', 4, 1, '', 'Y', 0, 'carnivalTheNewHighLimousine7.png');
INSERT INTO CAR VALUES ('41다5656', '그랜드스타랙스 12인승', 4, 2, '', 'Y', 0, 'grandStarex12.png');
INSERT INTO CAR VALUES ('41다7878', '솔라티 15인승', 4, 2, '', 'Y', 0, 'solati15.png');

-- 차량 (외제)
INSERT INTO CAR VALUES ('55마1234', 'BMW520D', 5, 5, '', 'Y', 0, 'BMW520d.png');
INSERT INTO CAR VALUES ('55마5678', 'BMWI3', 5, 5, '', 'Y', 0, 'BMWI3.png');
INSERT INTO CAR VALUES ('55마9012', 'BMWX2', 5, 5, '', 'Y', 0, 'BMWX2.png');
INSERT INTO CAR VALUES ('55마3456', 'BMWZ4', 5, 5, '', 'Y', 0, 'BMWZ4.png');
INSERT INTO CAR VALUES ('55마7890', 'DS3크로스백', 5, 6, '', 'Y', 0, 'DS3Crossback.png');
INSERT INTO CAR VALUES ('55마1212', '미니쿠페', 5, 7, '', 'Y', 0, 'MiniCooper.png');
INSERT INTO CAR VALUES ('55마5656', '테슬라Model3', 5, 8, '', 'Y', 0, 'teslaModel3.png');

SELECT * FROM CAR;
--// 차량 ------------------------------------------

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

--공지사항
INSERT INTO NOTICE VALUES(1,'제목1','내용1',SYSDATE, 0);
INSERT INTO NOTICE VALUES(2,'제목2','내용2',SYSDATE, 1);
INSERT INTO NOTICE VALUES(3,'제목3','내용3',SYSDATE, 1);
INSERT INTO NOTICE VALUES(4,'제목4','내용4',SYSDATE, 1);
INSERT INTO NOTICE VALUES(5,'제목5','내용5',SYSDATE, 0);

SELECT * FROM notice;
DELETE FROM notice WHERE NO=4;


-- 이벤트
INSERT INTO EVENT(NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT) VALUES('10월 월렌트 이벤트', '1000', '1_thumbnail.png', '1_view.png', 'y');
INSERT INTO EVENT(NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT) VALUES('11월 월렌트 이벤트', '1000', '1_thumbnail.png', '1_view.png', 'n');
INSERT INTO EVENT(NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT) VALUES('12월 월렌트 이벤트', '1000', '1_thumbnail.png', '1_view.png', 'y');
