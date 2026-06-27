git clone https://github.com/YOUR-USERNAME/team-project-tracker.git
cd team-project-tracker

สมมติว่า Developer A ได้รับมอบหมายให้เพิ่มงานใหม่เข้าไปในระบบ กฎของทีมคือ ห้ามแก้บน main โดยตรง ให้สร้าง Branch ของตัวเอง:

# สร้างและสลับไปยัง branch ของงานนั้นๆ
git checkout -b feature/add-new-task

จากนั้นให้ Developer A ทำการแก้ไขเพิ่มข้อมูลใน tasks.json แล้วลองรันสคริปต์ตรวจความถูกต้อง:

บน Linux: bash run-check.sh

บน Windows: .\run-check.ps1

เมื่อตรวจสอบผ่านแล้ว ให้สั่ง Commit และ Push ขึ้น GitHub:

git add tasks.json
git commit -m "feat: add initial system architecture task"
git push origin feature/add-new-task

ขั้นที่ 3: การบริหารทีมใน Repository (Pull Request & Code Review)
ให้ผู้สอนเปิดหน้า GitHub ของ Repository นั้น จะพบปุ่ม "Compare & pull request" ขึ้นมา

สาธิตการสร้าง Pull Request (PR) จาก feature/add-new-task เข้าสู่ main

การทำ Code Review (บทบาท Team Lead):

ชี้ให้ทีมดูเมนู Files changed เพื่อตรวจดูโค้ดที่เปลี่ยนไป

สาธิตการเขียนคอมเมนต์แนะนำหรือกด Approve

กด Merge pull request เพื่อรวมงานเข้าสู่ส่วนกลาง

ขั้นที่ 4: การรับมือกับ Git Conflict (เมื่อทีมส่งงานชนกัน)
นี่คือจุดที่สร้างความปวดหัวให้ทีมมากที่สุด และเหมาะกับการสาธิตมาก:

สมมติให้ Developer B แก้ไขไฟล์ tasks.json ที่บรรทัดเดียวกันในเครื่องของตนเอง (โดยที่ยังไม่ได้ดึงอัปเดตล่าสุดจาก main)

เมื่อ Developer B พยายามจะรวมงาน จะเกิด Conflict (การขัดกันของโค้ด)

สาธิตวิธีแก้ปัญหาแก้ Conflict โดยสั่งดึงโค้ดล่าสุดมาเคลียร์ในเครื่องก่อน:

git checkout main
git pull origin main
git checkout feature/b-task
git merge main

เปิดโปรแกรมแก้ไขโค้ด (เช่น VS Code) แสดงให้ทีมเห็นสัญลักษณ์ <<<<<<< HEAD และ >>>>>>> main จากนั้นเลือกโค้ดเวอร์ชันที่ถูกต้องร่วมกัน แก้ไขเสร็จแล้วทำตามขั้นตอนนี้เพื่อปิดงาน:

git add tasks.json
git commit -m "fix: resolve merge conflict with main"
git push origin feature/b-task


ภารกิจที่ 1 (ง่าย): ให้สมาชิกในทีมสร้าง Branch ใหม่ แล้วเข้าไปเปลี่ยน "status" ของ TASK-002 จาก "In Progress" เป็น "Completed"

ภารกิจที่ 2 (ท้าทาย): ให้เพิ่ม Object ของงานใหม่ลงใน Array "tasks" (เช่น TASK-004) จากนั้นลองแกล้งลืมใส่เครื่องหมายจุลภาค ( , ) คั่นระหว่างบล็อก แล้วสั่งรันสคริปต์ run-check เพื่อดูว่าระบบจะแจ้งเตือนความผิดพลาดของ JSON อย่างไร ก่อนที่จะแก้ให้ถูกต้องแล้วส่ง Push ขึ้นไปทำ Pull Request ครับ
