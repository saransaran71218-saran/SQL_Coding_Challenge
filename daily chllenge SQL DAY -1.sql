create database City_Hospital_1;
 use City_Hospital_1;
 create table Patients(
    patients_id int,
    patients_name varchar(100));
    
    alter table patients add column age int;
    alter table patients add column gender varchar(50);
    alter table patients add column AdmissionDate date;
    
    alter table patients add column DoctorAssigned varchar(100);
    alter table patients modify  patients_name varchar(50);
    rename table patients to patient_info;
    truncate table patient_info;
    drop table patient_info;
    
    
    
