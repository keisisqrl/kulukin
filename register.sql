SELECT 'dynamic' as component,
  sqlpage.run_sql('shell.sql') as properties
;

SELECT 'form' as component,
  'Register new user' as title,
  'POST' as method,
  '/create_user.sql' as action;
SELECT 
  'username' as name,
  'Username' as label,
  'text' as type,
  TRUE as required;
SELECT 
  'password' as name,
  'Password' as label,
  'password' as type,
  TRUE as required;
SELECT
  'email' as name,
  'Email' as label,
  'email' as type,
  TRUE as required;