--김창동----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT CAR_NO,NAME,KIND,PRICE,REMARK FROM car;

SELECT CAR_NO,NAME,KIND,PRICE,REMARK FROM car WHERE CAR_NO LIKE '%허%';

SELECT OPT_CODE FROM OPT_BOX WHERE RENT_NO = 3;
SELECT MAX(OPT_BOX) FROM OPT_BOX;

SELECT * FROM RENT r ;
SELECT * FROM car;

-- 대여일 넣어 차량구하기
SELECT DISTINCT CAR_NO 
  FROM rent r
 WHERE NOT(TO_DATE(RENT_DATE) > TO_DATE('2020/10/15') OR TO_DATE(RETURN_DATE) < TO_DATE('2020/10/15'));

SELECT CAR_NO, CAR_NAME, REMARK, IS_RENT, COUNTING, c.IMAGE AS CAR_IMG,
		c.KIND_CODE, k.NAME AS KIND_NAME, FARE, c.BRAND_CODE, b.NAME AS BRAND_NAME, b.IMAGE AS BRAND_IMG
  FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE
 WHERE CAR_NO NOT IN (SELECT DISTINCT CAR_NO 
  FROM rent r
 WHERE NOT(TO_DATE(RENT_DATE) > TO_DATE('2020/10/15') OR TO_DATE(RETURN_DATE) < TO_DATE('2020/10/15')));

-- 대여일, 반납일 넣어 차량구하기
SELECT DISTINCT CAR_NO
  FROM rent r
 WHERE (TO_DATE(RENT_DATE) > TO_DATE('2020/10/20') AND TO_DATE(RENT_DATE) < TO_DATE('2020/10/25'))
	OR (TO_DATE(RETURN_DATE) > TO_DATE('2020/10/20') AND TO_DATE(RETURN_DATE) < TO_DATE('2020/10/25'));  //각 대여rent값이 대여일보다 크며 반납일보다 작은차량, 각 대여return값이 대여일보다 크며 반납일보다 작은차량

SELECT *
  FROM CAR c 
 WHERE CAR_NO NOT IN (SELECT DISTINCT CAR_NO
  FROM rent r
 WHERE (TO_DATE(RENT_DATE) > TO_DATE('2020/10/20') AND TO_DATE(RENT_DATE) < TO_DATE('2020/10/25'))
	OR (TO_DATE(RETURN_DATE) > TO_DATE('2020/10/20') AND TO_DATE(RETURN_DATE) < TO_DATE('2020/10/25')));

-- 그차량의 최대 대여일표기
SELECT min(return_date)
  FROM RENT r 
 WHERE CAR_NO = '03호8254';

SELECT * FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE;

SELECT * FROM Rent r LEFT OUTER JOIN MEMBER m ON r.ID = m.ID JOIN INSURANCE i ON r.INS_CODE = i.INS_CODE JOIN car c ON r.CAR_NO = c.CAR_NO LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE;

DELETE FROM rent WHERE RENT_NO = 4;
--오수정----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT;
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT WHERE EVENT_CODE = 1;
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT WHERE is_event = 'y';

SELECT * FROM event_box;

INSERT INTO EVENT_BOX(EVENT_CODE, ID, IS_EVENT) VALUES(1, 'dong', 'y');

SELECT * FROM USER_TABLES;

--김대현----------------------------------------------------------------------------------------------------------------------------------------------------------



--이승은----------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM LONGRENT;
--SELECT NO, SUBJECT, CONTENT, REP, ID, REP_YN, WRITE_DATE"
--				+ " FROM QNA WHERE ID =? ORDER BY NO DESC

SELECT NO, title, CONTENTS, EXTERIOR, SAFETY , MULTI , SHEET, FARE , ID, NON_TEL , REP_YN , WRITE_DATE 
FROM LONGRENT WHERE ID = 'dong' ORDER BY NO DESC ;

UPDATE LONGRENT SET id = 'dong' WHERE NO = 1;

--NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT

SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT
FROM LONGRENT WHERE NO = 3;

INSERT INTO LONGRENT (NO, title, CONTENTS, REP_YN, WRITE_DATE, rent_term, name,tel, pwd, OPTIONS)
VALUES(?,?,?,?,?,?,?,)

DELETE FROM longrent WHERE NO = 28;

UPDATE LONGRENT SET TITLE = ?, contents = ?, RENT_TERM = ? , name= ? , tel =? , PWD = ?, OPTIONS = ? WHERE NO = ?;
UPDATE LONGRENT SET TITLE = '김창동입니다. 답변을 주세요', contents = '전동킥보드는 장기렌트 안 되나요?', RENT_TERM = '한달' , name= '동자승' , tel ='010-2222-1111' , PWD = '1111', OPTIONS = '풀옵션' WHERE NO = 22;

SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT FROM longrent WHERE NUM =? PWD = ?;

SELECT * FROM LONGRENT;
--문중희----------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * 
  FROM MEMBER;

INSERT INTO MEMBER(ID, PWD, NAME, TEL, LICENSE, EMAIL, ADDRESS)
VALUES ('dong1', '1234', '동자승', '010-1234-1234', '22-15-061904-90', 'aa@aa.com', '대구시 서구');

DELETE FROM MEMBER WHERE ID = 'pp555555';

SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS FROM LONGRENT WHERE NO = 3 AND PWD = '1111'