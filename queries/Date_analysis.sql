# number of appointments per month
select month(appointment_date) as month, count(*) as Total_appointments
from appointments 
where status = "completed"
group by month
order by month;

#---------------------------------------------------------------------------
# number of appointments per year
select year(appointment_date) as year, count(*) as Total_appointments
from appointments 
where status = "completed"
group by year
order by year;

# ------------------------------------------------------------------------
# days between appointment and review
select a.appointment_id, a.appointment_date, r.review_date,
datediff(r.review_date, a.appointment_date) as days_difference
from appointments a 
join reviews r 
on a.appointment_id = r.appointment_id 
where a.status = "completed";
# -------------------------------------------------------------------------
# patients who visited in the last 30 days
SELECT DISTINCT 
    p.patient_id,
    p.patient_name
FROM patients p
JOIN appointments a
    ON p.patient_id = a.patient_id
WHERE a.appointment_date >= (SELECT MAX(appointment_date) FROM appointments) - INTERVAL 30 DAY
AND a.status = 'completed';

# -------------------------------------------------------------------------
# month-wise revenue trend
select month(appointment_date) as month, sum(t.treatment_cost) as revenue
from appointments a 
join treatments t 
on a.appointment_id = t.appointment_id
where a.status = "completed"
group by month 
order by month;
