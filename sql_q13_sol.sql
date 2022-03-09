-- Write a SQL query to find all the defenders who scored a goal for their teams.

SELECT player_name
FROM goal_details
JOIN player_mast USING (player_id)
JOIN soccer_country ON soccer_country.country_id = goal_details.team_id
WHERE posi_to_play = 'DF'
GROUP BY player_name;

/*
+------------------------+
| player_name            |
+------------------------+
| Fabian Schar           |
| Vasili Berezutski      |
| Gerard Pique           |
| Ciaran Clark           |
| Gareth McAuley         |
| Birkir Saevarsson      |
| Neil Taylor            |
| Jerome Boateng         |
| Toby Alderweireld      |
| Giorgio Chiellini      |
| Arnor Ingvi Traustason |
| Ashley Williams        |
| Leonardo Bonucci       |
+------------------------+
*/
