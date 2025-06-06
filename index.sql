SELECT 'dynamic' as component,
  sqlpage.run_sql('shell.sql') as properties
;


SELECT 'hero' as component,
  'Kulukin' as title,
  'The distributed library' as description,
  '/images/library-splash.jpg' as image;
SELECT
  'Any item' as title,
  'Books, tools, *anything* you want to loan' as description_md,
  'infinity' as icon,
  'blue' as color;
SELECT
  'Anywhere' as title,
  'Create shelves for wherever your items live' as description,
  'building-community' as icon,
  'yellow' as color;
SELECT
  'Community-powered' as title,
  'Share your items with friends, family, and neighbors' as description,
  'heart-handshake' as icon,
  'red' as color;