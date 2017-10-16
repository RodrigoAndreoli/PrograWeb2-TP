drop database if exists logistica;
create database logistica;
use logistica;

CREATE TABLE usuario (
    idUsuario int PRIMARY KEY,
    tip_doc VARCHAR(45),
    nro_doc INT,
    nombre VARCHAR (45),
    fecha_nacimiento VARCHAR(45),
    rol SMALLINT(4),
    password VARCHAR (45)
);

CREATE TABLE chofer (
    idChofer int PRIMARY KEY,
    tipo_licencia VARCHAR (45),
    nro_licencia int,
    CONSTRAINT fk_usuario_chofer FOREIGN KEY (idChofer)
        REFERENCES usuario (idUsuario)
);

CREATE TABLE cliente (
	idCliente int PRIMARY KEY,
    cuit VARCHAR (11),
    razon VARCHAR (45),
    dom_numero int,
    dom_calle VARCHAR (45),
    dom_cp VARCHAR (45),
    dom_piso VARCHAR (45),
    telefono VARCHAR (45)
);

CREATE TABLE vehiculo (
	idVehiculo int PRIMARY KEY,
    tipo_vehiculo VARCHAR (45),
    patente VARCHAR (45),
    nro_chasis VARCHAR (45),
    marca VARCHAR (45),
    modelo VARCHAR (45),
    nro_motor VARCHAR (45),
    km VARCHAR (45),
    anio year
);

CREATE TABLE mantenimiento (
	idMantenimiento int PRIMARY KEY,
    idVehiculo int,
    idMecanico int,
    fecha date,
    km_unidad VARCHAR (45),
    costo decimal (12,2),
    externo boolean,
    repuestos VARCHAR (80),
    CONSTRAINT fk_mantenimiento_idVehiculo FOREIGN KEY (idVehiculo)
		REFERENCES vehiculo (idVehiculo),
	CONSTRAINT fk_mantenimiento_mecanico FOREIGN KEY (idMecanico)
		REFERENCES usuario (idUsuario)
);

CREATE TABLE reporte_mantenimiento (
	idReporteMantenimiento int PRIMARY KEY,
	idMantenimiento int,
	tiempo_fuera DATETIME,
    km_recorridos VARCHAR (45),
    costo_mantenimiento DECIMAL (10,2),
    costo_km_recorrido VARCHAR (45),
	CONSTRAINT fk_reporte_mante_idMantenimiento FOREIGN KEY (idMantenimiento)
		REFERENCES mantenimiento (idMantenimiento)
);
    
CREATE TABLE presupuesto (
	idPresupuesto int PRIMARY KEY,
    idCliente int,
    idSupervisor int,
    tiempo_estimado VARCHAR (45),
    km_previstos VARCHAR (45),
    combustible_previsto VARCHAR (45),
    costo_real DECIMAL (12,2),
    aceptado boolean,
    estado tinyint(3),
    CONSTRAINT fk_presupuesto_idCliente FOREIGN KEY (idCliente)
		REFERENCES cliente (idCliente),
    CONSTRAINT fk_presupuesto_idSupervisor FOREIGN KEY (idSupervisor)
		REFERENCES usuario (idUsuario)
);

CREATE TABLE viaje (
	idViaje int PRIMARY KEY,
    idPresupuesto int,
    idCliente int,
    fecha DATETIME,
    origen VARCHAR (45),
    destino VARCHAR (45),
    tipo_carga VARCHAR (45),
    tiempo int,
    combustible int,
    km_totales int,
    latitud VARCHAR (45),
    longitud VARCHAR (45),
    CONSTRAINT fk_viaje_idPresupuesto FOREIGN KEY (idPresupuesto)
		REFERENCES presupuesto (idPresupuesto),
	CONSTRAINT fk_viaje_cliente FOREIGN KEY (idCliente)
		REFERENCES cliente (idCliente)
);

CREATE TABLE vehiculo_chofer_viaje (
	idChofer int,
    idViaje int,
    idVehiculo int,
    CONSTRAINT pk_ternaria PRIMARY KEY (idChofer, idViaje, idVehiculo),
    CONSTRAINT fk_ternaria_cofer FOREIGN KEY (idChofer)
		REFERENCES chofer (idChofer),
    CONSTRAINT fk_ternaria_viaje FOREIGN KEY (idViaje)
		REFERENCES viaje (idViaje),
    CONSTRAINT fk_ternaria_Vehiculo FOREIGN KEY (idVehiculo)
		REFERENCES vehiculo (idVehiculo)
);
CREATE TABLE reporte_viaje (
	idReporteViaje int PRIMARY KEY,
    idViaje int,
    idVehiculo int,
    idChofer int,
    desvios VARCHAR(45),
    km VARCHAR(45),
    tiempo VARCHAR(45),
    combustible VARCHAR(45),
    paradas VARCHAR(45),
    posicion VARCHAR(45),
    CONSTRAINT fk_report_viaje_ternaria_idViaje FOREIGN KEY (idViaje)
		REFERENCES vehiculo_chofer_viaje (idViaje),
    CONSTRAINT fk_report_viaje_ternaria_idVehiculo FOREIGN KEY (idVehiculo)
		REFERENCES vehiculo_chofer_viaje (idVehiculo),
    CONSTRAINT fk_report_viaje_ternaria_idChofer FOREIGN KEY (idChofer)
		REFERENCES vehiculo_chofer_viaje (idChofer)
);
    

    
    