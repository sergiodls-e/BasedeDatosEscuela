-- Script para la creación del modelo de datos para el problema de
-- la gestión de una biblioteca.

CREATE DATABASE biblioteca;
USE biblioteca;

-- Tabla de Autor
CREATE TABLE autor(
    id_autor INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
    );

-- Tabla Categoria
CREATE TABLE categoria(
    id_categoria INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla Libro
CREATE TABLE libro(
    id_libro INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    anio_publicacion YEAR NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE
);

-- Tabla intermedia: Libro_Autor
CREATE TABLE libro_autor(
    id_libro INT NOT NULL,
    id_autor INT NOT NULL,

    PRIMARY KEY (id_libro, id_autor),

    FOREIGN KEY (id_libro)
        REFERENCES libro(id_libro)
        ON DELETE CASCADE,

    FOREIGN KEY (id_autor)
        REFERENCES autor(id_autor)
        ON DELETE CASCADE
);
-- Tabla libro-categoria
CREATE TABLE libro_categoria(
    id_libro INT NOT NULL,
    id_categoria INT NOT NULL,

    PRIMARY KEY (id_libro, id_categoria)

    FOREIGN KEY(id_libro)
        REFERENCES libro(id_libro)
        ON DELETE CASCADE,
    
    FOREIGN KEY(id_categoria)
        REFERENCES categoria(id_categoria)
        ON DELETE CASCADE
);
-- Tabla ejemplar
CREATE TABLE ejemplar(
    id_ejemplar INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_libro INT NOT NULL,
    estado ENUM('disponible','prestado','reserva') DEFAULT 'disponible',
    FOREIGN KEY (id_libro)
        ON DELETE CASCADE
);
-- Tabla usuario
CREATE TABLE usuario(
    id_usuario INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    matricula VARCHAR(30) NOT NULL UNIQUE,
    tipo ENUM('estudiante','profesor','empleado') DEFAULT 'estudiante'
);
-- Tabla prestamo
CREATE TABLE prestamo(
    id_prestamo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,

    id_usuario INT NOT NULL,
    id_ejemplar INT NOT NULL,

    fecha_salida DATE NOT NULL,
    fecha_devolucion_esperada DATE NOT NULL,
    fecha_devolucion_real DATE,

    FOREIGN KEY(id_usuario)
        REFERENCES usuario(id_usuario),
    FOREIGN KEY(id_ejemplar)
        REFERENCES ejemplar(id_ejemplar)
);
-- Tabla multa
CREATE TABLE multa(
    id_multa INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    
    id_prestamo INT NOT NULL UNIQUE,
    monto DECIMAL(10,2) NOT NULL,
    pagada BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (id_prestamo)
        REFERENCES prestamo(id_prestamo)
        ON DELETE CASCADE
);