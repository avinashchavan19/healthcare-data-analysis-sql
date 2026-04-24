# total revenue per hospital
select h.hospital_name, sum(t.treatment_cost) as total_revenue 
from appointments a
join treatments t
	on a.appointment_id = t.appointment_id
join doctors d
	on a.doctor_id = d.doctor_id
join hospitals h 
	on h.hospital_id = d.hospital_id
where a.status = "completed"
group by hospital_name;
# -------------------------------------------------------------------------------------

# hospitals within each state
select h.state, h.hospital_name, sum(t.treatment_cost) as revenue
from treatments t
join appointments a 
	on t.appointment_id = a.appointment_id
join doctors d
	on a.doctor_id = d.doctor_id
join hospitals h 
	on d.hospital_id = h.hospital_id
where a.status = "completed"
group by h.state,h.hospital_name
order by h.state,revenue desc;
# ----------------------------------------------------------------------------------------
# top hospital in each state
with afs as(
select h.state, h.hospital_name, sum(t.treatment_cost) as revenue
from treatments t
join appointments a 
	on t.appointment_id = a.appointment_id
join doctors d
	on a.doctor_id = d.doctor_id
join hospitals h 
	on d.hospital_id = h.hospital_id
where a.status = "completed"
group by h.state,h.hospital_name
)
select * from(select * , rank() over (partition by state order by revenue desc) as rn
from afs) ranked
where rn = 1;
