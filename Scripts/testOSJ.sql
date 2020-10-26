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
SELECT * FROM CAR;
--조회----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT ORDER BY EVENT_CODE DESC;
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT WHERE EVENT_CODE = 1;
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT WHERE is_event = 'y';

INSERT INTO RENT VALUES('1', 'dong', '11하5678', 1, '2020-10-23', '2020-10-24', 'y', 60000, 'test');


SELECT * 
  FROM CAR c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE
 WHERE CAR_NO NOT IN (SELECT DISTINCT CAR_NO FROM rent r
 WHERE (TO_DATE(RENT_DATE) > TO_DATE('2020102100','YYYYMMDDHH24') AND TO_DATE(RENT_DATE) < TO_DATE('2020102500','YYYYMMDDHH24'))
 OR (TO_DATE(RETURN_DATE) > TO_DATE('2020102100','YYYYMMDDHH24') AND TO_DATE(RETURN_DATE) < TO_DATE('2020102500','YYYYMMDDHH24')));

SELECT * 
  FROM CAR c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE
 WHERE CAR_NO = '11하5678' AND CAR_NO IN (SELECT DISTINCT CAR_NO FROM rent r
 WHERE (TO_DATE(RENT_DATE) > TO_DATE('2020102209','YYYYMMDDHH24') AND TO_DATE(RENT_DATE) < TO_DATE('2020103009','YYYYMMDDHH24'))
 OR (TO_DATE(RETURN_DATE) > TO_DATE('2020102209','YYYYMMDDHH24') AND TO_DATE(RETURN_DATE) < TO_DATE('2020103009','YYYYMMDDHH24')));

SELECT * FROM event_box;

SELECT EVENT_BOX, EVENT_CODE, ID, IS_EVENT FROM EVENT_BOX WHERE EVENT_CODE = 1 AND ID = 'dong';

INSERT INTO EVENT_BOX(EVENT_CODE, ID) VALUES(1, 'dong');

UPDATE EVENT_BOX SET IS_EVENT = 'n' WHERE ID = 'dong';

DELETE FROM EVENT_BOX;

SELECT * FROM USER_TABLES;

SELECT * FROM MEMBER;

SELECT * FROM USER_TABLES;

select count(*) from EVENT;

SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM EVENT ORDER BY EVENT_CODE DESC) a) WHERE RN BETWEEN 1 AND 5 ORDER BY RN;
SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT ORDER BY TO_NUMBER(EVENT_CODE) DESC;

SELECT * FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE ORDER BY CAR_COUNT DESC;

UPDATE CAR SET CAR_COUNT = 1 WHERE CAR_NO = '11하5678';



SELECT count(*) FROM event where EVENT_CODE LIKE 2;

SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM EVENT ORDER BY EVENT_CODE DESC) a) WHERE RN BETWEEN 0 AND 15 and NAME LIKE '%' || '이벤트' || '%' ORDER BY EVENT_CODE DESC;