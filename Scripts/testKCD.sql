--조회
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
-- 대여일 넣어 차량구하기----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT CAR_NO 
  FROM rent r
 WHERE NOT(TO_DATE(RENT_DATE) > TO_DATE('2020/10/15') OR TO_DATE(RETURN_DATE) < TO_DATE('2020/10/15'));

SELECT *
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
  FROM CAR c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE
 WHERE CAR_NO NOT IN (SELECT DISTINCT CAR_NO
  FROM rent r
 WHERE (TO_DATE(RENT_DATE) > TO_DATE('2020/10/20') AND TO_DATE(RENT_DATE) < TO_DATE('2020/10/25'))
	OR (TO_DATE(RETURN_DATE) > TO_DATE('2020/10/20') AND TO_DATE(RETURN_DATE) < TO_DATE('2020/10/25')));

-- 해당차량의 최대 대여일표기
SELECT min(return_date) AS RETURN_DATE 
  FROM RENT r
 WHERE CAR_NO = '11하0123';

-- 페이징
SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM CAR c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE ORDER BY c.KIND_CODE) a) WHERE RN BETWEEN 1 AND 5 ORDER BY RN;
SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM CAR c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE WHERE CAR_NAME LIKE '%11%' ORDER BY c.KIND_CODE) a) WHERE RN BETWEEN 1 AND 10 ;

-- 차량 차트
SELECT k.kind_name, count(CAR_NO) FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE GROUP BY k.KIND_NAME ORDER BY k.KIND_NAME;
SELECT b.BRAND_NAME, count(CAR_NO) FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE GROUP BY b.BRAND_NAME ORDER BY b.BRAND_NAME;
SELECT IS_RENTCAR, COUNT(CAR_NO) FROM CAR GROUP BY IS_RENTCAR;

-- 대여 차트
SELECT k.kind_name, SUM(CAR_COUNT) FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE GROUP BY k.KIND_NAME ORDER BY k.KIND_NAME;
SELECT b.BRAND_NAME, SUM(CAR_COUNT) FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE GROUP BY b.BRAND_NAME ORDER BY b.BRAND_NAME;
SELECT * FROM RENT r; 
SELECT * FROM "MEMBER" m WHERE TO_DATE(BIRTH) BETWEEN TO_DATE('1990/01/01') AND TO_DATE('2000/01/01');


-- 반복문 사용하여 나이수정
DECLARE
NUM NUMBER :=16;
BEGIN
	LOOP	
	UPDATE MEMBER SET BIRTH = TO_DATE('1960/01/01') WHERE id = 'dong'||NUM;
	NUM := NUM + 1;
	EXIT WHEN NUM > 20;
	END LOOP;
END;

-- 연령대별 인원추출
select	y, count(*) as cnt
from(SELECT	floor((to_DATE(sysdate) - TO_DATE(BIRTH)) / 3650) * 10 as y
	FROM rent r LEFT OUTER JOIN MEMBER m ON r.ID = m.ID)
group BY y
ORDER BY y;

SELECT * FROM rent r LEFT OUTER JOIN MEMBER m ON r.ID = m.ID;

-- 월별 차량대여현황
SELECT TO_CHAR(RENT_DATE, 'YYYY-MM') AS RENT_DATE,
(SELECT count(*) FROM (SELECT * FROM MEMBER m LEFT OUTER JOIN RENT rent ON rent.ID = m.ID WHERE m.gender = 'F')
WHERE RENT_DATE = r.RENT_DATE) AS F
	FROM RENT r
	GROUP BY TO_CHAR(RENT_DATE, 'YYYY-MM'), RENT_DATE
	ORDER BY RENT_DATE;

-- 연도별 차량대여현황
SELECT TO_CHAR(RENT_DATE, 'YYYY') AS RENT_DATE, COUNT(*) AS COUNT
	FROM RENT
	GROUP BY TO_CHAR(RENT_DATE, 'YYYY');