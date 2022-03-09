-- Write a SQL query to find the number of matches that were won by penalty shootout.

SELECT COUNT(*) FROM match_mast WHERE decided_by = 'P';

/*
mysql> SELECT COUNT(*) FROM match_mast WHERE decided_by = 'P';
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+
1 row in set (0.00 sec)
*/