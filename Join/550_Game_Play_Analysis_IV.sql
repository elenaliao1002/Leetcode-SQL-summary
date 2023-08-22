WITH MIN_DAY AS
(
    SELECT player_id, MIN(event_date) event_date
    FROM Activity
    GROUP BY player_id
)
, consecutive_cnt AS
(   -- use distinct to avoid duplicate count
    SELECT CAST(COUNT(DISTINCT A1.player_id) AS FLOAT) cnt
    FROM MIN_DAY A1
    INNER JOIN Activity A2
    -- using join on next day to filter two consecutive days
        ON A1.event_date = DATEADD(DAY,-1,A2.event_date) AND A1.player_id = A2.player_id)

SELECT 
  ROUND(
    -- *1.0 to convert to float 
    (SELECT cnt FROM consecutive_cnt)*1.0 / (SELECT CAST(COUNT(DISTINCT player_id) AS FLOAT) FROM Activity) , 2
    ) fraction
