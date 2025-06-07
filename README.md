# Layoffs-Analysis
This MySQL project analyzes global company layoffs (2020–2023) across industries. I started with data cleaning by removing duplicates, standardizing entries, and handling missing data. I also performed EDA to identify trends by company, industry, country, and time.

## Project Objectives
- Clean and prepare real-world layoff data for structured analysis
- Use SQL (specifically MySQL) to uncover patterns about layoffs
- Understand layoff behavior across different industries, countries, and company growth stages during 2020-2023
- Strengthen SQL querying and data wrangling skills

## Data Cleaning Process
<a href="https://github.com/yeniyen123/Layoffs-Analysis/blob/main/Layoffs_CleanedData.sql">Cleaned Dataset</a>
- Removed Duplicates
- Standardization (e.g., trimmed whitespace from text fields, normalized industry labels, cleaned up inconsistent country names, date formatting, etc.)
- Missing Value Handling (e.g., filled in missing industry values by matching company-level data, removed rows lacking both layoff count and percentage (because I believe they are unnecessary))
- Column Cleanup

## Exploratory Data Analysis
<a href="https://github.com/yeniyen123/Layoffs-Analysis/blob/main/Layoffs_ExploratoryDataAnalysis.sql">EDA</a>

Key queries included: 
- Maximum number and percentage of employees laid off
- Identification of companies with 100% layoffs
- Aggregated layoffs by company, industry, country, and year
- Monthly and cumulative (rolling) layoff trends
- Analysis by company funding stage
- Top 5 companies with the highest layoffs per year

##Key Insights
Aside from confirming the years of layoff, here are other insights I discovered:
- While tech was significantly impacted during years 2020-2023, other sectors like Consumer, Retail, and Transportation also reported major layoffs.
- The United States recorded the highest number of layoffs.
- Layoffs surged in 2022 and 2023, as seen in monthly and cumulative summaries.
- Post-IPO companies had the largest layoff figures at 204,132, which could reflect business model adjustments or over-expansion.
- Several companies laid off their entire workforce (100% layoff), often smaller startups with limited funding.
