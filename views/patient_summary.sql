create view patient_summary as 
select p.patient_id,p.patient_name , count(a.appointment_id) as total_visits, 
sum(t.treatment_cost) as total_spent, avg(t.treatment_cost) as average_treatment_cost,
max(a.appointment_date) as last_visit
from patients p
join appointments a
on p.patient_id = a.patient_id
join treatments t
on a.appointment_id = t.appointment_id
where a.status = "completed"
group by p.patient_id,p.patient_name;

select * from patient_summary;
