CREATE DATABASE venta_estadia;

USE venta_estadia;

CREATE TABLE Venta(
idVenta INT AUTO_INCREMENT,
fechaVenta DATE NOT NULL,
totalVenta NUMERIC(8,2) NOT NULL,
CONSTRAINT idVenta_pk PRIMARY KEY(idVenta)
);

CREATE TABLE DetalleVenta(
idDetalleVenta INT AUTO_INCREMENT,
efectivo NUMERIC(8,2) NOT NULL,
cambio NUMERIC(8,2) NOT NULL,
impuesto NUMERIC(2) NOT NULL,
idVenta INT NOT NULL,
CONSTRAINT idDetalleVenta_pk PRIMARY KEY(idDetalleVenta),
CONSTRAINT idVenta_fk FOREIGN KEY(idVenta)
REFERENCES Venta(idVenta)
);

CREATE TABLE Ticket(
idTicket INT AUTO_INCREMENT,
formaPago VARCHAR(30) NOT NULL,
razonSocial VARCHAR(40) NOT NULL,
direccion VARCHAR(60) NOT NULL,
idDetalleVenta INT NOT NULL,
CONSTRAINT idTicket_pk PRIMARY KEY(idTicket),
CONSTRAINT idDetalleVenta_fk FOREIGN KEY(idDetalleVenta)
REFERENCES DetalleVenta(idDetalleVenta)
);

#Inserción en tabla venta
INSERT INTO Venta (fechaVenta, totalVenta)VALUES('2012-10-25',2500);
INSERT INTO Venta (fechaVenta, totalVenta)VALUES('2017-10-22',8500);
INSERT INTO Venta (fechaVenta, totalVenta)VALUES('2012-10-25',7200);
INSERT INTO Venta (fechaVenta, totalVenta)VALUES('2012-10-25',9200);
INSERT INTO Venta (fechaVenta, totalVenta)VALUES('2012-10-25',250);

#Inserción en DetalleVenta
INSERT INTO DetalleVenta (efectivo, cambio, impuesto, idVenta)VALUES(3000,500,16,1);
INSERT INTO DetalleVenta (efectivo, cambio, impuesto, idVenta)VALUES(9000,500,16,2);
INSERT INTO DetalleVenta (efectivo, cambio, impuesto, idVenta)VALUES(8000,800,16,3);
INSERT INTO DetalleVenta (efectivo, cambio, impuesto, idVenta)VALUES(9500,300,16,4);
INSERT INTO DetalleVenta (efectivo, cambio, impuesto, idVenta)VALUES(300,50,16,5);

#Inserción en Ticket
INSERT INTO Ticket (formaPago, razonSocial, direccion, idDetalleVenta)VALUES('Efectivo','Pollos hermanos','Enrique Segoviano',1);
INSERT INTO Ticket (formaPago, razonSocial, direccion, idDetalleVenta)VALUES('Vales','GameDev','Progreso Nacional 1228 A',2);
INSERT INTO Ticket (formaPago, razonSocial, direccion, idDetalleVenta)VALUES('Tarjeta','Aviacsa','Av. Pantitlán 135',3);
INSERT INTO Ticket (formaPago, razonSocial, direccion, idDetalleVenta)VALUES('Efectivo','UTSchool','Homero 232',4);
INSERT INTO Ticket (formaPago, razonSocial, direccion, idDetalleVenta)VALUES('Tarjeta','MediFarma', 'Reforma 222',5);

#Ventas del día con detalle
SELECT * FROM Venta, DetalleVenta
WHERE Venta.idVenta = DetalleVenta.idVenta;

#Tickets del día
SELECT * FROM Ticket;

#Procedimientos almacenados

#Genera la venta del día
DELIMITER $$
CREATE PROCEDURE SP_SetGeneraVenta 
(IN fechaVentaIn DATE,
IN totalVentaIn NUMERIC(8,2),
IN efectivoIn NUMERIC(8,2),
IN cambioIn NUMERIC(8,2),
IN impuestoIn NUMERIC(8,2),
IN idVentaIn INT)
BEGIN
	INSERT INTO Venta (fechaVenta, totalVenta) VALUES(fechaVentaIn, totalVentaIn);
	INSERT INTO DetalleVenta (efectivo, cambio, impuesto, idVenta)VALUES(efectivoIn, cambioIn, impuestoIn, idVentaIn);
END$$
DELIMITER ;

CALL venta_estadia.SP_SetGeneraVenta(now(),7000,7000,0,16,6);

#Obtiene la venta del día por medio de un IDVenta
DELIMITER $$
CREATE PROCEDURE SP_GetVentaDia(IN idVentaIn INT)
BEGIN
	SELECT Venta.idVenta, Venta.fechaVenta, Venta.totalVenta, DetalleVenta.efectivo, DetalleVenta.cambio, DetalleVenta.impuesto
	FROM Venta, DetalleVenta
	WHERE idVentaIn = Venta.idVenta AND Venta.idVenta = DetalleVenta.idVenta;
END$$
DELIMITER ;

CALL venta_estadia.SP_GetVentaDia(4);

#Obtiene el ticket de la venta por medio del IDTicket
DELIMITER $$
CREATE PROCEDURE SP_GetTicket(IN idTicketIn INT)
BEGIN
	SELECT * FROM Ticket, Venta, DetalleVenta
    WHERE idTicketIn = Ticket.idTicket AND Ticket.idTicket = Venta.idVenta AND Ticket.idTicket = DetalleVenta.idDetalleVenta;
END$$
DELIMITER ;

CALL SP_GetTicket(2);