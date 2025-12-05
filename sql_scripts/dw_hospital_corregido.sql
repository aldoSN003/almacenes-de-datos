-- --- SCRIPT COMPLETO CORREGIDO PARA SQL SERVER ---




CREATE DATABASE sistemaHospitalarioDW;
GO

USE sistemaHospitalarioDW;
GO

-- ---------------------------------------------------
-- Fase 1: Creación de las Tablas de Dimensiones
-- ---------------------------------------------------

-- 3. Dimensión Tiempo
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

    -- SQL Server no soporta BOOLEAN → usar BIT
    dia_festivo         BIT,
    dia_fin_de_semana   BIT,

    CONSTRAINT pk_dim_tiempo PRIMARY KEY (id_tiempo)
);
GO

-- 4. Dimensión Doctor
CREATE TABLE dim_doctor (
    id             VARCHAR(5),
    nombre                VARCHAR(30),
    especialidad   VARCHAR(30),
    sueldo                INT,

    CONSTRAINT pk_dim_doctor PRIMARY KEY (id)
)
GO

-- 5. Dimensión Paciente
CREATE TABLE dim_paciente (
    id           VARCHAR(5) ,
    nombre      VARCHAR(30),
    edad                  INT,
    sexo                  VARCHAR(1),
    nombreEtapaVida            VARCHAR(30),

    CONSTRAINT pk_dim_paciente PRIMARY KEY (id)
);
GO

-- 6. Dimensión Hospital
CREATE TABLE dim_hospital (
    id           VARCHAR(5) NOT NULL,
    nombre                VARCHAR(60),
    tipo         VARCHAR(50),
    ciudad                VARCHAR(40),
    estado                VARCHAR(40),

    CONSTRAINT pk_dim_hospital PRIMARY KEY (id)
);
GO

-- ---------------------------------------------------
-- Fase 2: Creación de las Tablas de Hechos
-- ---------------------------------------------------

-- 7. Hechos de Consultas
CREATE TABLE hechos_consulta (
    id_tiempo             VARCHAR(10) NOT NULL,
    id_doctor             VARCHAR(5) NOT NULL,
    id_paciente           VARCHAR(5) NOT NULL,
    id_hospital           VARCHAR(5) NOT NULL,

    num_consultas             INT DEFAULT 1,
    importe_total_consultas   DECIMAL(12, 2),

    CONSTRAINT pk_hechos_consulta
        PRIMARY KEY (id_tiempo, id_doctor, id_paciente, id_hospital),

    CONSTRAINT fk_consulta_tiempo
        FOREIGN KEY (id_tiempo) REFERENCES dim_tiempo(id_tiempo),

    CONSTRAINT fk_consulta_doctor
        FOREIGN KEY (id_doctor) REFERENCES dim_doctor(id),

    CONSTRAINT fk_consulta_paciente
        FOREIGN KEY (id_paciente) REFERENCES dim_paciente(id),

    CONSTRAINT fk_consulta_hospital
        FOREIGN KEY (id_hospital) REFERENCES dim_hospital(id)
);
GO

-- 8. Hechos de Hospitalizaciones
CREATE TABLE hechos_hospitalizaciones (
    id_tiempo             VARCHAR(10) NOT NULL,
    id_doctor             VARCHAR(5) NOT NULL,
    id_paciente           VARCHAR(5) NOT NULL,
    id_hospital           VARCHAR(5) NOT NULL,

    dias_hospitalizacion          SMALLINT,
    importe_total_hospitalizacion DECIMAL(12, 2),

    CONSTRAINT pk_hechos_hospitalizaciones
        PRIMARY KEY (id_tiempo, id_doctor, id_paciente, id_hospital),

    CONSTRAINT fk_hosp_tiempo
        FOREIGN KEY (id_tiempo) REFERENCES dim_tiempo(id_tiempo),

    CONSTRAINT fk_hosp_doctor
        FOREIGN KEY (id_doctor) REFERENCES dim_doctor(id),

    CONSTRAINT fk_hosp_paciente
        FOREIGN KEY (id_paciente) REFERENCES dim_paciente(id),

    CONSTRAINT fk_hosp_hospital
        FOREIGN KEY (id_hospital) REFERENCES dim_hospital(id)
);
GO




-- ESTAS SENTENCIAS SE EJECUTAN UNA VEZ QUE LA TABLA TIEMPO ESTÉ LLENA

UPDATE dim_tiempo
SET nombre_mes = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(nombre_mes, 'á', 'a'), 'é', 'e'), 'í', 'i'), 'ó', 'o'), 'ú', 'u');

-- Actualizar el nombre del día
UPDATE dim_tiempo
SET nombre_dia = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(nombre_dia, 'á', 'a'), 'é', 'e'), 'í', 'i'), 'ó', 'o'), 'ú', 'u');



