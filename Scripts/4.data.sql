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
DELETE FROM NOTICE;

-- 회원
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong', '1234', 'M', '1998-11-6', '동자승', '010-1234-1234', 'Class1A', '12-12-123456-12', 'aa@aa.com', '대구시');

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
INSERT INTO INSURANCE VALUES (2, '완전보험', 10000);
INSERT INTO INSURANCE VALUES (3, '슈퍼보험', 15000);

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
VALUES(LONGRENT_NO_SEQ.NEXTVAL,empty_clob(),'K3TheNew 1년 장기렌트 문의드립니다. 예산은 대략 100원 정도로 생각하고 있으며, 유아 카시트 추가 되는지도 답변 부탁드립니다.', 1, SYSDATE,'365일','김창동','010-1234-1111','1111','옵션없음');
INSERT INTO LONGRENT(NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS)
VALUES(LONGRENT_NO_SEQ.NEXTVAL,'K3TheNew 1년 장기렌트 문의드립니다.','풀옵션 경차 렌트 문의드립니다. 5달정도 생각하고있습니다. 견적 부탁드립니다. ', 1, SYSDATE,'100일','김동자','010-1234-2222','1111','후방카메라');
INSERT INTO LONGRENT( TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS)
VALUES('외제차 문의, 답변 빨리 주세요.','뚜껑열린 외제차를 렌트하고싶습니다. 연락주세요..................!!',DEFAULT, SYSDATE,'100일', '곽수정','010-1234-3333','3333','옵션없음');
SELECT * FROM LONGRENT;

--공지사항
INSERT INTO NOTICE VALUES(1,'2020-10-01 동자승 렌터카 시무식 ','동자승 렌터카를 이용해주시는 고객여러분께 감사 드립니다. 2020-10-01 금일, 동자승 렌터카 시무식을 진행했습니다. 다시한번 새롭게 도약할 수 있는 한해가 되길 바라며 전 임직원이 자리를 함께 하였습니다. ',sysdate, 1);
INSERT INTO NOTICE VALUES(2,'운전면허 갱신기간 연장 안내','동자승 렌터카를 이용해주시는 고객여러분께 감사 드립니다. 도로 교통공단에 따라,  운전 코로나19 확산 방지를 위하여 운전면허 적성검사·갱신 기간이 최대 10개월 연장되어
단기 예약 시 아래 일자에 해당하는 고객님들에 한하여 연장기간까지 운전면허 검증이 통과됩니다.',SYSDATE, 1);
INSERT INTO NOTICE VALUES(3,'좋은 렌트카 업체는 어덯게 고르나요?','동자승 렌터카를 이용해주시는 고객여러분께 감사 드립니다. 좋은 렌터카는 동자승 렌터카 입니다.',SYSDATE, 1);
INSERT INTO NOTICE VALUES(4,'신종 코로나 바이러스 확산 예방 안내','동자승 렌터카를 이용해주시는 고객여러분께 감사 드립니다. 신종 코로나바이러스 확산 예방을 위해 전 직원 마스크 착용을 의무화 하고 전 차량을 향균 소독 하고 있습니다. 보다 안정적이고 편리한 서비스 제공을 위하여 더욱 노력하는 동자승 렌터카가 되겠습니다. 감사합니다.',SYSDATE, 1);
INSERT INTO NOTICE VALUES(5,'고객님께 안내 사항을 공지드립니다.','동자승 렌터카를 이용해주시는 고객여러분께 감사 드립니다. 시스템 점검 작업으로 인해 아래와 같이 서비스가 일시 중단됨을 알려드립니다. 해당 작업은 상황에 따라서 중단 시간과 범위는 변경될 수 있습니다. 
- 중단 일시 : 2020-10-20(화) 2:20 ~ 2020-10-20(화) 2:22 
- 중단 내용 : DB이관에 따른 서비스 일시 중단 
- 중단 범위 : 전체 서비스 이용 불가 ',SYSDATE, 0);
INSERT INTO NOTICE VALUES(6,'김동자 회장님 팬사인회 ','동자승 렌터카를 이용해주시는 고객여러분께 감사 드립니다. 동자승 렌터카 회장이신, 김동자 회장님의 팬사인회 일정 안내드립니다. 
- 일시 : 2020-10-30(금) 19:00 ~ 2020-10-30(금) 20:00 
- 장소 : 울특별시 구로구 서부샛길' ,SYSDATE, 1);
INSERT INTO NOTICE VALUES(7,'대여 자격 기준이 어떻게 되나요? ','동자승 렌터카를 이용해주시는 고객여러분께 감사 드립니다. [기본대여자격]
■ 만 21세 이상, 운전경력 만 1년 이상의 운전면허 소지자
단, 15인승 (쏠라티) 만 26세 이상 / 1종보통 면허 이상
■ 대여요금은 현장 결제입니다.
[상세 면허자격]
■운전면허 : 도로교통법상 유효하며, 적성검사기간이 지나지 않은 운전면허증 소지자
■면허경력 및 면허종류 : 승용차, 9인승 승합차 - 2종 보통면허 운전경력 1년 이상
11인승,12인승, 15인승 승합차 - 1종 보통면허, 운전경력 1년 이상
■외국인의 면허 : 유효기간이 지나지 않은 국제운전면허증과 여권,신용카드를 지참해 주셔야 대여 가능합니다.
단, 자국면허증 제출 후 전환 발급한 국내면허증을 소지한
외국인일 경우 면허경력 1년 미만일 경우에도 차량대여 가능합니다.
■재취득한 면허 : 재취득한 면허가 1년 미만이며,재취득 이전 면허를 포함하여 운전경력기간이 1년 이상일 경우
운전면허경력증명서와 재취득하신 면허증을 지참하시면 차량대여 가능합니다.'
,SYSDATE, 0);


INSERT INTO NOTICE (TITLE, CONTENTS, WRITE_DATE ,IS_TOP ) VALUES('중요한 공지사항입니다.','동자승 렌터카를 이용해주시는 고객여러분께 감사 드립니다. 확인용입니다. ',sysdate, 1);

SELECT * FROM notice;


-- 이벤트
INSERT INTO EVENT(NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT) VALUES('10월 월렌트 이벤트', '1000', '1_thumbnail.png', '1_view.png', 'y');
INSERT INTO EVENT(NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT) VALUES('11월 월렌트 이벤트', '1000', '1_thumbnail.png', '1_view.png', 'n');
INSERT INTO EVENT(NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT) VALUES('12월 월렌트 이벤트', '1000', '1_thumbnail.png', '1_view.png', 'y');
SELECT * FROM EVENT;

-- 이벤트 박스
INSERT INTO EVENT_BOX(EVENT_CODE, ID) VALUES(1, 'dong');
SELECT * FROM EVENT_BOX;

