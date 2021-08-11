--INSERT INTO Players(playerID, teamID, joinDate, rating, isStarter)
--VALUES(1, 202, '2021-01-31', 'L', TRUE);

UPDATE Players
	SET rating = 'L'
	WHERE playerID > 0;


