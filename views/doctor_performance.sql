create view doctor_performance as 
select d.doctor_id, d.doctor_name,
d.specialization,h.hospital_name,d.experience_years,  
count(a.appointment_id) as total_appointments,
sum(t.treatment_cost) as total_revenue,
avg(t.treatment_cost) as avg_treatment_cost,
avg(r.rating) as avg_ratings
from hospitals h

join doctors d
on h.hospital_id = d.hospital_id
join appointments a 
on d.doctor_id = a.doctor_id
left join reviews r 
on a.appointment_id = r.appointment_id
join treatments t
on r.appointment_id = t.appointment_id

where a.status = "completed"
group by d.doctor_id, d.doctor_name,
d.specialization,h.hospital_name,d.experience_years; 

select * from doctor_performance;
