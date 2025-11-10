-- --- SCRIPT COMPLETO CON CONSTRAINTS NOMBRADOS ---
-- ---------------------------------------------------
-- Fase 0: Creación y Selección de la Base de Datos
-- ---------------------------------------------------

-- 1. Crea la base de datos
CREATE DATABASE hospital_dw;

-- 2. Selecciona la base de datos recién creada para usarla
USE hospital_dw;

-- ---------------------------------------------------
-- Fase 1: Creación de las Tablas de Dimensiones
-- ---------------------------------------------------

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

-- 4. Dimensión Doctor
CREATE TABLE dim_doctor (
    id_doctor             INT AUTO_INCREMENT NOT NULL,
    nombre                VARCHAR(150) NOT NULL,
    especialidad_doctor   VARCHAR(100),
    sueldo                DECIMAL(10, 2),

    -- Constraint de Llave Primaria nombrada
    CONSTRAINT pk_dim_doctor PRIMARY KEY (id_doctor)
);

-- 5. Dimensión Paciente
CREATE TABLE dim_paciente (
    id_paciente           INT AUTO_INCREMENT NOT NULL,
    nombre_paciente       VARCHAR(150) NOT NULL,
    edad                  SMALLINT,
    sexo                  VARCHAR(20),
    etapa_vida            VARCHAR(50),

    -- Constraint de Llave Primaria nombrada
    CONSTRAINT pk_dim_paciente PRIMARY KEY (id_paciente)
);

-- 6. Dimensión Hospital
CREATE TABLE dim_hospital (
    id_hospital           INT AUTO_INCREMENT NOT NULL,
    nombre                VARCHAR(150) NOT NULL,
    tipo_hospital         VARCHAR(100),
    ciudad                VARCHAR(100),
    estado                VARCHAR(100),

    -- Constraint de Llave Primaria nombrada
    CONSTRAINT pk_dim_hospital PRIMARY KEY (id_hospital)
);

-- ---------------------------------------------------
-- Fase 2: Creación de las Tablas de Hechos
-- ---------------------------------------------------

-- 7. Tabla de Hechos de Consultas
CREATE TABLE hechos_consulta (
    -- Llaves Foráneas (FKs)
    id_tiempo             VARCHAR(10) NOT NULL,
    id_doctor             INT NOT NULL,
    id_paciente           INT NOT NULL,
    id_hospital           INT NOT NULL,

    -- Métricas
    num_consultas             INT DEFAULT 1,
    importe_total_consultas   DECIMAL(12, 2),

    -- Definición de Constraints (PK y FKs)
    CONSTRAINT pk_hechos_consulta
        PRIMARY KEY (id_tiempo, id_doctor, id_paciente, id_hospital),

    CONSTRAINT fk_consulta_tiempo
        FOREIGN KEY (id_tiempo) REFERENCES dim_tiempo(id_tiempo),

    CONSTRAINT fk_consulta_doctor
        FOREIGN KEY (id_doctor) REFERENCES dim_doctor(id_doctor),

    CONSTRAINT fk_consulta_paciente
        FOREIGN KEY (id_paciente) REFERENCES dim_paciente(id_paciente),

    CONSTRAINT fk_consulta_hospital
        FOREIGN KEY (id_hospital) REFERENCES dim_hospital(id_hospital)
);

-- 8. Tabla de Hechos de Hospitalizaciones
CREATE TABLE hechos_hospitalizaciones (
    -- Llaves Foráneas (FKs)
    id_tiempo             VARCHAR(10) NOT NULL,
    id_doctor             INT NOT NULL,
    id_paciente           INT NOT NULL,
    id_hospital           INT NOT NULL,

    -- Métricas
    dias_hospitalizacion          SMALLINT,
    importe_total_hospitalizacion DECIMAL(12, 2),

    -- Definición de Constraints (PK y FKs)
    CONSTRAINT pk_hechos_hospitalizaciones
        PRIMARY KEY (id_tiempo, id_doctor, id_paciente, id_hospital),

    CONSTRAINT fk_hosp_tiempo
        FOREIGN KEY (id_tiempo) REFERENCES dim_tiempo(id_tiempo),

    CONSTRAINT fk_hosp_doctor
        FOREIGN KEY (id_doctor) REFERENCES dim_doctor(id_doctor),

    CONSTRAINT fk_hosp_paciente
        FOREIGN KEY (id_paciente) REFERENCES dim_paciente(id_paciente),

    CONSTRAINT fk_hosp_hospital
        FOREIGN KEY (id_hospital) REFERENCES dim_hospital(id_hospital)
);



