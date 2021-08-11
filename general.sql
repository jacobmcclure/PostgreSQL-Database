ALTER TABLE GamePlayers
	ADD CONSTRAINT reasonable_salary
	CHECK (minutesPlayed >= 0);

ALTER TABLE Players
	ADD CONSTRAINT legal_rating
	CHECK (rating LIKE 'L'
		OR rating LIKE 'M'
		OR rating LIKE 'H'
		OR rating IS NULL);

ALTER TABLE Games
	ADD CONSTRAINT null_twice
	CHECK (homePoints IS NOT NULL OR visitorPoints IS NULL);

