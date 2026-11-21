SELECT
    f1.name AS faculty1,
    f2.name AS faculty2,
    f1.department AS department
FROM faculty f1
JOIN faculty f2
    ON f1.department = f2.department
    AND f1.faculty_id < f2.faculty_id
ORDER BY department ASC, faculty1 ASC;
