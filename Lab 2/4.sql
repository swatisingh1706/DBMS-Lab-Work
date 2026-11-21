SELECT
    s.name AS name,
    c.course_name,
    e.marks
FROM exam e
JOIN student s ON e.student_id = s.student_id
JOIN course c ON e.course_id = c.course_id
ORDER BY e.marks DESC, s.name ASC;
