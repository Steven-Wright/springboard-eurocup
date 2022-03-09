-- Write a SQL query that returns the total number of goals scored by each position on each country’s team. Do not include positions which scored no goals.

SELECT country_name, posi_to_play, count(*)
FROM goal_details
JOIN player_mast USING (player_id)
JOIN soccer_country ON soccer_country.country_id = goal_details.team_id
GROUP BY country_name, posi_to_play;

/*
+---------------------+--------------+----------+
| country_name        | posi_to_play | count(*) |
+---------------------+--------------+----------+
| France              | FD           |        9 |
| Romania             | FD           |        2 |
| France              | MF           |        4 |
| Switzerland         | DF           |        1 |
| Wales               | FD           |        6 |
| Slovakia            | MF           |        3 |
| England             | MF           |        1 |
| Russia              | DF           |        1 |
| Croatia             | MF           |        4 |
| Poland              | FD           |        2 |
| Germany             | FD           |        3 |
| Germany             | MF           |        3 |
| Spain               | DF           |        1 |
| Republic of Ireland | MF           |        3 |
| Republic of Ireland | DF           |        1 |
| Italy               | MF           |        1 |
| Italy               | FD           |        3 |
| Hungary             | FD           |        4 |
| Hungary             | MF           |        1 |
| Portugal            | FD           |        8 |
| Iceland             | MF           |        3 |
| Russia              | MF           |        1 |
| Switzerland         | FD           |        1 |
| England             | FD           |        3 |
| Northern Ireland    | DF           |        2 |
| Northern Ireland    | FD           |        1 |
| Czech Republic      | FD           |        2 |
| Spain               | FD           |        4 |
| Belgium             | FD           |        3 |
| Belgium             | MF           |        5 |
| Iceland             | DF           |        2 |
| Albania             | FD           |        1 |
| Wales               | MF           |        1 |
| Wales               | DF           |        2 |
| Poland              | MF           |        2 |
| Turkey              | FD           |        1 |
| Turkey              | MF           |        1 |
| Croatia             | FD           |        1 |
| Iceland             | FD           |        4 |
| Austria             | MF           |        1 |
| Switzerland         | MF           |        1 |
| Germany             | DF           |        1 |
| Belgium             | DF           |        1 |
| Italy               | DF           |        2 |
| Portugal            | MF           |        1 |
+---------------------+--------------+----------+
*/
