-- drop database  hospitality;
create database hospitality;
use hospitality;

-- Total Departmental Expenses
select sum(Total_Departmental_Expenses) Total_Departmental_Expenses 
from hospitality;

-- Total Management Fees
select sum(Total_Management_Fees)  Total_Management_Fees 
from hospitality;

-- Total Non Operating Expenses
select sum(Total_Non_Operating_Expenses) Total_Non_Operating_Expenses  
from hospitality;

-- Total Revenue
select sum(Total_Revenue) Total_Revenue   
from hospitality;

-- Total Rooms Available
select count(Total_Rooms_Available) Total_Rooms_Available   
from hospitality;

-- Total Rooms Revenue
select sum(Total_Rooms_Revenue)Total_Rooms_Revenue    
from hospitality;

-- Total Rooms Sold
select count(Total_Rooms_Sold) Total_Rooms_Sold   
from hospitality;

-- Total Undistributed Expenses
select sum(Total_Undistributed_Expenses) Total_Undistributed_Expenses   
from hospitality;

-- ADR (Average Daily Rate) : [Total Rooms Revenue] / [Total Rooms Sold]
select sum(Total_Rooms_Revenue)/count(Total_Rooms_Sold) ADR  
from hospitality;

-- Gross Operating Income : [Total Revenue] - [Total Departmental Expenses]
select sum(Total_Revenue) - sum(Total_Departmental_Expenses) as Gross_Operating_Income 
from hospitality;

-- Gross Operating Income % : [Gross Operating Income] / [Total Revenue]
select concat(round((sum(Total_Revenue) - sum(Total_Departmental_Expenses))/sum(Total_Revenue)*100),"%") as "Gross_Operating_Income %" 
from hospitality;

-- Gross Operating Profit : [Gross Operating Income] - [Total Undistributed Expenses]
select (sum(Total_Revenue) - sum(Total_Departmental_Expenses))- sum(Total_Undistributed_Expenses) as "Gross Operating Profit" 
from hospitality;

-- Gross Operating Profit % : [Gross Operating Profit] / [Total Revenue]
select concat(round(((sum(Total_Revenue) - sum(Total_Departmental_Expenses))- sum(Total_Undistributed_Expenses))/sum(Total_Revenue)*100),"%") as "Gross Operating Profit %" 
from hospitality;

-- Management Fees and NonOperating Expenses : [Total Management Fees] + [Total Non Operating Expenses]
select sum(Total_Management_Fees)+sum(Total_Non_Operating_Expenses) as "Management Fees and NonOperating Expenses"   
from hospitality;

-- EBITDA : [Gross Operating Profit] - [Management Fees and NonOperating Expenses]
select ((sum(Total_Revenue) - sum(Total_Departmental_Expenses))- sum(Total_Undistributed_Expenses)) - (sum(Total_Management_Fees)+sum(Total_Non_Operating_Expenses)) as "EBITDA" 
from hospitality;

-- EBITDA % : [EBITDA] / [Total Revenue]
select concat(round((((sum(Total_Revenue) - sum(Total_Departmental_Expenses))- sum(Total_Undistributed_Expenses)) - (sum(Total_Management_Fees)+sum(Total_Non_Operating_Expenses)))/sum(Total_Revenue)*100),"%") as "EBITDA %" 
from hospitality;

-- - Net Operating Income : [EBITDA] - [Total FF&E Reserves]
select ((sum(Total_Revenue) - sum(Total_Departmental_Expenses))- sum(Total_Undistributed_Expenses)) - (sum(Total_Management_Fees)+sum(Total_Non_Operating_Expenses)) as "EBITDA" 
from hospitality;

-- OCC (Occupancy Rate) : [Total Rooms Sold] / [Total Rooms Available]
select sum(Total_Rooms_Sold)/sum(Total_Rooms_Available) OCC  
from hospitality;

-- RevPAR (Revenue per Available Room) : [Total Rooms Revenue] / [Total Rooms Available]
select sum(Total_Rooms_Revenue)/sum(Total_Rooms_Available) occ  
from hospitality;


-- Top 5 cities having high Total_Revenue
select city,sum(Total_Revenue)Total_Revenue 
from hospitality 
group by 1 
order by Total_Revenue desc 
limit 5;


-- Brand wise Total_Revenue
select brand,sum(Total_Revenue)
from hospitality
group by 1;

-- Year wise Total_Revenue
select distinct Timetable_Row as Years,sum(Total_Revenue)Total_Revenue 
from hospitality 
group by 1 ;


-- State wise EBITDA % 
select state,concat(round((((sum(Total_Revenue) - sum(Total_Departmental_Expenses))- sum(Total_Undistributed_Expenses)) - (sum(Total_Management_Fees)+sum(Total_Non_Operating_Expenses)))/sum(Total_Revenue)*100),"%") as "EBITDA %" 
from hospitality 
group by 1;


-- State wise ADR (Average Daily Rate) 
select state, round(sum(Total_Rooms_Revenue)/count(Total_Rooms_Sold)) ADR  
from hospitality 
group by 1;

-- State wise OCC (Occupancy Rate)
select state,round(sum(Total_Rooms_Sold)/sum(Total_Rooms_Available),2) OCC  
from hospitality 
group by 1;