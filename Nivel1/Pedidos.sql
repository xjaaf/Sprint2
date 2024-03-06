CREATE DATABASE PedidosDomicilio;
USE PedidosDomicilio;

CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    direccion VARCHAR(255),
    codigo_postal VARCHAR(10),
    localidad VARCHAR(100),
    provincia VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE Pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha_hora DATETIME,
    tipo_entrega VARCHAR(20),
    cantidad_productos INT,
    precio_total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

CREATE TABLE Productos (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion TEXT,
    imagen VARCHAR(255),
    precio DECIMAL(10, 2)
);

CREATE TABLE CategoriasPizza (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(255)
);

CREATE TABLE Pizzas (
    pizza_id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT,
    nombre VARCHAR(255),
    descripcion TEXT,
    imagen VARCHAR(255),
    precio DECIMAL(10, 2),
    FOREIGN KEY (categoria_id) REFERENCES CategoriasPizza(categoria_id)
);

CREATE TABLE Tiendas (
    tienda_id INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(255),
    codigo_postal VARCHAR(10),
    localidad VARCHAR(100),
    provincia VARCHAR(100)
);

CREATE TABLE Empleados (
    empleado_id INT AUTO_INCREMENT PRIMARY KEY,
    tienda_id INT,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    NIF VARCHAR(20),
    telefono VARCHAR(20),
    cargo ENUM('cocinero', 'repartidor'),
    FOREIGN KEY (tienda_id) REFERENCES Tiendas(tienda_id)
);

CREATE TABLE Entregas (
    entrega_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    empleado_id INT,
    fecha_hora_entrega DATETIME,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id)
);
