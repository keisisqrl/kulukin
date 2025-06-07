SET session_user = SELECT user_id FROM login_session 
  WHERE session_id = sqlpage.cookie('session_token');

SET session_username = SELECT username FROM user 
  WHERE id = $session_user;

SELECT 'shell' as component,
  'Kulukin' as title,
  'A community-powered library for sharing items with friends, family, and neighbors.' as description,
  'dark' as theme,
  (CASE WHEN $session_username IS NULL THEN 
    json_object('title', 'Login',
                'link', '/login.sql')
    ELSE
    json_object('title', $session_username,
                'submenu', json_array(
                  json_object('title', 'My Items',
                              'link', '/items.sql?owner_id=' || $session_user),
                  json_object('title', 'My Shelves',
                              'link', '/shelves.sql?owner_id=' || $session_user),
                  json_object('title', 'My Profile',
                              'link', '/profile.sql'),
                  json_object('title', 'Logout',
                              'link', '/logout.sql')
                )
    )
  END) as menu_item;

SELECT 'alert' as component,
  'Info' as 'title',
  'check' as icon,
  'green' as color,
  TRUE as dismissible,
  $pop_info as description
  WHERE $pop_info IS NOT NULL;