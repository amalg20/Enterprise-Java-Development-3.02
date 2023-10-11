--  ----- CREATE SCHEMA BY FIRST, CHECK IF IT EXISTS OR NOT ------
drop schema if exists airline;
create schema airline;
use airline;



--  ----------- CREATE THREE TABLES AFTER THE NORMALIZATION ------------


-- ----------- CUSTOMERS TABLE ----------
create table customer(
id INT not null auto_increment,
customer_name VARCHAR(255),
customer_status VARCHAR(255),
total_customer_mileage INT not null,
primary key (id)
);

-- ----------- FLIGHTS TABLE ----------
create table flight(
flight_number VARCHAR(255) not null,
aircraft VARCHAR(255),
flight_mileage INT not null,
total_aircraft_seats INT NOT NULL ,
primary key (flight_number)

);



-- ------------ CUSTOMERS_FLIGHTS TABLE --------
create table booking(
id INT NOT NULL AUTO_INCREMENT,
customer_id INT not null,
flight_number VARCHAR(255) not null,
primary key (id),
foreign key (customer_id) references customer(id),
foreign key (flight_number) references flight(flight_number)

);






--    ------- INSERT VALUES (RECORDS) TO CUSTOMER TABLE ----------
insert into customer(customer_name, customer_status, total_customer_mileage)values
('Agustine Riviera', 'Silver',115235),
('Alaina Sepulvida', 'Silver',6008),
('Tom Jones', 'Gold',205767),
('Sam Rio','None',205767),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);


-- ----------- INSERT VALUES INTO FLIGHT TABLE ----------
insert into flight(flight_number, aircraft, flight_mileage, total_aircraft_seats)values
('DL143', 'Boeing 747', 135, 400),
('DL122', 'Airbus A330', 4370, 236),
('DL53', 'Boeing 777', 2078, 264),
('DL222', 'Boeing 777', 1765, 264),
('DL37', 'Boeing 747', 531, 400);


-- ------------- INSERT INTO CUSTOMERS_FLIGHTS TABLE -----------
insert into booking(customer_id, flight_number)values
(1, 'DL143'),
(1, 'DL122'),
(2, 'DL122'),
(3, 'DL122'),
(3, 'DL53'),
(3, 'DL222'),
(4, 'DL143'),
(4, 'DL37'),
(5, 'DL143'),
(5, 'DL122'),
(6, 'DL222'),
(7, 'DL222'),
(8, 'DL222');





-- ------------- Lab's Requirements -------------

-- Total Number Of Flights 
select COUNT(*)flight_number 
from booking;

-- Average Flight Distance
SELECT AVG(flight_mileage)
FROM flight;

-- Average Number Of Seats
select AVG(total_aircraft_seats) 
from flight;

-- Average Number Of Miles Flown By Customers Grouped By Status. 
SELECT customer_status, AVG(total_customer_mileage) 
FROM customer 
GROUP BY customer_status;

-- Maximum Number Of Miles Flown By Customers Grouped By Status. 
SELECT customer_status, MAX(total_customer_mileage) 
FROM customer 
GROUP BY customer_status;

-- Total Number Of Aircraft Name Containing Boeing
select COUNT(aircraft)
from flight
where aircraft like '%Boeing%';

--  All Flights With A Distance Between 300 And 2000 Miles.
SELECT *
FROM flight
WHERE flight_mileage BETWEEN 300 AND 2000;

-- Average Flight Distance Booked Grouped By Customer Status
SELECT customer_status, AVG(flight_mileage) AS average_flight_distance
FROM booking
INNER JOIN customer ON booking.customer_id = customer_id
INNER JOIN flight ON booking.flight_number = flight.flight_number
GROUP BY customer_status;


-- The Most Often Booked Aircraft By Gold Status Members
SELECT f.aircraft, COUNT(*) as booking_count
FROM booking b
INNER JOIN customer c ON b.customer_id = c.id
INNER JOIN flight f ON b.flight_number = f.flight_number
WHERE c.customer_status = 'Gold'
GROUP BY f.aircraft
ORDER BY booking_count DESC
LIMIT 1;
    