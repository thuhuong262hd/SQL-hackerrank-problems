SELECT IF(gr.Grade >= 8, st.Name, "NULL" ) AS Name, gr.Grade, st.Marks
FROM 
    Students st
LEFT JOIN Grades gr ON (gr.Min_Mark <= st.Marks AND st.Marks <= Max_Mark)
ORDER BY 
    Grade DESC, 
    CASE WHEN Grade >= 8 THEN Name END ASC,
    CASE WHEN Grade < 8 THEN Marks END ASC;