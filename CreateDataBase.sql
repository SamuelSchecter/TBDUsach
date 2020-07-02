
/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2016                    */
/* Created on:     26/06/2020 12:04:21                          */
/*==============================================================*/

create database EasySell
go

use EasySell
go
/*==============================================================*/
/* Table: ACCESO_ROL_ITEM                                       */
/*==============================================================*/
create table ACCESO_ROL_ITEM (
   ID                   int		             not null	PRIMARY KEY IDENTITY(1,1),
   ID_ROL               int 	             not null,
   ID_ITEM              int 	             not null
)
go

/*==============================================================*/
/* Table: ACCESO_USUARIO                                        */
/*==============================================================*/
create table ACCESO_USUARIO (
   ID                   int		             not null PRIMARY KEY IDENTITY(1,1),
   ID_USUARIO           int		             not null,
   FECHA_ACCESO         date             	 null,
   ESTADO               bit		             null
)
go

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA (
   ID                   int                  not null	PRIMARY KEY IDENTITY(1,1),
   TIPO                 varchar(100)         null,
   NOMBRE               varchar(100)         null,
)
go

/*==============================================================*/
/* Table: CATEGORIA_PRODUCTO                                    */
/*==============================================================*/
create table CATEGORIA_PRODUCTO (
   ID                   int 	             not null		PRIMARY KEY IDENTITY(1,1),
   ID_PRODUCTO          int		             not null,
   ID_CATEGORIA         int		             not null,
)
go

/*==============================================================*/
/* Table: COMPRA                                                */
/*==============================================================*/
create table COMPRA (
   ID                   int                  not null	PRIMARY KEY IDENTITY(1,1),
   COSTO                int                  null,
   ID_USUARIO           int                  not null
)
go

/*==============================================================*/
/* Table: CONSULTA                                              */
/*==============================================================*/
create table CONSULTA (
   ID                   char(10)             not null	PRIMARY KEY IDENTITY(1,1),
   TEXTO                char(1000)           null,
   FECHA_CONSULTA       date                 null,
   ESTADO               int                  not null,
   ID_USUARIO           int                  not null,
   ID_PRODUCTO          int	                 not null
)
go

/*==============================================================*/
/* Table: DETALLE_COMPRA                                        */
/*==============================================================*/
create table DETALLE_COMPRA (
   ID                   int                  not null	PRIMARY KEY IDENTITY(1,1),
   ID_PRODUCTO          int                  not null,
   CANTIDAD             int                  null,
   FECHA_COMPRA         date                 null,
   ID_COMPRA            int                  not null
)
go

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO (
   ID                   int                  not null PRIMARY KEY IDENTITY(1,1),
   NOMBRE               varchar(50)          null
)
go

/*==============================================================*/
/* Table: IMAGEN                                                */
/*==============================================================*/
create table IMAGEN (
   ID                   int                  not null	PRIMARY KEY IDENTITY(1,1),
   ID_PRODUCTO          int                  not null,
   IMAGEN               image                null,
   TAMANO               int                  null,
   FORMATO              varchar(10)          null,
   FECHA_CREACION       date                 null
)
go

/*==============================================================*/
/* Table: ITEM_PLATAFORMA                                       */
/*==============================================================*/
create table ITEM_PLATAFORMA (
   ID                   int                  not null	PRIMARY KEY IDENTITY(1,1),
   ITEM_ACCESO          varchar(100)         null,
   ESTADO               int                  not null
)
go

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID                   int            		 not null	PRIMARY KEY IDENTITY(1,1),
   NOMBRE               varchar(100)         null,
   ESTADO               int                  not null,
   ID_PUBLICACION       int                  not null,
   PRECIO               int                  null,
   DESCRIPCION          varchar(1000)        null
)
go

/*==============================================================*/
/* Table: PUBLICACION                                           */
/*==============================================================*/
create table PUBLICACION (
   ID                   int                  not null	PRIMARY KEY IDENTITY(1,1),
   FECHA_CREACION       date                 null,
   ID_USUARIO           int                  not null,
   ESTADO               int                  not null
)
go

/*==============================================================*/
/* Table: PUNTUACION_PRODUCTO                                   */
/*==============================================================*/
create table PUNTUACION_PRODUCTO (
   ID                   int            	 	 not null	PRIMARY KEY IDENTITY(1,1),
   ID_PRODUCTO          int                  not null,
   ID_USUARIO           int                  not null,
   COMENTARIO           varchar(1000)        null,
   CALIFICACION         int                  null,
   FECHA_PUNTUACION_PRODUCTO date            null,
   FECHA_CALIFICACION   date                 null
)
go

/*==============================================================*/
/* Table: PUNTUACION_USUARIO                                    */
/*==============================================================*/
create table PUNTUACION_USUARIO (
   ID                   int                  not null	PRIMARY KEY IDENTITY(1,1),
   ID_USUARIO           int                  not null,
   ID_USUARIO_CALIFICADO int                 not null,
   FECHA_PUNTUACION     date                 null,
   CALIFICACION         int                  null,
   FECHA_CALIFICACION   date                 null
)
go

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL (
   ID                   int             	 not null	PRIMARY KEY IDENTITY(1,1),
   NOMBRE               varchar(100)         null,
   FECHA_CREACION       date                 null
)
go

/*==============================================================*/
/* Table: ROL_USUARIO                                           */
/*==============================================================*/
create table ROL_USUARIO (
   ID                   int                  not null	PRIMARY KEY IDENTITY(1,1),
   ID_USUARIO           int                  not null,
   ID_ROL               int                  not null
)
go

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID                   int                  not null PRIMARY KEY IDENTITY(1,1),
   NOMBRE               varchar(100)         null,
   DIRECCION            varchar(100)         null,
   FECHA_NAC            date                 null,
   OCUPACION            varchar(100)         null,
   TELEFONO             varchar(15)          null,
   FECHA_CREACION       date                 null,
   ESTADO_ACTIVACION    int                  not null FOREIGN KEY REFERENCES ESTADO(ID),
   CONTRASENA           varchar(50)          null
)
go

alter table USUARIO
ADD CONSTRAINT USUARIO_ESTADO FOREIGN KEY (ESTADO_ACTIVACION) REFERENCES USUARIO(ID)

alter table ROL_USUARIO
ADD 
CONSTRAINT ROL_USUARIO_USUARIO FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID),
CONSTRAINT ROL_USUARIO_ROL FOREIGN KEY (ID_ROL) REFERENCES ROL(ID)

alter table PUNTUACION_USUARIO
ADD 
CONSTRAINT PUNTUACION_USUARIO_USUARIO FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID),
CONSTRAINT PUNTUACION_USUARIO_USUARIO_CALIFICADO FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID)

alter table PUNTUACION_PRODUCTO
ADD CONSTRAINT PUNTUACION_PRODUCTO_PRODUCTO FOREIGN KEY(ID_PRODUCTO) REFERENCES PRODUCTO(ID),
CONSTRAINT PUNTUACION_PRODUCTO_USUARIO FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID)

alter table PUBLICACION
ADD 
CONSTRAINT PUBLICACION_ESTADO FOREIGN KEY(ESTADO) REFERENCES ESTADO(ID),
CONSTRAINT PUBLICACION_USUARIO FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID)

alter table PRODUCTO
ADD 
CONSTRAINT PRODUCTO_ESTADO_ESTADO FOREIGN KEY(ESTADO) REFERENCES ESTADO(ID),
CONSTRAINT PRODUCTO_ESTADO_PUBLICACION FOREIGN KEY(ID_PUBLICACION) REFERENCES PUBLICACION(ID)

alter table ITEM_PLATAFORMA
ADD CONSTRAINT ITEM_PLATAFORMA_ESTADO FOREIGN KEY(ESTADO) REFERENCES ESTADO(ID)

alter table IMAGEN
ADD CONSTRAINT IMAGEN_PRODUCTO FOREIGN KEY(ID_PRODUCTO) REFERENCES PRODUCTO(ID)

alter table DETALLE_COMPRA
ADD 
CONSTRAINT DETALLE_COMPRA_PRODUCTO FOREIGN KEY(ID_PRODUCTO) REFERENCES PRODUCTO(ID),
CONSTRAINT DETALLE_COMPRA_COMPRA FOREIGN KEY(ID_COMPRA) REFERENCES COMPRA(ID)

alter table CONSULTA
ADD 
CONSTRAINT CONSULTA_ESTADO FOREIGN KEY(ESTADO) REFERENCES ESTADO(ID),
CONSTRAINT CONSULTA_USUARIO FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID),
CONSTRAINT CONSULTA_PRODUCTO FOREIGN KEY(ID_PRODUCTO) REFERENCES PRODUCTO(ID)

alter table COMPRA
ADD CONSTRAINT COMPRA_USUARIO FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID)

alter table CATEGORIA_PRODUCTO
ADD 
CONSTRAINT CATEGORIA_PRODUCTO_PRODUCTO FOREIGN KEY(ID_PRODUCTO) REFERENCES PRODUCTO(ID),
CONSTRAINT CATEGORIA_PRODUCTO_CATEGORIA FOREIGN KEY(ID_CATEGORIA) REFERENCES CATEGORIA(ID)

alter table ACCESO_USUARIO
ADD CONSTRAINT ACCESO_USUARIO_USUARIO FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID)

alter table ACCESO_ROL_ITEM
ADD 
CONSTRAINT ACCESO_ROL_ITEM_ROL FOREIGN KEY(ID_ROL) REFERENCES ROL(ID),
CONSTRAINT ACCESO_ROL_ITEM_ITEM_PLATAFORMA FOREIGN KEY(ID_ITEM) REFERENCES ITEM_PLATAFORMA(ID)