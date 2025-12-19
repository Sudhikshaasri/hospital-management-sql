#select queries
SELECT * FROM patients;
SELECT * FROM doctors;
SELECT * FROM nurses;
SELECT * FROM appointments;
SELECT patient_name, disease FROM patients;
SELECT * FROM patients WHERE age > 40;
SELECT * FROM patients WHERE gender = 'F';
SELECT DISTINCT specialization FROM doctors;
SELECT * FROM patients WHERE disease IN ('Diabetes', 'Asthma');
SELECT * FROM patients WHERE age BETWEEN 30 AND 50;
SELECT * FROM patients WHERE patient_name LIKE 'R%';
SELECT * FROM patients LIMIT 5 OFFSET 2;


#order by
SELECT patient_name, age FROM patients ORDER BY age DESC;
#aggregate functions
SELECT COUNT(*) AS total_patients FROM patients;
SELECT AVG(age) AS avg_age FROM patients;
SELECT MAX(age) FROM patients;
#group by
SELECT disease, COUNT(*) AS patient_count
FROM patients
GROUP BY disease;

SELECT disease, COUNT(*) AS count
FROM patients
GROUP BY disease
HAVING COUNT(*) > 1;
#join
SELECT p.patient_name, d.doctor_name
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

SELECT p.patient_name, d.doctor_name, n.nurse_name
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN nurses n ON a.nurse_id = n.nurse_id;

#update
UPDATE patients SET disease = 'Chronic Asthma' 
WHERE patient_name = 'Arvind';

#delete
DELETE FROM patients WHERE patient_id = 18;

#truncate 
TRUNCATE TABLE appointments;

#view
CREATE VIEW patient_doctor_view AS
SELECT p.patient_name, d.doctor_name, d.specialization
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

SELECT * FROM patient_doctor_view;
#subqueries
SELECT doctor_name
FROM doctors
WHERE doctor_id IN (
    SELECT doctor_id
    FROM appointments a
    JOIN patients p ON a.patient_id = p.patient_id
    WHERE p.age > 50
);
SELECT patient_name
FROM patients
WHERE patient_id IN (
    SELECT patient_id
    FROM appointments
);
SELECT 
    doctor_name
FROM
    doctors
WHERE
    doctor_id IN (SELECT 
            doctor_id
        FROM
            appointments
        GROUP BY doctor_id
        HAVING COUNT(*) > 1);
