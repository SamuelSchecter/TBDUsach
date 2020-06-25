CREATE TABLE easysell.Usuario (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR (50) NOT NULL,
    email VARCHAR (50) NOT NULL,
    contraseña VARCHAR (50) NOT NULL,
    direccion VARCHAR (100),
    fecha_nacimiento DATE, 
    ocupacion VARCHAR (500),
    telefono VARCHAR(20),
    fecha_creacion DATETIME,
    estado VARCHAR (50),
);

CREATE TABLE easysell.Acceso_usuario (
    id INT PRIMARY KEY IDENTITY(1,1),
    fecha_acceso DATETIME,
    estado VARCHAR (50) NOT NULL,
    id_usuario INT REFERENCES Usuario(id_usuario)
);

CREATE TABLE easysell.Rol (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR (50) NOT NULL,
    fecha_creacion DATETIME
);

CREATE TABLE easysell.Rol_usuario (
    id INT PRIMARY KEY IDENTITY(1,1), 
    id_usuario INT REFERENCES Usuario (id_usuario),
    id_rol INT REFERENCES Rol (id_rol)
);

CREATE TABLE easysell.Item (
    id INT PRIMARY KEY IDENTITY(1,1),
    estado VARCHAR (50) NOT NULL,
);

CREATE TABLE easysell.Acceso_Rol_Item (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_rol INT REFERENCES Rol (id_rol),
    id_item INT REFERENCES Item (id_item)
);

CREATE TABLE easysell.Puntuacion_usuario (
    id INT PRIMARY KEY IDENTITY(1,1),
    fecha_puntuacion DATETIME,
    calificacion INT,
    id_usuario INT REFERENCES Usuario (id_usuario),
    id_usuario_calificacion INT REFERENCES Usuario (id_usuario_calificacion),
);

CREATE TABLE easysell.Publicacion (
    id INT PRIMARY KEY IDENTITY(1,1),
    fecha_creacion DATETIME,
    estado VARCHAR (50) NOT NULL,
    id_usuario INT REFERENCES Usuario (id_usuario),
);

CREATE TABLE easysell.Producto (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR (50) NOT NULL,
    descripcion VARCHAR (500),
    precio INT NOT NULL,
    estado VARCHAR (50) NOT NULL,
    fecha_creacion DATETIME,
    id_publicacion INT REFERENCES Publicacion (id_publicacion),
);

CREATE TABLE easysell.Imagen (
    id INT PRIMARY KEY IDENTITY(1,1),
    imagen varbinary(max) NOT NULL,
    tamaño INT, 
    formato VARCHAR(50),
    fecha_creacion DATETIME,
    id_producto INT REFERENCES Producto (id_producto),
);

CREATE TABLE easysell.Categoria (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR (50) NOT NULL,
    tipo VARCHAR (50) NOT NULL,
);

CREATE TABLE easysell.Subcategoria (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR (50) NOT NULL,
    id_categoria INT REFERENCES Categoria (id_categoria),
);

CREATE TABLE easysell.Categoria_producto (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_categoria INT PRIMARY KEY
    id_producto INT REFERENCES Producto (id_producto),
    id_categoria INT REFERENCES Categoria (id_categoria),
);

CREATE TABLE easysell.Puntuacion_producto (
    id INT PRIMARY KEY IDENTITY(1,1),
    comentario VARCHAR (500) NOT NULL,
    calificacion INT NOT NULL,
    fecha_puntuacion DATETIME,
    id_producto INT REFERENCES Producto (id_producto),
    id_usuario INT REFERENCES Usuario (id_usuario),
);

CREATE TABLE easysell.Consulta (
    id INT PRIMARY KEY IDENTITY(1,1),
    texto VARCHAR (500) NOT NULL,
    fecha_consulta DATETIME,
    estado VARCHAR (50) NOT NULL,
    origen INT REFERENCES Usuario (id_usuario),
    destino INT REFERENCES Usuario (id_usuario),
);

CREATE TABLE easysell.Compra (
    id INT PRIMARY KEY IDENTITY(1,1),
    costo INT,
    id_usuario INT REFERENCES Usuario (id_usuario),
);

CREATE TABLE easysell.Detalle_compra (
    id INT PRIMARY KEY IDENTITY(1,1),
    cantidad_producto INT NOT NULL,
    fecha_compra DATETIME,
    id_producto INT REFERENCES Producto (id_producto),
);


