USE bigten;

/* Which colleges accept SAT scores between 1100-1350? */
SELECT college_id, college_name, avg_sat_score
FROM admissions
JOIN colleges
	USING(college_id)
WHERE avg_sat_score > 1100 AND avg_sat_score < 1350
ORDER BY avg_sat_score;

/* How many colleges are in each setting? */
SELECT label, COUNT(setting_id) AS counts
FROM colleges
JOIN settings
	USING(setting_id) 
GROUP BY setting_id
ORDER BY counts DESC;

/* Which colleges have been ranked in the top 3 for each sport? */
SELECT college_name, sport_name, rank
FROM colleges
JOIN rankings
	USING(college_id)
	JOIN sports
		USING(sport_id)
WHERE rank <= 3
   AND colleges.college_id IN
	(SELECT college_id 
	 FROM bigten.rankings
	 WHERE rank <= 3
	 GROUP BY college_id
	 HAVING COUNT(*) > 2)
GROUP BY college_id, sport_id;

/* Which colleges have less than 100 total incidents? */
SELECT college_id, college_name, sub.number_of_incidents
FROM
	(SELECT college_id, (non_negligent_manslaughter + negligent_manslaughter +
rape + fondling +incest + statutory_rape + robbery + aggravated_assult + burglary + motor_vehicle_theft + arson) AS number_of_incidents 
	FROM incidents) sub
    JOIN colleges
		USING(college_id)
WHERE sub.number_of_incidents < 100;

/* What is the total number of incidents for each setting? */
SELECT setting_id, label AS Setting, SUM(sub.total_incidents) AS 'Total Incidents'
FROM
	(SELECT setting_id, (non_negligent_manslaughter + negligent_manslaughter+ rape + fondling + incest + statutory_rape +
    robbery + aggravated_assult + burglary + motor_vehicle_theft + arson) AS Total_Incidents
	FROM colleges
		JOIN incidents USING(college_id)
		)sub
    JOIN settings USING(setting_id)
GROUP BY setting_id;

/* What is the average in state tuition for colleges with less than a 50% acceptance rate? */
SELECT AVG(in_state) AS Average
FROM admissions
	JOIN tuition USING(college_id)
WHERE acceptance_rate < .5;

