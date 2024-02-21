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

/*1*/ 
/*2*/
/*3*/
/*4*/
/*5*/
/*6*/
