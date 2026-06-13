-- ============================================================
-- Finances • Perso — configuration Supabase (à exécuter UNE fois)
-- Coller dans : Supabase → SQL Editor → New query → Run
-- ============================================================

-- 1) Table de sauvegarde : une ligne par utilisateur (tout l'état de l'app en JSON)
create table if not exists public.finances (
  user_id    uuid primary key references auth.users(id) on delete cascade,
  data       jsonb       not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

-- 2) Sécurité (RLS) : chacun n'accède qu'à SA propre ligne
alter table public.finances enable row level security;

drop policy if exists "finances_select_own" on public.finances;
drop policy if exists "finances_insert_own" on public.finances;
drop policy if exists "finances_update_own" on public.finances;

create policy "finances_select_own" on public.finances
  for select using (auth.uid() = user_id);
create policy "finances_insert_own" on public.finances
  for insert with check (auth.uid() = user_id);
create policy "finances_update_own" on public.finances
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- 3) Temps réel : synchro live entre appareils
alter publication supabase_realtime add table public.finances;
