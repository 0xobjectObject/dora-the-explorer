-- +goose Up
-- +goose StatementBegin

CREATE TABLE IF NOT EXISTS "forks"
(
    "forkid" bigserial NOT NULL,
    "parent_fork" bigint NOT NULL,
    "origin_slot" bigint NOT NULL,
    "origin_root" bytea NOT NULL,
    "head_slot" bigint NOT NULL,
    "head_root" bytea NOT NULL,
    "block_count" int NOT NULL,
    CONSTRAINT "forks_pkey" PRIMARY KEY ("forkid")
);

CREATE INDEX IF NOT EXISTS "fork_origin_root_idx"
    ON "forks" 
    ("origin_root" ASC);

CREATE INDEX IF NOT EXISTS "fork_origin_slot_idx"
    ON "forks" 
    ("origin_slot" ASC);

ALTER TABLE "orphaned_blocks"
    ADD COLUMN "forkid" BIGINT NOT NULL DEFAULT 0;

CREATE INDEX IF NOT EXISTS "orphaned_blocks_forkid_idx"
    ON "orphaned_blocks" 
    ("forkid" ASC);

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
SELECT 'NOT SUPPORTED';
-- +goose StatementEnd
