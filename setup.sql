-- วางทั้งหมดนี้ใน Supabase > SQL Editor แล้วกด Run (ทำครั้งเดียว)
create table if not exists clips  (id text primary key, data jsonb not null default '{}'::jsonb);
create table if not exists config (id text primary key, data jsonb not null default '{}'::jsonb);
alter table clips  enable row level security;
alter table config enable row level security;
-- เฉพาะผู้ใช้ที่ล็อกอินแล้วเท่านั้นที่อ่าน/เขียนได้
create policy "team all clips"  on clips  for all to authenticated using (true) with check (true);
create policy "team all config" on config for all to authenticated using (true) with check (true);
