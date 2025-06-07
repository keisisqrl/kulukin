SELECT 'authentication' as component,
  'login.sql?bad_login=true' as link,
  (SELECT password_hash from user where username = :username) as password_hash,
  :password as password;

INSERT INTO login_session (session_id, user_id)
VALUES (sqlpage.random_string(32), (SELECT id from user where username = :username))
RETURNING 
  'cookie' as component,
  'session_token' as name,
  session_id as value;

SELECT 'redirect' as component,
  '/index.sql?pop_info=' || sqlpage.url_encode('Logged in!') as link;