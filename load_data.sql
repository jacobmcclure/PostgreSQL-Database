-- Sample Script file to Populate a Volleyball database tables

-- Persons(personID, name, address, salary, canBePlayer, canBeManager)
COPY Persons FROM stdin USING DELIMITERS '|';
1|Kerri Walsh Jennings|12 Mockingbird Lane|95123.88|TRUE|TRUE
2|Misty May-Treanor|2753 Hoover Boulevard|90175.25|TRUE|FALSE
4|Andy Banachowski|5 Plum Terrace|83266.22|FALSE|TRUE
5|Kevin Hambly|29 Hickory Avenue|72356.12|FALSE|TRUE
6|Michelle Collier|631 Main Street|91000.00|FALSE|TRUE
8|Mick Haley|654 Tracy Court|65219.98|FALSE|TRUE
10|Joanne Persico-Smith|996 East Broadway|79622.33|FALSE|TRUE
12|Dan Fisher|68 North Elm Street|79135.84|FALSE|TRUE
13|Foluke Akinradewo|38 Cornell Avenue|87222.33|TRUE|TRUE
15|Karch Kiraly|612 Larchmont Drive|65432.11|TRUE|FALSE
16|Dax Holdren|96 California Avenue|52000.00|TRUE|FALSE
17|Annie Drews|316 Ravensclaw Lane|63185.22|TRUE|FALSE
19|Eugene Selznick|82 Maple Terrace|58137.64|TRUE|FALSE
21|Jordan Larson|531 Nassau Street|78915.63|TRUE|FALSE
22|Chiaka Ogbogu|29 Northpoint|85396.75|TRUE|FALSE
23|Yoko Zetterlund|3862 Middle Fork|87682.99|TRUE|FALSE
24|William Priddy|68 El Camino Real|84670.33|TRUE|FALSE
25|Tayyiba Haneef|247 West Oak Street|68027.44|TRUE|FALSE
26|Lauren Carlini|27431 Raven Way|59100.00|TRUE|FALSE
27|Matt Anderson|82 Llama Heights|43815.36|TRUE|FALSE
28|William Priddy|612 Mary Avenue|98358.67|TRUE|FALSE
\.

-- Teams(teamID, name, managerID, teamCity, teamColor, totalWins, totalLosses)
COPY Teams FROM stdin USING DELIMITERS '|';
201|Birds|1|San Francisco|red|2|3
202|Hollywoods|4|Los Angeles|yellow|1|2
203|Peaches|6|Atlanta|orange|3|0
204|Irons|10|Pittsburgh|purple|1|1
205|Skyscrapers|10|New York|blue|1|2
209|Lone Stars|13|Austin|green|1|0
\.

-- Players(pIayerID, teamID, joinDate, rating, isStarter)
COPY Players FROM stdin USING DELIMITERS '|';
1|201|2019-01-15|H|TRUE
2|201|2019-01-15|H|TRUE
13|202|2020-12-03|\N|TRUE
24|209|2018-07-06|H|TRUE
25|205|2020-01-27|M|TRUE
26|205|2019-11-03|H|TRUE
27|202|2019-08-31|M|TRUE
28|209|2019-08-31|L|TRUE
21|202|2021-02-28|L|FALSE
22|204|2018-10-30|H|TRUE
17|204|2019-04-17|M|TRUE
23|203|2018-01-02|L|TRUE
16|203|2020-01-03|H|FALSE
15|203|2021-01-09|\N|TRUE
\.

-- Games(gameID, gameDate, homeTeam, visitorTeam, homePoints, visitorPoints)
COPY Games FROM stdin USING DELIMITERS '|';
10001|2021-02-19|201|202|15|12
10002|2021-02-21|202|201|15|9
10003|2021-03-08|201|202|16|14
10004|2021-02-20|204|203|8|15
10005|2021-02-26|203|204|9|15
10006|2021-02-28|201|203|13|15
10008|2021-03-01|209|202|15|7
10009|2021-02-23|201|202|\N|\N
10010|2021-03-02|209|204|15|\N
10012|2021-03-05|204|202|17|15
10014|2021-03-05|205|209|15|4
10015|2021-03-06|209|205|15|12
10016|2021-03-07|204|209|15|6
\.

-- GamePlayers(gameID, playerID, minutesPlayed)
COPY GamePlayers FROM stdin USING DELIMITERS '|';
10001|1|55
10001|2|55
10001|13|40
10001|27|42
10001|21|28
10002|1|62
10002|2|62
10002|21|62
10002|27|62
10003|1|75
10003|2|75
10003|13|70
10003|27|60
10003|21|20
10004|16|40
10004|15|40
10004|23|40
10004|22|60
10004|17|60
10005|16|52
10005|15|54
10005|23|20
10005|22|63
10005|17|63
\.

-- PersonsChanges(personID, name, address, salary)
COPY PersonChanges FROM stdin USING DELIMITERS '|';
1|Kerri Walsh Jennings|13 Mockingbird Lane|95126.88
2|Misty May-Treanor|2753 Herbert Boulevard|92000.25
3|Clayton Stanley|123 Sesame Street|82741.36
4|Andy Banachowski|5 Peach Terrace|80266.22
7|Michelle Bartsch-Hackley|77 Sunset Place|74000.00
9|Rachael Adams|510 Melody Lane|58644.36
\.
