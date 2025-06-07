INSERT OR ROLLBACK INTO user (username, password_hash, email) VALUES
  (:username, 
  sqlpage.hash_password(:password),
  :email)
RETURNING 'redirect' as component, 
  '/login.sql?pop_info=' || sqlpage.url_encode('Success! Please log in.') as link;