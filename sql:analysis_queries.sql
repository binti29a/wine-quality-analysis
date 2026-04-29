{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica-Bold;\f1\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red73\green0\blue1;}
{\*\expandedcolortbl;;\cssrgb\c36221\c2639\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8960\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\b\fs24 \cf2 1.Question: How are wines distributed across different quality scores?
\f1\b0 \cf0 \
SELECT \
    quality,\
    COUNT(*) AS total_wines\
FROM wine_quality_red\
GROUP BY quality\
ORDER BY quality;\
\

\f0\b \cf2 2. Question: How does alcohol content vary across different wine quality levels?
\f1\b0 \cf0 \
SELECT \
    quality,\
    ROUND(AVG(alcohol), 2) AS avg_alcohol\
FROM wine_quality_red\
GROUP BY quality\
ORDER BY quality;\
\

\f0\b \cf2 3.Question: Is there a relationship between volatile acidity and wine quality?
\f1\b0 \cf0 \
SELECT \
    quality,\
    ROUND(AVG(volatile_acidity), 3) AS avg_volatile_acidity\
FROM wine_quality_red\
GROUP BY quality\
ORDER BY quality;\
\

\f0\b \cf2 4.Question: How do sulphate levels differ across wine quality categories?
\f1\b0 \cf0 \
SELECT \
    quality,\
    ROUND(AVG(sulphates), 2) AS avg_sulphates\
FROM wine_quality_red\
GROUP BY quality\
ORDER BY quality;\
\

\f0\b \cf2 5. Question: What characteristics define the highest-quality wines in the dataset?
\f1\b0 \cf0 \
SELECT *\
FROM wine_quality_red\
ORDER BY quality DESC, alcohol DESC\
LIMIT 10;\
\

\f0\b \cf2 6. Question: How do key chemical properties differ between low-, medium-, and high-quality wines?
\f1\b0 \cf0 \
SELECT\
    CASE\
        WHEN quality >= 7 THEN 'High Quality'\
        WHEN quality = 6 THEN 'Medium Quality'\
        ELSE 'Low Quality'\
    END AS quality_category,\
    COUNT(*) AS total_wines,\
    ROUND(AVG(alcohol), 2) AS avg_alcohol,\
    ROUND(AVG(volatile_acidity), 3) AS avg_volatile_acidity,\
    ROUND(AVG(sulphates), 2) AS avg_sulphates\
FROM wine_quality_red\
GROUP BY quality_category;}