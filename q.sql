
-- Vissza adja az összes alkatrészt a hozzá tartozó számítógépekkel együtt.
SELECT parts.name AS part_name, pcs.id AS pc_id
FROM parts
INNER JOIN pc_part_relations ON parts.id = pc_part_relations.part_id
INNER JOIN pcs ON pc_part_relations.pc_id = pcs.id;

-- Listázza az összes számítógépet a rajtuk telepített szoftverekkel együtt.
SELECT pcs.id AS pc_id, softwares.name AS software_name
FROM pcs
INNER JOIN pc_soft_relations ON pcs.id = pc_soft_relations.pc_id
INNER JOIN softwares ON pc_soft_relations.soft_id = softwares.id;

--Kiírja az összes felhasználót és a hozzájuk rendelt számítógépeket.
SELECT users.name AS user_name, pcs.id AS pc_id
FROM users
INNER JOIN pc_user_relations ON users.id = pc_user_relations.user_id
INNER JOIN pcs ON pc_user_relations.pc_id = pcs.id;

--Listázza az összes olyan alkatrészt, amelyhez nem rendeltünk számítógépet.
SELECT parts.name AS part_name
FROM parts
LEFT JOIN pc_part_relations ON parts.id = pc_part_relations.part_id
WHERE pc_part_relations.pc_id IS NULL;

--Megkeresi az összes olyan számítógépet, amelyen nincs telepítve szoftver.
SELECT pcs.id AS pc_id
FROM pcs
LEFT JOIN pc_soft_relations ON pcs.id = pc_soft_relations.pc_id
WHERE pc_soft_relations.soft_id IS NULL;