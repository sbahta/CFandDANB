CREATE OR REPLACE FORCE VIEW "VW_DANB_EXM_PDEP_ATTRIBUTE" ("TX_SERNO", "PDEP_SECOND_TRY_DATE", "PDEP_ARTICLE4_SCORE", "PDEP_OVERALL_STATUS", "PDEP_ARTICLE5_SCORE", "PDEP_ID", "PDEP_ARTICLE1_SCORE", "PDEP_ARTICLE3_SCORE", "PDEP_FIRST_TRY_DATE", "PDEP_ARTICLE2_SCORE", "PDEP_DATE_MAILED", "PDEP_TOTAL_SCORE") AS 
  select 
   TX_SERNO,
   PDEP_SECOND_TRY_DATE,
   PDEP_ARTICLE4_SCORE,
   PDEP_OVERALL_STATUS,
   PDEP_ARTICLE5_SCORE,
   PDEP_ID,
   PDEP_ARTICLE1_SCORE,
   PDEP_ARTICLE3_SCORE,
   PDEP_FIRST_TRY_DATE,
   PDEP_ARTICLE2_SCORE,
   PDEP_DATE_MAILED,
   PDEP_TOTAL_SCORE
from (
select tx_serno, ATTRIBUTE_TY, ATTRIBUTE_CD, CVAR, NVAR, DVAR
from CEN_CUST_TX_ATTRDTL
)
PIVOT ( 
              MAX(
                  COALESCE(CVAR,TO_CHAR(NVAR),TO_CHAR(DVAR),ATTRIBUTE_CD)
                  ) 
	     FOR ATTRIBUTE_TY IN (
                 'PDEP_SECOND_TRY_DATE' as PDEP_SECOND_TRY_DATE,
                 'PDEP_ARTICLE4_SCORE' as PDEP_ARTICLE4_SCORE,
                 'PDEP_OVERALL_STATUS' as PDEP_OVERALL_STATUS,
                 'PDEP_ARTICLE5_SCORE' as PDEP_ARTICLE5_SCORE,
                 'PDEP_ID' as PDEP_ID,
                 'PDEP_ARTICLE1_SCORE' as PDEP_ARTICLE1_SCORE,
                 'PDEP_ARTICLE3_SCORE' as PDEP_ARTICLE3_SCORE,
                 'PDEP_FIRST_TRY_DATE' as PDEP_FIRST_TRY_DATE,
                 'PDEP_ARTICLE2_SCORE' as PDEP_ARTICLE2_SCORE,
                 'PDEP_DATE_MAILED' as PDEP_DATE_MAILED,
                 'PDEP_TOTAL_SCORE' as PDEP_TOTAL_SCORE
              )
)
/