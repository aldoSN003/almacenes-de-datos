CREATE DATABASE sistemaHospitalarioGeneral;

-- Tabla Doctores
CREATE TABLE doctores (
    idDoctor VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(30),
    sueldo INT,
    especialidad VARCHAR(30),
    idHosp VARCHAR(5)

);



-- Tabla Desarrollo Físico
CREATE TABLE desarrollofisico (
    idEtapaVida VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(30),
    edadLimInf INT,
    edadLimSup INT
);

INSERT INTO desarrollofisico (idEtapaVida, nombre, edadLimInf, edadLimSup) VALUES
('DF001', 'infante', 0, 2),
('DF002', 'niño', 3, 11),
('DF003', 'adolescente', 12, 18),
('DF004', 'joven', 19, 25),
('DF005', 'adulto joven', 26, 39),
('DF006', 'adulto maduro', 40, 59),
('DF007', 'adulto mayor', 60, 69),
('DF008', 'vejez', 70, 100);


-- Tabla Pacientes

CREATE TABLE pacientes (
    idPaciente VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(30),
    edad INT,
    sexo VARCHAR(1),
    idCiudad VARCHAR(5),
    idEtapaVida VARCHAR(5)
);


-- Tabla Concepto
CREATE TABLE concepto (
    idConcepto VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(40),
    descripcion TEXT,
    precioBase DECIMAL(6,2)
);


INSERT INTO concepto (idConcepto, nombre, descripcion, precioBase) VALUES
('CP001', 'Consulta Externa', 'Atención médica general en consultorio, sin urgencia.', 850.00),
('CP002', 'Noche Hospitalización', 'Estadía por 24 horas en habitación estándar.', 2500.00),
('CP003', 'Examen de Laboratorio', 'Análisis de sangre y orina básicos (Biometría, Urianálisis).', 620.50),
('CP004', 'Sutura Menor', 'Procedimiento para cerrar heridas simples con anestesia local.', 1300.00),
('CP005', 'Día de Quirófano', 'Uso del área de cirugía por 1 hora, incluye equipo y personal técnico.', 7500.00),
('CP006', 'Medicamento Estándar', 'Suministro de medicamentos básicos (analgésicos, antibióticos).', 150.00),
('CP007', 'Radiografía Simple', 'Toma de imagenología de una zona específica (ej. tórax o mano).', 780.00);




