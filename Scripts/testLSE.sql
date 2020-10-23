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

UPDATE NOTICE SET CONTENTS = '동자승 렌터카를 이용해주시는 고객여러분께 감사 드립니다. [기본대여자격]
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
WHERE NO=7;

UPDATE NOTICE SET IS_TOP = 0 WHERE NO =7;

SELECT * FROM NOTICE ORDER BY IS_TOP, WRITE_DATE asc;


SELECT * FROM notice;

-------------------관리자-----------------------------------------------------------------------------------
SELECT * FROM LONGRENT ;
UPDATE LONGRENT SET REP_CONTENT = '댓글수정', REP_YN = 2  WHERE NO = 5;


UPDATE LONGRENT SET rep_yn = 1 WHERE NO = 0;



SELECT * FROM NOTICE ORDER BY IS_TOP, WRITE_DATE ASC;




-- 제약조건 추가 

ALTER TABLE LONGRENT MODIFY (WRITE_DATE DEFAULT SYSDATE);
ALTER TABLE LONGRENT MODIFY (REP_YN DEFAULT 1);
ALTER TABLE NOTICE MODIFY (REP_YN DEFAULT 1);
ALTER TABLE NOTICE MODIFY (IS_TOP DEFAULT 1);



---페이징

SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM longrent ORDER BY no DESC) a) WHERE RN BETWEEN 1 AND 5 ORDER BY RN;
select count(*) from longrent;



SELECT * FROM longrent ORDER BY TO_NUMBER(NO) desc;
SELECT * FROM longrent ORDER BY WRITE_DATE desc;

SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM NOTICE ORDER BY IS_TOP, WRITE_DATE asc) a) WHERE RN BETWEEN 1 AND 2 ORDER BY RN;



SELECT * FROM LONGRENT WHERE NAME LIKE '%김%' ORDER BY WRITE_DATE DESC;


--------------------------차트실험-------------------------------------------------------------------------------


--월별 통계 구하기  (몇월(1개의 월만...), 몇건) 
SELECT 
COUNT(*) AS MON_COUNT,
TO_CHAR(WRITE_DATE, 'MM') AS WRITE_MONTH
FROM LONGRENT 
WHERE
WRITE_DATE >='2020-01-01' AND WRITE_DATE  < '2020-02-01'
GROUP BY
TO_CHAR(WRITE_DATE, 'MM');

--월별 합계 구하기
SELECT TO_CHAR(WRITE_DATE, 'MM') AS WRITE_MONTH, COUNT(*) AS MON_COUNT FROM LONGRENT GROUP BY TO_CHAR(WRITE_DATE, 'MM');


SELECT  no, name FROM LONGRENT;

SELECT  extract(MONTH FROM write_date ) AS WRITE_MONTH
FROM longrent;

SELECT * FROM longrent;


