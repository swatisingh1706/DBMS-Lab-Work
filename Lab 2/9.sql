create view  course_report as 
select c.course_id, c.course_name, round(avg(e.marks), 2) as average_marks
from course c
join exam e on c.course_id=e.course_id
group by c.course_id, c.course_name;
