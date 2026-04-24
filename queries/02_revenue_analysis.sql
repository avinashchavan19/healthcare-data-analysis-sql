-- Revenue Analysis

SELECT treatment_type, SUM(cost) AS total_revenue
FROM treatments
GROUP BY treatment_type
ORDER BY total_revenue DESC;

-- Top Patients
SELECT patient_id, SUM(cost) AS total_spent
FROM treatments
GROUP BY patient_id
ORDER BY total_spent DESC;
