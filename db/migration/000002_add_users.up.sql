CREATE TABLE users (
  username varchar(64) PRIMARY KEY,
  hashed_password varchar(64) NOT NULL,
  full_name varchar(64) NOT NULL,
  email varchar(64) UNIQUE NOT NULL,
  password_changed_at timestamp NOT NULL DEFAULT current_timestamp(),  
  created_at timestamp NOT NULL DEFAULT current_timestamp()
);

ALTER TABLE accounts ADD FOREIGN KEY (owner) REFERENCES users (username);

-- CREATE UNIQUE INDEX ON accounts (owner, currency);
ALTER TABLE accounts ADD CONSTRAINT owner_currency_key UNIQUE (owner, currency);
