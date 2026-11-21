select student_id, name 
from student
where student_id not in (
  select student_id 
  from exam
  where student_id is not null
)
order by student_id
