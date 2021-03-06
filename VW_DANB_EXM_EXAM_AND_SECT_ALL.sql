CREATE OR REPLACE FORCE VIEW "VW_DANB_EXM_EXAM_AND_SECT_ALL" ("EXAM_NM", "EXAM_SERNO", "REG_ID", "CUST_ID", "EXAM_AUTORIZATION", "EXAM_CD", "EXAM_SERIES_CD", "REVISION_NUMBER", "FORM_CD", "EXAM_TAKEN_DT", "SCORE", "GRADE", "EXAM_SCALED_SCORE", "SCALED_STATUS", "EXAM_SCORED_DT", "VUEID", "HOLD_FL", "SECTION_ORDINAL", "SECTION_SCALED_SCORE", "NOMINAL_RATING", "SECTION_NAME", "SECTION_PERCENT") AS 
  SELECT 
	LEVEL2 as EXAM_NN,
	NULL as EXAM_SERNO,
	EXAM_VUE_REGID as REG_ID,
	CUST_ID ,
	TO_CHAR(TX.TX_SERNO) as EXAM_AUTORIZATION,
	LEVEL2 as exam_cd,
	EXAM_SERIES_CD as EXAM_SERIES_CD,
	NULL as REVISION_NUMBER,
	NULL as FORM_CD,
	to_date(EXAM_TEST_DATE) as EXAM_TAKEN_DT,
	to_char(RESULT_SCORE) as SCORE,
	result_cd as GRADE,
	result_score as EXAM_SCALED_SCORE, 
	result_cd as SCALED_STATUS,
	TO_DATE(EXAM_SCORED_DATE) as EXAM_SCORED_DT,
	NULL as VUEID,
	NULL as HOLD_FL,
	hsec.section_ordinal as SECTION_ORDINAL, 
	hsec.section_scaled_score as SECTION_SCALED_SCORE,
	NULL as  NOMINAL_RATING, 
	NULL as SECTION_NAME, 
	NULL as SECTION_PERCENT

FROM CEN_CUST_TX  tx
JOIN VW_DANB_EXM_EXAM_HISTORICAL hist on tx.tx_serno = hist.tx_serno
LEFT JOIN VW_DANB_EXAM_HIST_SECTION hsec on tx.tx_serno = hsec.tx_serno

UNION 
SELECT 
	EXAM_NM, 
	EXAM_SERNO, 
	REGID, 
    CUST_ID , 
	EXAM_AUTHORIZATION, 
	EXAM_CD, 
	EXAM_SERIES_CD, 
	REVISION_NUMBER, 
	FORM_CD, 
	EXAM_TAKEN_DT, 
	SCORE, 
	GRADE, 
	EXAM_SCALED_SCORE, 
	SCALED_STATUS, 
	EXAM_SCORED_DT, 
	VUEID, 
	HOLD_FL, 
	SECTION_ORDINAL, 
	SECTION_SCALED_SCORE, 
	NOMINAL_RATING, 
	SECTION_NAME, 
	SECTION_PERCENT

FROM VW_DANB_EXM_EXAM_AND_SECTION
/