-- Write a SQL query to find referees and the number of bookings they made for the entire tournament. Sort your answer by the number of bookings in descending order

SELECT referee_name, count(*) as count
FROM referee_mast
JOIN match_mast USING (referee_id)
JOIN player_booked USING (match_no)
GROUP BY referee_name
ORDER BY count DESC;
/*
+-------------------------+-------+
| referee_name            | count |
+-------------------------+-------+
| Mark Clattenburg        |    21 |
| Nicola Rizzoli          |    20 |
| Milorad Mazic           |    13 |
| Bjorn Kuipers           |    12 |
| Viktor Kassai           |    12 |
| Sergei Karasev          |    12 |
| Damir Skomina           |    12 |
| Cuneyt Cakir            |    11 |
| Jonas Eriksson          |    11 |
| Pavel Kralovec          |    11 |
| Szymon Marciniak        |    10 |
| Carlos Velasco Carballo |    10 |
| Martin Atkinson         |     9 |
| Ovidiu Hategan          |     9 |
| Felix Brych             |     9 |
| Svein Oddvar Moen       |     8 |
| William Collum          |     8 |
| Clement Turpin          |     3 |
+-------------------------+-------+
*/