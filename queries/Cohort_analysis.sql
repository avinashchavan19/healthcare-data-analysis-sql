# first visit month for each patient
SELECT patient_id ,MONTHNAME(MIN(appointment_date)) AS "FIRST MONTH" FROM appointments
GROUP BY patient_id;
# -------------------------------------------------------------------------------------------
# Create cohort groups
select p.patient_id, p.patient_name, 
date_format(min(a.appointment_date),"%y-%m") as cohort_month
from patients p 
join appointments a 
on p.patient_id = a.patient_id
where a.status = "completed"
group by p.patient_id, p.patient_name;
