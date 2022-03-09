# Euro Cup Data Analysis

## Creating the database
I used an ubuntu VM as a development environment. I installed mysql from the package manager with the following command:
```
sudo apt install mysql -y
```

After installing mysql I logged into the server using the debian defaults-file:
```
sudo mysql --defaults-file=/etc/mysql/debian.cnf
```

Once logged in, I created a new database and enabled loading local data [after consulting stack overflow](https://stackoverflow.com/questions/59993844/error-loading-local-data-is-disabled-this-must-be-enabled-on-both-the-client).
```
mysql> SET GLOBAL local_infile=1;
mysql> CREATE SCHEMA euro_cup_2016;
```

## Loading the data
The file `load.sql` defines the tables and loads them from the .csv files.

```
$ mysql -D euro_cup_2016 -p  --load-data-local-dir=. < load.sql

```

## Weird issues with data

1. The data has CRLF endings. So when loading the data you need to specify CRLF endings with `LINES TERMINATED BY '\r\n'` in load.sql (see below).
```
LOAD DATA LOCAL INFILE 'soccer_city.csv'
INTO TABLE soccer_city
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
```

2. The goal_score field in match_mast table has some werid values in it. It feels like the file was autoformatted by excel before being exported as a CSV. I wrote the following query to replace the values from the corresponding values in match_details.

```
WITH fix as (
    SELECT
        d1.match_no,
        CASE
            WHEN CAST(LEFT(m.goal_score, 2) AS UNSIGNED) = d1.goal_score THEN
                CONCAT(d1.goal_score, '-', d2.goal_score)
            ELSE
                CONCAT(d2.goal_score, '-', d1.goal_score)
        END AS goal_score
    FROM match_details AS d1
    JOIN match_details AS d2
        ON d1.match_no = d2.match_no AND d1.team_id < d2.team_id
    JOIN match_mast AS m
        ON d1.match_no = m.match_no
    WHERE m.goal_score LIKE '%Ja' OR m.goal_score LIKE '%Fe' OR m.goal_score LIKE '%Ma')

UPDATE match_mast AS m
INNER JOIN fix on m.match_no = fix.match_no
SET m.goal_score = fix.goal_score;
```

