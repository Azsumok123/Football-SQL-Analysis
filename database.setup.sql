UPDATE dbo.RawData
SET home_team = LOWER(home_team),
    away_team = LOWER(away_team);



CREATE TABLE Leagues(
league_id INT IDENTITY(1,1) PRIMARY KEY,
league VARCHAR(50),
league_name VARCHAR(50),
country VARCHAR(50)
);

INSERT INTO Leagues ( league, league_name, country)
SELECT league, league_name, country
FROM (
SELECT DISTINCT league, league_name, country
FROM dbo.RawData
) AS UniqueLeagues;



CREATE TABLE Teams (
team_id INT IDENTITY(1,1) PRIMARY KEY,
team_name VARCHAR(100) NOT NULL,
league_id INT FOREIGN KEY REFERENCES Leagues(league_id)
);

INSERT INTO dbo.Teams (team_name)
SELECT DISTINCT home_team
FROM RawData

UPDATE dbo.Teams
SET Teams.league_id = L.league_id
FROM dbo.Teams AS T
JOIN dbo.RawData AS R
ON T.team_name = R.home_team
JOIN dbo.Leagues AS L
ON R.league_name = L.league_name;



CREATE TABLE Matches (
match_id INT IDENTITY(1,1) PRIMARY KEY,
season VARCHAR(50),
match_date VARCHAR(50),
time time(7),
home_team VARCHAR(50),
away_team VARCHAR(50),
ht_result VARCHAR(50),
ft_result VARCHAR(50),
home_goals tinyint,
away_goals tinyint,
total_goals tinyint,
result VARCHAR(50),
first_goal_time tinyint,
all_goal_times VARCHAR(50),
league_id INT FOREIGN KEY REFERENCES Leagues(league_id)
);

INSERT INTO dbo.Matches (
season, match_date, time, home_team, away_team,
ht_result, ft_result, home_goals, away_goals, total_goals,
result, first_goal_time, all_goal_times,league_id
)
SELECT R.season, R.match_date, R.time, R.home_team, R.away_team, R.ht_result, R.ft_result, 
R.home_goals, R.away_goals, R.total_goals,
R.result, R.first_goal_time, R.all_goal_times, L.league_id
FROM dbo.RawData AS R
JOIN dbo.Leagues AS L
ON R.league = L.league;


