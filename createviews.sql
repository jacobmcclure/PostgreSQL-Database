-- Helper View that contains a list of each game winner's teamID (including duplicates)
CREATE VIEW Winners(teamID) AS
	SELECT w.teamID
	FROM Teams w, Teams l, Games g
	WHERE ((w.teamID = g.homeTeam AND l.teamID = g.visitorTeam) AND (g.homePoints > g.visitorPoints)
		OR (l.teamID = g.homeTeam AND w.teamID = g.visitorTeam) AND (g.homePoints < g.visitorPoints))
		AND (g.homePoints IS NOT NULL AND g.visitorPoints IS NOT NULL)
	ORDER BY w.teamID
;

-- View "a)", which contains teams whose totalWins and computedWins are unequal
CREATE VIEW WinsDisagree(teamID, teamName, totalWins, computedWins) AS
	SELECT t.teamID, name, totalWins, COUNT(t.teamID) AS computedWins
	FROM Teams t, Winners w
	WHERE w.teamID = t.teamID
		AND t.teamID IN (SELECT teamID
				 FROM Winners)
	GROUP BY t.teamID
	HAVING COUNT(t.teamID) != t.totalWins
;

-- Helper View that contains a list of each game loser's teamID (including duplicates)
CREATE VIEW Losers(teamID) AS
	SELECT l.teamID
	FROM Teams w, Teams l, Games g
	WHERE ((w.teamID = g.homeTeam AND l.teamID = g.visitorTeam) AND (g.homePoints > g.visitorPoints)                          OR (l.teamID = g.homeTeam AND w.teamID = g.visitorTeam) AND (g.homePoints < g.visitorPoints))
		AND (g.homePoints IS NOT NULL AND g.visitorPoints IS NOT NULL)
	ORDER BY l.teamID
;

-- View "b)", which contains teams whose totalLosses and computedLosses are unequal
CREATE VIEW LossesDisagree(teamID, teamName, totalLosses, computedLosses) AS
	SELECT t.teamID, name, totalLosses, COUNT(t.teamID) AS computedLosses
	FROM Teams t, Losers l
	WHERE l.teamID = t.teamID
		AND t.teamID IN (SELECT teamID
				 FROM Losers)
	GROUP BY t.teamID
	HAVING COUNT(t.teamID) != t.totalLosses
;


