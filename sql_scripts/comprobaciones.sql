-- COMPROBACION ZONA SUR HECHOS CONSULTAS MYSQL

SELECT
    COUNT(*) AS total_grupos
FROM
    (
        SELECT
            F.id_tiempo,
            FD.idDoctor,
            F.idpaciente,
            F.idHosp,
            Z.idZona
        FROM facturas F
        INNER JOIN factdetalle FD
            ON F.idFactura = FD.idFactura
        INNER JOIN concepto C
            ON FD.concepto = C.id
        INNER JOIN hospitales H
            ON F.idHosp = H.idHosp
        INNER JOIN ciudades CI
            ON H.idCiudad = CI.idCiudad
        INNER JOIN estados E
            ON CI.idEstado = E.idEstado
        INNER JOIN zonas Z
            ON E.idZona = Z.idZona
        WHERE
            F.id_tiempo IS NOT NULL
            AND C.nombre = 'Consulta'
        GROUP BY
            F.id_tiempo,
            FD.idDoctor,
            F.idpaciente,
            F.idHosp,
            Z.idZona
    ) AS SubconsultaAgrupada;


-- COMPROBACION ZONA NORTE HECHOS CONSULTAS
-- El punto y coma al inicio asegura que la CTE es la primera instrucción
;WITH ConsultasAgrupadas AS (
    SELECT
        F.id_tiempo,
        FD.idDoctor,
        F.idpaciente,
        F.idHosp,
        Z.idZona
        -- No se necesitan COUNT(*) ni SUM() en esta etapa, solo se definen los grupos
    FROM facturas F
    INNER JOIN factdetalle FD
        ON F.idFactura = FD.idFactura
    INNER JOIN concepto C
        ON FD.concepto = C.id
    INNER JOIN hospitales H
        ON F.idHosp = H.idHosp
    INNER JOIN ciudades CI
        ON H.idCiudad = CI.idCiudad
    INNER JOIN estados E
        ON CI.idEstado = E.idEstado
    INNER JOIN zonas Z
        ON E.idZona = Z.idZona
    WHERE
        F.id_tiempo IS NOT NULL
        AND C.nombre = 'Consulta'
    GROUP BY
        F.id_tiempo,
        FD.idDoctor,
        F.idpaciente,
        F.idHosp,
        Z.idZona
)
SELECT
    COUNT(*) AS total_grupos
FROM ConsultasAgrupadas;




-- COMPROBACION ZONA NORTE HECHOS HOSPITALIZACIONES



-- COMPROBACION ZONA SUR HECHOS HOSPITALIZACIONES

SELECT
    COUNT(*) AS total_grupos_hospitalizaciones
FROM
    (
        SELECT
            F.id_tiempo,
            FD.idDoctor,
            F.idpaciente,
            F.idHosp,
            Z.idZona
        FROM facturas F
        INNER JOIN factdetalle FD
            ON F.idFactura = FD.idFactura
        INNER JOIN concepto C
            ON FD.concepto = C.id
        INNER JOIN hospitales H
            ON F.idHosp = H.idHosp
        INNER JOIN ciudades CI
            ON H.idCiudad = CI.idCiudad
        INNER JOIN estados E
            ON CI.idEstado = E.idEstado
        INNER JOIN zonas Z
            ON E.idZona = Z.idZona
        WHERE
            F.id_tiempo IS NOT NULL
            -- Filtro clave: Cambiado a 'Hospitalización'
            AND C.nombre = 'Hospitalización'
        GROUP BY
            F.id_tiempo,
            FD.idDoctor,
            F.idpaciente,
            F.idHosp,
            Z.idZona
    ) AS SubconsultaHospitalizaciones;