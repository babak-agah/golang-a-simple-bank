-- name: CreateTransfer :one
InSERT INTO transfers (
    from_account_id,
    to_account_id,
    amount
) VALUES (
    $1, $2, $3
) RETURNING *;


-- name: GetTrasfer :one
SELECT * FROM transfers
WHERE id = $1 LIMIT 1;

-- name: ListTransfers :many
SELECT * FROM transfers
WHERE from_account_id = $1 or to_account_id = $2
ORDER BY id
LIMIT $3
OFFSET $4;

