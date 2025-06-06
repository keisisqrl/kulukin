SET session_token = sqlpage.cookie('session_token');
DELETE FROM login_session WHERE session_id = $session_token;
SELECT 'cookie' as component,
  'session_token' as name,
  TRUE as remove;
SELECT 'redirect' as component,
  '/index.sql?pop_info=' || sqlpage.url_encode('Logged out!') as link;