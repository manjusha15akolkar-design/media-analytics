CREATE TABLE google_ad_data (
    campaign_id INT,
    ad_group_id INT,
    ad_group_name VARCHAR(100),
    ad_id INT,
    ad_impressions INT,
    ad_clicks INT,
    ad_conversions INT,
    ad_conversion_value DECIMAL(15,2),
    ad_cost_usd DECIMAL(10,2),
    cost_per_conversion DECIMAL(10,2),
    value_per_conversion DECIMAL(10,2),
    campaign_impressions INT,
    campaign_clicks INT,
    campaign_conversions INT,
    campaign_cost_usd DECIMAL(10,2),
    campaign_conversion_value DECIMAL(15,2),
    campaign_start_date DATE,
    campaign_end_date DATE,
    click_start_date DATE,
    click_end_date DATE
);
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Google Data.csv'
INTO TABLE google_ad_data 
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 LINES;
-- 1. Total impressions
SELECT SUM(ad_impressions) AS Total_Impressions FROM google_ad_data;
-- 2.Total Clicks
SELECT SUM(ad_clicks) AS Total_Clicks FROM google_ad_data;
-- 3. Click through Rate
SELECT  ROUND((SUM(ad_clicks) / SUM(ad_impressions)) * 100, 2) AS CTR_Percent
FROM google_ad_data
WHERE ad_impressions > 0;
-- 4. Total Conversions
SELECT SUM(ad_conversion_value) AS Total_Conversions
FROM google_ad_data;
-- 5. Conversion Rate
SELECT ROUND((SUM(ad_conversions) / SUM(ad_clicks)) * 100, 2) AS Conversion_Rate_Percent
FROM google_ad_data
WHERE ad_clicks > 0;
-- 6. Total Cost
SELECT 
    ROUND(SUM(ad_cost_usd), 2) AS Total_Cost
FROM google_ad_data;
-- 7. Cost Per Click
SELECT ROUND(SUM(ad_cost_usd) / SUM(ad_clicks), 2) AS CPC
FROM google_ad_data
WHERE ad_clicks > 0;
-- 8. Cost Per Conversion
SELECT ROUND(SUM(ad_cost_usd) / SUM(ad_conversions), 2) AS CPA
FROM google_ad_data
WHERE ad_conversions > 0;
-- 9. Return on ad spend
SELECT ROUND(SUM(ad_conversion_value) / SUM(ad_cost_usd), 2) AS ROAS
FROM google_ad_data
WHERE ad_cost_usd > 0;
-- 10. Total Conversion Value
SELECT ROUND(SUM(ad_conversion_value), 2) AS Total_Conversion_Value
FROM google_ad_data;

-- 11.Compaign CPM
SELECT 
    ROUND((SUM(ad_cost_usd) / SUM(ad_impressions)) * 1000, 2) AS CPM
FROM google_ad_data
WHERE ad_impressions > 0;