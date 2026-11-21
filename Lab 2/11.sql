select course_id, student_id, marks,
Rank() over(partition by course_id order by marks desc) as course_rank
from exam
order by course_id, course_rank, student_id
