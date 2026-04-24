# most common payment type
select p.payment_type , count(*) as total_count 
from  payments p 
join appointments a 
on p.appointment_id = a.appointment_id
where a.status = "completed"
group by payment_type
order by total_count desc
limit 1;

# ----------------------------------------------------------------
# percentage contribution of each payment type
select p.payment_type, 
COUNT(*) * 100.0 / (SELECT COUNT(*) FROM payments) AS percentage
from payments p 
join appointments a
on p.appointment_id = a.appointment_id
where a.status = "completed"
group by p.payment_type;
# ------------------------------------------------------

# average payment amount
select avg(p.payment_amount) as avg_payment_amount
from payments p 
join appointments a 
on p.appointment_id = a.appointment_id
where a.status= "completed";
