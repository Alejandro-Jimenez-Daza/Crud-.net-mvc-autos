CREATE DATABASE Concesionario

use Concesionario
GO

create table tbl_autos(
id_auto int primary key identity (1,1),
marca varchar (30),
modelo varchar (30),
año int,
color varchar(30)
)


--INSERT:
INSERT INTO tbl_autos
VALUES ('Mercedez','Benz','1996','Plateado')

INSERT INTO tbl_autos
VALUES ('Chevrolet','Logan','2016','Negro'),
('Lamborghini','Aventador','2011','Gris')
select * from tbl_autos



------------------------------------------------PROCEDIMIENTOS ALMACENADOS---------------------------------------------

--AGREGAR:
CREATE PROCEDURE SP_GUARDAR_AUTO
@marca varchar (30),
@modelo varchar (30),
@año int,
@color varchar(30)
AS
BEGIN
	INSERT INTO tbl_autos(marca,modelo,año,color)
		VALUES(@marca,@modelo,@año,@color);
END
--PROBAR:
EXECUTE SP_GUARDAR_AUTO 'Ferrari','448 GT3','1956','Rojo'
SELECT * FROM tbl_autos


-------------------------------------------------------------------------
--ACTUALIZAR:
CREATE PROCEDURE SP_ACTUALIZAR_AUTO
@id_auto int,
@marca varchar (30),
@modelo varchar (30),
@año int,
@color varchar(30)
AS
BEGIN
UPDATE tbl_autos
	SET marca=@marca,
		modelo = @modelo,
		año=@año,
		color=@color
	WHERE id_auto=@id_auto
END
--PROBAR:
EXECUTE SP_ACTUALIZAR_AUTO 1,'Mercedez Benz','CLS','2004','Morado'
SELECT*FROM tbl_autos


--------------------------------------------------------------------
--ELIMINAR
CREATE PROCEDURE SP_ELIMINAR_AUTO
@id_auto int
AS
BEGIN
	DELETE FROM tbl_autos WHERE id_auto=@id_auto
END
--PROBAR
EXECUTE SP_ELIMINAR_AUTO 4
SELECT * FROM tbl_autos

--------------------------------------------------------------
--LISTAR:
CREATE PROCEDURE SP_SELECT_AUTO
AS
SELECT id_auto,marca,modelo,año,color
FROM tbl_autos
GO

EXEC SP_SELECT_AUTO
GO

USE Concesionario

select*from tbl_autos