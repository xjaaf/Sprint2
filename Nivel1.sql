use tienda;
 
/*1*/ SELECT nombre FROM `producto`;
/*2*/ SELECT nombre, precio FROM `producto`;
/*3*/ SELECT * FROM producto;
/*4*/ SELECT nombre AS "Productos", precio AS "Euros", precio * 1.08 AS "USD" FROM producto;
/*5*/ SELECT nombre AS "Nombre del producto", precio AS "Euros", precio * 1.08 AS "Dólares estadounidenses" FROM producto;
/*6*/ SELECT UPPER(nombre), precio FROM producto;
/*7*/ SELECT LOWER(nombre), precio FROM producto;
/*8*/ SELECT nombre, UPPER(substring(nombre, 1, 2)) FROM fabricante;
/*9*/ SELECT nombre, round(precio) FROM producto;
/*10*/ SELECT nombre, truncate(precio, 0) FROM producto;
/*11*/ SELECT codigo_fabricante FROM producto;
/*12*/ SELECT DISTINCT codigo_fabricante FROM producto;
/*13*/ SELECT nombre FROM fabricante ORDER BY nombre asc;
/*14*/ SELECT nombre FROM fabricante ORDER BY nombre desc;
/*15*/ SELECT nombre, precio FROM producto ORDER BY nombre asc, precio desc;
/*16*/ SELECT * FROM fabricante limit 5;
/*17*/ SELECT * FROM fabricante limit 3, 2;
/*18*/ SELECT nombre, precio FROM producto ORDER BY precio limit 1;
/*19*/ SELECT nombre, precio FROM producto ORDER BY precio desc limit 1;
/*20*/ SELECT nombre FROM producto WHERE codigo_fabricante = 2;

use universidad;

/*1*/ SELECT apellido1, apellido2, nombre FROM persona ORDER BY apellido1, apellido2, nombre asc;
/*2*/ SELECT nombre, apellido1, apellido2  FROM persona where telefono is null;
/*3*/ SELECT nombre, apellido1, apellido2 from persona where year(fecha_nacimiento) = 1999;
/*4*/ SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono is null AND substring(nif, length(nif)) = 'k' AND tipo = 'profesor';
/*5*/ SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7; 
/*6*/ SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS nombre_departamento FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1, persona.apellido2, persona.nombre;
/*7*/ SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin
    FROM alumno_se_matricula_asignatura
    JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
    JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id
    JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id
    WHERE persona.nif = '26902806M';
/*8*/ SELECT DISTINCT departamento.nombre
    FROM departamento, profesor, asignatura, grado
    WHERE departamento.id = profesor.id_departamento
    AND profesor.id_profesor = asignatura.id_profesor
    AND asignatura.id_grado = grado.id
    AND grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
/*9*/ SELECT DISTINCT persona.nombre, persona.apellido1, persona.apellido2
    FROM persona
    JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno
    JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
    WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019;

//LEFT JOIN y RIGHT JOIN.

/*1*/ SELECT d.nombre AS 'Nombre del Departamento', 
       p.apellido1 AS 'Primer Apellido', 
       p.apellido2 AS 'Segundo Apellido', 
       p.nombre AS 'Nombre del Profesor/a'
    FROM profesor pr
    RIGHT JOIN persona p ON pr.id_profesor = p.id
    LEFT JOIN departamento d ON pr.id_departamento = d.id
    ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
/*2*/ SELECT persona.apellido1, persona.apellido2, persona.nombre
    FROM persona
    LEFT JOIN profesor  ON persona.id = profesor.id_profesor
    WHERE profesor.id_profesor IS NULL AND persona.tipo = 'profesor';

/*3*/ SELECT departamento.nombre
    FROM departamento 
    LEFT JOIN profesor  ON departamento.id = profesor.id_departamento
    WHERE profesor.id_departamento IS NULL;
/*4*/ SELECT persona.apellido1, persona.apellido2, persona.nombre
FROM persona 
    LEFT JOIN asignatura ON persona.id = asignatura.id_profesor
    WHERE asignatura.id_profesor IS NULL AND persona.tipo = 'profesor';
/*5*/ SELECT asignatura.nombre
    FROM asignatura 
    LEFT JOIN persona ON asignatura.id_profesor = persona.id
    WHERE persona.id IS NULL;
/*6*/ SELECT departamento.nombre
    FROM departamento 
    LEFT JOIN profesor ON departamento.id = profesor.id_departamento
    LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
    LEFT JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
    WHERE alumno_se_matricula_asignatura.id_asignatura IS NULL;

//Consultes resum:

/*1*/ SELECT COUNT(*) FROM persona WHERE tipo = 'alumno';
/*2*/ SELECT COUNT(*) FROM persona WHERE YEAR(fecha_nacimiento) = 1999 AND tipo = 'alumno';
/*3*/ SELECT departamento.nombre, COUNT(profesor.id_profesor) AS 'Número de profesores'
    FROM departamento 
    LEFT JOIN profesor ON departamento.id = profesor.id_departamento
    GROUP BY departamento.nombre
    ORDER BY COUNT(profesor.id_profesor) DESC;
/*4*/ SELECT departamento.nombre, COUNT(profesor.id_profesor)
    FROM departamento
    LEFT JOIN profesor ON departamento.id = profesor.id_departamento
    GROUP BY departamento.nombre;
/*5*/ SELECT grado.nombre, COUNT(asignatura.id)
    FROM grado
    LEFT JOIN asignatura ON grado.id = asignatura.id_grado
    GROUP BY grado.nombre
    ORDER BY COUNT(asignatura.id) DESC;
/*6*/ SELECT grado.nombre, COUNT(asignatura.id)
    FROM grado
    LEFT JOIN asignatura ON grado.id = asignatura.id_grado
    GROUP BY grado.nombre
    HAVING COUNT(asignatura.id) > 40;   
/*7*/ SELECT grado.nombre AS 'Grado', asignatura.tipo AS 'Tipo de asignatura', SUM(asignatura.creditos) 
    AS 'Suma de     créditos'
    FROM grado 
    LEFT JOIN asignatura ON grado.id = asignatura.id_grado
    GROUP BY grado.nombre, asignatura.tipo;

/*8*/ SELECT anyo_inicio AS 'Año de inicio', COUNT(DISTINCT id_alumno) AS 'Número de alumnos matriculados'
    FROM curso_escolar
    JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
    GROUP BY anyo_inicio;

