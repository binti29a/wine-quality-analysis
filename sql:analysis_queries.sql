-- Question: How are wines distributed across different quality scores?
SELECT 
    quality,
    COUNT(*) AS total_wines
FROM wine_quality_red
GROUP BY quality
ORDER BY quality;

-- Question: How does alcohol content vary across different wine quality levels?
SELECT 
    quality,
    ROUND(AVG(alcohol), 2) AS avg_alcohol
FROM wine_quality_red
GROUP BY quality
ORDER BY quality;

-- Question: Is there a relationship between volatile acidity and wine quality?
SELECT 
    quality,
    ROUND(AVG(volatile_acidity), 3) AS avg_volatile_acidity
FROM wine_quality_red
GROUP BY quality
ORDER BY quality;

-- Question: How do sulphate levels differ across wine quality categories?
SELECT 
    quality,
    ROUND(AVG(sulphates), 2) AS avg_sulphates
FROM wine_quality_red
GROUP BY quality
ORDER BY quality;

-- Question: What characteristics define the highest-quality wines in the dataset?
SELECT *
FROM wine_quality_red
ORDER BY quality DESC, alcohol DESC
LIMIT 10;

-- Question: How do key chemical properties differ between low-, medium-, and high-quality wines?
SELECT
    CASE
        WHEN quality >= 7 THEN 'High Quality'
        WHEN quality = 6 THEN 'Medium Quality'
        ELSE 'Low Quality'
    END AS quality_category,
    COUNT(*) AS total_wines,
    ROUND(AVG(alcohol), 2) AS avg_alcohol,
    ROUND(AVG(volatile_acidity), 3) AS avg_volatile_acidity,
    ROUND(AVG(sulphates), 2) AS avg_sulphates
FROM wine_quality_red
GROUP BY quality_category;
