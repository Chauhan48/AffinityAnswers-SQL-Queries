-- query to find types of tiger in taxonomy table

SELECT COUNT(DISTINCT species) AS tiger_species_count
FROM taxonomy
WHERE species LIKE '%tigris%';


-- query to find ncbi_id of Sumatran tiger

SELECT ncbi_id
FROM taxonomy
WHERE species LIKE 'Panthera tigris sumatrae (Sumatran tiger)';