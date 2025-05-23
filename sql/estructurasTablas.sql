USE fvyvvdbc_pilaweb;

CREATE TABLE IF NOT EXISTS PRODUCTOS (
	ID_PRODUCTOS INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE TINYTEXT NOT NULL UNIQUE,
    CLAVE VARCHAR(50) DEFAULT 'UNDEFINED',
    PRESENTACION VARCHAR(50) DEFAULT 'UNDEFINED',
    MARCA TINYTEXT DEFAULT 'UNDEFINED',
    HISTORIA TEXT DEFAULT 'UNDEFINED',
    IMAGEN_ETIQUETA BLOB DEFAULT NULL,
    IMAGEN_PRODUCTO BLOB DEFAULT NULL,
    RESETAS JSON DEFAULT '{}',
    STATUS ENUM('ACTIVO', 'INACTIVO', 'DESCONOCIDO') NOT NULL DEFAULT 'ACTIVO'
);

CREATE TABLE IF NOT EXISTS CATEGORIAS (
	ID_CATEGORIA INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE TINYTEXT NOT NULL UNIQUE,
    DESCRIPCION TEXT,
	STATUS ENUM('ACTIVO', 'INACTIVO', 'DESCONOCIDO') NOT NULL DEFAULT 'ACTIVO'
);

CREATE TABLE IF NOT EXISTS TABLA_ALIMENTICIA (
	ID_PRODUCTO INT PRIMARY KEY NOT NULL,
	PORCION DOUBLE DEFAULT 0,
    CONTENIDO_ENERGETICO VARCHAR(50) DEFAULT 'UNDEFINED',
    PROTEINA VARCHAR(50) DEFAULT 'UNDEFINED',
    GRASAS_TOTALES VARCHAR(50) DEFAULT 'UNDEFINED',
    GRASAS_SATURADAS VARCHAR(50) DEFAULT 'UNDEFINED',
    GRASAS_TRANS VARCHAR(50) DEFAULT 'UNDEFINED',
    CARBOHIDRATOS VARCHAR(50) DEFAULT 'UNDEFINED',
    AZUCARES_TOTALES VARCHAR(50) DEFAULT 'UNDEFINED',
    AZUCARES_AÑADIDOS VARCHAR(50) DEFAULT 'UNDEFINED',
    FIBRA_DIETETICA VARCHAR(50) DEFAULT 'UNDEFINED',
    SODIO VARCHAR(50) DEFAULT 'UNDEFINED',
    HUMEDAD VARCHAR(50) DEFAULT 'UNDEFINED',
    GRASA_BUTIRICA_MIN VARCHAR(50) DEFAULT 'UNDEFINED',
    PROTEINA_MIN VARCHAR(50) DEFAULT 'UNDEFINED',
    INGREDIENTES TEXT DEFAULT 'UNDEFINED',
    DESCRIPCION TEXT DEFAULT 'UNDEFINED',
    ID_CATEGORIA INT NOT NULL DEFAULT 1,
    STATUS ENUM('ACTIVO', 'INACTIVO', 'DESCONOCIDO') NOT NULL DEFAULT 'ACTIVO',
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS (ID_PRODUCTO),
    FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIAS (ID_CATEGORIA)
);

CREATE TABLE IF NOT EXISTS RECETAS (
	ID_RESETA INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE TINYTEXT NOT NULL UNIQUE,
    DESCRIPCION TEXT DEFAULT 'UNDEFINED',
    INGREDIENTES JSON DEFAULT '{}',
    INSTRUCCIONES LONGTEXT DEFAULT 'UNDEFINED',
    TIEMPO_PREPARACION TIME DEFAULT '00:00:00',
    TIEMPO_COCINA TIME DEFAULT '00:00:00',
    STATUS ENUM('ACTIVO', 'INACTIVO', 'DESCONOCIDO') NOT NULL DEFAULT 'ACTIVO'
);

CREATE TABLE IF NOT EXISTS CONTACTOS (
	ID_CONTACTO INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_TITULAR TINYTEXT NOT NULL,
    NOMBRE_EMPRESA MEDIUMTEXT DEFAULT 'UNDEFINED',
    RFC VARCHAR(50) DEFAULT 'UNDEFINED',
    DIRECCION_FISCAL TEXT DEFAULT 'UNDEFINED',
    ARCHIVO_ADJUNTO LONGBLOB DEFAULT NULL,
    DIRECCION_NEGOCIO TEXT DEFAULT 'UNDEFINED',
    CORREO_ELECTRONICO TINYTEXT NOT NULL,
    NUMERO_TELEFONICO VARCHAR(20) NOT NULL,
    WHATSAPP VARCHAR(20) DEFAULT 'UNDEFINED',
    MENSAJE LONGTEXT NOT NULL,
    STATUS ENUM('NUEVO', 'LEIDO', 'ATENDIDO', 'DESCARTADO') NOT NULL DEFAULT 'NUEVO'
);

CREATE TABLE IF NOT EXISTS COMENTARIOS (
    ID_COMENTARIO INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(100) NOT NULL,
    APELLIDO VARCHAR(200) NOT NULL,
    CORREO VARCHAR(150) NOT NULL,
    TELEFONO VARCHAR(20) DEFAULT 'sin telefono',
    DIRECCION VARCHAR(255) DEFAULT 'sin direccion',
    EMPRESA VARCHAR(150) DEFAULT 'sin empresa',
    TIPO ENUM('Queja', 'Sugerencia', 'Agradecimiento') NOT NULL,
    DESCRIPCION TEXT NOT NULL,
    ARCHIVO_ADJUNTO VARCHAR(255) DEFAULT 'undefined',
    FECHA_CREACION DATETIME DEFAULT CURRENT_TIMESTAMP,
    ESTADO ENUM('Descartado', 'Pendiente', 'Revisado', 'Resuelto') DEFAULT 'Pendiente'
);

CREATE TABLE IF NOT EXISTS SUSCRIPCIONES (
    ID_SUSCRIPCION INT AUTO_INCREMENT PRIMARY KEY,
    CORREO VARCHAR(255) UNIQUE,
    FECHA_CREACION TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ESTADO ENUM('Desuscrito', 'Suscrito') DEFAULT 'Suscrito'
);



