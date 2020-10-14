--김창동----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT CAR_NO,NAME,KIND,PRICE,REMARK FROM car;

SELECT CAR_NO,NAME,KIND,PRICE,REMARK FROM car WHERE CAR_NO LIKE '%허%';

INSERT INTO CAR VALUES(?, ?, ?, ?, ?);
--오수정----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT;
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT WHERE EVENT_CODE = 1;
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT WHERE is_event = 'y';

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

DELETE FROM longrent WHERE NO = 19;

UPDATE LONGRENT SET TITLE = ?, contents = ?, RENT_TERM = ? , name= ? , tel =? , PWD = ?, OPTIONS = ? WHERE NO = ?;
UPDATE LONGRENT SET TITLE = '김창동입니다. 답변을 주세요', contents = '전동킥보드는 장기렌트 안 되나요?', RENT_TERM = '한달' , name= '동자승' , tel ='010-2222-1111' , PWD = '1111', OPTIONS = '풀옵션' WHERE NO = 3;

SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT FROM longrent WHERE NUM =? PWD = ?;

SELECT * FROM LONGRENT;
--문중희----------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT * 
  FROM MEMBER;

INSERT INTO MEMBER(ID, PWD, NAME, TEL, LICENSE, EMAIL, ADDRESS)
VALUES ('dong1', '1234', '동자승', '010-1234-1234', '22-15-061904-90', 'aa@aa.com', '대구시 서구');

DELETE FROM MEMBER WHERE ID = 'pp555555';

SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS FROM LONGRENT WHERE NO = 3 AND PWD = '1111'