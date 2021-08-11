-- Helper Views for "Messy Statistics" Query (2.6.2): 
CREATE VIEW LossDiffs(teamID, teamName, lossDiff) AS                                   
        SELECT teamID, teamName, totalLosses - computedLosses AS lossDiff
        FROM LossesDisagree 
;

CREATE VIEW WinDiffs(teamID, teamName, winDiff) AS 
        SELECT teamID, teamName, totalWins - computedWins AS winDiff 
        FROM WinsDisagree   
;

-- MESSY STATISTCS QUERY:
SELECT wd.teamID, wd.teamName as teamName, winDiff, lossDiff, COUNT(p.teamID) AS numPlayers
FROM WinDiffs wd, LossDiffs ld, Players p
WHERE wd.teamID = ld.teamID
	AND wd.teamID = p.teamID
GROUP BY wd.teamID, wd.teamName, winDiff, lossDiff
HAVING winDiff != 0 AND lossDiff != 0
;

-- OUTPUT:
-- teamid |  teamname  | windiff | lossdiff | numplayers
-- -------+------------+---------+----------+------------
--    203 | Peaches    |       1 |       -1 |          3
--    209 | Lone Stars |      -1 |       -2 |          2

-- Remve the two specified games:
DELETE FROM Games
WHERE gameID = 10005
	OR gameID = 10001
;

-- Run the Messy Statistics query once more
SELECT wd.teamID, wd.teamName as teamName, winDiff, lossDiff, COUNT(p.teamID) AS numPlayers
FROM WinDiffs wd, LossDiffs ld, Players p
WHERE wd.teamID = ld.teamID
        AND wd.teamID = p.teamID
GROUP BY wd.teamID, wd.teamName, winDiff, lossDiff
HAVING winDiff != 0 AND lossDiff != 0
;

-- [NEW] OUTPUT:
-- teamid |  teamname  | windiff | lossdiff | numplayers
-- -------+------------+---------+----------+------------ 
--    201 | Birds      |       1 |        1 |          2
--    209 | Lone Stars |      -1 |       -2 |          2
