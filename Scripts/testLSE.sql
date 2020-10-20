SELECT * FROM CAR;
SELECT * FROM MEMBER;
SELECT * FROM ADMIN;
SELECT * FROM RENT;
SELECT * FROM INSURANCE;
SELECT * FROM LONGRENT;
SELECT * FROM OPTIONS;
SELECT * FROM KIND;
SELECT * FROM EVENT;
SELECT * FROM BRAND;
SELECT * FROM EVENT_BOX;
SELECT * FROM OPT_BOX;
--조회----------------------------------------------------------------------------------------------------------------------------------------------------------
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


SELECT  COUNT(*) FROM LONGRENT WHERE NO LIKE 1;

UPDATE LONGRENT SET REP_YN = 2 WHERE NO = 8;

SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT FROM LONGRENT ORDER BY REP_YN ASC, WRITE_DATE ASC;

--공지사항---------------------------------------------------------------------------------------------------------------------------------W-------------------------
SELECT * FROM notice;

SELECT NO, TITLE, CONTENTS, WRITE_DATE FROM NOTICE ;

SELECT *
FROM ( SELECT * FROM NOTICE ORDER BY WRITE_DATE DESC)
WHERE ROWNUM =1;


SELECT * FROM notice;


SELECT * FROM NOTICE  ORDER BY IS_TOP, NO DESC; 
UNION 
SELECT * FROM NOTICE WHERE IS_TOP = 1 ;

SELECT *
FROM (SELECT * FROM NOTICE WHERE IS_TOP = 0 
UNION 
SELECT * FROM NOTICE WHERE IS_TOP = 1)
ORDER BY IS_TOP;


SELECT * FROM NOTICE  ORDER BY IS_TOP, NO DESC;

UPDATE NOTICE SET CONTENTS = '일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지일반공지'
WHERE NO=4;

-------------------관리자-----------------------------------------------------------------------------------
SELECT * FROM LONGRENT ;
UPDATE LONGRENT SET REP_CONTENT = '댓글수정', REP_YN = 2  WHERE NO = 5;


UPDATE LONGRENT SET rep_yn = 1 WHERE NO = 8;