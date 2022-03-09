-- Write a SQL query to find all the venues where matches with penalty shootouts were played
SELECT venue_name 
FROM soccer_venue 
JOIN match_mast USING (venue_id) 
WHERE decided_by = 'P';

/*
+-------------------------+
| venue_name              |
+-------------------------+
| Stade Geoffroy Guichard |
| Stade VElodrome         |
| Stade de Bordeaux       |
+-------------------------+
*/
