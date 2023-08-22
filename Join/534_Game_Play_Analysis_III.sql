
SELECT A1.player_id, A1.event_date, SUM(A2.games_played) games_played_so_far
FROM Activity AS A1
INNER JOIN Activity AS A2
-- the matched data from A2 include all records happened before or exactly on a1.event_date of the according record in A1
ON A1.player_id = A2.player_id AND A1.event_date >= A2.event_date
GROUP BY A1.player_id, A1.event_date 