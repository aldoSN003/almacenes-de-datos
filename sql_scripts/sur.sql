

CREATE DATABASE sistemaHospitalarioSur;




USE sistemaHospitalarioSur;


CREATE TABLE zonas (
    idZona VARCHAR(5) PRIMARY KEY,
    nombreZona VARCHAR(30)
);

-- Insertar Zona Sur
INSERT INTO zonas (idZona, nombreZona) VALUES
('ZS01', 'Zona Sur');

-- ======================
-- Tabla Estados
-- ======================
CREATE TABLE estados (
    idEstado VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(40),
    idZona VARCHAR(5),
    FOREIGN KEY (idZona) REFERENCES zonas(idZona)
);

-- Insertar Estados dentro de Zona Sur
INSERT INTO estados (idEstado, nombre, idZona) VALUES
('ES01', 'Chiapas', 'ZS01'),
('ES02', 'Oaxaca', 'ZS01'),
('ES03', 'Guerrero', 'ZS01'),
('ES04', 'Tabasco', 'ZS01');

-- ======================
-- Tabla Ciudades
-- ======================
CREATE TABLE ciudades (
    idCiudad VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(40),
    poblacion INT,
    region VARCHAR(1),
    idEstado VARCHAR(5),
    FOREIGN KEY (idEstado) REFERENCES estados(idEstado)
);

-- Insertar 20 Ciudades (5 por cada estado de Zona Sur)
INSERT INTO ciudades (idCiudad, nombre, poblacion, region, idEstado) VALUES
('CS01', 'Tuxtla Gutiérrez', 600000, 'S', 'ES01'),
('CS02', 'San Cristóbal de las Casas', 215000, 'S', 'ES01'),
('CS03', 'Tapachula', 350000, 'S', 'ES01'),
('CS04', 'Palenque', 50000, 'S', 'ES01'),
('CS05', 'Comitán', 170000, 'S', 'ES01'),

('CS06', 'Oaxaca de Juárez', 300000, 'S', 'ES02'),
('CS07', 'Salina Cruz', 85000, 'S', 'ES02'),
('CS08', 'Juchitán', 110000, 'S', 'ES02'),
('CS09', 'Puerto Escondido', 45000, 'S', 'ES02'),
('CS10', 'Tuxtepec', 160000, 'S', 'ES02'),

('CS11', 'Chilpancingo', 200000, 'S', 'ES03'),
('CS12', 'Acapulco', 700000, 'S', 'ES03'),
('CS13', 'Iguala', 130000, 'S', 'ES03'),
('CS14', 'Taxco', 60000, 'S', 'ES03'),
('CS15', 'Zihuatanejo', 100000, 'S', 'ES03'),

('CS16', 'Villahermosa', 680000, 'S', 'ES04'),
('CS17', 'Cárdenas', 250000, 'S', 'ES04'),
('CS18', 'Comalcalco', 150000, 'S', 'ES04'),
('CS19', 'Macuspana', 160000, 'S', 'ES04'),
('CS20', 'Tenosique', 90000, 'S', 'ES04');

-- ======================
-- Tabla Hospitales
-- ======================
CREATE TABLE hospitales (
    idHosp VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(60),
    idCiudad VARCHAR(5),
    FOREIGN KEY (idCiudad) REFERENCES ciudades(idCiudad)
);

-- Insertar 60 Hospitales (3 por ciudad)
INSERT INTO hospitales (idHosp, nombre, idCiudad) VALUES
('HS01', 'Hospital Tuxtla Cardiológico', 'CS01'),
('HS02', 'Hospital Infantil Tuxtla', 'CS01'),
('HS03', 'Hospital Tuxtla Ortopédico', 'CS01'),
('HS04', 'Hospital San Cristóbal Ginecológico', 'CS02'),
('HS05', 'Hospital San Cristóbal Oftalmológico', 'CS02'),
('HS06', 'Hospital San Cristóbal Oncológico', 'CS02'),
('HS07', 'Hospital Tapachula Pediátrico', 'CS03'),
('HS08', 'Hospital Tapachula Neurológico', 'CS03'),
('HS09', 'Hospital Tapachula General', 'CS03'),
('HS10', 'Hospital Palenque Traumatología', 'CS04'),
('HS11', 'Hospital Palenque Dermatológico', 'CS04'),
('HS12', 'Hospital Palenque Gastroenterológico', 'CS04'),
('HS13', 'Hospital Comitán Reumatológico', 'CS05'),
('HS14', 'Hospital Comitán Psiquiátrico', 'CS05'),
('HS15', 'Hospital Comitán Urológico', 'CS05'),

('HS16', 'Hospital Oaxaca Cardiológico', 'CS06'),
('HS17', 'Hospital Infantil Oaxaca', 'CS06'),
('HS18', 'Hospital Oaxaca Ortopédico', 'CS06'),
('HS19', 'Hospital Salina Cruz Ginecológico', 'CS07'),
('HS20', 'Hospital Salina Cruz Oftalmológico', 'CS07'),
('HS21', 'Hospital Salina Cruz Oncológico', 'CS07'),
('HS22', 'Hospital Juchitán Pediátrico', 'CS08'),
('HS23', 'Hospital Juchitán Neurológico', 'CS08'),
('HS24', 'Hospital Juchitán General', 'CS08'),
('HS25', 'Hospital Puerto Escondido Traumatología', 'CS09'),
('HS26', 'Hospital Puerto Escondido Dermatológico', 'CS09'),
('HS27', 'Hospital Puerto Escondido Gastroenterológico', 'CS09'),
('HS28', 'Hospital Tuxtepec Reumatológico', 'CS10'),
('HS29', 'Hospital Tuxtepec Psiquiátrico', 'CS10'),
('HS30', 'Hospital Tuxtepec Urológico', 'CS10'),

('HS31', 'Hospital Chilpancingo Cardiológico', 'CS11'),
('HS32', 'Hospital Infantil Chilpancingo', 'CS11'),
('HS33', 'Hospital Chilpancingo Ortopédico', 'CS11'),
('HS34', 'Hospital Acapulco Ginecológico', 'CS12'),
('HS35', 'Hospital Acapulco Oftalmológico', 'CS12'),
('HS36', 'Hospital Acapulco Oncológico', 'CS12'),
('HS37', 'Hospital Iguala Pediátrico', 'CS13'),
('HS38', 'Hospital Iguala Neurológico', 'CS13'),
('HS39', 'Hospital Iguala General', 'CS13'),
('HS40', 'Hospital Taxco Traumatología', 'CS14'),
('HS41', 'Hospital Taxco Dermatológico', 'CS14'),
('HS42', 'Hospital Taxco Gastroenterológico', 'CS14'),
('HS43', 'Hospital Zihuatanejo Reumatológico', 'CS15'),
('HS44', 'Hospital Zihuatanejo Psiquiátrico', 'CS15'),
('HS45', 'Hospital Zihuatanejo Urológico', 'CS15'),

('HS46', 'Hospital Villahermosa Cardiológico', 'CS16'),
('HS47', 'Hospital Infantil Villahermosa', 'CS16'),
('HS48', 'Hospital Villahermosa Ortopédico', 'CS16'),
('HS49', 'Hospital Cárdenas Ginecológico', 'CS17'),
('HS50', 'Hospital Cárdenas Oftalmológico', 'CS17'),
('HS51', 'Hospital Cárdenas Oncológico', 'CS17'),
('HS52', 'Hospital Comalcalco Pediátrico', 'CS18'),
('HS53', 'Hospital Comalcalco Neurológico', 'CS18'),
('HS54', 'Hospital Comalcalco General', 'CS18'),
('HS55', 'Hospital Macuspana Traumatología', 'CS19'),
('HS56', 'Hospital Macuspana Dermatológico', 'CS19'),
('HS57', 'Hospital Macuspana Gastroenterológico', 'CS19'),
('HS58', 'Hospital Tenosique Reumatológico', 'CS20'),
('HS59', 'Hospital Tenosique Psiquiátrico', 'CS20'),
('HS60', 'Hospital Tenosique Urológico', 'CS20');





-- ======================
-- Tabla Facturas Generales
-- ======================
CREATE TABLE facturas (
    idFactura VARCHAR(7) PRIMARY KEY,
	idpaciente VARCHAR(40),
    fecha DATE,
    idHosp VARCHAR(5),
    FOREIGN KEY (idHosp) REFERENCES hospitales(idHosp)
);


-- ======================
-- Tabla Factura Detalle
-- ======================
# CREATE TABLE factdetalle (
#     idFactura VARCHAR(5),
#     concepto VARCHAR(100),
# 	idDoctor VARCHAR(100),
#     cant INT,
#     iva DECIMAL(6,2),
#     PRIMARY KEY (idFactura, concepto),
#     FOREIGN KEY (idFactura) REFERENCES facturas(idFactura)
# );

CREATE TABLE factdetalle (

    idFacturaDetalle VARCHAR(12) PRIMARY KEY,

    idFactura VARCHAR(7),

    concepto VARCHAR(5),

    idDoctor VARCHAR(5),

    cant INT,
    iva DECIMAL(6,2),

    FOREIGN KEY (idFactura) REFERENCES facturas(idFactura)
);


-- -----------------------------------------------------
-- MODIFICACIONES PARA LA TABLA HOSPITAL
-- -----------------------------------------------------

-- 1. Añadir la columna 'tipo' a la tabla 'hospitales'
ALTER TABLE hospitales ADD COLUMN tipo VARCHAR(50);

-- 2. Actualizar todos los registros existentes con un tipo basado en el nombre
UPDATE hospitales SET tipo =
    CASE
        WHEN nombre LIKE '%General%' THEN 'General'
        WHEN nombre LIKE '%Infantil%' THEN 'Pediátrico'
        WHEN nombre LIKE '%Pediátrico%' THEN 'Pediátrico'
        WHEN nombre LIKE '%Cardiológico%' THEN 'Cardiología'
        WHEN nombre LIKE '%Ortopédico%' THEN 'Ortopedia'
        WHEN nombre LIKE '%Ginecológico%' THEN 'Ginecología'
        WHEN nombre LIKE '%Oftalmológico%' THEN 'Oftalmología'
        WHEN nombre LIKE '%Oncológico%' THEN 'Oncología'
        WHEN nombre LIKE '%Neurológico%' THEN 'Neurología'
        WHEN nombre LIKE '%Traumatología%' THEN 'Traumatología'
        WHEN nombre LIKE '%Dermatológico%' THEN 'Dermatología'
        WHEN nombre LIKE '%Gastroenterológico%' THEN 'Gastroenterología'
        WHEN nombre LIKE '%Reumatológico%' THEN 'Reumatología'
        WHEN nombre LIKE '%Psiquiátrico%' THEN 'Psiquiatría'
        WHEN nombre LIKE '%Urológico%' THEN 'Urología'
        ELSE 'Especializado' -- Un tipo por defecto
    END;
    
    
    
    
-- 3. Dimensión Tiempo (Actualizada)
CREATE TABLE dim_tiempo (
    id_tiempo           VARCHAR(10) NOT NULL,
    fecha               DATE,
    año                 SMALLINT,
    semestre            SMALLINT,
    trimestre           SMALLINT,
    mes                 SMALLINT,
    nombre_mes          VARCHAR(20),
    quincena_mes        SMALLINT,
    quincena_anio       SMALLINT,
    semana_del_anio     SMALLINT,
    semana_del_mes      SMALLINT,
    dia_del_año         SMALLINT,
    dia_del_mes         SMALLINT,
    dia_de_semana       SMALLINT,
    nombre_dia          VARCHAR(15),
    dia_festivo         BOOLEAN,
    dia_fin_de_semana   BOOLEAN,

    -- Constraint de Llave Primaria nombrada
    CONSTRAINT pk_dim_tiempo PRIMARY KEY (id_tiempo)
);





