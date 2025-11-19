CREATE DATABASE IF NOT EXISTS media_analytics;
USE media_analytics;

CREATE TABLE facebook_data_table (
    Ad_Name VARCHAR(255),
    Ad_Set_Name VARCHAR(255),
    Age_Group VARCHAR(255),
    Campaign_Name VARCHAR(255),
    Gender VARCHAR(255),
    ReportDate VARCHAR(255),
    Total_Cost__Expression_ DOUBLE,
    Total_Impressions__Expression_ DOUBLE,
    Total_Link_Clicks__Expression_ INT,
    Total_Page_Likes__Expression_ INT,
    Total_People_Reached__Expression_ DOUBLE,
    Total_Post_Comments__Expression_ INT,
    Total_Post_Reactions__Expression_ INT,
    Total_Post_Shares__Expression_ INT,
    Total_Social_Interactions__Expression_ DOUBLE,
    Total_Website_Leads__Expression_ INT,
    Total_Website_Purchases__Expression_ INT,
    Total_Website_Purchases_Value__Expression_ DOUBLE,
    Avg_Purchase_Value DOUBLE,
    Cost DOUBLE,
    Cost_per_People_Reached DOUBLE,
    CPA__Cost_per_Action_ DOUBLE,
    CPC__Cost_per_Click_ DOUBLE,
    CPL__Cost_per_Lead_ DOUBLE,
    Frequency DOUBLE,
    Impressions DOUBLE,
    Indicator DOUBLE,
    KPI DOUBLE,
    LinkClicks INT,
    LTR__Lead_Through_Rate_ DOUBLE,
    Page_Likes INT,
    Post_Comments INT,
    Post_Reactions INT,
    Reach DOUBLE,
    TotalCost DOUBLE,
    Total_Link_Clicks INT,
    Total_Margin DOUBLE,
    Total_People_Reached DOUBLE,
    Total_Post_Reactions INT,
    Total_Post_Shares INT,
    Total_Social_Interactions DOUBLE,
    Total_Website_Leads INT,
    WebsiteLeads INT,
    WebsitePurchases INT,
    ClickThroughRate DOUBLE,
    ConversionRate DOUBLE,
    ReturnOnAdSpend DOUBLE,
    DayOfWeek VARCHAR(255)
);
ALTER TABLE facebook_data_table MODIFY ReturnOnAdSpend VARCHAR(50);
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/facebook data.csv'
INTO TABLE facebook_data_table
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 LINES;
-- 1. Total Cost
select  SUM(TotalCost) AS Total_Cost FROM facebook_data_table;
-- 2. Total Page likes
select SUM(Total_Page_Likes__Expression_) AS Total_Page_Likes FROM facebook_data_table;
-- 3. Total People Reached
select SUM(Total_People_Reached__Expression_) AS Total_People_Reached FROM facebook_data_table;
-- 4. Total Social interaction
select SUM(Total_Social_Interactions__Expression_) AS Total_Social_Interactions FROM facebook_data_table;
-- 5. Total Post Reactions
select SUM(Total_Post_Reactions__Expression_) AS Total_Post_Reactions FROM facebook_data_table;
-- 6. Total Ad Spend
select SUM(TotalCost) AS Total_Ad_Spend FROM facebook_data_table;
-- 7. Total impressions
select SUM(Total_Impressions__Expression_) AS Total_Impressions FROM facebook_data_table;
-- 8.Total Reach
select  SUM(Reach) AS Total_Reach FROM facebook_data_table;
-- 9. Total Link Clicks
select  SUM(Total_Link_Clicks__Expression_) AS Total_Link_Clicks FROM facebook_data_table;

-- 10. Click through Rate %
   select 
   ROUND(SUM(Total_Link_Clicks__Expression_) / NULLIF(SUM(Total_Impressions__Expression_), 0) * 100, 2)
   AS `Click_Through_Rate_(CTR%)`FROM facebook_data_table;

-- 11. Conversion Rate %
  select  
  ROUND(SUM(websitepurchases) / NULLIF(SUM(Total_Link_Clicks__Expression_), 0) * 100, 2) 
  AS `Conversion_Rate_(%)`FROM facebook_data_table;
  
  -- 12.Return on Ad Spend
   SELECT (SUM(ConversionRate) / SUM(TotalCost)) AS 'ROAS'
FROM facebook_data_table; ;

   -- 13. Cost per purchase
    select ROUND(SUM(TotalCost) / NULLIF(SUM(WebsitePurchases), 0), 2) 
    AS `Cost_per_Purchase_(CPP)`FROM facebook_data_table;
    

    --  14.Cost Per Lead
    select ROUND(SUM(TotalCost) / NULLIF(SUM(Total_Website_Leads__Expression_), 0), 2)
    AS `CPL_(Cost_per_Lead)`FROM facebook_data_table;
    -- Cost Per Person Reached
    select 
    ROUND(SUM(TotalCost) / NULLIF(SUM(Total_People_Reached__Expression_), 0), 6) 
    AS `Cost_per_Person_Reached` From facebook_data_table;
