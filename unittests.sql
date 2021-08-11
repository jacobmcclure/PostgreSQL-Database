-- FOREIGN KEY CONSTRAINT TESTS:
INSERT INTO Teams(teamID, coachID)
	VALUES(305, 37);

INSERT INTO GamePlayers
	VALUES(20000, 2, 45);

INSERT INTO GamePlayers
	VALUES(10002, 77, 5);

-- GENERAL CONSTRAINT TESTS:
-- First Constraint:
UPDATE GamePlayers
	SET minutesPlayed = 45
	WHERE playerID = 1;

UPDATE GamePlayers
	SET minutesPlayed = -1
	WHERE playerID = 1;

-- Second Constraint:
UPDATE Players
        SET rating = 'L'
        WHERE playerID > 0;	

UPDATE Players
	SET rating = 'Z'
	WHERE playerID > 0;

-- Third Constraint:
UPDATE Games
	SET homePoints = 24, visitorPoints = NULL
	WHERE gameDate < DATE '2022-02-12';

UPDATE Games
	SET homePoints = NULL, visitorPoints = 14;

