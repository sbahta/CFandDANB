CREATE OR REPLACE FORCE VIEW "VW_DANB_EXM_EXAM_HISTORICAL" ("TX_SERNO", "EXAM_AFDS", "EXAM_EDU_EXP_MONTHS", "EXAM_EDU_EXP_YEARS", "EXAM_GROUP_NO", "EXAM_ID", "EXAM_PARENT_ID", "EXAM_SCORED_DATE", "EXAM_SERIES_CD", "EXAM_TEST_DATE", "EXAM_VUE_REGID") AS 
  SELECT  TX_SERNO,
        EXAM_AFDS,
		EXAM_EDU_EXP_MONTHS,
		EXAM_EDU_EXP_YEARS,
		EXAM_GROUP_NO,
		EXAM_ID,
		EXAM_PARENT_ID,
		EXAM_SCORED_DATE,
		EXAM_SERIES_CD,
		EXAM_TEST_DATE,
		EXAM_VUE_REGID 
FROM
(
	SELECT TX_SERNO, ATTRIBUTE_TY, ATTRIBUTE_CD, CVAR, NVAR, DVAR FROM CEN_CUST_TX_ATTRDTL
)
	PIVOT ( MAX(COALESCE(CVAR,TO_CHAR(NVAR),TO_CHAR(DVAR),ATTRIBUTE_CD)) 
	FOR ATTRIBUTE_TY IN (
		'EXAM_AFDS' AS EXAM_AFDS,
		'EXAM_EDU_EXP_MONTHS' AS EXAM_EDU_EXP_MONTHS, 
		'EXAM_EDU_EXP_YEARS' AS EXAM_EDU_EXP_YEARS, 
		'EXAM_GROUP_NO' AS EXAM_GROUP_NO, 
		'EXAM_ID' AS EXAM_ID, 
		'EXAM_PARENT_ID' AS EXAM_PARENT_ID, 
		'EXAM_SCORED_DATE' AS EXAM_SCORED_DATE, 
		'EXAM_SERIES_CD' AS EXAM_SERIES_CD,
		'EXAM_TEST_DATE' AS EXAM_TEST_DATE, 
		'EXAM_VUE_REGID' AS EXAM_VUE_REGID	
		) 
)
/