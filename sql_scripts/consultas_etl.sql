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