select * from mpg;

SELECT *, CONCAT('19', model_year) AS launch_year
FROM mpg; 			

with new_mpg as
(SELECT *, CONCAT('19', model_year) AS launch_year
FROM mpg)
select * from new_mpg;


select 
	round(avg(mpg),2) as average_mpg
from mpg;

select
	max(horsepower) as maximum_horsepower
from mpg;

select
	round(avg(acceleration),2) as average_acceleration
from mpg;


SELECT
    car_name,
    round(avg(mpg),2) AS total_mpg
FROM
    mpg
GROUP BY
    car_name
ORDER BY
    total_mpg DESC
limit 5;



select
	model_year,
    round(avg(mpg),2) as average_mpg,
    round(avg(weight),2) as average_weight
from
	mpg
group by
	model_year
order by
	model_year,average_mpg;
    
    
    
-- First Query: Calculate average weight
SELECT AVG(weight) AS average_weight
FROM mpg;

-- Second Query: Select car names, max mpg, and weight for cars with weight greater than the average
SELECT
    car_name,
    MAX(mpg) AS max_mpg,
    weight
FROM
    mpg
WHERE
    weight > (SELECT AVG(weight) FROM mpg)
GROUP BY
    car_name, weight
order by
	max_mpg desc
limit 5;



SELECT
    model_year,
    AVG(horsepower) AS avg_hpower,
    origin
FROM
    mpg
GROUP BY
    model_year, origin
ORDER BY
    model_year,avg_hpower;



SELECT
    car_name,
    AVG(displacement) AS avg_dsp
FROM
    mpg
GROUP BY
    car_name
ORDER BY
    avg_dsp DESC
LIMIT 5;



SELECT
    car_name,
    displacement,
    ((displacement - AVG(displacement) OVER ()) / AVG(displacement) OVER ()) * 100 AS displacement_percentage
FROM
    mpg
WHERE
    displacement > (SELECT AVG(displacement) FROM mpg)
ORDER BY
    displacement_percentage DESC
LIMIT 10;


SELECT
    car_name,
    horsepower,
    acceleration,
    mpg
FROM
    mpg
WHERE
    mpg > (SELECT AVG(mpg) FROM mpg)
ORDER BY
    acceleration DESC, horsepower DESC
LIMIT 10;


