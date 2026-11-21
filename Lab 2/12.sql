with course_stats as (
  select course_id,
  count (distinct student_id) as total_students,
  avg(marks) as avg_marks
  from exam
  group by course_id
),
above_avg as(
  select e.course_id,
  count (*) as above_avg_count
  from exam e
  join course_stats cs on cs.course_id= e.course_id
  where e.marks>cs.avg_marks
  group by e.course_id
),
pass_stats as (
  select course_id,
  round (100.0 * SUM(CASE when marks>=40 then 1 else 0 end)/ count (*), 2) as pass_percentage
  from exam
  group by course_id
)
select cs.course_id,
cs.total_students,
coalesce(aa.above_avg_count, 0) as above_avg_count,
ps.pass_percentage
from course_stats cs
left join above_avg aa on aa.course_id = cs.course_id
join pass_stats ps on ps.course_id = cs.course_id
order by cs.course_id
