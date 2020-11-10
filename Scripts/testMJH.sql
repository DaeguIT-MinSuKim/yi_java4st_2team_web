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
SELECT * FROM NOTICE;
--조회----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT *
  FROM MEMBER
 ORDER BY NAME ASC;
 ORDER BY NAME ASC;

SELECT *
  FROM MEMBER
 WHERE id = 'dong20';

SELECT * FROM ADMIN WHERE ID = ?;

/* 회원 개인 정보 수정 */
UPDATE MEMBER
   SET GENDER = ?,
   		BIRTH = ?,
   		LI_CLASS = ?,
   		LI_NUMBER = ?,
   		EMAIL = ?,
   		ADDRESS = ?
  WHERE ID = ?;
 
/* 회원 탈퇴 */
UPDATE MEMBER
   SET PWD = ?,
  		GENDER = ?,
   		BIRTH = ?,
   		NAME = ?,
   		TEL = ?,
   		LI_CLASS = ?,
   		LI_NUMBER = ?,
   		EMAIL = ?,
   		ADDRESS = ?,
   		REASON = ?,
   		CONTENT = ?
  WHERE ID = ?;
 
UPDATE MEMBER
   SET PWD = '1234'
  WHERE ID = 'dong';

/* 페이징 - 회원 리스트 수 */
SELECT COUNT(*) FROM MEMBER;

SELECT *
  FROM (SELECT rownum RN, a.*
          FROM (SELECT * 
                  FROM MEMBER
                 ORDER BY NAME ASC) a)
         WHERE RN BETWEEN 0 AND 50 ORDER BY RN;

/* 페이징 - 회원 블랙 리스트 수 */
SELECT COUNT(*) FROM MEMBER WHERE IS_BLACK = 'Y';

SELECT *
  FROM (SELECT rownum RN, a.*
          FROM (SELECT * 
                  FROM MEMBER
                 WHERE IS_BLACK = 'Y'
                 ORDER BY NAME ASC) a)
         WHERE RN BETWEEN 0 AND 50
         ORDER BY RN;

SELECT ID , NAME , LOGIN_DATE , TRY_COUNTING , IS_LOCK , LOCK_COUNTING
  FROM MEMBER;

SELECT *
  FROM MEMBER
 WHERE ID = 'dong20'
   SET LOGIN_DATE = SYSDATE;

UPDATE MEMBER
   SET LOGIN_DATE = SYSDATE
 WHERE ID = 'dong20';

SELECT * FROM MEMBER WHERE id = 'dong';

UPDATE MEMBER SET IS_BLACK = 'N' WHERE ID = 'dong';

UPDATE MEMBER SET IS_BLACK = 'Y' WHERE ID = 'dong';

SELECT * FROM MEMBER ORDER BY NAME ASC; /* 정렬 - 이름 오름차순 */
SELECT * FROM MEMBER ORDER BY NAME DESC; /* 정렬 - 이름 내림차순 */

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

/* 추가 */
INSERT INTO MEMBER(ID, PWD, NAME, TEL, LICENSE, EMAIL, ADDRESS)
VALUES ('dong1', '1234', '동자승', '010-1234-1234', '22-15-061904-90', 'aa@aa.com', '대구시 서구');

/* 삭제 */
DELETE FROM MEMBER WHERE ID = 'dong';

SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS FROM LONGRENT WHERE NO = 3 AND PWD = '1111'

/* 블랙 리스트 추출 */
SELECT * FROM MEMBER WHERE IS_BLACK = 'Y' ORDER BY NAME ASC;

SELECT BIRTH
  FROM MEMBER
 WHERE id = 'dong1';

INSERT INTO ADMIN(ID, PWD)
VALUES ('admin', '1234');

/* 더미 회원 */
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong1', '1234', 'M', '1998-11-6', '김자승', '010-1234-1234', 'Class1A', '11-11-123456-11', 'dong1@naver.com', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong2', '1234', 'F', '1998-11-6', '이자승', '010-1234-1234', 'Class1B', '12-12-123456-12', 'dong2@daum.net', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong3', '1234', 'M', '1998-11-6', '박자승', '010-1234-1234', 'Class2A', '13-12-123456-12', 'dong3@nate.com', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong4', '1234', 'F', '1998-11-6', '최자승', '010-1234-1234', 'Class2M', '14-12-123456-12', 'dong4@gmail.com', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong5', '1234', 'M', '1998-11-6', '정자승', '010-1234-1234', 'Class1A', '15-12-123456-12', 'dong5@naver.com', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong6', '1234', 'F', '1998-11-6', '강자승', '010-1234-1234', 'Class1B', '16-12-123456-12', 'dong6@daum.net', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong7', '1234', 'M', '1998-11-6', '조자승', '010-1234-1234', 'Class2A', '17-12-123456-12', 'dong7@nate.com', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong8', '1234', 'F', '1998-11-6', '윤자승', '010-1234-1234', 'Class2M', '18-12-123456-12', 'dong8@gmail.com', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong9', '1234', 'M', '1998-11-6', '창자승', '010-1234-1234', 'Class1A', '19-12-123456-12', 'dong9@naver.com', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong10', '1234', 'F', '1998-11-6', '임자승', '010-1234-1234', 'Class1B', '20-12-123456-12', 'dong10@daum.net', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong11', '1234', 'M', '1998-11-6', '한자승', '010-1234-1234', 'Class2A', '21-12-123456-12', 'dong11@nate.com', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong12', '1234', 'F', '1998-11-6', '오자승', '010-1234-1234', 'Class2M', '22-12-123456-12', 'dong12@gmail.com', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong13', '1234', 'M', '1998-11-6', '서자승', '010-1234-1234', 'Class1A', '23-12-123456-12', 'dong13@naver.com', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong14', '1234', 'F', '1998-11-6', '신자승', '010-1234-1234', 'Class1B', '24-12-123456-12', 'dong14@daum.net', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong15', '1234', 'M', '1998-11-6', '권자승', '010-1234-1234', 'Class2A', '25-12-123456-12', 'dong15@nate.com', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong16', '1234', 'F', '1998-11-6', '황자승', '010-1234-1234', 'Class2M', '26-12-123456-12', 'dong16@gmail.com', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong17', '1234', 'M', '1998-11-6', '안자승', '010-1234-1234', 'Class1A', '28-12-123456-12', 'dong17@naver.com', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong18', '1234', 'F', '1998-11-6', '송자승', '010-1234-1234', 'Class1B', '11-12-123456-12', 'dong18@daum.net', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong19', '1234', 'M', '1998-11-6', '전자승', '010-1234-1234', 'Class2A', '12-12-123456-12', 'dong19@nate.com', '대구시');
INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS)
VALUES ('dong20', '1234', 'F', '1998-11-6', '홍자승', '010-1234-1234', 'Class2M', '13-12-123456-12', 'dong20@gmail.com', '대구시');