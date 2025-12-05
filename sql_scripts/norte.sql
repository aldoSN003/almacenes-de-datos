-- Crear la base de datos
CREATE DATABASE sistemaHospitalarioNorte;
GO

USE sistemaHospitalarioNorte;
GO

-- -----------------------------------------------------
-- Tabla Zonas
-- -----------------------------------------------------
CREATE TABLE zonas (
    idZona VARCHAR(5) PRIMARY KEY,
    nombreZona VARCHAR(30)
);
GO

INSERT INTO zonas (idZona, nombreZona) VALUES
('ZN01', 'Zona Norte');
GO

-- -----------------------------------------------------
-- Tabla Estados (con el prefijo modificado)
-- -----------------------------------------------------
CREATE TABLE estados (
    idEstado VARCHAR(6) PRIMARY KEY,
    nombre VARCHAR(40),
    idZona VARCHAR(5),
    FOREIGN KEY (idZona) REFERENCES zonas(idZona)
);
GO

INSERT INTO estados (idEstado, nombre, idZona) VALUES
('EN001', 'Sonora', 'ZN01'),
('EN002', 'Chihuahua', 'ZN01'),
('EN003', 'Coahuila', 'ZN01'),
('EN004', 'Nuevo Leon', 'ZN01');
GO

-- -----------------------------------------------------
-- Tabla Ciudades (con las referencias actualizadas)
-- -----------------------------------------------------
CREATE TABLE ciudades (
    idCiudad VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(40),
    poblacion INT,
    region VARCHAR(1),
    idEstado VARCHAR(6),
    FOREIGN KEY (idEstado) REFERENCES estados(idEstado)
);
GO

INSERT INTO ciudades (idCiudad, nombre, poblacion, region, idEstado) VALUES
-- Sonora
('CN01', 'Hermosillo', 936263, 'N', 'EN001'),
('CN02', 'Nogales', 264782, 'N', 'EN001'),
('CN03', 'Caborca', 89972, 'N', 'EN001'),
('CN04', 'Guaymas', 156863, 'N', 'EN001'),
('CN05', 'Navojoa', 159511, 'N', 'EN001'),

-- Chihuahua
('CN06', 'Chihuahua', 925762, 'N', 'EN002'),
('CN07', 'Juarez', 1591903, 'N', 'EN002'),
('CN08', 'Delicias', 148045, 'N', 'EN002'),
('CN09', 'Cuauhtemoc', 168482, 'N', 'EN002'),
('CN10', 'Parral', 118589, 'N', 'EN002'),

-- Coahuila
('CN11', 'Saltillo', 879958, 'N', 'EN003'),
('CN12', 'Torreon', 735340, 'N', 'EN003'),
('CN13', 'Monclova', 242707, 'N', 'EN003'),
('CN14', 'Piedras Negras', 191383, 'N', 'EN003'),
('CN15', 'Acuna', 181804, 'N', 'EN003'),

-- Nuevo Leon
('CN16', 'Monterrey', 1142994, 'N', 'EN004'),
('CN17', 'San Nicolas', 443273, 'N', 'EN004'),
('CN18', 'Apodaca', 656464, 'N', 'EN004'),
('CN19', 'Guadalupe', 673616, 'N', 'EN004'),
('CN20', 'Santa Catarina', 307789, 'N', 'EN004');
GO

-- -----------------------------------------------------
-- Tabla Hospitales
-- -----------------------------------------------------
CREATE TABLE hospitales (
    idHosp VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(60),
    idCiudad VARCHAR(5),
    FOREIGN KEY (idCiudad) REFERENCES ciudades(idCiudad)
);
GO

INSERT INTO hospitales (idHosp, nombre, idCiudad) VALUES
-- Sonora
('HN01', 'Hospital General Hermosillo', 'CN01'),
('HN02', 'Clínica Pediátrica Hermosillo', 'CN01'),
('HN03', 'Hospital de Ortopedia Hermosillo', 'CN01'),
('HN04', 'Hospital General Nogales', 'CN02'),
('HN05', 'Clínica de Oftalmología Nogales', 'CN02'),
('HN06', 'Hospital de Oncología Nogales', 'CN02'),
('HN07', 'Hospital General Caborca', 'CN03'),
('HN08', 'Clínica de Neurología Caborca', 'CN03'),
('HN09', 'Hospital Infantil General Caborca', 'CN03'),
('HN10', 'Hospital General Guaymas', 'CN04'),
('HN11', 'Clínica de Traumatología Guaymas', 'CN04'),
('HN12', 'Hospital de Gastroenterología Guaymas', 'CN04'),
('HN13', 'Hospital General Navojoa', 'CN05'),
('HN14', 'Clínica de Reumatología Navojoa', 'CN05'),
('HN15', 'Hospital de Urología Navojoa', 'CN05'),

-- Chihuahua
('HN16', 'Hospital Central Chihuahua', 'CN06'),
('HN17', 'Hospital Infantil Chihuahua', 'CN06'),
('HN18', 'Hospital de Ortopedia Chihuahua', 'CN06'),
('HN19', 'Hospital General Juárez', 'CN07'),
('HN20', 'Clínica de Ginecología Juárez', 'CN07'),
('HN21', 'Hospital de Oncología Juárez', 'CN07'),
('HN22', 'Hospital General Delicias', 'CN08'),
('HN23', 'Clínica de Neurología Delicias', 'CN08'),
('HN24', 'Hospital Infantil General Delicias', 'CN08'),
('HN25', 'Hospital General Cuauhtémoc', 'CN09'),
('HN26', 'Clínica de Traumatología Cuauhtémoc', 'CN09'),
('HN27', 'Hospital de Gastroenterología Cuauhtémoc', 'CN09'),
('HN28', 'Hospital General Parral', 'CN10'),
('HN29', 'Clínica de Reumatología Parral', 'CN10'),
('HN30', 'Hospital de Urología Parral', 'CN10'),

-- Coahuila
('HN31', 'Hospital General Saltillo', 'CN11'),
('HN32', 'Hospital Infantil Saltillo', 'CN11'),
('HN33', 'Hospital de Ortopedia Saltillo', 'CN11'),
('HN34', 'Hospital General Torreón', 'CN12'),
('HN35', 'Clínica de Ginecología Torreón', 'CN12'),
('HN36', 'Hospital de Oncología Torreón', 'CN12'),
('HN37', 'Hospital General Monclova', 'CN13'),
('HN38', 'Clínica de Neurología Monclova', 'CN13'),
('HN39', 'Hospital Infantil General Monclova', 'CN13'),
('HN40', 'Hospital General Piedras Negras', 'CN14'),
('HN41', 'Clínica de Traumatología Piedras Negras', 'CN14'),
('HN42', 'Hospital de Gastroenterología Piedras Negras', 'CN14'),
('HN43', 'Hospital General Acuña', 'CN15'),
('HN44', 'Clínica de Reumatología Acuña', 'CN15'),
('HN45', 'Hospital de Urología Acuña', 'CN15'),

-- Nuevo León
('HN46', 'Hospital Universitario Monterrey', 'CN16'),
('HN47', 'Hospital Infantil Monterrey', 'CN16'),
('HN48', 'Hospital de Ortopedia Monterrey', 'CN16'),
('HN49', 'Hospital General San Nicolás', 'CN17'),
('HN50', 'Clínica de Oftalmología San Nicolás', 'CN17'),
('HN51', 'Hospital de Oncología San Nicolás', 'CN17'),
('HN52', 'Hospital General Apodaca', 'CN18'),
('HN53', 'Clínica de Neurología Apodaca', 'CN18'),
('HN54', 'Hospital Infantil General Apodaca', 'CN18'),
('HN55', 'Hospital General Guadalupe', 'CN19'),
('HN56', 'Clínica de Ginecología Guadalupe', 'CN19'),
('HN57', 'Hospital de Oncología Guadalupe', 'CN19'),
('HN58', 'Hospital General Santa Catarina', 'CN20'),
('HN59', 'Clínica de Reumatología Santa Catarina', 'CN20'),
('HN60', 'Hospital de Urología Santa Catarina', 'CN20');
GO

-- -----------------------------------------------------
-- Tabla Facturas
-- -----------------------------------------------------
CREATE TABLE facturas (
    idFactura VARCHAR(7) PRIMARY KEY,
    idpaciente VARCHAR(40),
    fecha DATE,
    idHosp VARCHAR(5),
    FOREIGN KEY (idHosp) REFERENCES hospitales(idHosp)
);
GO

-- -----------------------------------------------------
-- Tabla Factura Detalle
-- -----------------------------------------------------
CREATE TABLE factdetalle (
    idFacturaDetalle VARCHAR(12) PRIMARY KEY,
    idFactura VARCHAR(7),
    concepto VARCHAR(5),
    idDoctor VARCHAR(5),
    cant INT,
    iva DECIMAL(6,2),
    FOREIGN KEY (idFactura) REFERENCES facturas(idFactura)
);
GO

-- -----------------------------------------------------
-- MODIFICACIONES PARA LA TABLA HOSPITAL
-- -----------------------------------------------------

-- 1. Añadir la columna 'tipo' a la tabla 'hospitales'
ALTER TABLE hospitales ADD tipo VARCHAR(50);
GO

-- 2. Actualizar todos los registros existentes con un tipo basado en el nombre
UPDATE hospitales SET tipo =
    CASE
        WHEN nombre LIKE 'Hospital General%' THEN 'General'
        WHEN nombre LIKE 'Hospital Central%' THEN 'General'
        WHEN nombre LIKE 'Clínica Pediátrica%' THEN 'Pediátrico'
        WHEN nombre LIKE 'Hospital Infantil General%' THEN 'Pediátrico'
        WHEN nombre LIKE 'Hospital Infantil%' THEN 'Pediátrico'
        WHEN nombre LIKE 'Hospital de Ortopedia%' THEN 'Ortopedia'
        WHEN nombre LIKE 'Clínica de Oftalmología%' THEN 'Oftalmología'
        WHEN nombre LIKE 'Hospital de Oncología%' THEN 'Oncología'
        WHEN nombre LIKE 'Clínica de Neurología%' THEN 'Neurología'
        WHEN nombre LIKE 'Clínica de Traumatología%' THEN 'Traumatología'
        WHEN nombre LIKE 'Hospital de Gastroenterología%' THEN 'Gastroenterología'
        WHEN nombre LIKE 'Clínica de Reumatología%' THEN 'Reumatología'
        WHEN nombre LIKE 'Hospital de Urología%' THEN 'Urología'
        WHEN nombre LIKE 'Clínica de Ginecología%' THEN 'Ginecología'
        WHEN nombre LIKE 'Hospital Universitario%' THEN 'Universitario'
        ELSE 'Especializado'
    END;
GO

-- 3. Dimensión Tiempo
CREATE TABLE dim_tiempo (
    id_tiempo VARCHAR(10) NOT NULL,
    fecha DATE,
    año SMALLINT,
    semestre SMALLINT,
    trimestre SMALLINT,
    mes SMALLINT,
    nombre_mes VARCHAR(20),
    quincena_mes SMALLINT,
    quincena_anio SMALLINT,
    semana_del_anio SMALLINT,
    semana_del_mes SMALLINT,
    dia_del_año SMALLINT,
    dia_del_mes SMALLINT,
    dia_de_semana SMALLINT,
    nombre_dia VARCHAR(15),
    dia_festivo BIT,
    dia_fin_de_semana BIT,
    CONSTRAINT pk_dim_tiempo PRIMARY KEY (id_tiempo)
);
GO

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







ALTER TABLE facturas
ADD id_tiempo VARCHAR(10);

-- Step 2: Populate id_tiempo by matching fecha values
UPDATE f
SET f.id_tiempo = dt.id_tiempo
FROM facturas f
JOIN dim_tiempo dt ON dt.fecha = f.fecha;



ALTER TABLE facturas
ADD CONSTRAINT fk_facturas_tiempo
    FOREIGN KEY (id_tiempo) REFERENCES dim_tiempo(id_tiempo);







-- Función anidada para quitar acentos en SQL Server
-- Zonas
UPDATE zonas
SET nombreZona = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
    nombreZona COLLATE Latin1_General_CI_AI, 'á', 'a'), 'é', 'e'), 'í', 'i'), 'ó', 'o'), 'ú', 'u');
GO

-- Estados
UPDATE estados
SET nombre = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
    nombre COLLATE Latin1_General_CI_AI, 'á', 'a'), 'é', 'e'), 'í', 'i'), 'ó', 'o'), 'ú', 'u');
GO

-- Ciudades
UPDATE ciudades
SET nombre = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
    nombre COLLATE Latin1_General_CI_AI, 'á', 'a'), 'é', 'e'), 'í', 'i'), 'ó', 'o'), 'ú', 'u');
GO

-- Hospitales
UPDATE hospitales
SET nombre = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
    nombre COLLATE Latin1_General_CI_AI, 'á', 'a'), 'é', 'e'), 'í', 'i'), 'ó', 'o'), 'ú', 'u');

UPDATE hospitales
SET nombre = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
    tipo COLLATE Latin1_General_CI_AI, 'á', 'a'), 'é', 'e'), 'í', 'i'), 'ó', 'o'), 'ú', 'u');
GO

-- Factura Detalle
UPDATE factdetalle
SET concepto = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
    concepto COLLATE Latin1_General_CI_AI, 'á', 'a'), 'é', 'e'), 'í', 'i'), 'ó', 'o'), 'ú', 'u');
GO

-- Dimensión Tiempo
UPDATE dim_tiempo
SET nombre_mes = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
    nombre_mes COLLATE Latin1_General_CI_AI, 'á', 'a'), 'é', 'e'), 'í', 'i'), 'ó', 'o'), 'ú', 'u');

UPDATE dim_tiempo
SET nombre_dia = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
    nombre_dia COLLATE Latin1_General_CI_AI, 'á', 'a'), 'é', 'e'), 'í', 'i'), 'ó', 'o'), 'ú', 'u');
GO
