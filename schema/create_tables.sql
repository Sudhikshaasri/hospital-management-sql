CREATE DATABASE hospital_db;
USE hospital_db;
#doctor table
CREATE TABLE doctors (doctor_id INT AUTO_INCREMENT PRIMARY KEY,
  doctor_name VARCHAR(50) NOT NULL,
  specialization VARCHAR(40),
  phone VARCHAR(15));
#nurses table
CREATE TABLE nurses (nurse_id INT AUTO_INCREMENT PRIMARY KEY,
  nurse_name VARCHAR(50) NOT NULL,
  shift VARCHAR(20));
#patients table
CREATE TABLE patients (patient_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_name VARCHAR(50) NOT NULL,
  age INT,gender CHAR(1),
  disease VARCHAR(50)
);
#appointment table
CREATE TABLE appointments (appointment_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT,
  doctor_id INT,
  nurse_id INT,
  appointment_date DATE,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
  FOREIGN KEY (nurse_id) REFERENCES nurses(nurse_id));
