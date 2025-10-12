SELECT * FROM airlines.final_data;

SELECT COUNT(`FLIGHT_NUMBER`) AS count_of_flights
FROM final_data ; 


SELECT SUM(`CANCELLED`) AS count_of_cncelled_flights , (  SUM(`CANCELLED`) / COUNT(`FLIGHT_NUMBER`) * 100)AS percentage_of_cancelled_flights
FROM final_data ; 


SELECT AIRLINE , SUM(`CANCELLED`) AS count_of_cncelled_flights , (  SUM(`CANCELLED`) / COUNT(`FLIGHT_NUMBER`) * 100)AS percentage_of_cancelled_flights
FROM final_data 
GROUP BY AIRLINE 
ORDER BY percentage_of_cancelled_flights DESC ; 


SELECT Cancellation_Reason_Desc , SUM(`CANCELLED`) AS count_of_cncelled_flights
FROM final_data
WHERE CANCELLED = 1 
GROUP BY Cancellation_Reason_Desc 
ORDER BY count_of_cncelled_flights DESC ; 

SELECT COUNT(`FLIGHT_NUMBER`) AS count_of_diverted_flights
FROM final_data
WHERE DIVERTED = 1 ; 

SELECT AVG(`AIR_SYSTEM_DELAY`),MAX(`AIR_SYSTEM_DELAY`),MIN(`AIR_SYSTEM_DELAY`) 
FROM final_data 
WHERE AIR_SYSTEM_DELAY != 0 ; 

SELECT AVG(`SECURITY_DELAY`),MAX(`SECURITY_DELAY`),MIN(`SECURITY_DELAY`) 
FROM final_data 
WHERE SECURITY_DELAY != 0 ;

SELECT AVG(`AIRLINE_DELAY`),MAX(`AIRLINE_DELAY`),MIN(`AIRLINE_DELAY`) 
FROM final_data 
WHERE AIRLINE_DELAY != 0 ; 

SELECT AVG(`LATE_AIRCRAFT_DELAY`),MAX(`LATE_AIRCRAFT_DELAY`),MIN(`LATE_AIRCRAFT_DELAY`)
FROM final_data 
WHERE LATE_AIRCRAFT_DELAY != 0 ; 

SELECT AVG(`WEATHER_DELAY`),MAX(`WEATHER_DELAY`),MIN(`WEATHER_DELAY`)
FROM final_data 
WHERE WEATHER_DELAY != 0 ; 


SELECT * FROM airlines.final_data;


SELECT AIRLINE ,  (COUNT(CASE WHEN `ARRIVAL_DELAY_new` BETWEEN -15 AND 15 THEN 1 END) /COUNT(`FLIGHT_NUMBER`) * 100) AS percentage_of_flights_arrived_in_the_scheduled_time
FROM final_data 
GROUP BY AIRLINE 
ORDER BY percentage_of_flights_arrived_in_the_scheduled_time DESC;

SELECT DAY_OF_WEEK , (COUNT(CASE WHEN `ARRIVAL_DELAY_new` BETWEEN -15 AND 15 THEN 1 END) /COUNT(`FLIGHT_NUMBER`) * 100) AS percentage_of_flights_arrived_in_the_scheduled_time
FROM final_data 
GROUP BY DAY_OF_WEEK 
ORDER BY percentage_of_flights_arrived_in_the_scheduled_time DESC;


SELECT ORIGIN_AIRPORT , (COUNT(CASE WHEN `ARRIVAL_DELAY_new` BETWEEN -15 AND 15 THEN 1 END) /COUNT(`FLIGHT_NUMBER`) * 100) AS percentage_of_flights_arrived_in_the_scheduled_time
FROM final_data 
GROUP BY ORIGIN_AIRPORT 
ORDER BY percentage_of_flights_arrived_in_the_scheduled_time DESC;


SELECT MONTH(`Flight_date`) , (COUNT(CASE WHEN `ARRIVAL_DELAY_new` BETWEEN -15 AND 15 THEN 1 END) /COUNT(`FLIGHT_NUMBER`) * 100) AS percentage_of_flights_arrived_in_the_scheduled_time
FROM final_data 
GROUP BY MONTH(`Flight_date`) 
ORDER BY percentage_of_flights_arrived_in_the_scheduled_time DESC;


SELECT ORIGIN_AIRPORT , SUM(DIVERTED) AS sum_of_diverted_FLIGHTS_BY_origin_airport
FROM final_data 
GROUP BY ORIGIN_AIRPORT 
ORDER BY sum_of_diverted_FLIGHTS_BY_origin_airport DESC ;


SELECT DESTINATION_AIRPORT , SUM(`DIVERTED`) AS sum_of_diverted_FLIGHTS_BY_distnation_airport
FROM final_data 
GROUP BY DESTINATION_AIRPORT 
ORDER BY sum_of_diverted_FLIGHTS_BY_distnation_airport DESC ;

SELECT AIRLINE , SUM(`DIVERTED`) AS sum_of_diverted_FLIGHTS_BY_AIRLINE
FROM final_data 
GROUP BY AIRLINE 
ORDER BY sum_of_diverted_FLIGHTS_BY_AIRLINE DESC ;

SELECT ORIGIN_AIRPORT , SUM(`AIR_SYSTEM_DELAY`) AS sum_of_air_system_delays_by_origin_airport
FROM final_data 
GROUP BY ORIGIN_AIRPORT 
ORDER BY sum_of_air_system_delays_by_origin_airport DESC ;

SELECT ORIGIN_AIRPORT , SUM(`SECURITY_DELAY`) AS sum_of_SECURITY_DELAY_by_origin_airport
FROM final_data 
GROUP BY ORIGIN_AIRPORT 
ORDER BY sum_of_SECURITY_DELAY_by_origin_airport DESC ;


SELECT DESTINATION_AIRPORT , SUM(`SECURITY_DELAY`) AS sum_of_SECURITY_DELAY_by_distnation_airport
FROM final_data 
GROUP BY DESTINATION_AIRPORT 
ORDER BY sum_of_SECURITY_DELAY_by_distnation_airport DESC ;


SELECT ORIGIN_AIRPORT , SUM(`WEATHER_DELAY`) AS sum_of_WEATHER_DELAY_by_ORIGIN_AIRPORT
FROM final_data 
GROUP BY ORIGIN_AIRPORT 
ORDER BY sum_of_WEATHER_DELAY_by_ORIGIN_AIRPORT DESC ;


SELECT AIRLINE , SUM(`AIRLINE_DELAY`) AS sum_of_AIRLINE_DELAY_by_airline , AVG(`AIRLINE_DELAY`) AS average_of_AIRLINE_DELAY_by_airline
FROM final_data 
GROUP BY AIRLINE 
ORDER BY sum_of_SECURITY_DELAY_by_airline DESC ;


SELECT AIRLINE , AVG(`ARRIVAL_DELAY_new`) AS average_of_ARRIVAL_DELAY_by_airline , SUM(`ARRIVAL_DELAY_new`) AS sum_of_ARRIVAL_DELAY_by_airline
FROM final_data 
GROUP BY AIRLINE 
ORDER BY average_of_ARRIVAL_DELAY_by_airline DESC ;



SELECT * FROM airlines.final_data ;






















































