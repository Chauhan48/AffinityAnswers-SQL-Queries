-- query to find types of tiger in taxonomy table

SELECT COUNT(DISTINCT species) AS tiger_species_count
FROM taxonomy
WHERE species LIKE '%tigris%';


-- query to find ncbi_id of Sumatran tiger

SELECT ncbi_id
FROM taxonomy
WHERE species LIKE 'Panthera tigris sumatrae (Sumatran tiger)';

-- query to find the type of rice with longest DNA sequence

SELECT t.species, r.rfamseq_acc, r.length
FROM rfamseq r
JOIN taxonomy t ON r.ncbi_id = t.ncbi_id
WHERE t.species LIKE '%Oryza%'
ORDER BY r.length DESC
LIMIT 1;

-- query to find paginate list of the family names and their longest DNA sequence lengths (in descending order of length) where only    families that have DNA sequence lengths greater than 1,000,000 are included.

SELECT f.rfam_acc AS family_acc, f.description AS family_name, MAX(r.length) AS max_length
FROM family f
JOIN full_region fr ON f.rfam_acc = fr.rfam_acc
JOIN rfamseq r ON fr.rfamseq_acc = r.rfamseq_acc
GROUP BY f.rfam_acc, f.description
HAVING MAX(r.length) > 1000000
ORDER BY max_length DESC
LIMIT 15 OFFSET 120;
