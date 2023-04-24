WITH A AS (
SELECT START_DATE,
    rank() over ( order by start_date) as rank_start
    FROM PROJECTS
WHERE START_DATE  NOT IN (SELECT END_DATE FROM PROJECTS)
)
, B AS (

SELECT END_DATE,
    rank() over ( order by end_date) as rank_end
    FROM PROJECTS
WHERE END_DATE  NOT IN (SELECT START_DATE FROM PROJECTS)
)

SELECT START_DATE,END_DATE
FROM A,B
where rank_start=rank_end
order by datediff(day,START_DATE,END_DATE), start_date