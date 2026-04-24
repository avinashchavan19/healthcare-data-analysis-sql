## total revenue by treatment type

select t.treatment_type,sum(t.treatment_cost) as Total_Revenue from appointments a 
join treatments t
on a.appointment_id = t.appointment_id
where a.status = "completed"
group by t.treatment_type;

# -------------------------------------------------------------------------------------

## total number of treatments per hospital

select h.hospital_name,count(t.treatment_id) as total_treatments 
from hospitals h 
join doctors d
	on h.hospital_id = d.hospital_id
join appointments a 
	on a.doctor_id = d.doctor_id
join treatments t
	on a.appointment_id = t.appointment_id
where a.status = "completed"
group by h.hospital_name;

# -------------------------------------------------------------------------------------

# top 5 treatments by revenue
select t.treatment_type,sum(t.treatment_cost) as Total_Revenue from appointments a 
join treatments t
on a.appointment_id = t.appointment_id
where a.status = "completed"
group by t.treatment_type
order by Total_Revenue desc
limit 5;

# ------------------------------------------------------------------------------------

# average treatment cost per specialization

select d.specialization,avg(t.treatment_cost) as average_treatment_cost 
from doctors d
join appointments a 
	on d.doctor_id = a.doctor_id
join treatments t
	on a.appointment_id = t.appointment_id
where a.status = "completed"
group by specialization;
