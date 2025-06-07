SELECT *
FROM layoffs_staging2;

-- QUERY TO RETRIEVE MAX OF TOTAL LAID OFF AND PERCENTAGE OF LAYOFF
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

-- QUERY THAT RETRIEVES RECORDS WITH 1 AS THE PERCENTAGE OF LAYOFFS, WHILE TOTAL LAYOFF IS DESCENDING
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC
;

-- QUERY THAT RETRIEVES RECORDS WITH 1 AS THE PERCENTAGE OF LAYOFFS, WHILE FUNDS RAISED (IN MILLIONS) IS DESCENDING
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC
;

-- MIN AND MAX DATE OF THE CLEANED DATASET
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2
;

-- SUM OF TOTAL LAYOFFS BY COMPANY
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- SUM OF TOTAL LAYOFFS BY INDUSTRY
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

-- SUM OF TOTAL LAYOFFS BY COUNTRY
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

-- SUM OF TOTAL LAYOFFS BY YEAR
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

-- SUM OF TOTAL LAYOFFS BY STAGE 
SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

-- ROLLING TOTAL OF LAYOFFS
SELECT SUBSTRING(`date`, 1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1,7)  IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
;

-- ROLLING TOTAL OF LAYOFFS BY MONTH
WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`, 1,7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1,7)  IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off,
SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;

-- HOW MUCH DO COMPANIES LAYOFF PER YEAR
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

-- TOP 5 COMPANIES WHO LAID OFF THE MOST PEOPLE PER YEAR
WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_Year_Rank AS
(
SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5
;