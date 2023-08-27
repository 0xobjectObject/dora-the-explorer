-- +goose Up
-- +goose StatementBegin

CREATE TABLE IF NOT EXISTS public."forks"
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
    ON public."forks" 
    ("origin_root" ASC NULLS LAST);

CREATE INDEX IF NOT EXISTS "fork_origin_slot_idx"
    ON public."forks" 
    ("origin_slot" ASC NULLS LAST);

ALTER TABLE IF EXISTS public."orphaned_blocks"
    ADD COLUMN "forkid" bigint NOT NULL DEFAULT 0;

CREATE INDEX IF NOT EXISTS "orphaned_blocks_forkid_idx"
    ON public."orphaned_blocks" 
    ("forkid" ASC NULLS LAST);

-- +goose StatementEnd
-- +goose Down
-- +goose StatementBegin
SELECT 'NOT SUPPORTED';
-- +goose StatementEnd
