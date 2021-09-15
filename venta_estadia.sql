
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
#Inserción en Venta
INSERT INTO Venta VALUES(1,'2012-10-25',2500);
INSERT INTO Venta VALUES(3,'2012-10-25',7200);
INSERT INTO Venta VALUES(2,'2017-10-22',8500);
INSERT INTO Venta VALUES(4,'2012-10-25',9200);
INSERT INTO Venta VALUES(5,'2012-10-25',250);

#Inserción en Detalle Venta
INSERT INTO DetalleVenta VALUES(1,3000,500,16,1);
INSERT INTO DetalleVenta VALUES(3,8000,800,16,3);
INSERT INTO DetalleVenta VALUES(2,9000,500,16,2);
INSERT INTO DetalleVenta VALUES(4,9500,300,16,4);
INSERT INTO DetalleVenta VALUES(5,300,50,16,5);

#Inserción en Ticket
INSERT INTO Ticket VALUES(1,'Efectivo','Pollos hermanos','Enrique Segoviano',1);
INSERT INTO Ticket VALUES(3,'Tarjeta','Aviacsa','Av. Pantitlán 135',3);
INSERT INTO Ticket VALUES(2,'Vales','GameDev','Progreso Nacional 1228 A',2);
INSERT INTO Ticket VALUES(4,'Efectivo','UTSchool','Homero 232',4);
INSERT INTO Ticket VALUES(5,'Tarjeta','MediFarma', 'Reforma 222',5);

#Consulta para la venta con el detalle
SELECT * FROM Venta, DetalleVenta
WHERE Venta.idVenta = DetalleVenta.idVenta;

#Consulta para el Ticket
SELECT * FROM Ticket, DetalleVenta, Venta
WHERE Venta.idVenta = DetalleVenta.idVenta AND Ticket.idDetalleVenta = DetalleVenta.idDetalleVenta;

#Procedimientos almacenados
CREATE OR REPLACE PROCEDURE SP_SetGeneraVenta
(a in Venta.idVenta%type,
b in Venta.fechaVenta%type,
c in Venta.totalVenta%type,
d in DetalleVenta.idVentaDetalle%type,
e in DetalleVenta.efectivo%type,
f in DetalleVenta.cambio%type,
g in DetalleVenta.impuesto%type)
is 
begin
INSERT INTO Venta VALUES(a,b,c);
INSERT INTO DetalleVenta VALUES(d,e,f,g);
END SP_SetGeneraVenta;

CREATE PROCEDURE PRUEBA(
IN _idVenta INT,
IN _fechaVenta DATE,
IN _totalVenta INT
)
BEGIN
INSERT INTO Venta (idVenta, fechaVenta, totalVenta) VALUES(_idVenta, _fechaVenta, _totalVenta)
END
