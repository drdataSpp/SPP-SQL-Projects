-- Populating Date Dimension Table
----------
declare @startDate as datetime,@enddate as datetime

set @startDate = '01/01/2009'
set @enddate = '01/01/2016'

while @startDate<@enddate
begin
insert into DimDate_T(
 DateKey
,[DayOfMonth]
,MonthOfYear
,[Year]
,[DayOfWeek]
,WeekOfYear
,[DayOfYear]
,[MonthName]
,[Quarter]
,QuarterName)
select cast(convert(varchar(8),@startdate,112) as int)
,day(@startdate)
,Month(@startdate)
,Year(@startdate)
,datename(weekday,@startdate) as WeekDay
,datename(week,@startdate) as Week
,datename(dayOfYear,@startdate) as dayOfYear
,datename(month,@startdate) as MonthName
,datename(quarter,@startdate) as Quarter
,CASE datename(quarter,@startdate)
WHEN 1 THEN 'First Quarter'
WHEN 2 THEN 'Second Quarter'
WHEN 3 THEN 'Third Quarter'
WHEN 4 THEN 'Fourth Quarter'
END AS QuarterName

set @startDate = @startDate +1
end
GO
