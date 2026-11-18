SELECT *
FROM Matches
WHERE total_goals != (home_goals + away_goals)
   OR total_goals IS NULL
   OR home_goals IS NULL
   OR away_goals IS NULL;


SELECT * 
FROM Matches
WHERE 
home_goals > away_goals AND result NOT IN ('H') OR
home_goals < away_goals AND result NOT IN ('A') OR
home_goals = away_goals AND result NOT IN ('D');


SELECT season,match_date,home_team,away_team,league_id ,COUNT (*) AS duplicate_count
FROM Matches
GROUP BY season,match_date,home_team,away_team,league_id
HAVING COUNT (*) > 1
