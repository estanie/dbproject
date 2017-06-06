CREATE OR REPLACE TRIGGER BeforeUpdateStudent BEFORE
UPDATE ON student
FOR EACH ROW

DECLARE
  underflow_length		EXCEPTION;
  invalid_value		EXCEPTION;
  nLength			NUMBER;
  nBlank			NUMBER;

BEGIN
	/* 채워 넣자 */
END;
/

    
