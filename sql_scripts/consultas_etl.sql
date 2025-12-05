-- DIMENSION PACIENTES
select  p.id, p.nombre, p.edad,p.sexo, e.nombre as nombreEtapaVida
from pacientes p, etapavida e
where p.idEtapaVida = e.id;


-- DIMENSION DOCTORES
select id, nombre, especialidad,sueldo
from doctores 


-- DIMENSION HOSPITALES
select  idHosp, h.nombre as nombreH, tipo,
        e.nombre as nombreE, c.nombre as nombreC
from hospitales h, estados e, ciudades c
where h.idCiudad = c.idCiudad and c.idEstado = e.idEstado




-- HECHOS CONSULTA (norte y sur)
SELECT
    F.id_tiempo         AS id_tiempo,
    FD.idDoctor         AS id_doctor,
    F.idpaciente        AS id_paciente,
    F.idHosp            AS id_hospital,

    Z.idZona            AS id_zona,   -- ← atributo directo

    COUNT(*) AS num_consultas,
    SUM(C.precioBase) AS importe_total_consultas

FROM facturas F
INNER JOIN factdetalle FD ON F.idFactura = FD.idFactura
INNER JOIN concepto C ON FD.concepto = C.id
INNER JOIN hospitales H ON F.idHosp = H.idHosp
INNER JOIN ciudades CI ON H.idCiudad = CI.idCiudad
INNER JOIN estados E ON CI.idEstado = E.idEstado
INNER JOIN zonas Z ON E.idZona = Z.idZona

WHERE 
    F.id_tiempo IS NOT NULL
    AND C.nombre = 'Consulta'

GROUP BY
    F.id_tiempo,
    FD.idDoctor,
    F.idpaciente,
    F.idHosp,
    Z.idZona;




-- hechos hospitalizaciones (norte y sur)
SELECT
    F.id_tiempo         AS id_tiempo,
    FD.idDoctor         AS id_doctor,
    F.idpaciente        AS id_paciente,
    F.idHosp            AS id_hospital,

    Z.idZona            AS id_zona,  -- ← atributo directo

    SUM(FD.cant) AS dias_hospitalizacion,
    SUM(FD.cant * C.precioBase) AS importe_total_hospitalizacion

FROM facturas F
INNER JOIN factdetalle FD ON F.idFactura = FD.idFactura
INNER JOIN concepto C ON FD.concepto = C.id
INNER JOIN hospitales H ON F.idHosp = H.idHosp
INNER JOIN ciudades CI ON H.idCiudad = CI.idCiudad
INNER JOIN estados E ON CI.idEstado = E.idEstado
INNER JOIN zonas Z ON E.idZona = Z.idZona

WHERE 
    F.id_tiempo IS NOT NULL
    AND C.nombre = 'Hospitalizacion'

GROUP BY
    F.id_tiempo,
    FD.idDoctor,
    F.idpaciente,
    F.idHosp,
    Z.idZona;
