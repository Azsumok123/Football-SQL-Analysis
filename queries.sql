--Home wins, away wins, and draws
SELECT result,
COUNT(match_id) AS Total_matches, 
100.0*COUNT(match_id) / (SELECT COUNT(match_id) FROM Matches) AS Percentage
FROM Matches
GROUP BY result;


--The 10 most common scorelines
SELECT TOP 10 home_goals, away_goals, COUNT(match_id) AS match_count, 100.0*COUNT(match_id) / (SELECT COUNT(match_id) FROM Matches) AS Percentage
FROM Matches
GROUP BY home_goals, away_goals
ORDER BY  Percentage DESC;


--Total and average goals by season
SELECT season, COUNT(match_id) AS Total_matches, SUM(total_goals) AS Total_goals, SUM(total_goals*1.0)/COUNT(match_id) AS Average_goals
FROM Matches
GROUP BY season
ORDER BY Total_goals DESC;


--Highest-scoring matches in each season
SELECT M.season, M.home_team, M.away_team, M.home_goals, M.away_goals, M.total_goals, M.match_date
FROM Matches AS M
JOIN (SELECT season, MAX(total_goals) AS max_goals
FROM Matches
GROUP BY season
) AS Mx
ON M.season = Mx.season
AND M.total_goals = Mx.max_goals
ORDER BY M.season;


--Matches scoring above their season average
SELECT M.season,M.home_team,M.away_team,M.total_goals,Mn.Average_goals
FROM Matches AS M
JOIN(SELECT season, AVG(total_goals*1.0) AS Average_goals
FROM Matches
GROUP BY season 
) AS Mn
ON M.season = Mn.season 
WHERE M.total_goals > Mn.Average_goals
ORDER BY M.season, M.total_goals DESC;


--Teams with most goals
SELECT TOP 10 T.team_name,SUM(CASE WHEN T.team_name=M.home_team THEN(M.home_goals) WHEN T.team_name=M.away_team THEN(M.away_goals) ELSE 0 END) AS Total_goals
FROM Teams AS T
JOIN Leagues AS L ON L.league_ID = T.league_id
JOIN Matches AS M ON T.team_name = M.home_team OR T.team_name = M.away_team
WHERE T.team_name = M.home_team OR
T.team_name = M.away_team
GROUP BY T.team_name
ORDER BY Total_goals DESC;

--Leagues with most goals on average
SELECT L.league_name, COUNT(L.league_name) AS Total_games, AVG(M.total_goals*1.0) AS Average_goals
FROM Leagues AS L
JOIN Matches AS M ON L.league_ID = M.league_id
GROUP BY L.league_name
ORDER BY Average_goals DESC;