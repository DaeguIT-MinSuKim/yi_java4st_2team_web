-----------------------------------------------------------------------------김창동-----------------------------------------------------------------------------
SELECT CAR_NO,NAME,KIND,PRICE,REMARK FROM car;

SELECT CAR_NO,NAME,KIND,PRICE,REMARK FROM car WHERE CAR_NO LIKE '%허%';
-----------------------------------------------------------------------------오수정-----------------------------------------------------------------------------

-----------------------------------------------------------------------------김대현-----------------------------------------------------------------------------

-----------------------------------------------------------------------------이승은-----------------------------------------------------------------------------

DROP TABLE LONGRENT 
	CASCADE CONSTRAINTS;
SELECT * FROM LONGRENT;
--SELECT NO, SUBJECT, CONTENT, REP, ID, REP_YN, WRITE_DATE"
--				+ " FROM QNA WHERE ID =? ORDER BY NO DESC

SELECT NO, title, CONTENTS, EXTERIOR, SAFETY , MULTI , SHEET, FARE , ID, NON_TEL , REP_YN , WRITE_DATE 
FROM LONGRENT WHERE ID = 'dong' ORDER BY NO DESC ;

UPDATE LONGRENT SET id = 'dong' WHERE NO = 1;

--NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT

SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT
FROM LONGRENT WHERE NO = 1;


INSERT INTO LONGRENT (NO, title, CONTENTS, REP_YN, WRITE_DATE, rent_term, name,tel, pwd, OPTIONS)
VALUES(?,?,?,?,?,?,?,)

DELETE FROM longrent WHERE NO = 3;


-----------------------------------------------------------------------------문중희-----------------------------------------------------------------------------
SELECT * 
  FROM MEMBER;

INSERT INTO MEMBER(ID, PWD, NAME, TEL, LICENSE, EMAIL, ADDRESS)
VALUES ('dong', '1234', '동자승', '010-1234-1234', '22-15-061904-90', 'aa@aa.com', '대구시 서구');
