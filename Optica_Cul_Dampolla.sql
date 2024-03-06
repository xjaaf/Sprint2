CREATE TABLE Proveedor (
    idProveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    fax VARCHAR(15),
    NIF VARCHAR(20)
);

CREATE TABLE Gafas (
    idGafas INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(100),
    graduacion_cristales VARCHAR(100),
    tipo_montura VARCHAR(50),
    color_montura VARCHAR(50),
    color_vidrio VARCHAR(50),
    precio DECIMAL(10, 2),
    idProveedor INT,
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)
);

CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion_postal VARCHAR(255),
    telefono VARCHAR(15),
    correo_electronico VARCHAR(100),
    fecha_registro DATE,
    idClienteRecomendador INT,
    FOREIGN KEY (idClienteRecomendador) REFERENCES Cliente(idCliente)
);

CREATE TABLE Empleado (
    idEmpleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Venta (
    idVenta INT AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATE,
    idCliente INT,
    idEmpleado INT,
    idGafas INT,
    cantidad_vendida INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado),
    FOREIGN KEY (idGafas) REFERENCES Gafas(idGafas)
);
