-- 1st 
SELECT COUNT(*) AS Total_Posts
FROM linkedin_data;
-- 2nd
SELECT SUM(Views) AS Total_Views
FROM linkedin_data;
-- 3rd
SELECT 
    SUM(Reactions) AS Total_Reactions,
    SUM(Comments) AS Total_Comments,
    SUM(Reposts) AS Total_Reposts
FROM linkedin_data;
-- 4th
SELECT AVG(`Engagement Rate`) AS Avg_Engagement_Rate
FROM linkedin_data;
-- 5th
SELECT 
    PostDescription,
    `Engagement Rate`
FROM linkedin_data
ORDER BY `Engagement Rate` DESC
LIMIT 10;
-- 6th
SELECT 
    `Day Of Week`, 
    ROUND(AVG(`Engagement Rate`), 2) AS Avg_Engagement_Rate
FROM linkedin_data
GROUP BY `Day Of Week`
ORDER BY Avg_Engagement_Rate DESC
LIMIT 1;
-- 7th
SELECT 
    PostTopic,
    COUNT(*) AS Total_Posts,
    ROUND(AVG(`Engagement Rate`), 2) AS Avg_Engagement_Rate,
    SUM(Views) AS Total_Views,
    SUM(Reactions + Comments + Reposts) AS Total_Interactions
FROM linkedin_data
GROUP BY PostTopic
ORDER BY Avg_Engagement_Rate DESC;


