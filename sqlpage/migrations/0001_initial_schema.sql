CREATE TABLE user (
  id INTEGER PRIMARY KEY,
  username TEXT NOT NULL,
  password_hash TEXT NOT NULL,
  email TEXT NOT NULL,
  admin INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE login_sessions (
  session_id TEXT PRIMARY KEY,
  user_id INTEGER REFERENCES user(id) ON DELETE CASCADE,
  start_time INTEGER NOT NULL DEFAULT (unixepoch('now'))
);

CREATE TABLE item (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  owner_id INTEGER REFERENCES user(id) ON DELETE CASCADE,
  shelf_id INTEGER REFERENCES shelf(id) ON DELETE SET NULL
);

CREATE TABLE shelf (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  owner_id INTEGER REFERENCES user(id) ON DELETE CASCADE
);