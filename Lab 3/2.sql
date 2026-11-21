create or replace procedure register_patient(p_id int, p_name varchar, p_age int, p_contact varchar) language plpgsql as $$
begin 
insert into patient values (p_id, p_name, p_age, p_contact);
end;
$$;
create or replace procedure enter_treatment(a_id int, t_id int, diag varchar, t_date date, presc_id int, med varchar, dose varchar)
language plpgsql as $$
begin
insert into treatment values (t_id, a_id, diag, t_date);
insert into prescription values(presc_id, t_id, med, dose);
end;
$$;
call register_patient(7, 'Neha', 38, '9990007777');
call enter_treatment(701, 802, 'Seasonal allergy', '2026-08-01', 902, 'Cetirizine', '10mg once daily');
