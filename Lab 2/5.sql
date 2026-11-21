SELECT
    s.student_id,
    s.name,
    COUNT(e.exam_id) AS exams_taken
FROM student s
LEFT JOIN exam e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name
ORDER BY s.student_id ASC;
