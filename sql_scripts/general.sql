


CREATE DATABASE sistemaHospitalarioGeneral;

-- Tabla Doctores
CREATE TABLE doctores (
    id VARCHAR(5) ,
    nombre VARCHAR(30),
    sueldo INT,
    especialidad VARCHAR(30),
    idHosp VARCHAR(5),
    CONSTRAINT  pk_doctores PRIMARY KEY (id)

);



-- Tabla Desarrollo Físico
CREATE TABLE etapaVida (
    id VARCHAR(5) ,
    nombre VARCHAR(30),
    edadLimInf INT,
    edadLimSup INT,

    CONSTRAINT pk_etapaVida PRIMARY KEY (id)
);

INSERT INTO etapaVida (id, nombre, edadLimInf, edadLimSup) VALUES
('DF001', 'infante', 0, 2),
('DF002', 'chamaco', 3, 11),
('DF003', 'adolescente', 12, 18),
('DF004', 'joven', 19, 25),
('DF005', 'adulto joven', 26, 39),
('DF006', 'adulto maduro', 40, 59),
('DF007', 'adulto mayor', 60, 69),
('DF008', 'vejez', 70, 100);


-- Tabla Pacientes

CREATE TABLE pacientes (
    id VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(30),
    edad INT,
    sexo VARCHAR(1),
    idCiudad VARCHAR(5),
    idEtapaVida VARCHAR(5)
);


-- Tabla Concepto
CREATE TABLE concepto (
    id VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(40),
    descripcion TEXT,
    precioBase DECIMAL(6,2)
);


INSERT INTO concepto (id, nombre, descripcion, precioBase) VALUES
('CP001', 'Consulta', 'Atencion medica general en consultorio, sin urgencia.', 850.00),
('CP002', 'Hospitalizacion', 'Estadia por 24 horas en habitacion estandar.', 2500.00),
('CP003', 'Examen de Laboratorio', 'Analisis de sangre y orina basicos (Biometria, Urianalisis).', 620.50),
('CP004', 'Sutura Menor', 'Procedimiento para cerrar heridas simples con anestesia local.', 1300.00),
('CP005', 'Dia de Quirofano', 'Uso del area de cirugia por 1 hora, incluye equipo y personal tecnico.', 7500.00),
('CP006', 'Medicamento Estandar', 'Suministro de medicamentos basicos (analgesicos, antibioticos).', 150.00),
('CP007', 'Radiografia Simple', 'Toma de imagenologia de una zona especifica (ej. torax o mano).', 780.00);


UPDATE doctores
SET
    nombre = translate(nombre,
        'áéíóúÁÉÍÓÚñÑ',
        'aeiouAEIOUnN'),
    especialidad = translate(especialidad,
        'áéíóúÁÉÍÓÚñÑ',
        'aeiouAEIOUnN');




UPDATE pacientes
SET
    nombre = translate(nombre,
        'áéíóúÁÉÍÓÚñÑ',
        'aeiouAEIOUnN')





