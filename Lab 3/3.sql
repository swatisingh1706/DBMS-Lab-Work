create or replace function doctor_appointment_summary(doc_id int)
returns table(patient_name varchar, appt_date date, appt_status varchar, diagnosis varchar) language plpgsql as $$
declare 
cur cursor for
select p.name, a.appointment_date, a.status, t.diagnosis
from appointment a
join patient p on a.patient_id = p.patient_id
left join treatment t on a.appointment_id = t.appointment_id
where a.doctor_id = doc_id;
r record;
begin
open cur;
loop
fetch cur into r;
exit when not found;
patient_name := r.name;
appt_date := r.appointment_date;
appt_status := r.status;
diagnosis := coalesce(r.diagnosis, 'Not yet treated');
return next;
end loop;
close cur;
end;
$$;
select * from doctor_appointment_summary(2)
order by appt_date;
