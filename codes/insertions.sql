-- Script para la inserción de algunos registros en el modelo
-- datos.

USE biblioteca;
INSERT INTO autor(nombre) VALUES('Gabriel García Márquez'),('Isaac Newton');

INSERT INTO categoria(nombre) VALUES ('Ciencias', 'Humanidades', 'Ingenieria');

INSERT INTO libro(titulo, anio_publicacion,isbn) VALUES('Cien anos de soledad',1967, '1234567890'), ('Principia Mathematica', 1687, '0987654321');

INSERT INTO libro_autor VALUES (1,1),(2,2);
INSERT INTO libro_categoria VALUES (1,2),(2,1);
INSERT INTO ejemplar(id_libro) VALUES (1),(1),(2);
INSERT INTO usuario(nombre, correo, matricula, tipo) VALUES 
    ('Juan Perez','juan@cua.uam.mx','12344','estudiante'),
    ('Ana Lopez', 'ana@cua.uam.mx', '44321', 'profesor');

INSERT INTO prestamo(id_usuario, id_ejemplar,fecha_salida,fecha_devolucion_esperada) VALUES (
    1,
    1,
    CURDATE(),
    DATE_ADD(CURDATE(),
        INTERVAL 7 DAY));
