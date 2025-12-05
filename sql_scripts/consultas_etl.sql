-- DIMENSION PACIENTES
select  p.id, p.nombre, p.edad,p.sexo, e.nombre as nombreEtapaVida
from pacientes p, etapavida e
where p.idEtapaVida = e.id;
