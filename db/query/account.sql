-- name: CreateAccount :execresult
INSERT INTO accounts (
  owner,
  balance,
  currency
) VALUES (
  ?, ?, ?
);

-- name: GetAccount :one
SELECT * FROM accounts
WHERE id = ? LIMIT 1;

-- name: GetAccountForUpdate :one
SELECT * FROM accounts
WHERE owner = ? LIMIT 1;

-- name: ListAccounts :many
SELECT * FROM accounts
WHERE owner = ?
ORDER BY id
LIMIT ?
OFFSET ?;

-- name: UpdateAccount :execresult
UPDATE accounts
SET balance = ?
WHERE id = ?;

-- name: AddAccountBalance :execresult
UPDATE accounts
SET balance = balance + sqlc.arg(amount)
WHERE id = sqlc.arg(id);

-- name: DeleteAccount :execresult
DELETE FROM accounts
WHERE id = ?;
