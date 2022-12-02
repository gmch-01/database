CREATE DATABASE maxisoft_db; 

USE maxisoft_db;

CREATE TABLE insumo(
    id_insumo  INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(180),
    unidad VARCHAR(255),
);

DESCRIBE insumo;