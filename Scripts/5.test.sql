-----------------------------------------------------------------------------김창동-----------------------------------------------------------------------------
SELECT CAR_NO,NAME,KIND,PRICE,REMARK FROM car;

SELECT CAR_NO,NAME,KIND,PRICE,REMARK FROM car WHERE CAR_NO LIKE '%허%';
-----------------------------------------------------------------------------오수정-----------------------------------------------------------------------------
SELECT * 
  FROM MEMBER;

INSERT INTO MEMBER(ID, PWD, NAME, TEL, LICENSE, ADDRESS)
VALUES ('dong', '1234', '동자승', '010-1234-1234', '22-15-061904-90', '대구시 서구');
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


-----------------------------------------------------------------------------문중희-----------------------------------------------------------------------------