SELECT *
FROM flight_punctuality;

# How many flights were delayed by more than 15 minutes each month?
SELECT
	DATE_FORMAT(flight_date, '%Y-%m') AS month,
    COUNT(*) AS total_flight
FROM flight_punctuality
WHERE delay_minutes > 15
GROUP BY month
ORDER BY month;

# Which airline has the highest average delay?
SELECT airline, ROUND(AVG(delay_minutes),2) AS average_delay
FROM flight_punctuality
GROUP BY airline
ORDER BY average_delay DESC;

# Which route (from departure to arrival) has the highest total delay?
SELECT airline, departure_airport, arrival_airport,
SUM(delay_minutes) AS total_delay
FROM flight_punctuality
GROUP BY airline, departure_airport, arrival_airport;

SELECT 
    CONCAT(departure_airport, ' → ', arrival_airport) AS route,
    SUM(delay_minutes) AS total_delay
FROM flight_punctuality
GROUP BY route
ORDER BY total_delay DESC; 




# What is the average delay for each airport?
SELECT
	departure_airport,
    ROUND(AVG(delay_minutes),2) AS average_delay
FROM
	flight_punctuality
GROUP BY
	departure_airport
ORDER BY
	average_delay DESC;


