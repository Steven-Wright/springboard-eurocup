-- Write a SQL query to find the referees who booked the most number of players.
WITH bookings_by_referee AS (
    SELECT referee_name, count(*) as bookings
    FROM referee_mast
    JOIN match_mast USING (referee_id)
    JOIN player_booked USING (match_no)
    GROUP BY referee_name
    ORDER BY bookings DESC
)

SELECT referee_name
FROM bookings_by_referee
WHERE bookings = (SELECT max(bookings) FROM bookings_by_referee);

/*

I used a CTE instead of just order and limit because refs could tie for most bookings

+------------------+
| referee_name     |
+------------------+
| Mark Clattenburg |
+------------------+
*/