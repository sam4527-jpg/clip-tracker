# ระบบคุมคลิป (GitHub Pages + Supabase)

## 1) Supabase (ฐานข้อมูล + ล็อกอิน) — supabase.com
1. สมัคร > New project (ตั้งรหัสฐานข้อมูลแล้วจดไว้)
2. SQL Editor > วางไฟล์ `setup.sql` > Run
3. Authentication > Sign In / Providers (หรือ Settings) > ปิด "Allow new users to sign up"
4. Authentication > Users > Add user > ใส่อีเมล+รหัสผ่านให้ทีมทีละคน (ติ๊ก Auto Confirm)
5. Project Settings > API > คัดลอก **Project URL** และคีย์ **anon / publishable**
   (ห้ามใช้ service_role เด็ดขาด)

## 2) แก้ index.html
ค้นหา `YOUR-PROJECT` แล้วใส่ URL และ KEY ลงใน 2 ค่า `SUPABASE_URL`, `SUPABASE_KEY`

## 3) GitHub — github.com
1. New repository (Public) > Add file > Upload files > ลาก `index.html`, `setup.sql`, `README.md`
2. Add file > Create new file > ตั้งชื่อ `.github/workflows/keep-alive.yml` > วางเนื้อหาจากไฟล์ที่ให้ไป > Commit
3. Settings > Pages > Deploy from a branch > main / (root) > Save
   รอ 1-2 นาที จะได้ลิงก์ `https://ชื่อคุณ.github.io/ชื่อrepo/`
4. Settings > Secrets and variables > Actions > New repository secret
   - `SUPABASE_URL` = Project URL
   - `SUPABASE_KEY` = anon/publishable key
5. แท็บ Actions > keep-supabase-awake > Run workflow (ลองกดครั้งแรกให้เป็นสีเขียว)

## ข้อควรรู้
- ตัวเว็บ (โค้ด) เป็นสาธารณะ แต่ข้อมูลคลิปอ่านได้เฉพาะคนที่ล็อกอินเท่านั้น
- Supabase ฟรีจะพักโปรเจกต์ถ้าไม่มีการใช้งาน 7 วัน ถ้าถูกพัก เข้า dashboard กด Restore
- GitHub อาจปิด schedule อัตโนมัติถ้า repo ไม่มีความเคลื่อนไหว 60 วัน
  ให้กด Run workflow เองอีกครั้ง หรือแก้ไฟล์ใดก็ได้ 1 ครั้ง
- วิดีโอเก็บใน Google Drive แล้ววางลิงก์ (ที่เก็บไฟล์ฟรีของ Supabase ไม่พอสำหรับวิดีโอ)
