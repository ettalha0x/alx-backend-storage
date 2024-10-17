-- Rank country origins of bands by total non-unique number of fans
SELECT 
    origin,                          -- Country of the band
    SUM(fans) AS nb_fans             -- Total number of fans per country
FROM 
    metal_bands                      -- Assuming metal_bands is the table name
GROUP BY 
    origin                           -- Grouping by country of origin
ORDER BY 
    nb_fans DESC;                    -- Ordering by total fans in descending order

