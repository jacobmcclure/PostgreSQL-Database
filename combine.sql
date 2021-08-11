BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

UPDATE Persons p
SET name = pc.name, address = pc.address, salary = pc.salary,
        canBePlayer = FALSE, canBeCoach = FALSE
FROM PersonChanges pc
WHERE p.personID = pc.personID
        AND (pc.name != p.name
        OR pc.address != p.address
        OR pc.salary != p.salary)
;

INSERT INTO Persons(personID, name, address, salary, canBePlayer)
SELECT DISTINCT pc.personID, pc.name, pc.address, pc.salary, TRUE
FROM PersonChanges pc
WHERE pc.personID NOT IN (SELECT p.personID
				FROM Persons p
				WHERE p.personID = pc.personID);

COMMIT;
