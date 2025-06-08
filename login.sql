SELECT 'dynamic' as component,
  sqlpage.run_sql('shell.sql') as properties
;

SELECT 'alert' as component,
      'Error' as title,
      'lock-exclamation' as icon,
      'red' as color,
      TRUE as dismissible,
      'Invalid username or password.' as description
WHERE $bad_login IS NOT NULL;

SELECT 'form' as component,
  'Log In' as title,
  'POST' as method,
  '/create_session.sql' as action;
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

SELECT 'text' as component,
  TRUE as center,
  'Need an account? ' as contents;
SELECT 
  'Click here to register' as contents,
  'register.sql' as link;