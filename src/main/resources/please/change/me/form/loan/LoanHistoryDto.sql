FIND_BY_LOAN_ID=
SELECT
  KANJI_NAME,
  EXECUTION_DATE_TIME,
  LOAN_APPLI_ACTION_CD,
  LOAN_APPLI_RESULT_CD,
  HISTORY_COMMENT
FROM
  LOAN_APPLICATION_HISTORY
  INNER JOIN USERS
    ON USER_ID = EXECUTIONER_ID
WHERE
  LOAN_APPLI_ID = ?
ORDER BY EXECUTION_DATE_TIME
