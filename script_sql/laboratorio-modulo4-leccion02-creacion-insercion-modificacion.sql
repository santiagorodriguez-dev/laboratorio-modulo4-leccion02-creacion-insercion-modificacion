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
	    id_cliente INT,
	    id_empleado INT,
	    id_proveedor INT,
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
	    id_envio INT,
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

-- ### Ejercicio 2: Inserción de Datos

-- 1. Inserta al menos **10 clientes** en la tabla `Clientes`.
INSERT INTO Clientes (nombre, email, direccion, telefono, pais)
VALUES
    ('Pepe Pérez', 'Pepe.perez@mail.com', 'Calle A, 123', '600312345', 'España'),
    ('Lola López', 'maria.lopez@mail.com', 'Calle B, 456', '611412345', 'España'),
    ('Juan Fernández', 'Juan.fernandez@mail.com', 'Avenida C, 789', '622512345', 'Portugal'),
    ('Pepa Gómez', 'Pepa.gomez@mail.com', 'Calle Z, 101', '633612345', 'Francia'),
    ('Maria Martín', 'lucia.martin@mail.com', 'Boulevard D, 102', '644712345', 'España'),
    ('Santi García', 'Santi.garcia@mail.com', 'Plaza E, 203', '655812345', 'Portugal'),
    ('Vega Jiménez', 'sofia.jimenez@mail.com', 'Calle F, 304', '666912345', 'Francia'),
    ('David Rodriguez', 'david.Rodriguez@mail.com', 'Avenida G, 405', '677012345', 'España'),
    ('Ana Sánchez', 'Ana.sanchez@mail.com', 'Calle H, 506', '688112345', 'Italia'),
    ('Angel Rodríguez', 'Angel.rodriguez@mail.com', 'Boulevard I, 607', '699212345', 'España');
   
-- 2. Inserta al menos **5 empleados** en la tabla `Empleados`.
INSERT INTO Empleados (nombre, cargo, email)
VALUES
    ('Alberto Ruiz', 'Supervisor', 'alberto.ruiz@mail.com'),
    ('Cristina Díaz', 'Coordinadora', 'cristina.diaz@mail.com'),
    ('Daniela Moreno', 'Gerente', 'daniela.moreno@mail.com'),
    ('Felipe Álvarez', 'Asistente', 'felipe.alvarez@mail.com'),
    ('Gabriela Romero', 'Analista', 'gabriela.romero@mail.com');


-- 3. Inserta al menos **3 proveedores** en la tabla `Proveedores`.
INSERT INTO Proveedores (nombre, contacto, telefono, direccion)
VALUES
    ('Transporte S.A.', 'Pepe Luis', '902123456', 'Calle, 10'),
    ('Exprés S.A.', 'Lola Martínez', '902654321', 'Avenida , 20'),
    ('Logística S.L.', 'Juan Fernández', '902789012', 'calle, 30');

-- 4. Inserta al menos **8 envíos** en la tabla `Envíos`, asignando envíos a los clientes, empleados y proveedores registrados.
INSERT INTO Envios (id_cliente, id_empleado, id_proveedor, fecha_envio, estado, total)
VALUES
    (1, 2, 1, '2024-04-01', 'En tránsito', 200.00),
    (2, 3, 2, '2024-04-02', 'Entregado', 100.00),
    (3, 1, 3, '2024-04-03', 'En preparación', 88.00),
    (4, 4, 1, '2024-04-04', 'Cancelado', 33.00),
    (5, 5, 2, '2024-04-05', 'Entregado', 1300.00),
    (6, 3, 3, '2024-04-06', 'En tránsito', 234.00),
    (7, 2, 1, '2024-04-07', 'En preparación', 34.00),
    (8, 1, 2, '2024-04-08', 'Entregado', 125.00);


-- 5. Inserta los detalles correspondientes en la tabla `Detalle de Envíos`, 
-- asegurando que las cantidades y precios unitarios sean consistentes con los productos y los envíos.
INSERT INTO Detalle_Envios (id_envio, producto, cantidad, precio_unitario)
VALUES
    (1, 'Producto 1', 2, 100.00),
    (1, 'Producto 2', 3, 100.00),
    (2, 'Producto 3', 4, 50.00),
    (2, 'Producto 4', 1, 50.00),
    (3, 'Producto 5', 5, 88.00),
    (4, 'Producto 6', 2, 33.00),
    (5, 'Producto 7', 3, 1300.00),
    (6, 'Producto 8', 1, 234.00),
    (7, 'Producto 9', 4, 34.00),
    (8, 'Producto 10', 2, 125.00);


-- 6. Inserta al menos **5 regiones** en la tabla `Regiones`.
   
INSERT INTO Regiones (nombre, pais)
VALUES
    ('Madrid', 'España'),
    ('Extremadura', 'España'),
    ('Galicia', 'España'),
    ('Castilla', 'España'),
    ('Asturias', 'España');
   
 
 -- ### Ejercicio 3: Modificación y Actualización de Datos

-- 1. Actualizar el Estado de un Envío. Actualiza el estado del envío con `id_envio = 3` a "Entregado".
   	UPDATE Envios
		SET estado = 'Entregado'
		WHERE id_envio = 3;

-- 2. Modificar el Cargo de un Empleado. Cambia el cargo del empleado con `id_empleado = 5` a "Director de Datos".
	UPDATE Empleados
		SET cargo = 'Director de Datos'
		WHERE id_empleado = 5;

-- 3. Incrementar el Precio Unitario de un Producto. Incrementa en un 10% el precio unitario del producto "Producto A" en la tabla `Detalle_Envíos`.
	UPDATE Detalle_Envios
		SET precio_unitario = precio_unitario * 1.10
		WHERE producto = 'Producto 1';

-- 4. Actualizar la Dirección de un Cliente. Modifica la dirección del cliente con `id_cliente = 2` a "Nueva Calle B, 123".
	UPDATE Clientes
		SET direccion = 'Nueva Calle B, 123'
		WHERE id_cliente = 2;

-- 5. Cambiar el Proveedor de un Envío. Cambia el proveedor del envío con `id_envio = 4` al proveedor con `id_proveedor = 3`.
	UPDATE Envios
		SET id_proveedor = 3
		WHERE id_envio = 4;

-- 6. Actualizar la Cantidad de un Producto en un Envío. Modifica la cantidad del producto "Producto C" en el envío con `id_envio = 2` a 5 unidades.
	UPDATE Detalle_Envios
		SET cantidad = 5
		WHERE id_envio = 2 AND producto = 'Producto 2';

-- 7. Actualizar el Total de un Envío. Incrementa el total del envío con `id_envio = 5` en 50 unidades monetarias.
	UPDATE Envios
		SET total = total + 50
		WHERE id_envio = 5;

-- 8. Modificar el Contacto de un Proveedor. Cambia el contacto del proveedor con `id_proveedor = 2` a "Nuevo Contacto 2".
	UPDATE Proveedores
		SET contacto = 'Nuevo Contacto 2'
		WHERE id_proveedor = 2;

-- 9. Cambiar el País de un Cliente. Actualiza el país del cliente con `id_cliente = 6` a "Portugal".
	UPDATE Clientes
		SET pais = 'Portugal'
		WHERE id_cliente = 6;

-- 10. Actualizar la Fecha de un Envío. Modifica la fecha del envío con `id_envio = 7` a "2024-08-10".
	UPDATE Envios
		SET fecha_envio = '2024-08-10'
		WHERE id_envio = 7;


-- ### Ejercicio 4: Eliminación de Datos

-- 1. Añadir una Columna. Añade una columna `fecha_nacimiento` de tipo `DATE` a la tabla `Clientes`.
	ALTER TABLE Clientes
		ADD COLUMN fecha_nacimiento DATE;

-- 2. Añadir una Columna. Añade una columna `codigo_postal` de tipo `VARCHAR(10)` a la tabla `Proveedores`.
	ALTER TABLE Proveedores
		ADD COLUMN codigo_postal VARCHAR(10);

-- 3. Eliminar una Columna. Elimina la columna `contacto` de la tabla `Proveedores`.
	ALTER TABLE Proveedores
		DROP COLUMN contacto;

-- 4. Eliminar una Columna. Elimina la columna `pais` de la tabla `Regiones`.
	ALTER TABLE Regiones
		DROP COLUMN pais;

-- 5. Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna `telefono` en la tabla `Clientes` a `VARCHAR(15)`.
	ALTER TABLE Clientes
		ALTER COLUMN telefono TYPE VARCHAR(15);

-- 6. Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna `total` en la tabla `Envíos` a `NUMERIC(12, 2)`.
	ALTER TABLE Envios
		ALTER COLUMN total TYPE NUMERIC(12, 2);

-- 7. Añadir una Columna. Añade una columna `fecha_contrato` de tipo `DATE` a la tabla `Empleados`.
	ALTER TABLE Empleados
		ADD COLUMN fecha_contrato DATE;
	
-- 8. Eliminar una Columna. Elimina la columna `estado` de la tabla `Envíos`.
	ALTER TABLE Envios
		DROP COLUMN estado;

-- 9. Modificar el Nombre de una Columna. Modifica el nombre de la columna `nombre` en la tabla `Empleados` a `nombre_completo`.
	ALTER TABLE Empleados
		RENAME COLUMN nombre TO nombre_completo;
	

-- ### Ejercicio 5: Contesta a las siguientes preguntas usando queries

-- 1. Listar todos los clientes que viven en España.
	SELECT * FROM Clientes
		WHERE pais = 'España';

-- 2. Obtener todos los envíos realizados por un empleado específico.
	SELECT * FROM Envios
		WHERE id_empleado = 3;

-- 3. Listar todos los productos incluidos en un envío específico.
	SELECT * FROM Detalle_Envios
		WHERE id_envio = 3;

-- 4. Encontrar todos los proveedores con un teléfono específico.
	SELECT * FROM Proveedores
		WHERE telefono = '902654321';

-- 5. Listar los empleados que tienen un cargo de "Supervisor de Envíos".
	SELECT * FROM Empleados
		WHERE cargo = 'Supervisor';

-- 6. Obtener todos los envíos que fueron realizados por el cliente con id_cliente = 5.
	SELECT * FROM Envios
		WHERE id_cliente = 5;

-- 7. Listar todas las regiones con su nombre y país.
--	SELECT nombre, pais  FROM Regiones;
-- No existe la columna la hemos eliminado previamente.

-- 8. Mostrar todos los productos cuyo precio unitario sea mayor que 50.
	SELECT * FROM Detalle_Envios
		WHERE precio_unitario > 50;

-- 9. Obtener todos los envíos realizados el 2024-08-05.
	SELECT * FROM Envios
		WHERE fecha_envio = '2024-04-02';

-- 10. Listar todos los clientes que tienen un número de teléfono que comienza con "6003".
	SELECT * FROM Clientes
		WHERE telefono LIKE '6003%';


