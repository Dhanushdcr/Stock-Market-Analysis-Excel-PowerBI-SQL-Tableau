create database stock_market ;
use stock_market;
select * from synthetic_stock_data;


#  Average Daily Trading Volume
select  Ticker,round(avg(volume) ,2)as average_daily_volume 
from synthetic_stock_data
group by Ticker 
order by ticker desc;


# stock with highest and lowest of 52 weeks
SELECT ticker,
		round(sum(`52 Week High`),2) AS highest_52_week_high,
		round(sum(`52 Week Low`),2) AS lowest_52_week_low
FROM synthetic_stock_data
GROUP BY ticker
ORDER BY  highest_52_week_high desc;

# stock wise PE ratio
select ticker,round(sum(`PE Ratio`),2) as sum_of_PE_ratio
from synthetic_stock_data
group by ticker
order by sum_of_PE_ratio desc;


# stock wise dividend amount
select ticker,round(sum(`Dividend Amount`),2) as sum_of_dividendAmount 
from synthetic_stock_data
group by ticker
order by sum_of_dividendAmount desc;

# count of buying signal and selling signal
 SELECT ticker,
    COUNT(CASE WHEN `RSI (14 days)` < 45 AND MACD > 0 THEN 1 ELSE NULL END) AS Buy_Signal_Count,
    COUNT(CASE WHEN `RSI (14 days)` >= 69 AND MACD < 0 THEN 1 ELSE NULL END) AS Sell_Signal_Count
FROM synthetic_stock_data
group by ticker 
order by ticker desc;


# stock with highest market cap
select ticker , round(sum(`Market Cap`),2) as Sum_Of_Market_cap , round(sum(`beta`),2) as Beta
from synthetic_stock_data
group by ticker
order by Sum_Of_Market_cap desc;

# Most volatile stock
select ticker , round(sum(`beta`),2) as Beta
from synthetic_stock_data
group by ticker
order by Beta desc;
