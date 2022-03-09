-- Write a SQL query to find the country where the most assistant referees come from, and the count of the assistant referees
WITH asst_refs_by_country AS (
    SELECT country_name, count(*) as asst_refs
    FROM soccer_country
    JOIN asst_referee_mast USING (country_id)
    GROUP BY country_name
    ORDER BY asst_refs DESC
)

SELECT *
FROM asst_refs_by_country
WHERE asst_refs = (SELECT MAX(asst_refs) FROM asst_refs_by_country);

/*
I used a CTE instead of just order and limit because countries could tie.

+--------------+-----------+
| country_name | asst_refs |
+--------------+-----------+
| England      |         4 |
+--------------+-----------+

*/
