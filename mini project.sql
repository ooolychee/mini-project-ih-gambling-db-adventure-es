create database IronHack_Gambling;
use IronHack_Gambling;

describe customer;


select title, FirstName, LastName, DateOfBirth from customer;

select CustomerGroup, count(*) as number_of_each_group from customer
group by customerGroup;

describe betting;

select ClassId, CategoryId, BetDate, sum(Bet_Amt) from betting 
group by ClassId, CategoryId, BetDate;

SELECT ClassId, CategoryId, BetDate, sum(Sportsbook) as Amt_Sportsbook
FROM betting 
group by ClassId, CategoryId, BetDate;

select a.CurrencyCode, c.customerGroup, 
b.Vegas, b.Sportsbook,b.Games, b.Casino, b.Poker, b.Bingo,
b.BetDate
from betting as b
join accounts as a on a.AccountNo = b.AccountNo
join customer as c on a.CustId = c.CustId;


SELECT a.CurrencyCode, c.customerGroup, 
sum(b.Vegas) AS total_Vegas, 
sum(b.Sportsbook) AS total_Sportsbook,
sum(b.Games) AS total_Games, 
sum(b.Casino) AS total_Casino, 
sum(b.Poker) AS total_Poker,
sum(b.Bingo) AS total_Bingo
FROM betting AS b
JOIN accounts AS a ON a.AccountNo = b.AccountNo
JOIN customer AS c ON a.CustId = c.CustId
GROUP BY a.CurrencyCode, c.customerGroup;

select c.Title, c.FirstName, c.LastName, b.BetDate, b.BetCount 
from customer as c
join accounts as a on a.CustId = c.CustId
join betting as b on b.AccountNo = a.AccountNo;

SELECT 
    AccountNo, 
    SUM(Vegas) AS Total_Vegas, 
    COUNT(Vegas) AS Count_Vegas,
    SUM(Sportsbook) AS Total_Sportsbook, 
    COUNT(Sportsbook) AS Count_Sportsbook,
    SUM(Games) AS Total_Games, 
    COUNT(Games) AS Count_Games,
    SUM(Casino) AS Total_Casino, 
    COUNT(Casino) AS Count_Casino,
    SUM(Poker) AS Total_Poker, 
    COUNT(Poker) AS Count_Poker,
    SUM(Bingo) AS Total_Bingo, 
    COUNT(Bingo) AS Count_Bingo
FROM 
    betting
GROUP BY 
    AccountNo;
    
select distinct AccountNo from betting 
where Sportsbook IS NOT NULL and Vegas IS NOT NULL;

select AccountNo, sum(Sportsbook), sum(Vegas) from betting 
group by AccountNo
having sum(vegas) > 0 and sum(Sportsbook) > 0 or sum(Games) = 0 
and sum(Casino) = 0 and sum(Poker) = 0 and sum(Bingo) = 0
    

    