

CREATE DATABASE DW_Hospitalario;
USE DW_Hospitalario;

-- ---------------------------------
-- DIMENSIONES DE UBICACIÓN (SNOWFLAKE)
-- ---------------------------------

CREATE TABLE Dim_Zona (
    DimZona_key INT AUTO_INCREMENT PRIMARY KEY,
    idZona VARCHAR(5) NOT NULL, -- Business Key
    NombreZona VARCHAR(30)
);

CREATE TABLE Dim_Estado (
    DimEstado_key INT AUTO_INCREMENT PRIMARY KEY,
    idEstado VARCHAR(6) NOT NULL, -- Business Key
    Nombre VARCHAR(40),
    DimZona_key INT,
    FOREIGN KEY (DimZona_key) REFERENCES Dim_Zona(DimZona_key)
);

CREATE TABLE Dim_Ciudad (
    DimCiudad_key INT AUTO_INCREMENT PRIMARY KEY,
    idCiudad VARCHAR(5) NOT NULL, -- Business Key
    Nombre VARCHAR(40),
    Poblacion INT,
    Region VARCHAR(1),
    DimEstado_key INT,
    FOREIGN KEY (DimEstado_key) REFERENCES Dim_Estado(DimEstado_key)
);

-- ---------------------------------
-- OTRAS DIMENSIONES
-- ---------------------------------

CREATE TABLE Dim_Hospital (
    DimHospital_key INT AUTO_INCREMENT PRIMARY KEY,
    idHosp VARCHAR(5) NOT NULL, -- Business Key
    Nombre VARCHAR(60),
    DimCiudad_key INT,
    FOREIGN KEY (DimCiudad_key) REFERENCES Dim_Ciudad(DimCiudad_key)
);

CREATE TABLE Dim_EtapaVida (
    DimEtapaVida_key INT AUTO_INCREMENT PRIMARY KEY,
    idEtapaVida VARCHAR(5) NOT NULL, -- Business Key
    Nombre VARCHAR(30),
    EdadLimInf INT,
    EdadLimSup INT
);

CREATE TABLE Dim_Paciente (
    DimPaciente_key INT AUTO_INCREMENT PRIMARY KEY,
    idPaciente VARCHAR(5) NOT NULL, -- Business Key
    Nombre VARCHAR(30),
    Edad INT,
    Sexo VARCHAR(1),
    DimCiudad_key INT, -- Ciudad de residencia del paciente
    DimEtapaVida_key INT,
    FOREIGN KEY (DimCiudad_key) REFERENCES Dim_Ciudad(DimCiudad_key),
    FOREIGN KEY (DimEtapaVida_key) REFERENCES Dim_EtapaVida(DimEtapaVida_key)
);

CREATE TABLE Dim_Doctor (
    DimDoctor_key INT AUTO_INCREMENT PRIMARY KEY,
    idDoctor VARCHAR(5) NOT NULL, -- Business Key
    Nombre VARCHAR(30),
    Sueldo INT,
    Especialidad VARCHAR(30),
    DimHospital_key INT, -- Hospital base del doctor
    FOREIGN KEY (DimHospital_key) REFERENCES Dim_Hospital(DimHospital_key)
);

CREATE TABLE Dim_Concepto (
    DimConcepto_key INT AUTO_INCREMENT PRIMARY KEY,
    idConcepto VARCHAR(5) NOT NULL, -- Business Key
    Nombre VARCHAR(40),
    Descripcion TEXT,
    PrecioBase DECIMAL(6,2)
);

CREATE TABLE Dim_Fecha (
    DimFecha_key INT PRIMARY KEY, -- Formato YYYYMMDD
    FechaCompleta DATE NOT NULL,
    Anio INT NOT NULL,
    Trimestre INT NOT NULL,
    Mes INT NOT NULL,
    NombreMes VARCHAR(20) NOT NULL,
    Dia INT NOT NULL,
    DiaDeLaSemana VARCHAR(20) NOT NULL
);

-- ---------------------------------
-- TABLA DE HECHOS (FACT TABLE)
-- ---------------------------------

CREATE TABLE Fact_Facturacion (
    idFacturaDetalle VARCHAR(12) PRIMARY KEY, -- Business Key de la línea de detalle
    idFactura VARCHAR(7) NOT NULL,         -- Business Key de la factura

    -- Claves Foráneas a Dimensiones
    DimFecha_key INT,
    DimHospital_key INT,
    DimPaciente_key INT,
    DimDoctor_key INT,
    DimConcepto_key INT,

    -- Métricas
    Cantidad INT,
    PrecioBase_Unitario DECIMAL(6,2), -- Poblado desde Dim_Concepto durante ETL
    MontoIVA DECIMAL(6,2),

    -- Métricas Calculadas (Sintaxis corregida para MySQL)
    MontoSubtotal DECIMAL(10, 2) AS (Cantidad * PrecioBase_Unitario) STORED,
    MontoTotal DECIMAL(10, 2) AS ( (Cantidad * PrecioBase_Unitario) + MontoIVA ) STORED,

    -- Foreign Keys
    FOREIGN KEY (DimFecha_key) REFERENCES Dim_Fecha(DimFecha_key),
    FOREIGN KEY (DimHospital_key) REFERENCES Dim_Hospital(DimHospital_key),
    FOREIGN KEY (DimPaciente_key) REFERENCES Dim_Paciente(DimPaciente_key),
    FOREIGN KEY (DimDoctor_key) REFERENCES Dim_Doctor(DimDoctor_key),
    FOREIGN KEY (DimConcepto_key) REFERENCES Dim_Concepto(DimConcepto_key)
);