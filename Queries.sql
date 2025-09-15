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