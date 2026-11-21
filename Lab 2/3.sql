select c.course_id, 
count (*) as students_appeared,
round(avg(e.marks),2) as average_marks,
max(e.marks) as top_marks
from course c 
join exam e on c.course_id = e.course_id
group by c.course_id
order by c.course_id asc;
