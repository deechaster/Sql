-- -- CREATE database HOSPITAL;
-- -- use HOSPITAL;
-- -- SELECT database();
-- -- create database HOSPITAL;

-- -- CREATING DOCTOR TABLE
-- -- create table Doctor (
-- -- 	Doc_ID numeric(5) primary key,
-- -- 	Doc_Name varchar(50) not null,
-- -- 	Gender varchar(1) check (Gender in ('M','F','T')) not null,
-- -- 	DOB date,
-- -- 	Specialist varchar(30) check (Specialist in ('Ophthalmologist', 'Cardiologist', 'Allergist',
-- -- 	'Dentist', 'Epidemiologist', 'Anesthesiologist', 'Trauma Surgeon', 'Neurosurgeon' ,
-- -- 	'ENT Specialist', 'Paediatrician', 'Rheumatologist') ) not null,
-- -- 	Qualification varchar(10) check (Qualification in ('MBBS' , 'MS' , 'MD' , 'BDS' , 'MDS',
-- -- 	'BUMS', 'BHMS' ) ) not null,
-- -- 	Contact int(10) unique not null,
-- -- 	Address varchar(30) not null,
-- -- 	Dept_no varchar(5)
-- -- );
-- -- ALTER TABLE Doctor MODIFY COLUMN Doc_ID varchar(5);

-- -- -- CREATING DEPARTMENT
-- -- CREATE TABLE Department(
-- -- Dept_no VARCHAR(5) PRIMARY KEY,
-- -- Dept_name VARCHAR(20) CHECK (Dept_name in ( 'Trauma Unit' , 'Cardiology', 'Intensive care unit',
-- -- 'Neurology', 'Oncology', 'Obstetrics and gynaecology', 'Dental', 'Paediatrics', 'Rheumatology' ) ) NOT NULL,
-- -- Room_no numeric ( 4 ) NOT NULL,
-- -- Room_floor numeric (2),
-- -- Estd_date DATE CHECK (Estd_date >= STR_TO_DATE('January 10 2010', '%M %d %Y' )),
-- -- Hod VARCHAR(5) ,
-- -- FOREIGN KEY (Hod) REFERENCES Doctor (Doc_ID)
-- -- );-

-- -- ALTER TABLE Doctor ADD CONSTRAINT fk_doc_dept FOREIGN KEY (Dept_no) REFERENCES Department (Dept_no);

-- -- CREATING STAFF TABLE

-- -- create table Staff (
-- --     Staff_id varchar(5) PRIMARY KEY,
-- --     Staff_name varchar(30) NOT NULL,
-- --     Category VARCHAR(20) CHECK (Category in ('Nurse', 'Lab technician', 'Attender', 'Helper', 'Security',
-- --     'Cleaner', 'Receptionist')) NOT NULL,
-- --     Designation VARCHAR(20) CHECK(Designation in ('Staff Nurse', 'Head Nurse', 'Technician',
-- --     'Senior Technician', 'Senior Attender', 'Junior Attender') ) NOT NULL,
-- --     Dob DATE,
-- --     Contact INT(10) UNIQUE NOT NULL,
-- --     Addres_s VARCHAR(30) NOT NULL,
-- --     Dept_no VARCHAR(5),
-- --     FOREIGN KEY (Dept_no) REFERENCES Department (Dept_no)
-- -- );

-- -- CREATING PATIENT TABLE

-- -- CREATE TABLE Patient (
-- --     Pat_id VARCHAR(5) PRIMARY KEY,
-- --     Pat_name VARCHAR(20) NOT NULL,
-- --     Dob DATE,
-- --     Gender CHAR(1) CHECK (Gender in ('M' , 'F' , 'T')) NOT NULL,
-- --     Contact INT(10) UNIQUE NOT NULL,
-- --     Addres_s VARCHAR(30) NOT NULL
-- -- );  

-- -- CREATING IN_PATIENT TABLE

-- -- CREATE TABLE In_patient(
-- --     Pat_id VARCHAR(5),
-- --     FOREIGN KEY (Pat_id) REFERENCES Patient (Pat_id),
-- --     Admission_date DATE,
-- --     Bed_no INT(2) NOT NULL,
-- --     Start_time TIMESTAMP NOT NULL,
-- --     End_time TIMESTAMP NOT NULL,
-- --     PRIMARY KEY(Pat_id, Admission_date)
-- -- );

-- -- CREATING APPOINTMENT TABLE

-- -- CREATE TABLE Appointment(
-- --     App_id VARCHAR(5) PRIMARY KEY,
-- --     Pat_id VARCHAR(5),
-- --     FOREIGN KEY (Pat_id) REFERENCES Patient(Pat_id),
-- --     Doc_ID VARCHAR(5),
-- --     FOREIGN KEY (Doc_ID) REFERENCES Doctor (Doc_ID),
-- --     Nurse_id VARCHAR(5),
-- --     FOREIGN KEY (Nurse_id) REFERENCES Staff (Staff_id),
-- --     Consulting_room INT(4) NOT NULL,
-- --     App_time TIMESTAMP
-- -- );    

-- -- CREATING PRESCRIPTION TABLE 

-- -- CREATE TABLE Prescription(
-- --     Pres_id VARCHAR(5) PRIMARY KEY,
-- --     App_id VARCHAR(5),
-- --     FOREIGN KEY (App_id) REFERENCES Appointment(App_id),
-- --     App_date_time TIMESTAMP NOT NULL,
-- --     Diagnostic_details VARCHAR( 30) NOT NULL
-- -- );

-- -- CREATING IN_PATIENT_PRESCRIPTION TABLE

-- -- CREATE TABLE In_patient_prescription(
-- --     Pat_id VARCHAR(5),
-- --     FOREIGN KEY (Pat_id) REFERENCES Patient(Pat_id),
-- --     Pres_id VARCHAR(5),
-- --     FOREIGN KEY (Pres_id) REFERENCES Prescription(Pres_id),
-- --     PRIMARY KEY(Pat_id, Pres_id)
-- -- );

-- -- CREATING PRESCRIBED MEDICINES TABLE

-- -- CREATE TABLE Prescribed_medicines(
-- --     Pres_id VARCHAR(5),
-- --     FOREIGN KEY (Pres_id) REFERENCES Prescription(Pres_id) ,
-- --     Medicine_name VARCHAR(20) NOT NULL,
-- --     Dosage VARCHAR(30) NOT NULL,
-- --     Brand VARCHAR(20) NOT NULL,
-- --     PRIMARY KEY(Pres_id, Medicine_name)
-- -- );

-- -- CREATING HOSPITAL BILL TABLE

-- -- CREATE TABLE Hospital_bill(
-- --     Inv_no INT (5) ,
-- --     Inv_date DATE,
-- --     PRIMARY KEY(Inv_no, Inv_date),
-- --     Pat_id VARCHAR(5),
-- --     FOREIGN KEY (Pat_id) REFERENCES Patient(Pat_id),
-- --     Bill_amount DECIMAL (10, 2) NOT NULL,
-- --     Payment_type VARCHAR(20) CHECK (Payment_type in ('Credit card' , 'Debit card', 'PayTM',
-- --     'GPay' , 'Cash') ) NOT NULL,
-- --     Discount DECIMAL (10, 2)
-- -- );    

-- -- CREATING LAB TESTS TABLE

-- -- CREATE TABLE Lab_tests(
-- --     Test_id VARCHAR(5) PRIMARY KEY,
-- --     Pat_id VARCHAR(5),
-- --     FOREIGN KEY (Pat_id) REFERENCES Patient(Pat_id),    
-- --     Date_time TIMESTAMP NOT NULL
-- -- );

-- -- CREATING TEST TYPES TABLE

-- -- CREATE TABLE Test_types(
-- --     TT_id VARCHAR(5) PRIMARY KEY,
-- --     Test_description VARCHAR(30) CHECK (Test_description in ('Urine test', 'Blood test',
-- --     'ECG' , 'X-ray') ) NOT NULL,
-- --     Low_val INT (3) NOT NULL,
-- --     High_val INT(3) NOT NULL,
-- --     Test_method VARCHAR(20) NOT NULL,
-- --     Technician VARCHAR(5),
-- --     FOREIGN KEY (Technician) REFERENCES Staff(Staff_id)
-- -- );

-- -- CREATING TEST RESULTS TABLE

-- -- CREATE TABLE Test_results(
-- --     Test_id VARCHAR(5) ,
-- --     TT_id VARCHAR(5),
-- --     FOREIGN KEY (Test_id) REFERENCES Lab_tests (Test_id),
-- --     FOREIGN KEY (TT_id) REFERENCES Test_types(TT_id),
-- --     PRIMARY KEY(Test_id, TT_id),
-- --     Result VARCHAR(10) NOT NULL
-- -- );    


-- -- POPULATING DEPARTMENT TABLE

-- -- INSERT INTO Department VALUES ('DP001','Cardiology','3017','03',STR_TO_DATE ('MARCH 17 2018' , '%M %d %Y'), null);
-- -- INSERT INTO Department VALUES ('DP002','Trauma Unit','8001','08',STR_TO_DATE ('JANUARY 10 2020' , '%M %d %Y'), null);
-- -- INSERT INTO Department VALUES ('DP003','Rheumatology','9204','09',STR_TO_DATE ('FEBRUARY 17 2017' , '%M %d %Y'), null);
-- -- INSERT INTO Department VALUES ('DP004','Dental','4031','04',STR_TO_DATE ('APRIL 14 2018' , '%M %d %Y'), null);
-- -- INSERT INTO Department VALUES ('DP005','Paediatrics','8005','08',STR_TO_DATE ('NOVEMBER 01 2014' , '%M %d %Y'), null);
-- -- INSERT INTO Department VALUES ('DP006','ICU','1012','11',STR_TO_DATE ('DECEMBER 22 2015' , '%M %d %Y'), null);
-- -- INSERT INTO Department VALUES ('DP007','Oncology','2020','02',STR_TO_DATE ('OCTOBER 14 2016' , '%M %d %Y'), null);
-- -- INSERT INTO Department VALUES ('DP008','Neurology','4001','04',STR_TO_DATE ('SEPTEMBER 09 2020' , '%M %d %Y'), null);
-- -- INSERT INTO Department VALUES ('DP009','Dental','1001','01',STR_TO_DATE ('MAY 04 2015' , '%M %d %Y'), null);
-- -- INSERT INTO Department VALUES ('DP010','Rheumatology','9022','09',STR_TO_DATE ('JUNE 10 2012' , '%M %d %Y'), null);

-- -- POPULATING DOCTOR TABLE

-- -- INSERT INTO Doctor VALUES ('DR001','DR. DEEP PATEL','M', STR_TO_DATE ('NOVEMBER 26 1979', '%M %d %Y'), 'Cardiologist', 'MBBS' ,'89803584','202 SEPAL APT, VADODARA','DP001');
-- -- INSERT INTO Doctor VALUES ('DR002','DR. PANKAJ SHAH','M', STR_TO_DATE ('JANUARY 11 1981', '%M %d %Y'), 'Trauma Surgeon', 'MD' ,'98965312','104 SHASWAT APT, HARNI','DP002');
-- -- INSERT INTO Doctor VALUES ('DR003','DR. KAMYA PATEL','F', STR_TO_DATE ('NOVEMBER 06 1975', '%M %d %Y'), 'Rheumatologist', 'MBBS' ,'97564211','102 KISMAT APT, SURAT','DP003');
-- -- INSERT INTO Doctor VALUES ('DR004','DR. ADOMS JOHN','M', STR_TO_DATE ('APRIL 06 1978', '%M %d %Y'), 'Dentist', 'BDS' ,'88776562','305-B RAMVIHAR DUPLAX, MUMBAI','DP004');
-- -- INSERT INTO Doctor VALUES ('DR005','DR. LALLU DAMORT','M', STR_TO_DATE ('JUNE 28 1999', '%M %d %Y'), 'Paediatrician', 'MDS' ,'82351455','22 XYZ SOCIETY, PUNE','DP005');
-- -- INSERT INTO Doctor VALUES ('DR006','DR. VAIDEHI','F', STR_TO_DATE ('OCTOBER 16 1981', '%M %d %Y'), 'Epidemiologist', 'BDS' ,'88700062','QWT  DUPLAX, CALAFONIA','DP007');
-- -- INSERT INTO Doctor VALUES ('DR007','DR. KARISHMA KAPOR','F', STR_TO_DATE ('SEPTEMBER 20 1978', '%M %d %Y'), 'Anesthesiologist', 'MD' ,'88965102','SHUBHAM TENAMENT, KERALA','DP009');
-- -- INSERT INTO Doctor VALUES ('DR008','DR. SIDDHI PATEL','F', STR_TO_DATE ('JANUARY 04 1989', '%M %d %Y'), 'Ophthalmologist', 'MBBS' ,'78752365','GOVUI TENAMENT, BANGLURU','DP006');
-- -- INSERT INTO Doctor VALUES ('DR009','DR. ANMOL BHAEDWAJ','M', STR_TO_DATE ('JULY 23 1984', '%M %d %Y'), 'Neurosurgeon', 'MDS' ,'63517589','LOGI BUNGLOWS, MERUTH','DP008');
-- -- INSERT INTO Doctor VALUES ('DR010','DR. UTPAL PRAJAPATI','M', STR_TO_DATE ('JUNE 20 1994', '%M %d %Y'), 'Dentist', 'BDS' ,'99917589','OM APT, KOLHAPUR','DP004');
-- -- INSERT INTO Doctor VALUES ('DR011','DR. NUPOOR KUMARI','F', STR_TO_DATE ('AUGUST 15 1974', '%M %d %Y'), 'Dentist', 'BDS' ,'99882210','SWARG COLONY, KASHMIR','DP004');


-- -- ALTER TABLE Department changes Dept_name Dept_name longtext;



-- -- ALTER TABLE Department 
-- -- MODIFY Dept_name VARCHAR(90) CHECK (Dept_name in ( 'Trauma Unit' , 'Cardiology', 'ICU','Neurology', 'Oncology', 'Obstetrics and gynaecology', 'Dental', 'Paediatrics', 'Rheumatology' ,'Psychiatrist') ) NOT NULL;

-- -- UPDATE Department
-- -- SET Dept_name  = 'Obstetrics and gynaecology' 
-- -- WHERE Dept_no = 'DP009';

-- -- DELETE FROM Department 
-- -- WHERE Dept_no = 'DP008';

-- -- DELETE FROM Department 
-- -- WHERE Dept_no = 'DP006';

-- -- ALTER TABLE Department 
-- -- DROP CONSTRAINT department_chk_1;

-- -- UPDATE Department SET Hod = 'DR001' WHERE Dept_no= 'DP001';
-- -- UPDATE Department SET Hod = 'DR002' WHERE Dept_no= 'DP002';
-- -- UPDATE Department SET Hod = 'DR003' WHERE Dept_no= 'DP003';
-- -- UPDATE Department SET Hod = 'DR004' WHERE Dept_no= 'DP004';
-- -- UPDATE Department SET Hod = 'DR005' WHERE Dept_no= 'DP005';
-- -- UPDATE Department SET Hod = 'DR006' WHERE Dept_no= 'DP007';
-- -- UPDATE Department SET Hod = 'DR007' WHERE Dept_no= 'DP009';
-- -- UPDATE Department SET Hod = 'DR008' WHERE Dept_no= 'DP006';
-- -- UPDATE Department SET Hod = 'DR009' WHERE Dept_no= 'DP008';
-- -- UPDATE Department SET Hod = 'DR010' WHERE Dept_no= 'DP004';

-- -- POPULATING STAFF TABLE

-- -- INSERT INTO Staff VALUES ('STF01','JULI CHAHAL','Nurse','Head Nurse', STR_TO_DATE ('NOVEMBER 26 1979', '%M %d %Y'),'88996621','ABC APT,BENGKIOK','DP002');
-- -- INSERT INTO Staff VALUES ('STF02','MUNNA MOTI','Attender','Junior Attender', STR_TO_DATE ('JANUARY 30 1999', '%M %d %Y'),'32568545','BABLU APT,MIRZAPUR','DP010');
-- -- INSERT INTO Staff VALUES ('STF03','RAM DAS','Security','Senior Attender', STR_TO_DATE ('DECEMBER 25 1988', '%M %d %Y'),'65324785','506 QWAIO,CHINA','DP006');
-- -- INSERT INTO Staff VALUES ('STF04','MUNNA TRIPATHI','Lab technician','Senior Technician', STR_TO_DATE ('APRIL 25 1989', '%M %d %Y'),'91356845','AKASH, CALIFONIA','DP004');
-- -- INSERT INTO Staff VALUES ('STF05','GUDDU BHAIYA','Receptionist','Junior Attender', STR_TO_DATE ('FEBRUARY 14 1982', '%M %d %Y'),'63254125','VIHAR SOCIETY,PATNA','DP009');
-- -- INSERT INTO Staff VALUES ('STF06','DHANUSHREE PANDYA','Nurse','Staff Nurse', STR_TO_DATE ('JANUARY 28 1989', '%M %d %Y'),'74563259','BOAT HOUSE,KANYAKUMARI','DP003');
-- -- INSERT INTO Staff VALUES ('STF07','ESHIKA PATEL','Cleaner','Junior Attender', STR_TO_DATE ('JUNE 01 1994', '%M %d %Y'),'55326478','202 JABLI,BIHAR','DP005');
-- -- INSERT INTO Staff VALUES ('STF08','ALIYA DAMOR','Nurse','Staff Nurse', STR_TO_DATE ('OCTOBER 10 1989', '%M %d %Y'),'88445216','QWT BUNGLOWS,BENGLURU','DP008');
-- -- INSERT INTO Staff VALUES ('STF09','VARUN SHAH','Nurse','Staff Nurse', STR_TO_DATE ('SEPTEMBER 16 1985', '%M %d %Y'),'44596621','RAM SOCIETY,KERALA','DP007');
-- -- INSERT INTO Staff VALUES ('STF10','TERNITY PATIL','Helper','Senior Attender', STR_TO_DATE ('AUGUST 03 1989', '%M %d %Y'),'44526451','KAMYA COLONY,KASHMIR','DP001');

-- -- POPULATING PATIENT TABLE'

-- -- INSERT INTO Patient VALUES ('PAT01','VANDAN PATEL',STR_TO_DATE ('AUGUST 15 1978', '%M %d %Y'),'M','98756423','23 SARVODAY,MANJALPUR');
-- -- INSERT INTO Patient VALUES ('PAT02','UTPALA BALAGI',STR_TO_DATE ('APRIL 20 1988', '%M %d %Y'),'M','78956423','43 BAMROLI,GODHRA');
-- -- INSERT INTO Patient VALUES ('PAT03','AMIR SIDDQI',STR_TO_DATE ('MAY 23 1978', '%M %d %Y'),'M','45789632','99 BREEK,KERALA');
-- -- INSERT INTO Patient VALUES ('PAT04','RANU MONDAL',STR_TO_DATE ('JANUARY 14 1987', '%M %d %Y'),'F','48965368','56 GANTIVADA,HIMATTNAGR');
-- -- INSERT INTO Patient VALUES ('PAT05','KUNAL KAMRA',STR_TO_DATE ('FEBRUARY 22 1970', '%M %d %Y'),'M','598756321','35 TRIPATHI CHOCK,MIRZAPUR');
-- -- INSERT INTO Patient VALUES ('PAT06','RAKHI SAWAT',STR_TO_DATE ('DECEMBER 11 1989', '%M %d %Y'),'F','96587456','76 MOTNATH,HARBI');
-- -- INSERT INTO Patient VALUES ('PAT07','REHYA CHKRAVEDI',STR_TO_DATE ('OCTOBER 17 1973', '%M %d %Y'),'F','85656389','87 MARUUR,BENGKOK');
-- -- INSERT INTO Patient VALUES ('PAT08','KAMU DAMOR',STR_TO_DATE ('SEPTEMBER 15 1982', '%M %d %Y'),'F','96458523','35 APPLESTORE,CALIFONIA');
-- -- INSERT INTO Patient VALUES ('PAT09','LEAN DOBA',STR_TO_DATE ('JULY 21 1978', '%M %d %Y'),'M','88445566','14 GALIYOE,LOS LOST');
-- -- INSERT INTO Patient VALUES ('PAT10','GEL SAPA',STR_TO_DATE ('AUGUST 17 1990', '%M %d %Y'),'M','99654523','54 SWARG,BUMRO');
-- -- INSERT INTO Patient VALUES ('PAT11','LOGI TECHWALA',STR_TO_DATE ('NOVEMBER 19 1999', '%M %d %Y'),'M','23556423','75 MAWAWALA,SURAT');
-- -- INSERT INTO Patient VALUES ('PAT12','JONJ KIA',STR_TO_DATE ('MARCH 01 1980', '%M %d %Y'),'M','45896423','02 GASITERAM,PUNE');
-- -- INSERT INTO Patient VALUES ('PAT13','AASHA RAM',STR_TO_DATE ('AUGUST 27 1978', '%M %d %Y'),'F','96326423','03 SHUBHAM,KOLHAPUR');
-- -- INSERT INTO Patient VALUES ('PAT14','DHRUAVI HARD',STR_TO_DATE ('DECEMBER 25 1999', '%M %d %Y'),'F','23216423','65 BOLYWUD,BENGALA');
-- -- INSERT INTO Patient VALUES ('PAT15','RAMILA',STR_TO_DATE ('FEBRUARY 14 1970', '%M %d %Y'),'F','98000054','24 HOLISH,HAIDRABAD');

-- -- POPULATING IN PATIENT

-- -- INSERT INTO In_patient VALUES ('PAT01',STR_TO_DATE ('APRIL 13 2020', '%M %d %Y'),'65', TIMESTAMP ('2020-04-13','15:47:20'),TIMESTAMP ('2020-04-13', '20:25:56'));
-- -- INSERT INTO In_patient VALUES ('PAT03',STR_TO_DATE ('MAY 17 2020', '%M %d %Y'),'65', TIMESTAMP ('2020-05-17','13:57:20'),TIMESTAMP ('2020-05-17', '14:57:56'));
-- -- INSERT INTO In_patient VALUES ('PAT02',STR_TO_DATE ('AUGUST 30 2020', '%M %d %Y'),'65', TIMESTAMP ('2020-08-30','19:50:25'),TIMESTAMP ('2020-08-30', '20:25:56'));
-- -- INSERT INTO In_patient VALUES ('PAT07',STR_TO_DATE ('FEBRUARY 14 2020', '%M %d %Y'),'65', TIMESTAMP ('2020-02-14','19:47:20'),TIMESTAMP ('2020-02-14', '20:13:56'));
-- -- INSERT INTO In_patient VALUES ('PAT09',STR_TO_DATE ('JULY 19 2020', '%M %d %Y'),'65', TIMESTAMP ('2020-07-19','13:47:20'),TIMESTAMP ('2020-07-19', '15:00:56'));
-- -- INSERT INTO In_patient VALUES ('PAT11',STR_TO_DATE ('JUNE 22 2020', '%M %d %Y'),'65', TIMESTAMP ('2020-06-22','20:47:20'),TIMESTAMP ('2020-06-22', '20:59:56'));
-- -- INSERT INTO In_patient VALUES ('PAT14',STR_TO_DATE ('JANUARY 29 2020', '%M %d %Y'),'65', TIMESTAMP ('2020-01-29','14:20:22'),TIMESTAMP ('2020-01-29', '17:51:56'));
-- -- INSERT INTO In_patient VALUES ('PAT05',STR_TO_DATE ('SEPTEMBER 20 2020', '%M %d %Y'),'65', TIMESTAMP ('2020-09-20','20:02:22'),TIMESTAMP ('2020-09-20', '22:41:52'));

-- -- POPULATING APPOINTMENT TABLE

-- -- INSERT INTO Appointment VALUES ('AP001','PAT01','DR001','STF01','3014', TIMESTAMP ('2020-05-19','13:10:11'));
-- -- INSERT INTO Appointment VALUES ('AP002','PAT03','DR003','STF06','7014', TIMESTAMP ('2020-12-19','14:20:11'));
-- -- INSERT INTO Appointment VALUES ('AP003','PAT06','DR004','STF09','3024', TIMESTAMP ('2020-02-19','17:50:11'));
-- -- INSERT INTO Appointment VALUES ('AP004','PAT08','DR006','STF10','9453', TIMESTAMP ('2020-01-19','22:44:11'));
-- -- INSERT INTO Appointment VALUES ('AP005','PAT10','DR002','STF09','5032', TIMESTAMP ('2020-11-19','20:42:54'));
-- -- INSERT INTO Appointment VALUES ('AP006','PAT11','DR009','STF06','4035', TIMESTAMP ('2020-07-19','19:32:22'));
-- -- INSERT INTO Appointment VALUES ('AP007','PAT13','DR010','STF01','9047', TIMESTAMP ('2020-05-19','15:40:00'));


-- -- POPULATING PRESCRIPTION TABLE

-- -- INSERT INTO Prescription VALUES ('PRE01','AP001', TIMESTAMP ('2020-05-19','13:10:11'), 'COVID');
-- -- INSERT INTO Prescription VALUES ('PRE02','AP002', TIMESTAMP ('2020-12-19','14:20:11'), 'HEART FAILURE');
-- -- INSERT INTO Prescription VALUES ('PRE03','AP003', TIMESTAMP ('2020-02-19','17:50:11'), 'ACCEDIENT');
-- -- INSERT INTO Prescription VALUES ('PRE04','AP004', TIMESTAMP ('2020-01-19','22:44:11'), 'BRAIN DEAD');
-- -- INSERT INTO Prescription VALUES ('PRE05','AP005', TIMESTAMP ('2020-11-19','20:42:54'), 'LUNG CANCER');
-- -- INSERT INTO Prescription VALUES ('PRE06','AP006', TIMESTAMP ('2020-07-19','19:32:22'), 'OVERDOZE OF DRUGS');
-- -- INSERT INTO Prescription VALUES ('PRE07','AP007', TIMESTAMP ('2020-05-19','15:40:00'), 'APPENDICITIES');

-- -- POPULATING IN_PATIENT_PRESCRIPTION TABLE

-- -- INSERt INTO In_patient_prescription VALUES ('PAT01','PRE01');
-- -- INSERt INTO In_patient_prescription VALUES ('PAT03','PRE02');
-- -- INSERt INTO In_patient_prescription VALUES ('PAT08','PRE04');
-- -- INSERt INTO In_patient_prescription VALUES ('PAT06','PRE03');
-- -- INSERt INTO In_patient_prescription VALUES ('PAT10','PRE05');
-- -- INSERt INTO In_patient_prescription VALUES ('PAT12','PRE06');
-- -- INSERt INTO In_patient_prescription VALUES ('PAT09','PRE07');

-- -- POPULATING Prescribed_medicines TABLE

-- -- INSERT INTO Prescribed_medicines VALUES ('PRE01','PATANGLI','Every Day','PATANN');
-- -- INSERT INTO Prescribed_medicines VALUES ('PRE02','CROCINE','Every week','HIMALAYA');
-- -- INSERT INTO Prescribed_medicines VALUES ('PRE03','PERACITAMOL','Every night','MEDIMIC');
-- -- INSERT INTO Prescribed_medicines VALUES ('PRE04','BOMBIFLIES','Every year','PIFAR');
-- -- INSERT INTO Prescribed_medicines VALUES ('PRE05','VICONOTY','Every morning','ROCHE');
-- -- INSERT INTO Prescribed_medicines VALUES ('PRE06','FAIRLOVELY','Every year','BIOGEN');
-- -- INSERT INTO Prescribed_medicines VALUES ('PRE07','MEDIMIX','Every Hour','CELEGENE');

-- -- POPULATING HOSPITAL BILLS TABLE

-- -- INSERT INTO Hospital_bill VALUES ('10002',STR_TO_DATE ('AUGUST 15 2020' , '%M %d %Y'), 'PAT01','1023.5','Cash','30.59');
-- -- INSERT INTO Hospital_bill VALUES ('20120',STR_TO_DATE ('JANUARY 30 2020' , '%M %d %Y'), 'PAT01','7850.59','PayTm','830.59');
-- -- INSERT INTO Hospital_bill VALUES ('10285',STR_TO_DATE ('FEBRUARY 14 2020' , '%M %d %Y'), 'PAT01','23002.17','GPay','1030.52');
-- -- INSERT INTO Hospital_bill VALUES ('30245',STR_TO_DATE ('SEPTEMBER 22 2020' , '%M %d %Y'), 'PAT01','92023.74','Credit card','530.09');
-- -- INSERT INTO Hospital_bill VALUES ('23014',STR_TO_DATE ('MARCH 10 2020' , '%M %d %Y'), 'PAT01','19993.32','Debit card','1050.00');
-- -- INSERT INTO Hospital_bill VALUES ('10123',STR_TO_DATE ('DECEMBER 25 2020' , '%M %d %Y'), 'PAT01','100.5','Cash','5.84');
-- -- INSERT INTO Hospital_bill VALUES ('10312',STR_TO_DATE ('JUNE 28 2020' , '%M %d %Y'), 'PAT01','17.5','GPay','1.00');

-- -- POPULATING LAB_TESTS TABLE

-- -- INSERT INTO Lab_tests VALUES ('TES01','PAT01',TIMESTAMP ('2020-11-11','13:20:55'));
-- -- INSERT INTO Lab_tests VALUES ('TES02','PAT02',TIMESTAMP ('2020-10-12','23:15:55'));
-- -- INSERT INTO Lab_tests VALUES ('TES03','PAT05',TIMESTAMP ('2020-10-13','18:45:55'));
-- -- INSERT INTO Lab_tests VALUES ('TES04','PAT03',TIMESTAMP ('2020-10-14','19:56:45'));
-- -- INSERT INTO Lab_tests VALUES ('TES05','PAT06',TIMESTAMP ('2020-09-15','20:20:51'));
-- -- INSERT INTO Lab_tests VALUES ('TES06','PAT04',TIMESTAMP ('2020-04-20','15:15:10'));
-- -- INSERT INTO Lab_tests VALUES ('TES07','PAT07',TIMESTAMP ('2020-01-22','14:10:15'));

-- -- POPULATING TEST_TYPES TABLE

-- -- INSERT INTO Test_types VALUES ('TT001','Urine test','10','45','Urinanalysis','STF04');
-- -- INSERT INTO Test_types VALUES ('TT002','Blood test','14','94','Centrifugation','STF04');
-- -- INSERT INTO Test_types VALUES ('TT003','ECG','17','30','Electrical signal','STF04');
-- -- INSERT INTO Test_types VALUES ('TT004','X-ray','26','75','Spectroscopy','STF04');

-- -- UPDATE Test_types SET Test_method = 'Blood test' WHERE TT_id ='TT002';

-- -- POPULATING Test_RESULTS TABLE 

-- -- INSERT INTO Test_results VALUES ('TES01','TT001','POSITIVE');
-- -- INSERT INTO Test_results VALUES ('TES02','TT002','NEGATIVE');
-- -- INSERT INTO Test_results VALUES ('TES03','TT003','POSITIVE');
-- -- INSERT INTO Test_results VALUES ('TES04','TT004','NEGATIVE');
-- -- INSERT INTO Test_results VALUES ('TES05','TT003','POSITIVE');
-- -- INSERT INTO Test_results VALUES ('TES06','TT002','NEGATIVE');
-- -- INSERT INTO Test_results VALUES ('TES07','TT001','POSITIVE');

-- -- DDL STATMENTS (ALTER CONSTRAINT ETC)

-- -- 1) Modify Hospital_Bill by adding an attribute consulting_physician and add
-- -- foreign key constraint for that attribute. Use constraint name for foreign key
-- -- constraint. 

-- -- ALTER TABLE Hospital_bill 
-- -- ADD Consulting_physician VARCHAR(50);
-- -- ALTER TABLE Hospital_bill ADD CONSTRAINT doc_hos_bill FOREIGN KEY (Consulting_physician) 
-- -- REFERENCES Doctor(Doc_ID);
 

-- -- 2) In Patient table, replace address with three attributes namely street, city and
-- -- pincode. 

-- -- ALTER TABLE Patient ADD STREET VARCHAR(50);
-- -- ALTER TABLE Patient ADD CITY VARCHAR(50);
-- -- ALTER TABLE Patient ADD PINCODE NUMERIC(5);

-- -- ALTER TABLE Patient DROP COLUMN Addres_s;
-- -- INSERT INTO Patient ( STREET, CITY, PINCODE ) VALUES ('SARVODAY','MANJALPUR','23');

-- -- UPDATE Patient SET STREET = 'SARVODAY' WHERE Pat_id= 'PAT01';
-- -- UPDATE Patient SET CITY = 'MANJALPUR' WHERE Pat_id= 'PAT01';
-- -- UPDATE Patient SET PINCODE = '20453' WHERE Pat_id= 'PAT01'; 

-- -- UPDATE Patient SET STREET = 'BAMROLI' WHERE Pat_id= 'PAT02';
-- -- UPDATE Patient SET CITY = 'GODHRA' WHERE Pat_id= 'PAT02';
-- -- UPDATE Patient SET PINCODE = '85632' WHERE Pat_id= 'PAT02'; 

-- -- UPDATE Patient SET STREET = 'GALIGOYE' WHERE Pat_id= 'PAT03';
-- -- UPDATE Patient SET CITY = 'LOS ANGLES' WHERE Pat_id= 'PAT03';
-- -- UPDATE Patient SET PINCODE = '11102' WHERE Pat_id= 'PAT03'; 

-- -- UPDATE Patient SET STREET = 'BREEK' WHERE Pat_id= 'PAT04';
-- -- UPDATE Patient SET CITY = 'KERALA' WHERE Pat_id= 'PAT04';
-- -- UPDATE Patient SET PINCODE = '63210' WHERE Pat_id= 'PAT04'; 

-- -- UPDATE Patient SET STREET = 'GATIWADA' WHERE Pat_id= 'PAT05';
-- -- UPDATE Patient SET CITY = 'HIMMATNAGR' WHERE Pat_id= 'PAT05';
-- -- UPDATE Patient SET PINCODE = '36541' WHERE Pat_id= 'PAT05'; 

-- -- UPDATE Patient SET STREET = 'TRIPATHI CHOCK' WHERE Pat_id= 'PAT06';
-- -- UPDATE Patient SET CITY = 'MIRZAPUR' WHERE Pat_id= 'PAT06';
-- -- UPDATE Patient SET PINCODE = '54123' WHERE Pat_id= 'PAT06'; 

-- -- UPDATE Patient SET STREET = 'MOTNATH' WHERE Pat_id= 'PAT07';
-- -- UPDATE Patient SET CITY = 'HARNI' WHERE Pat_id= 'PAT07';
-- -- UPDATE Patient SET PINCODE = '38900' WHERE Pat_id= 'PAT07'; 

-- -- UPDATE Patient SET STREET = 'MARUR' WHERE Pat_id= 'PAT08';
-- -- UPDATE Patient SET CITY = 'BENGKOK' WHERE Pat_id= 'PAT08';
-- -- UPDATE Patient SET PINCODE = '74125' WHERE Pat_id= 'PAT08'; 

-- -- UPDATE Patient SET STREET = 'APPLIOUS' WHERE Pat_id= 'PAT09';
-- -- UPDATE Patient SET CITY = 'CALIFINOIA' WHERE Pat_id= 'PAT09';
-- -- UPDATE Patient SET PINCODE = '41023' WHERE Pat_id= 'PAT09'; 

-- -- UPDATE Patient SET STREET = 'SWARG' WHERE Pat_id= 'PAT10';
-- -- UPDATE Patient SET CITY = 'KASHMIR' WHERE Pat_id= 'PAT10';
-- -- UPDATE Patient SET PINCODE = '12345' WHERE Pat_id= 'PAT10'; 

-- -- UPDATE Patient SET STREET = 'MAWAWALA' WHERE Pat_id= 'PAT11';
-- -- UPDATE Patient SET CITY = 'SURAT' WHERE Pat_id= 'PAT011';
-- -- UPDATE Patient SET PINCODE = '36363' WHERE Pat_id= 'PAT11'; 

-- -- UPDATE Patient SET STREET = 'GASITERAM' WHERE Pat_id= 'PAT12';
-- -- UPDATE Patient SET CITY = 'PUNE' WHERE Pat_id= 'PAT012';
-- -- UPDATE Patient SET PINCODE = '41232' WHERE Pat_id= 'PAT12'; 

-- -- UPDATE Patient SET STREET = 'HALWAI KONDA' WHERE Pat_id= 'PAT13';
-- -- UPDATE Patient SET CITY = 'JAIPUR' WHERE Pat_id= 'PAT013';
-- -- UPDATE Patient SET PINCODE = '52102' WHERE Pat_id= 'PAT13'; 

-- -- UPDATE Patient SET STREET = 'BOLYWUD' WHERE Pat_id= 'PAT14';
-- -- UPDATE Patient SET CITY = 'MUMBAI' WHERE Pat_id= 'PAT014';
-- -- UPDATE Patient SET PINCODE = '62301' WHERE Pat_id= 'PAT14'; 

-- -- UPDATE Patient SET STREET = 'BASTRI KENDRA' WHERE Pat_id= 'PAT15';
-- -- UPDATE Patient SET CITY = 'BIHAR' WHERE Pat_id= 'PAT015';
-- -- UPDATE Patient SET PINCODE = '30147' WHERE Pat_id= 'PAT15'; 

-- -- 3) Add an attribute Test_Time which can accept only two values “Before food”
-- -- and “After food” with proper constraint name. 

-- -- ALTER TABLE Test_types ADD Test_Time VARCHAR(20);
-- -- ALTER TABLE Test_types ADD CONSTRAINT test_time_type CHECK (Test_Time IN ('Before food' , 'After food'));

-- -- UPDATE Test_types SET Test_Time = 'Before food' WHERE TT_id = 'TT001';
-- -- UPDATE Test_types SET Test_Time = 'After food' WHERE TT_id = 'TT002';
-- -- UPDATE Test_types SET Test_Time = 'Before food' WHERE TT_id = 'TT003';
-- -- UPDATE Test_types SET Test_Time = 'After food' WHERE TT_id = 'TT004';


-- -- 4) Remove the constraint only from test_time attribute. 

-- -- ALTER TABLE Test_types DROP CONSTRAINT test_time_type;

-- -- 5) Drop address attribute from staff table and add attributes door_no, street,
-- -- city, and pincode. 


-- -- ALTER TABLE Staff ADD DOOR_NO VARCHAR(50);
-- -- ALTER TABLE Staff ADD STREET VARCHAR(50);
-- -- ALTER TABLE Staff ADD CITY VARCHAR(50);
-- -- ALTER TABLE Staff ADD PINCODE NUMERIC(10);
-- -- ALTER TABLE Staff DROP COLUMN Addres_s;

-- -- UPDATE Staff SET DOOR_NO = '12' WHERE Staff_id='STF01';
-- -- UPDATE Staff SET DOOR_NO = '23' WHERE Staff_id='STF02';
-- -- UPDATE Staff SET DOOR_NO = '01' WHERE Staff_id='STF03';
-- -- UPDATE Staff SET DOOR_NO = '201' WHERE Staff_id='STF04';
-- -- UPDATE Staff SET DOOR_NO = '304' WHERE Staff_id='STF05';
-- -- UPDATE Staff SET DOOR_NO = '17' WHERE Staff_id='STF06';
-- -- UPDATE Staff SET DOOR_NO = '19' WHERE Staff_id='STF07';
-- -- UPDATE Staff SET DOOR_NO = '22' WHERE Staff_id='STF08';
-- -- UPDATE Staff SET DOOR_NO = '604' WHERE Staff_id='STF09';
-- -- UPDATE Staff SET DOOR_NO = '101' WHERE Staff_id='STF10';

-- -- UPDATE Staff SET STREET = 'ABC APT' WHERE Staff_id='STF01';
-- -- UPDATE Staff SET STREET = 'BABLU CHOCK' WHERE Staff_id='STF02';
-- -- UPDATE Staff SET STREET = 'TRIPATHI CHOCK' WHERE Staff_id='STF03';
-- -- UPDATE Staff SET STREET = 'MANINAGR' WHERE Staff_id='STF04';
-- -- UPDATE Staff SET STREET = 'AKSK' WHERE Staff_id='STF05';
-- -- UPDATE Staff SET STREET = 'QWT' WHERE Staff_id='STF06';
-- -- UPDATE Staff SET STREET = 'VIHAR MARG' WHERE Staff_id='STF07';
-- -- UPDATE Staff SET STREET = 'BEFRD' WHERE Staff_id='STF08';
-- -- UPDATE Staff SET STREET = 'BOAT HOUSE' WHERE Staff_id='STF09';
-- -- UPDATE Staff SET STREET = 'SWARG' WHERE Staff_id='STF10';

-- -- UPDATE Staff SET CITY = 'BENGKOK' WHERE Staff_id='STF01';
-- -- UPDATE Staff SET CITY = 'MANJALPUR' WHERE Staff_id='STF02';
-- -- UPDATE Staff SET CITY = 'MIRZAPUR' WHERE Staff_id='STF03';
-- -- UPDATE Staff SET CITY = 'CHINA' WHERE Staff_id='STF04';
-- -- UPDATE Staff SET CITY = 'LOS ANGELS' WHERE Staff_id='STF05';
-- -- UPDATE Staff SET CITY = 'CALIFONUIA' WHERE Staff_id='STF06';
-- -- UPDATE Staff SET CITY = 'HAIDRABAD' WHERE Staff_id='STF07';
-- -- UPDATE Staff SET CITY = 'AHMEDABAD' WHERE Staff_id='STF08';
-- -- UPDATE Staff SET CITY = 'VADODARA' WHERE Staff_id='STF09';
-- -- UPDATE Staff SET CITY = 'KOLHAPUR' WHERE Staff_id='STF10';

-- -- UPDATE Staff SET PINCODE = '654123' WHERE Staff_id='STF01';
-- -- UPDATE Staff SET PINCODE = '964520' WHERE Staff_id='STF02';
-- -- UPDATE Staff SET PINCODE = '321456' WHERE Staff_id='STF03';
-- -- UPDATE Staff SET PINCODE = '369852' WHERE Staff_id='STF04';
-- -- UPDATE Staff SET PINCODE = '321789' WHERE Staff_id='STF05';
-- -- UPDATE Staff SET PINCODE = '954785' WHERE Staff_id='STF06';
-- -- UPDATE Staff SET PINCODE = '654852' WHERE Staff_id='STF07';
-- -- UPDATE Staff SET PINCODE = '412589' WHERE Staff_id='STF08';
-- -- UPDATE Staff SET PINCODE = '513452' WHERE Staff_id='STF09';
-- -- UPDATE Staff SET PINCODE = '654321' WHERE Staff_id='STF10';


-- -- 6) Create a table Medicines with schema medicines=(med_name, brand,
-- -- dosage, manu_date, exp_date). Ensure that manu_date should not be later
-- -- than exp_date. Create an appropriate constraint to ensure this. 


-- -- CREATE TABLE Medicines (
-- --     Med_name VARCHAR(50) NOT NULL,
-- --     Brand VARCHAR(50) NOT NULL,
-- --     Dosage VARCHAR(50),
-- --     Manu_date DATE,
-- --     Exp_date DATE,
-- --     PRIMARY KEY (Med_name,Brand)
-- -- );

-- -- ALTER TABLE Medicines ADD CONSTRAINT exp_gt_manu CHECK (Exp_date >= Manu_date);

-- -- INSERT INTO Medicines VALUES ('PATANGLI','PATANN','Every Day',STR_TO_DATE('AUGUST 15 2017', '%M %d %Y'),STR_TO_DATE('JUNE 30 2021', '%M %d %Y') );
-- -- INSERT INTO Medicines VALUES ('CROCINE','HIMALAYA','Every week',STR_TO_DATE('SEPTEMBER 05 2019', '%M %d %Y'),STR_TO_DATE('JANUARY 20 2023', '%M %d %Y'));
-- -- INSERT INTO Medicines VALUES ('PERACITAMOL','MEDIMIC','Every night',STR_TO_DATE('NOVEMBER 26 2020', '%M %d %Y'),STR_TO_DATE('APRIL 09 2028', '%M %d %Y'));
-- -- INSERT INTO Medicines VALUES ('BOMBIFLIES','PIFAR','Every year',STR_TO_DATE('FEBRUARY 14 2020', '%M %d %Y'),STR_TO_DATE('FEBRUARY 10 2021', '%M %d %Y'));
-- -- INSERT INTO Medicines VALUES ('VICONOTY','ROCHE','Every morning',STR_TO_DATE('OCTOBER 02 2018', '%M %d %Y'),STR_TO_DATE('MARCH 21 2021', '%M %d %Y'));
-- -- INSERT INTO Medicines VALUES ('FAIRLOVELY','BIOGEN','Every year',STR_TO_DATE('MAY 21 2020', '%M %d %Y'),STR_TO_DATE('JUNE 05 2024', '%M %d %Y'));
-- -- INSERT INTO Medicines VALUES ('MEDIMIX','CELEGENE','Every Hour',STR_TO_DATE('SEPTEMBER 26 2020', '%M %d %Y'),STR_TO_DATE('JULY 14 2021', '%M %d %Y'));


-- -- 7) Remove the attributes dosage and brand from Prescribed_Medicines and
-- -- alter the medicine_name attribute as a foreign key referencing the new table
-- -- Medicines. 

-- -- ALTER TABLE Prescribed_medicines 
-- -- DROP Dosage,
-- -- Drop Brand;

-- -- ALTER TABLE Prescribed_medicines ADD CONSTRAINT fk_pre_med FOREIGN KEY (Medicine_name) REFERENCES Medicines (Med_name);


-- -- 8)Create a view for doctors who are specialized in ‘Cardiology’ from Doctor
-- -- table with attributes doc_id, doc_name and gender. 

-- -- CREATE VIEW Cardiology AS
-- -- SELECT Doc_ID, Doc_Name , Gender
-- -- FROM Doctor WHERE Specialist = 'Cardiologist';


-- -- 9)Add an attribute No_of_staff in Department table and create a constraint
-- -- with constraint name to make sure the number is >0.

-- -- ALTER TABLE Department ADD COLUMN No_of_staff NUMERIC(3);
-- -- ALTER TABLE Department ADD CONSTRAINT  no_gt_zero CHECK (No_of_staff > 0);

-- -- UPDATE Department SET No_of_staff ='2' WHERE Dept_no ='DP001';
-- -- UPDATE Department SET No_of_staff ='1' WHERE Dept_no ='DP002';
-- -- UPDATE Department SET No_of_staff ='3' WHERE Dept_no ='DP003';
-- -- UPDATE Department SET No_of_staff ='4' WHERE Dept_no ='DP004';
-- -- UPDATE Department SET No_of_staff ='2' WHERE Dept_no ='DP005';
-- -- UPDATE Department SET No_of_staff ='5' WHERE Dept_no ='DP006';
-- -- UPDATE Department SET No_of_staff ='2' WHERE Dept_no ='DP007';
-- -- UPDATE Department SET No_of_staff ='1' WHERE Dept_no ='DP008';
-- -- UPDATE Department SET No_of_staff ='5' WHERE Dept_no ='DP009';
-- -- UPDATE Department SET No_of_staff ='2' WHERE Dept_no ='DP010';


-- -- 10) Add an attribute with In_Patient_prescription to store the Room_Type
-- -- which can store the values “AC” and “Non-AC”. 

-- -- ALTER TABLE In_patient_prescription ADD COLUMN Romm_type VARCHAR(50);
-- -- ALTER TABLE In_patient_prescription ADD CONSTRAINT room_type CHECK (Romn_type IN ('AC' , 'NON -AC')); 

-- -- UPDATE In_patient_prescription SET Romm_type ='AC' WHERE Pat_id ='PAT01';
-- -- UPDATE In_patient_prescription SET Romm_type ='NON -AC' WHERE Pat_id ='PAT03';
-- -- UPDATE In_patient_prescription SET Romm_type ='AC' WHERE Pat_id ='PAT06';
-- -- UPDATE In_patient_prescription SET Romm_type ='NON -AC' WHERE Pat_id ='PAT08';
-- -- UPDATE In_patient_prescription SET Romm_type ='AC' WHERE Pat_id ='PAT09';
-- -- UPDATE In_patient_prescription SET Romm_type ='NON -AC' WHERE Pat_id ='PAT10';
-- -- UPDATE In_patient_prescription SET Romm_type ='AC' WHERE Pat_id ='PAT12';



-- -- SQL QUARIES WITH JOIN OPERATION

-- -- 1). Find the HOD of doctor ‘Raghavan’ (Hint: you need to join the tables
-- -- DOCTOR and DEPARTMENT

-- -- SELECT Doctor.Doc_Name ,Department.Hod
-- -- FROM Doctor JOIN Department
-- -- ON Doctor.Dept_no = Department.Dept_no
-- -- WHERE Doc_Name='DR. SIDDHI PATEL';

-- -- 2) Find the list of all patients who were admitted in bed number ‘B101’ 

-- -- UPDATE In_patient SET Bed_no = '49' WHERE Pat_id = 'PAT02';
-- -- UPDATE In_patient SET Bed_no = '56' WHERE Pat_id = 'PAT03';
-- -- UPDATE In_patient SET Bed_no = '23' WHERE Pat_id = 'PAT05';
-- -- UPDATE In_patient SET Bed_no = '62' WHERE Pat_id = 'PAT07';
-- -- UPDATE In_patient SET Bed_no = '11' WHERE Pat_id = 'PAT09';
-- -- UPDATE In_patient SET Bed_no = '03' WHERE Pat_id = 'PAT11';
-- -- UPDATE In_patient SET Bed_no = '45' WHERE Pat_id = 'PAT14';

-- -- SELECT Patient.Pat_id, Patient.Pat_name, Patient.Dob, Patient.Gender, Patient.Contact, Patient.STREET, Patient.CITY, Patient.PINCODE, In_patient.Bed_no
-- -- FROM Patient JOIN In_patient
-- -- ON Patient.Pat_id = In_patient.Pat_id
-- -- WHERE Bed_no = '23';


-- -- 3) Display all the prescribed medicines of patient with Pat_ID ‘P101’ 

-- -- SELECT Prescribed_medicines.Pres_id , Prescribed_medicines.Medicine_name 
-- -- FROM Prescribed_medicines 
-- -- INNER JOIN In_patient_prescription 
-- -- ON In_patient_prescription.Pres_id = Prescribed_medicines.Pres_id
-- -- AND In_patient_prescription.Pat_id = 'PAT01';


-- -- 4) Display the test results of patient ‘Mani’ 

-- -- SELECT Test_results.Result
-- -- FROM Test_results
-- -- JOIN Lab_tests
-- -- ON Test_results.Test_id = Lab_tests.Test_id
-- -- JOIN Patient
-- -- ON Patient.Pat_id = Lab_tests.Pat_id
-- -- WHERE Pat_name = 'KUNAL KAMRA';


-- -- 5) Display all bills of bill amount more than 10000 rupees and paid by the
-- -- patient ‘Steve’. 

-- -- SELECT Hospital_bill.Inv_no, Hospital_bill.Inv_date, Hospital_bill.Pat_ID, Hospital_bill.Bill_amount, Hospital_bill.Payment_type, Hospital_bill.Discount, Patient.Pat_name
-- -- FROM Hospital_bill
-- -- JOIN Patient
-- -- ON Hospital_bill.Pat_id = Patient.Pat_id
-- -- WHERE Bill_amount > '10000' AND Pat_name = 'DHRUAVI HARD';

-- -- UPDATE Hospital_bill SET Pat_id = 'PAT02' WHERE Inv_no = '10123';
-- -- UPDATE Hospital_bill SET Pat_id = 'PAT03' WHERE Inv_no = '10285';
-- -- UPDATE Hospital_bill SET Pat_id = 'PAT05' WHERE Inv_no = '10312';
-- -- UPDATE Hospital_bill SET Pat_id = 'PAT06' WHERE Inv_no = '20120';
-- -- UPDATE Hospital_bill SET Pat_id = 'PAT11' WHERE Inv_no = '23014';
-- -- UPDATE Hospital_bill SET Pat_id = 'PAT14' WHERE Inv_no = '30245';

-- -- 6) Find the category and address of the nurse who attended the patient with
-- -- pat_no ‘P220’. 

-- -- SELECT Staff.Category, Staff.DOOR_NO, Staff.STREET, Staff.CITY, Staff.PINCODE
-- -- FROM Staff
-- -- JOIN Appointment
-- -- ON Staff.Staff_id = Appointment.Nurse_id
-- -- WHERE Pat_id = 'PAT06';

-- -- 7) Find the list of doctors who worked in the department which is started on or
-- -- after ’10-May-2018’.

-- -- SELECT Doctor.Doc_ID, Doctor.Doc_Name
-- -- FROM Doctor
-- -- INNER JOIN Department
-- -- ON Doctor.Dept_no = Department.Dept_name
-- -- AND Department.Estd_date > '2018-03-17';

-- -- baki chhe 7 mo

-- -- 8) Get the name of technicians who tests blood glucose level. 


-- -- SELECT Staff.Staff_name
-- -- FROM Staff
-- -- JOIN Test_types
-- -- ON Staff.Staff_id = Test_types.Technician
-- -- WHERE Test_description = 'Blood Test';

-- -- 9) Display the details of all patients who were hospitalized between ’10-Mar2017’ and ’10-Apr-2017’ 

-- -- SELECT Patient.Pat_id, Patient.Pat_name, Patient.Dob, Patient.Gender, Patient.Contact, Patient.STREET, Patient.CITY, Patient.PINCODE
-- -- FROM Patient
-- -- JOIN In_patient
-- -- ON Patient.Pat_id = In_patient.Pat_id
-- -- WHERE '2020-09-20' >= In_patient.Admission_date AND In_patient.Admission_date >= '2020-04-13';


-- -- 10) Display the in-patient prescription of the patient whose name is ‘Gayle’.

-- -- SELECT In_patient_prescription.Pat_id, In_patient_prescription.Pres_id
-- -- FROM In_patient_prescription
-- -- JOIN Patient
-- -- ON In_patient_prescription.Pat_id = Patient.Pat_id
-- -- WHERE Patient.Pat_name = 'KAMU DAMOR';



-- -- SQL queries - Nested subqueries

-- -- 1) Find the number of doctors who are working in the department ‘DP001’.
 
-- -- SELECT COUNT(*) doc_ct
-- -- FROM HOSPITAL.Doctor
-- -- WHERE Dept_no = 'DP001';

-- -- 2) Count the number of male patients who are treated by the doctor with doctor
-- -- id ‘D101’ 

-- -- SELECT COUNT(*) male_patient
-- -- FROM HOSPITAL.Appointment
-- -- JOIN Doctor
-- -- ON Appointment.Doc_ID = Doctor.Doc_ID
-- -- JOIN Patient
-- -- ON Appointment.Pat_id = Patient.Pat_id
-- -- WHERE Patient.Gender = 'M' AND Appointment.Doc_ID = 'DR001';

-- -- 3) Find the total bill paid by the patient ‘Karthik’ 
 
-- -- SELECT SUM( bill_amount )
-- -- FROM HOSPITAL.Hospital_bill AS HOSPITAL_BILL
-- -- INNER JOIN Patient AS PATIENT
-- -- ON HOSPITAL_BILL.Pat_id = PATIENT.Pat_id 
-- -- WHERE PATIENT.Pat_name = 'VANDAN PATEL';
  

-- -- 4) Find the name and address of the patient who paid the highest bill of all
-- -- patients.

-- -- SELECT Patient.Pat_name, Patient.STREET, Patient.CITY, Patient.PINCODE, MAX(Hospital_bill.Bill_amount)
-- -- FROM HOSPITAL.Patient
-- -- JOIN Hospital_bill
-- -- ON Patient.Pat_id = Hospital_bill.Pat_id;

-- -- 5) Get the specialization of doctors whose name start with the letter 'DR. S' 

-- -- SELECT Specialist FROM Doctor 
-- -- WHERE Doc_Name LIKE 'DR. S%';

-- -- 6) Find the all the patients details whose name is exactly 10 characters long 

-- -- SELECT * FROM Patient
-- -- WHERE LENGTH(Pat_name) = '10';

-- -- 7) Display the department names in ascending order

-- -- SELECT Dept_name FROM Department
-- -- ORDER BY Dept_name ASC;

-- -- 8) Get the gender wise count of patients

-- -- SELECT Gender, COUNT(Gender) FROM Patient WHERE Gender ='M' UNION
-- -- SELECT Gender, COUNT(Gender) FROM Patient WHERE Gender ='F';

-- -- 9)  Get the count of doctors for each specialization. 

-- -- SELECT Specialist, COUNT(Specialist) FROM Doctor GROUP BY Specialist ;  

-- -- 10) Get the total number tests conducted in any particular date. 

-- -- SELECT COUNT(Test_id) FROM Lab_tests WHERE MONTHNAME(Date_time) = 'OCTOBER';


-- -- SQL queries - Nested subqueries

-- -- 1)All of the queries in “SQL queries with JOIN operation” section can be tried
-- -- with subqueries concept

-- -- 1.a) Find the HOD of doctor ‘Raghavan’ 

-- -- SELECT Hod FROM Department WHERE Dept_no
-- -- IN (SELECT Dept_no FROM Doctor WHERE Doc_Name = 'DR. SIDDHI PATEL');

-- -- 2) Find the list of all patients who were admitted in bed number ‘B101’

-- SELECT * FROM Patient WHERE Pat_id 
-- IN (SELECT Pat_id FROM In_patient WHERE Bed_no = '23');

-- -- 3)Display all the prescribed medicines of patient with Pat_ID ‘P101’

-- -- SELECT Medicine_name FROM Prescribed_medicines WHERE Pres_id 
-- -- IN ( SELECT Pres_id FROM In_patient_prescription WHERE Pat_id = 'PAT01' );

-- -- 4) Display the test results of patient ‘Mani’

-- -- SELECT Result, Test_id FROM Test_results WHERE Test_id
-- -- IN (SELECT Test_id FROM Lab_tests WHERE Pat_id
-- -- IN (SELECT Pat_id FROM Patient WHERE Pat_name = 'KUNAL KAMRA'));

-- -- 5) Display all bills of bill amount more than 10000 rupees and paid by the
-- -- patient ‘Steve’.

-- -- SELECT Hospital_bill. * FROM Hospital_bill WHERE Pat_id
-- -- IN (SELECT Pat_id FROM Patient WHERE Pat_name ='DHRUAVI HARD') AND Bill_amount > 10000;

-- -- 6). Find the category and address of the nurse who attended the patient with
-- -- pat_no ‘P220’

-- -- SELECT Staff_name, Category FROM Staff WHERE Staff_id
-- -- IN (SELECT Nurse_id FROM Appointment WHERE Pat_id = 'PAT06');

-- -- 7) Find the list of doctors who worked in the department which is started on or
-- -- after ’10-May-2018’

-- -- SELECT Doc_ID , Doc_Name FROM Doctor WHERE Dept_no 
-- -- IN ( SELECT Dept_no FROM Department WHERE Estd_date > '2018-03-17');

-- -- 8)  Get the name of technicians who tests blood glucose level.

-- -- SELECT Staff_id , Staff_name FROM Staff WHERE Staff_id 
-- -- IN ( SELECT Technician FROM Test_types WHERE Test_description = 'Blood Test');

-- -- 9) Display the details of all patients who were hospitalized between ’10-Mar2017’ and ’10-Apr-2017’


-- -- SELECT * FROM Patient WHERE Pat_id 
-- -- IN ( SELECT Pat_id FROM In_patient WHERE Admission_date BETWEEN '2020-04-13' AND '2020-09-20');

-- -- 10) Display the in-patient prescription of the patient whose name is ‘Gayle’.

-- -- SELECT * FROM Prescription WHERE Pres_id 
-- -- IN ( SELECT Pres_id FROM In_patient_prescription WHERE Pat_id IN 
-- -- (SELECT Pat_id FROM Patient WHERE Pat_name = 'KAMU DAMOR'));



-- -- 2) Display the list of doctors who are working in the department with more
-- -- number of doctors using sub-query and IN operator.

-- -- SELECT Doc_Name FROM HOSPITAL.Doctor WHERE 
-- -- Dept_no IN (SELECT Dept_no FROM Doctor GROUP BY Dept_no HAVING COUNT (Dept_no) > 1);

-- -- 3) Find the name and id of all patients who are older than all the doctors in the
-- -- entire ‘cardiology’ department. Use subqueries and ALL operator.

-- -- SELECT Pat_id , Pat_name FROM Patient WHERE Dob < ALL ( SELECT Dob FROM Doctor WHERE Dept_no IN
-- -- ( SELECT Dept_no FROM Department WHERE Dept_name = 'Cardiology'));


-- -- 4) Find the prescription ids of all prescription that included a medicine from the
-- -- brand ‘Ranbaxy’ using nested subqueries. 

-- --     SELECT Pres_id FROM Prescribed_medicines WHERE Medicine_name --   
-- --   IN ( SELECT Med_name FROM Medicines WHERE Brand = 'HIMALAYA' );


-- -- 5) Find the list of patients who paid their bill through either ‘credit card’ or
-- -- ‘debit card’ using subquery. 

-- -- SELECT Pat_name FROM Patient WHERE Pat_id
-- -- IN ( SELECT Pat_id FROM Hospital_bill WHERE Payment_type = 'Credit card' OR Payment_type = 'Debit card');

-- -- SQL queries using other functions

-- -- BY DATE FUNCTION 

-- -- 1>>>


-- -- SELECT App_id, EXTRACT (YEAR_MONTH FROM App_time) FROM Appointment;
-- -- SELECT EXTRACT (YEAR FROM App_time) FROM Appointment;
-- -- SELECT EXTRACT (MONTH FROM App_time) FROM Appointment;

-- -- 2>>> 

-- -- SELECT WEEKOFYEAR (Inv_date) FROM Hospital_bill;

-- -- BY NUMERIC 

-- -- 1>>> ROUND

-- -- -- SELECT Bill_amount FROM Hospital_bill;
-- -- SELECT ROUND (Bill_amount) FROM Hospital_bill;

-- -- -- 2>>> TRUNCATE 

-- -- SELECT TRUNCATE (Bill_amount,1) FROM Hospital_bill;

-- -- BY CHARACTER

-- -- 1>>> LOWER

-- -- SELECT LOWER (Doc_Name) FROM Doctor;

-- -- -- 2>>> REVERSE

-- -- SELECT REVERSE (Doc_Name) FROM Doctor;

-- -- select EXTRACT (YEAR_MONTH FROM App_date_time) FROM Appointment;


