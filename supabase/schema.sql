-- Monthly Expense Tracker: database schema for Supabase.
-- Run once in Supabase Dashboard → SQL Editor → New query → Run.
--
-- Each signed-in user owns a few JSON documents:
--   doc_id = 'recurring'   → recurring income/expense items with their per-month amount history
--   doc_id = 'm-YYYY-MM'   → one-off items and "paid" ticks for that month
-- Row Level Security makes every row readable and writable only by its owner.

create table if not exists public.ledger_docs (
  user_id    uuid        not null default auth.uid() references auth.users (id) on delete cascade,
  doc_id     text        not null check (doc_id ~ '^(recurring|m-[0-9]{4}-[0-9]{2})$'),
  body       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, doc_id),
  constraint ledger_docs_body_size check (octet_length(body::text) < 512000)
);

alter table public.ledger_docs enable row level security;

drop policy if exists "ledger_docs_select_own" on public.ledger_docs;
drop policy if exists "ledger_docs_insert_own" on public.ledger_docs;
drop policy if exists "ledger_docs_update_own" on public.ledger_docs;
drop policy if exists "ledger_docs_delete_own" on public.ledger_docs;

create policy "ledger_docs_select_own" on public.ledger_docs
  for select to authenticated using ((select auth.uid()) = user_id);

create policy "ledger_docs_insert_own" on public.ledger_docs
  for insert to authenticated with check ((select auth.uid()) = user_id);

create policy "ledger_docs_update_own" on public.ledger_docs
  for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);

create policy "ledger_docs_delete_own" on public.ledger_docs
  for delete to authenticated using ((select auth.uid()) = user_id);

-- Anonymous visitors get no access at all.
revoke all on public.ledger_docs from anon;
grant select, insert, update, delete on public.ledger_docs to authenticated;
