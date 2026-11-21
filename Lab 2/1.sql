insert into exam (exam_id, student_id, course_id, marks)
values (312, 108, 204, 72);

insert into exam (exam_id, student_id, course_id, marks)
values(313, 106, 204, 68);

update exam
set marks=75
where student_id=103 and course_id=203;

delete from exam
where exam_id=307;
