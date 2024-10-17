-- List all Glam rock bands ranked by their longevity (lifespan)
SELECT 
    band_name,                                             -- The band's name
    CASE 
        WHEN split IS NULL THEN (2022 - formed)            -- If the band is still active, lifespan is from formed to 2022
        ELSE (split - formed)                             -- If the band has split, lifespan is from formed to split year
    END AS lifespan                                        -- Lifespan in years
FROM 
    metal_bands                                            -- Assuming metal_bands is the table name
WHERE 
    style = 'Glam rock'                                    -- Filter for Glam rock bands
ORDER BY 
    lifespan DESC;                                         -- Rank by lifespan in descending order

