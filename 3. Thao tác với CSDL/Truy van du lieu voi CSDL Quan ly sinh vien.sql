insert class
values (1, "A1", "20081220", 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

insert subject 
values (1, 'CF', 5, 1),
		(2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

insert student 
values (2, 'Nam', 'HP', '0123654886', 1, 1),
		(3, 'Quan', 'HN', '011114477', 1, 2),
        (4, 'Toan', 'ND', '033369852', 0, 3);
		
INSERT quanlysinhvien.mark
VALUES (1, 1, 1, 8, 1),
       (2, 3, 1, 10, 2),
       (3, 2, 1, 12, 1);
       
select * from student
where status = true;

select * from subject 
where credit < 10;

select s.studentId, s.studentName, c.className from student s
join class c on s.classId = c.classId
where c.className = 'a1';

-- Hiển thị điểm môn CF của các học viên
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on Sub.SubId = M.SubId
where sub.subName = 'cf';
-- Hiển thị tất cả các điểm đang có của học viên
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on Sub.SubId = M.SubId;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student
where StudentName like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
select * from class
where month(startDate) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-6
select * from subject
where Credit between 3 and 6;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hieu’ là 2
update student 
set classId = 2 where studentName = 'Hieu';

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần
select s.studentName, s.studentId, m.mark 
from Student s join mark m on s.studentId = m.studentId 
order by m.mark desc;
