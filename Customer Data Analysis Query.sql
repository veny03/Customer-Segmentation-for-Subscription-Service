select * from [dbo].['Customer Data$']

select * from [dbo].['Solving Sheet']

select * from [dbo].['Pivot Table']

-----Total Number of customers in each region-----

SELECT Region, COUNT(CustomerID) AS CustomerCount
FROM [dbo].['Solving Sheet']
GROUP BY Region

-----Most Popular subscription type----

SELECT SubscriptionType, COUNT(CustomerID) AS SubscriberCount
FROM [dbo].['Solving Sheet']
GROUP BY SubscriptionType
ORDER BY SubscriberCount DESC

-----Customers that canceled subscription with six months-----

SELECT CustomerID, CustomerName, SubscriptionStart, SubscriptionEnd
FROM [dbo].['Solving Sheet']
WHERE DATEDIFF(month, SubscriptionStart, SubscriptionEnd) <= 6 AND Canceled = '1'

-----Average Subscription Duration----

SELECT AVG(DATEDIFF(day, SubscriptionStart, SubscriptionEnd)) AS AvgSubscriptionDuration
FROM [dbo].['Solving Sheet']

-------Customers with subscription longer than 12 months-----

SELECT CustomerID, CustomerName, SubscriptionStart, SubscriptionEnd
FROM [dbo].['Solving Sheet']
WHERE DATEDIFF(month, SubscriptionStart, SubscriptionEnd) > 12

----Toal Revenue by Subscription Type-----

SELECT SubscriptionType, SUM(Revenue) AS TotalRevenue
FROM [dbo].['Solving Sheet']
GROUP BY SubscriptionType

----Top 3 Regions by Subscription Cancellation-----

SELECT TOP 3 Region, COUNT(Canceled) AS CancellationCount
FROM [dbo].['Solving Sheet']
WHERE Canceled = '1'
GROUP BY Region
ORDER BY CancellationCount DESC

-----Total number of active subscription----

SELECT COUNT(CASE WHEN Canceled = '0' THEN 1 END) AS ActiveSubscriptions
FROM [dbo].['Solving Sheet']

-----Total number of canceled subscription-----

SELECT COUNT(CASE WHEN Canceled = '1' THEN 1 END) AS CanceledSubscriptions
FROM [dbo].['Solving Sheet']
