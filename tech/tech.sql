CREATE DATABASE IF NOT EXISTS cursos_en_linea;
USE cursos_en_linea;

-- Tabla de instructores
CREATE TABLE instructores (
    id_instructor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100)
);

-- Tabla de cursos (1:N con instructores)
CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    duracion INT NOT NULL, -- duración en horas
    id_instructor INT NOT NULL,
    CONSTRAINT fk_curso_instructor FOREIGN KEY (id_instructor)
        REFERENCES instructores(id_instructor)
        ON DELETE CASCADE
);

-- Tabla de estudiantes
CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de inscripciones (N:M entre estudiantes y cursos)
CREATE TABLE inscripciones (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    CONSTRAINT fk_inscripcion_estudiante FOREIGN KEY (id_estudiante)
        REFERENCES estudiantes(id_estudiante)
        ON DELETE CASCADE,
    CONSTRAINT fk_inscripcion_curso FOREIGN KEY (id_curso)
        REFERENCES cursos(id_curso)
        ON DELETE CASCADE
);
