--2. Dentro de la base de datos, crea las siguientes tablas:

   -- **Clientes**: Incluye campos como `id_cliente` (clave primaria), `nombre`, `email`, `direccion`, `telefono`, `pais`.
   
   CREATE TABLE Clientes (
	    id_cliente SERIAL PRIMARY KEY,
	    nombre VARCHAR(100),
	    email VARCHAR(125),
	    direccion VARCHAR(175),
	    telefono VARCHAR(25),
	    pais VARCHAR(75)
	);


   -- **Empleados**: Incluye campos como `id_empleado` (clave primaria), `nombre`, `cargo`, `email`.
   CREATE TABLE Empleados (
    	id_empleado SERIAL PRIMARY KEY,
    	nombre VARCHAR(100),
    	cargo VARCHAR(40),
    	email VARCHAR(125)
	);

   -- **Proveedores**: Incluye campos como `id_proveedor` (clave primaria), `nombre`, `contacto`, `telefono`, `direccion`.
	CREATE TABLE Proveedores (
	    id_proveedor SERIAL PRIMARY KEY,
	    nombre VARCHAR(100),
	    contacto VARCHAR(75),
	    telefono VARCHAR(25),
	    direccion VARCHAR(175)
	);

   -- **Envíos**: Incluye campos como `id_envio` (clave primaria), `id_cliente` (clave foránea), 
   -- `id_empleado` (clave foránea), `id_proveedor` (clave foránea), `fecha_envio`, `estado`, `total`.
	CREATE TABLE Envios (
	    id_envio SERIAL PRIMARY KEY,
	    id_cliente INT not null unique,
	    id_empleado INT not null unique,
	    id_proveedor INT REFERENCES Proveedores(id_proveedor),
	    fecha_envio DATE,
	    estado VARCHAR(50),
	    total NUMERIC(15, 2),
	    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
	    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
	    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
	    
	);

   -- **Detalle de Envíos**: Incluye campos como `id_detalle` (clave primaria), `id_envio` (clave foránea), `producto`, `cantidad`, `precio_unitario`.
	CREATE TABLE Detalle_Envios (
	    id_detalle SERIAL PRIMARY KEY,
	    id_envio INT not null unique,
	    producto VARCHAR(125),
	    cantidad INT,
	    precio_unitario NUMERIC(15, 2),
	    FOREIGN KEY (id_envio) REFERENCES Envios(id_envio)
	);

   -- **Regiones**: Incluye campos como `id_region` (clave primaria), `nombre`, `pais`.
	CREATE TABLE Regiones (
	    id_region SERIAL PRIMARY KEY,
	    nombre VARCHAR(100),
	    pais VARCHAR(60)
	);

   
