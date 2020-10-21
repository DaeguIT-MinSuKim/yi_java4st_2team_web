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
SELECT * 
  FROM MEMBER;
 
SELECT ID , NAME , LOGIN_DATE , TRY_COUNTING , IS_LOCK , LOCK_COUNTING
  FROM MEMBER;

/* 로그인 상태 화인 */
SELECT COUNT(1) CNT
  FROM MEMBER
 WHERE ID = 'dong'
   AND IS_LOCK = 'Y'
   AND LOGIN_DATE + ( 1 / 24 / 60 ) * LOCK_COUNTING > SYSDATE;

/* 로그인 시도 횟수 */
UPDATE MEMBER
   SET TRY_COUNTING = TRY_COUNTING + 1, LOGIN_DATE = SYSDATE
 WHERE ID = 'dong';

/* 로그인 제한 횟수 */
UPDATE MEMBER
   SET IS_LOCK = 'Y', LOCK_COUNTING = LOCK_COUNTING + 1
 WHERE ID = 'dong'
   AND TRY_COUNTING > 3;
  
/* 로그인 시도 횟수 리셋 */
UPDATE MEMBER
   SET TRY_COUNTING = 0, IS_LOCK = 'N'
 WHERE ID = 'dong'
   AND IS_LOCK = 'Y';
  
/* 로그인 제한 횟수 리셋 */
UPDATE MEMBER
   SET LOCK_COUNTING = 0
 WHERE ID = 'dong';

INSERT INTO MEMBER(ID, PWD, NAME, TEL, LICENSE, EMAIL, ADDRESS)
VALUES ('dong1', '1234', '동자승', '010-1234-1234', '22-15-061904-90', 'aa@aa.com', '대구시 서구');

DELETE FROM MEMBER WHERE ID = 'pp555555';

SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS FROM LONGRENT WHERE NO = 3 AND PWD = '1111'