begin;
insert into appointment(appointment_id, patient_id, doctor_id, appointment_date, appointment_time, status) values (705, 5,4, '2026-08-03', '14:00:00', 'Scheduled');

savepoint after_booking;

update appointment 
set status = 'Completed'
where appointment_id = 705;

rollback to savepoint after_booking;

commit;
