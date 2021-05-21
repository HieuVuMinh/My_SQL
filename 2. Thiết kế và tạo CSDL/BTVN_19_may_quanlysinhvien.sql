create database BTVN_19_may_quanlysinhvien;
use BTVN_19_may_quanlysinhvien;

Create table students(
	studentId int(4) not null primary key,
    studentName varchar(50) not null,
    age int(4) null,
    email varchar(100) null
);

Create table classes(
	classId int(4) not null primary key,
    className varchar(50)
);

Create table subjects(
	subjectsId int(4) not null primary key,
    subjectsName varchar(50) not null
);

Create table mark(
	subjects_Id int,
    foreign key (subjects_Id) REFERENCES subjects(subjectsId),
	student_Id int,
    foreign key (student_Id) REFERENCES students(studentId),
	mark int
);

Create table classStudent(
    studentId int,
    classId int,
	primary key (studentId, classId)
);

insert into students
value (1, 'Nguyen Quang An', 18, 'an@yahoo.com'),
	  (2, 'Nguyen Cong Vinh', 20, 'vinh@gmail.com'),
	  (3, 'Nguyen Van Quyen', 19, 'quyen@yahoo.com'),
	  (4, 'Pham Thanh Binh', 25, 'binh@gmail.com'),
	  (5, 'Nguyen Van Tai Em', 30, 'taiem@sport.vn');
      
insert classes
value (1, 'C0706L'),
	  (2, 'C0708G');
      
insert classStudent
value (1, 1),
	  (2, 1),
	  (3, 2),
	  (4, 2),
	  (5, 2);
      
insert Subjects
value (1, 'SQL'),
	  (2, 'Java'),
	  (3, 'C'),
	  (4, 'Visual Basic');
      
insert into mark
values (1, 1, 8),
	   (2, 1, 4),
	   (1, 1, 9),
	   (1, 3, 7),
	   (1, 4, 3),
       (2, 5, 5),
       (3, 3, 8),
       (3, 5, 1),
       (2, 4, 3);
      
-- 1.Hien thi danh sach tat ca cac hoc vien (danh sach phai sap xep theo ten hoc vien)
select * from students 
order by studentName DESC;

-- 2.Hien thi danh sach tat ca cac mon hoc
select subjectsName
from subjects;

-- 3.Hien thi danh sach nhung hoc vien nao co dia chi email chinh xac
select email
from students
where email like '%gmail.com%';

-- 4.Hien thi danh sach nhung hoc vien nao co Ho la Nguyen
select studentName
from students
where studentName like 'Nguyen%';

-- 5.Hien thi danh sach cac ban hoc vien cua lop C0706L
select s.studentName 
from students s join classStudent cs on s.studentId = cs.studentId join classes c on c.classId = cs.classId
where className like 'C0706L';

-- 6. Hien danh sach va diem cua hoc vien ung voi cac mon hoc
select s.studentName, sub.subjectsName, m.mark
from students s join mark m on s.studentId = m.student_Id 
join subjects sub on m.subjects_Id = sub.subjectsId
order by s.studentName DESC;

-- 7.Hien thi danh sach hoc vien chua thi mon nao (chua co diem)
select studentName
from students 
where studentId not in (select student_Id from mark);

-- 8.Hien thi mon hoc chua duoc hoc vien nao thi
select subjectsName
from subjects 
where subjectsId not in (select subjects_Id from mark);

-- 9.Tinh diem trung binh cho cac hoc vien
select s.studentName, avg (m.mark) as DiemTrungBinh
from students s join mark m on m.student_Id = s.studentId
group by s.studentName;

-- 10.Hien thi mon hoc nao duoc thi nhieu nhat
select sub.subjectsName, max(m.subjects_Id) as MonThiNhieuNhat
from subjects sub join mark m on m.subjects_Id = sub.subjectsId;

-- 11.Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
select sub.subjectsName, max(m.mark) as DiemCaoNhat
from subjects sub join mark m on m.subjects_Id = sub.subjectsId;

-- 12.Hien thi mon hoc nao co nhieu diem duoi diem trung binh nhat ( <5)
select sub.subjectsName
from subjects sub join mark m on m.subjects_Id = sub.subjectsId
where m.mark < 5
having max(m.subjects_Id);

-- 13.Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
alter table students 
ADD CONSTRAINT myCheckConstraint CHECK(age > 15 and age < 50);

-- 14.Loai bo tat ca quan he giua cac bang
alter table mark
drop foreign key mark_ibfk_1;

alter table mark 
add constraint mark_ibfk_1
foreign key (subjects_Id) references subjects(subjectsId);

-- 15.Xoa hoc vien co StudentID la 1
delete from students 
where studentId = '1';

-- 16.Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
alter table students
add status bit default 1;

-- 17.Cap nhap gia tri Status trong bang Student thanh 1
update students
set status = 1;




