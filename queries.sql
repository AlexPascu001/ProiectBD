-- JOIN, TO_CHAR, ORDER BY, ASYNC SELECT, WHERE
-- selecteaza echipele care au jucat in meciuri cu prezenta >= (maximul + minimul) / 2 din prezenta
-- si afiseaza pentru fiecare echipa ora inceperii meciurilor si sponsorii sai
SELECT e.team_id, e.nume_echipa, TO_CHAR(e.data_infiintare, 'DD-MM-YYYY'), m.ora_incepere, 
       m.spectatori, s.nume_sponsor, s.suma_sponsorizata
FROM echipa e
JOIN joaca j ON j.team_id = e.team_id
JOIN meci m ON m.match_id = j.match_id
JOIN sponsorizeaza spn ON e.team_id = spn.team_id
JOIN sponsor s ON spn.sponsor_id = s.sponsor_id
WHERE s.suma_sponsorizata >= 1500
AND m.spectatori >= (
    SELECT ((SELECT MAX(mecimax.spectatori) FROM meci mecimax) + (SELECT MIN(mecimin.spectatori) FROM meci mecimin)) / 2 FROM dual
)
ORDER BY e.team_id;

-- WITH, CASE, ORDER BY
-- selecteaza si afiseaza antrenorii tuturor echipelor in ordine descrescatoare dupa experienta
WITH experimentat as (SELECT a.nume, a.experienta FROM antrenor a)
SELECT exp.nume,
CASE
    WHEN exp.experienta >= 3 THEN 'avansat'
    WHEN exp.experienta >= 2 THEN 'experimentat'
    WHEN exp.experienta >= 1 THEN 'incepator'
    END
FROM experimentat exp
ORDER BY exp.experienta DESC;

-- UPPER, GROUP BY, HAVING, TO_DATE
-- selecteaza si afiseaza echipele cu data infiintarii inainte de anul 2021 si numarul total de spectatori al acestora
SELECT e.team_id, UPPER(e.nume_echipa), SUM(m.spectatori) as total_spectatori
FROM echipa e
JOIN joaca j ON j.team_id = e.team_id
JOIN meci m ON m.match_id = j.match_id
GROUP BY (e.team_id, e.nume_echipa, e.data_infiintare)
HAVING e.data_infiintare <= TO_DATE('01-01-2021', 'DD-MM-YYYY');

-- SYNC SELECT
-- selecteaza si afiseaza numarul de meciuri jucate si numarul de jucatori pentru fiecare echipa 
SELECT e.team_id, e.nume_echipa,
    (SELECT COUNT(j.match_id) FROM joaca j
    WHERE j.team_id = e.team_id) as meciuri_jucate,
    (SELECT COUNT(player.player_id) FROM jucator player
    WHERE e.team_id = player.team_id) as jucatori_echipa
FROM echipa e;

-- NVL
-- selecteaza si afiseaza jucatorii si domeniul de studii si in caz ca nu a fost introdus
-- se afiseaza 0
SELECT player.nume_prenume, NVL(player.an_studii, 0) as domeniu_studii
FROM jucator player;

-- cream un index nou
CREATE INDEX index_echipa ON echipa(nume_echipa);

-- selecteaza si afiseaza echipele care au 'FC' in nume si jucatorii acestora
SELECT e.nume_echipa, e.data_infiintare, j.nume_prenume
FROM echipa e
JOIN jucator j ON e.team_id = j.team_id
WHERE e.nume_echipa IS NOT NULL AND e.nume_echipa LIKE '%FC%';

