SELECT
    ROUND(
        COUNT(DISTINCT a.player_id) /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM Activity a
JOIN Activity b
    ON a.player_id = b.player_id
    AND b.event_date = DATE_ADD(a.event_date, INTERVAL 1 DAY)
WHERE (a.player_id, a.event_date) IN (
    SELECT
        player_id,
        MIN(event_date)
    FROM Activity
    GROUP BY player_id
);
