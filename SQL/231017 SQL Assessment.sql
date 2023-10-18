-- List of all facilities
select * from cd.facilities;

-- List of all facilities and their cost to members
select name, membercost from cd.facilities;

-- Facilities that charge a fee to members
select * from cd.facilities where membercost > 0;

-- Facilities that charge a fee to members and that fee is less than 1/50th of the monthly maintenance cost
select * from cd.facilities where membercost > 0 and membercost < monthlymaintenance / 50;

-- List of facilities with the word 'Tennis'
select * from cd.facilities where name like '%Tennis%';

-- Details of facilities with ID 1 and 5
select * from cd.facilities where facid in (1, 5);

-- Members who joined after the start of September 2012
select * from cd.members where joindate >= '2012-09-01';

-- Ordered list of the first 10 surnames in the members table
select distinct surname from cd.members order by surname asc limit 10;

-- Signup date of the last member
select joindate from cd.members order by joindate desc limit 1;

-- The number of facilities that have a cost to guests of 10 or more
select count(*) from cd.facilities where guestcost >= 10;

-- List of total number of slots booked per facility in the month of September 2012. Sort the result by the number of slots
select facid, sum(slots) as "Total Slots" from cd.bookings where starttime >= '2012-09-01' and starttime < '2012-10-01' group by facid order by 2;

-- List of facilities with more than 1000 slots booked. Sort by facility id
select facid, sum(slots) as "Total Slots" from cd.bookings group by facid having sum(slots) > 1000 order by 1;

-- List of the start times for bookings for tennis courts, for the date '2012-09-21'
select b.starttime, f.name from cd.bookings b join cd.facilities f on b.facid = f.facid where f.name like '%Tennis Court%' and starttime >= '2012-09-21' and starttime < '2012-09-22';

-- List of the start times for bookings by members named 'David Farrell'
select b.starttime from cd.bookings b join cd.members m on b.memid = m.memid where m.surname = 'Farrell' and m.firstname = 'David';