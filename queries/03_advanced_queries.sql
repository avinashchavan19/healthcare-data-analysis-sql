-- Ranking Doctors using Window Function

SELECT doctor_id,
       SUM(cost) AS revenue,
       RANK() OVER (ORDER BY SUM(cost) DESC) AS rank
FROM treatments
GROUP BY doctor_id;

-- High Value Patients
SELECT patient_id,
       SUM(cost) AS total_spent,
       NTILE(4) OVER (ORDER BY SUM(cost) DESC) AS segment
FROM treatments;
