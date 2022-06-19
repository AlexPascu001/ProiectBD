CREATE SEQUENCE id_automat
START WITH 1
INCREMENT BY 1;
INSERT INTO echipa VALUES(id_automat.nextval, 'FMI United', TO_DATE('06-09-2019'));
INSERT INTO echipa VALUES(id_automat.nextval, 'Warriors FC', TO_DATE('30-03-2020'));
INSERT INTO echipa VALUES(id_automat.nextval, 'Winners Club', TO_DATE('04-04-2021'));
INSERT INTO echipa (team_id, nume_echipa) VALUES(id_automat.nextval, 'FC ASMI');
INSERT INTO echipa VALUES(id_automat.nextval, 'Real FMI', TO_DATE('24-10-2020'));
INSERT INTO echipa VALUES(id_automat.nextval, 'Stiinta FMI', TO_DATE('15-09-2018'));
INSERT INTO echipa VALUES(id_automat.nextval, 'UniBuc FC', TO_DATE('01-10-2017'));
--SELECT * FROM echipa ORDER BY team_id;


INSERT INTO sponsor VALUES(1, 'Red Bull', 1000);
INSERT INTO sponsor VALUES(2, 'PlayStation', 2500);
INSERT INTO sponsor VALUES(3, 'Coca Cola', 1500);
INSERT INTO sponsor VALUES(4, 'Tesla', 1200);
INSERT INTO sponsor VALUES(5, 'Lenovo', 800);
INSERT INTO sponsor VALUES(6, 'Audi', 2000);
--SELECT * FROM sponsor ORDER BY suma_sponsorizata;

INSERT INTO jucator VALUES(1, 'Alex Pascu', 1, 1, TO_DATE('30-03-2002'), 1);
INSERT INTO jucator VALUES(2, 'Cristiano Ronaldo', 3, 1, TO_DATE('05-02-1985'), 1);
INSERT INTO jucator VALUES(3, 'Leo Messi', 2, 2, TO_DATE('24-06-1987'), 2);
INSERT INTO jucator VALUES(4, 'Karim Benzema', NULL, NULL, TO_DATE('19-12-1987'), 3);
INSERT INTO jucator VALUES(5, 'Kylian Mbappe', 2, 1, TO_DATE('20-12-1998'), 4);
INSERT INTO jucator VALUES(6, 'Toni Kroos', NULL, NULL, TO_DATE('12-03-1994'), 2);
INSERT INTO jucator VALUES(7, 'Neymar Jr', 3, 2, TO_DATE('05-02-1992'), 4);
INSERT INTO jucator VALUES(8, 'Luka Modric', 2, 3, TO_DATE('10-06-2000'), 6);
INSERT INTO jucator VALUES(9, 'Vinicius Jr', 1, 1, TO_DATE('22-11-1999'), 7);
INSERT INTO jucator VALUES(10, 'Andrei Ivan', 3, 1, TO_DATE('08-01-1994'), 5);
--SELECT * FROM jucator ORDER BY data_nasterii DESC;

INSERT INTO sponsorizeaza (team_id, sponsor_id) VALUES(1, 6);
INSERT INTO sponsorizeaza (team_id, sponsor_id) VALUES(1, 2);
INSERT INTO sponsorizeaza (team_id, sponsor_id) VALUES(2, 1);
INSERT INTO sponsorizeaza (team_id, sponsor_id) VALUES(2, 4);
INSERT INTO sponsorizeaza (team_id, sponsor_id) VALUES(3, 5);
INSERT INTO sponsorizeaza (team_id, sponsor_id) VALUES(3, 3);
INSERT INTO sponsorizeaza (team_id, sponsor_id) VALUES(4, 2);
INSERT INTO sponsorizeaza (team_id, sponsor_id) VALUES(4, 1);
INSERT INTO sponsorizeaza (team_id, sponsor_id) VALUES(5, 2);
INSERT INTO sponsorizeaza (team_id, sponsor_id) VALUES(5, 4);
INSERT INTO sponsorizeaza (team_id, sponsor_id) VALUES(6, 1);
INSERT INTO sponsorizeaza (team_id, sponsor_id) VALUES(6, 6);
INSERT INTO sponsorizeaza (team_id, sponsor_id) VALUES(7, 3);
INSERT INTO sponsorizeaza (team_id, sponsor_id) VALUES(7, 4);
--SELECT * FROM sponsorizeaza;

INSERT INTO meci VALUES(1,'18:00', 300);
INSERT INTO meci VALUES(2,'19:00', 180);
INSERT INTO meci VALUES(3,'19:30', 230);
INSERT INTO meci VALUES(4,'20:30', 270);
INSERT INTO meci VALUES(5,'22:00', 120);
--SELECT * FROM meci ORDER BY spectatori;

INSERT INTO joaca (match_id, team_id) VALUES(1, 1);
INSERT INTO joaca (match_id, team_id) VALUES(1, 2);
INSERT INTO joaca (match_id, team_id) VALUES(2, 3);
INSERT INTO joaca (match_id, team_id) VALUES(2, 4);
INSERT INTO joaca (match_id, team_id) VALUES(3, 5);
INSERT INTO joaca (match_id, team_id) VALUES(3, 6);
INSERT INTO joaca (match_id, team_id) VALUES(4, 1);
INSERT INTO joaca (match_id, team_id) VALUES(4, 7);
INSERT INTO joaca (match_id, team_id) VALUES(5, 5);
INSERT INTO joaca (match_id, team_id) VALUES(5, 6);
--SELECT * FROM joaca;

INSERT INTO antrenor VALUES(1, 1, 3, 'Carlo Ancelotti');
INSERT INTO antrenor VALUES(2, 2, 1, 'Pep Guardiola');
INSERT INTO antrenor VALUES(3, 3, 2, 'Dan Petrescu');
INSERT INTO antrenor VALUES(4, 4, 2, 'Zinedine Zidane');
INSERT INTO antrenor VALUES(5, 5, 2, 'Laurentiu Reghecampf');
INSERT INTO antrenor VALUES(6, 6, 3, 'Gigi Becali');
INSERT INTO antrenor VALUES(7, 7, 1, 'Mihai Rotaru');
SELECT * FROM antrenor;
COMMIT;
ROLLBACK;