-- nr de spectatori pentru meciurile cu prezenta <= media devine 250
SELECT * FROM meci;
UPDATE meci SET spectatori = 250 WHERE (spectatori <= (SELECT AVG(spectatori) FROM meci));
SELECT * FROM meci;

-- sterge sponsorul cu cea mai mica suma sponsorizata
SELECT * FROM sponsor;
DELETE FROM sponsor WHERE (suma_sponsorizata = (SELECT MIN(suma_sponsorizata) FROM sponsor));
SELECT * FROM sponsor;

-- sterge jucatorii nascuti in 1987
SELECT * FROM jucator;
DELETE FROM jucator WHERE TO_CHAR(data_nasterii, 'YYYY') LIKE '%1987%';
SELECT * FROM jucator;

-- actualizeaza experienta antrenorilor echipelor cu un meci jucat la 2
SELECT * FROM antrenor;
UPDATE antrenor a SET a.experienta = 2 WHERE 
    (SELECT COUNT(*) FROM joaca j WHERE j.team_id = a.team_id) = 1;
SELECT * FROM antrenor;

COMMIT;
ROLLBACK;