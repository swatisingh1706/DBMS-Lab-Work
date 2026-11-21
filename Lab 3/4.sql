create or replace function log_status_change()
returns trigger as $$
begin
insert into appointment_log(appointment_id, old_status, new_status, changed_at) values (NEW.appointment_id, OLD.status, NEW.status, '2024-01-01 00:00:00');
return NEW;
end;
$$ language plpgsql;

create trigger trg_status_audit after update on appointment for each row 
when (OLD.status is distinct from NEW.status)
execute function
log_status_change();
