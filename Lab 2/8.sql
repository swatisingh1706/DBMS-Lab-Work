select student_id from exam
where marks>=85
intersect
select student_id from exam 
where course_id=201 
order by student_id;
