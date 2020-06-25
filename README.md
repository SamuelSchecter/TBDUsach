# Easy Sell

Ofrece un servicio que une proveedores y consumidores en el país enfocado en la consulta rápida sobre los productos y la evaluación de los usuarios en forma de aplicativo web.

### Alcances

* Cualquier persona puede registrarse como usuario proveedor o consumidor en el sistema.
* Se mostrarán datos del perfil de los usuarios, tal como, su nombre, foto de perfil y evaluación de manera pública.
* Se presentan los productos/servicios y las solicitudes de productos/servicios en forma de listas que contarán con un buscador.
* Se podrá acceder al detalle de cada servicio/producto o solicitud que contará co galería de imágenes, descripciones, comentarios de otros usuarios y perfiles del proveedor/solicitante.
* Los consumidores podrán realizar consultas sobre un producto en particular.
* Los productos tendrán estados que facilitaran crearlos y publicarlos, permitiendo tenerlos por ejemplo en borrador o desactivados.

### Limitaciones

El sistema no contempla:

* Uso internacional.
* Ingreso de personas no registradas a la aplicación.
* Comunicación que no sea através de un producto.
* Seguimiento de despacho y entrega de productos.
* Geolocalización.
* No se registran datos de sesión, como: ip, navegador,etc.
* No se pueden evaluar productos que no se han comprado.
* Las calificaciones de los productos no son editables.
* No se guardan historiales de datos de productos.

## Instalación

### SQL Server

En este inicio rápido, instala SQL Server 2019 en Ubuntu 18.04. Luego se conecta con sqlcmd para crear su primera base de datos y ejecutar consultas.

#### Prerrequisitos

Debe tener una máquina Ubuntu 16.04 o 18.04 con al menos 2 GB de memoria.

Para instalar Ubuntu 18.04 en su propia máquina, vaya a[](http://releases.ubuntu.com/bionic/) .

Para conocer otros requisitos del sistema, consulte [Requisitos del sistema para SQL Server en Linux](https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup?view=sql-server-ver15#system).

#### Instalar SQL Server

>**Nota:** Los siguientes comandos para SQL Server 2019 apuntan al repositorio Ubuntu 18.04. Si está utilizando Ubuntu 16.04, cambie la ruta a continuación en /ubuntu/16.04/lugar de /ubuntu/18.04/.

Para configurar SQL Server en Ubuntu, ejecute los siguientes comandos en una terminal para instalar el paquete mssql-server.

1. Importe las claves GPG del repositorio público:

`wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -`

2. Registre el repositorio de Ubuntu de Microsoft SQL Server para SQL Server 2019:

`sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2019.list)"`

3. Ejecute los siguientes comandos para instalar SQL Server:
```
sudo apt-get update
sudo apt-get install -y mssql-server
```

4. Una vez que finalice la instalación del paquete, ejecute la configuración mssql-conf y siga las instrucciones para configurar la contraseña SA y elegir su edición.

`sudo /opt/mssql/bin/mssql-conf setup`

>**Nota:** Asegúrese de especificar una contraseña segura para la cuenta SA (longitud mínima de 8 caracteres, incluidas letras mayúsculas y minúsculas, dígitos de base 10 y / o símbolos no alfanuméricos).

5. Una vez que se realiza la configuración, verifique que el servicio se esté ejecutando:

`systemctl status mssql-server --no-pager`

6. Si planea conectarse de forma remota, es posible que también deba abrir el puerto TCP de SQL Server (predeterminado 1433) en su firewall.

En este punto, SQL Server 2019 se ejecuta en su máquina Ubuntu y está listo para usar.

#### Instale las herramientas de línea de comandos de SQL Server

Para crear una base de datos, debe conectarse con una herramienta que pueda ejecutar instrucciones Transact-SQL en el servidor SQL. Los siguientes pasos instalan las herramientas de línea de comandos de SQL Server: [sqlcmd](https://docs.microsoft.com/en-us/sql/tools/sqlcmd-utility?view=sql-server-ver15) y [bcp](https://docs.microsoft.com/en-us/sql/tools/bcp-utility?view=sql-server-ver15).

Siga los siguientes pasos para instalar mssql-tools en Ubuntu.

1. Importe las claves GPG del repositorio público.

`curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -`

2. Registre el repositorio de Microsoft Ubuntu.

`curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list`

3. Actualice la lista de fuentes y ejecute el comando de instalación con el paquete de desarrollador unixODBC.
```
sudo apt-get update 
sudo apt-get install mssql-tools unixodbc-dev
```
>**Nota:** Para actualizar a la última versión de mssql-tools, ejecute los siguientes comandos:
```
sudo apt-get update 
sudo apt-get install mssql-tools
```
#### Conectar localmente

Los siguientes pasos usan sqlcmd para conectarse localmente a su nueva instancia de SQL Server.

1. Ejecute sqlcmd con parámetros para su nombre de SQL Server (-S), el nombre de usuario (-U) y la contraseña (-P). En este tutorial, se está conectando localmente, por lo que el nombre del servidor es localhost. El nombre de usuario es SAy la contraseña es la que proporcionó para la cuenta SA durante la configuración.

`sqlcmd -S localhost -U SA -P '<YourPassword>'`

2. Si tiene éxito, se debe llegar a un sqlcmd símbolo del sistema: `1>`.

3. Si obtiene una falla de conexión, primero intente diagnosticar el problema desde el mensaje de error. Luego revise las [recomendaciones de solución de problemas de conexión](https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-troubleshooting-guide?view=sql-server-ver15#connection).

### DBeaver

1. Importe las claves del repositorio:

`wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -`

2. Añada el propio repositorio:

`echo "deb https://dbeaver.io/debs/dbeaver-ce /" \ | sudo tee /etc/apt/sources.list.d/dbeaver.list`

3. Ejecute los siguientes comandos para instalar DBeaber:
```
sudo apt update
sudo apt install dbeaver-ce
```
En este punto ya podemos encontrar la herramienta disponible.

## Construido con

* [Microsoft SQL Server](https://www.microsoft.com/es-es/sql-server/sql-server-2019) - Base de datos relacional.
* [DBeaver](https://dbeaver.io/download/) - Herramienta de administración bases de datos.
* [MongoDB](https://www.mongodb.com/) - Base de datos no relacional.

## Versionado


## Autores

* **Samuel Arriagada** - Trabajo inicial - [SamuelSchecter](https://github.com/SamuelSchecter)
* **Mariana Encalada** - Trabajo inicial - [marianaencalada](https://github.com/marianaencalada)
* **Juan Gamboa** - Documentación - [vuduzeta](https://github.com/vuduzeta)
* **Álvaro Reyes** - Trabajo inicial - [Areyesenc](https://github.com/Areyesenc)

## Otros enlaces

* [Metodología Kanban](https://trello.com/b/htISa8xu/easy-sell)

