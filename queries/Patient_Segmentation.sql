# recency, frequency, and monetary value for each patient
select p.patient_id, max(a.appointment_id) as "last_visit / recency" , count(a.appointment_id) as "frequency", sum(treatment_cost) as "monetary"
from patients p
join appointments a
on p.patient_id = a.patient_id
join treatments t
on t.appointment_id = a.appointment_id
where a.status = "completed"
group by p.patient_id;

# RFM scores using NTILE
with rfm as 
(select p.patient_id, max(a.appointment_id) as "last_visit" , count(a.appointment_id) as "frequency", sum(treatment_cost) as "monetary"
from patients p
join appointments a
on p.patient_id = a.patient_id
join treatments t
on t.appointment_id = a.appointment_id
where a.status = "completed"
group by p.patient_id)
select *, 
ntile(4) over (order by last_visit desc) recency_score, 
ntile(4) over (order by frequency desc) freq_score, 
ntile(4) over (order by monetary desc) monetary_score
from rfm;
# ------------------------------------------------------------------------------------

# top 10 high-value patients
select p.patient_id, p.patient_name, sum(t.treatment_cost) as Total_cost
from patients p 
join appointments a 
on p.patient_id = a.patient_id
join treatments t
on t.appointment_id = a.appointment_id
where a.status = "completed"
group by p.patient_id, p.patient_name
order by Total_cost desc
limit 10;
# -------------------------------------------------------------------------------------
