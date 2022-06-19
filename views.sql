CREATE OR REPLACE VIEW jucatori_echipa (team_id, nume_echipa, player_id, nume_prenume) AS 
    (SELECT e.team_id, e.nume_echipa, p.player_id, p.nume_prenume FROM echipa e
    JOIN jucator p ON p.team_id = e.team_id);
    
SELECT * FROM jucatori_echipa;
--DROP VIEW jucatori_echipa;

-- aceasta operatie merge
UPDATE jucatori_echipa SET nume_prenume = 'Ilie Balaci' WHERE player_id = 10;

-- aceasta operatie nu merge (nu putem updata mai multe campuri pe un view cu join)
UPDATE jucatori_echipa SET nume_prenume = 'John Cena', nume_echipa = 'FCSB' WHERE player_id = 5;
ROLLBACK;