


DECLARE @xmlData XML ;
 DECLARE @hDoc int ;



 select @xmlData = BulkColumn 
 from  openrowset( BULK  'D:\DBS\tema 12  BDAVANZADOS\Usuarios.xml', SINGLE_BLOB) as x;

  EXEC sp_xml_preparedocument @hDoc output, @xmlData;

  INSERT INTO ClaseXml.Usuarios (Nombre, Email, Celular, RUC, FechaNacimiento)
SELECT 
    x.Nombre,
    x.Email,
    x.Celular,
    x.RUC,
    CONVERT(DATE, x.FechaNacimiento, 103) -- Formato dd/mm/yyyy
FROM OPENXML(@hDoc, '/Usuarios/Usuario', 2)
WITH (
    Nombre varchar(100),
    Email varchar(100),
    Celular varchar(100),
    RUC varchar(100),
    FechaNacimiento varchar(100)
) AS x;

		exec sp_xml_removedocument @hDoc;


-- COMPROBACION DE LO REGISTRADO 
  select*from      ClaseXml.Usuarios  where Nombre= 'Gabriela Santos'
		


--LISTA DE COLECCIONS DE SCHEMA XML DE LA BD 
        SELECT*FROM SYS.XML_SCHEMA_COLLECTIONS



        -- CREAMOS UNA TABLA PARA REGISTROS DE CAMPOS XML 
        create table tb_registro2 (id int not null,
        dato xml not null)
        go


        -- INGRESAMOS UN REGISTRO CONSIDERANDO TIPO DE DATO 
        insert into tb_registro2 values(1,
        
        '
        <Libro>
            <id>Lo1</id>
            <nombre>SQLSERVER</nombre>            
        </Libro>
        '
        )
        GO
        


        SELECT* FROM tb_registro2
        

        -- se visualiza de manera temproal una tabla cargada en memoria 
    select* from openrowset(bulk 'D:\DBS\tema 12  BDAVANZADOS\Usuarios.xml' , single_clob) Xml

    create table tablaXML(
        id int  identity(1,1),
        contenidoXML   varchar(max),
        fechaCarga  datetime default getdate()        
        
    );
    go

    insert into tablaXML(contenidoXML)
    SELECT *
    from openrowset (bulk 'D:\DBS\tema 12  BDAVANZADOS\Usuarios.xml',SINGLE_CLOB) AS Xml;

  select* from tablaXML



  select*from sys.tables
  select*from sys.schemas

  



select* from Compras.proveedores
select* from Compras.productos

-- hago un query de 2 tablas relacionadas 
select
    p.IdProveedor,
    p.NomProveedor,
    c.NomProducto,
    c.PrecioUnidad

from Compras.productos  c
join Compras.proveedores p  on  c.IdProveedor =  p.IdProveedor


-- AHORA TOMANDO EN REFERENCIA EL QUERY ANTERIOR , REALIZO UNA  transformacion de un unico  documento xml   tomando como referencia 2 tablas relacionadas 
-- genera un XML  DONDE CADA PROOVEDOR SERA UN ELEMENTO PADRE Y CADA PRODUCTO UN ELEMENTO HIJO 


--- esta consulta lo brinda de manera ordenada en  formato xml con un <PROOVEDORES > PADRE  Y <PROOVEDOR > POR CADA REGISTRO 

select 
    p.IdProveedor,
    p.NomProveedor,
    c.NomProducto,
    c.PrecioUnidad

from Compras.proveedores  p
join  compras.productos c on  c.IdProveedor =  p.IdProveedor   
for XML PATH('Proovedor'), ROOT('Proveedores') , ELEMENTS   

-- LA ANTEIOR CONSULTA SE GUARDARA COMO UNA TABLA EN LA BD 

CREATE TABLE ProveedoresProductosXML(
    ID INT IDENTITY PRIMARY KEY ,
    FechGeneracion datetime default getdate(),
    datoXML xml

);
-- insertamos el resultado xml 

insert into ProveedoresProductosXML (datoXML)
SELECT(
                select 
                    p.IdProveedor,
                    p.NomProveedor,
                    c.NomProducto,
                    c.PrecioUnidad

                from Compras.proveedores  p
                join  compras.productos c on  c.IdProveedor =  p.IdProveedor   
                for XML PATH('Proovedor'), ROOT('Proveedores') , ELEMENTS   
                );
-- AHORA PARA LA CONSULTA LO CREAMOS UN PROCEDIMIENTO ALMACENADO 
    CREATE PROCEDURE sp_GenerarXML_ProveedoresProductos
    as
    begin 
        select(
            select 
                    p.IdProveedor,
                    p.NomProveedor,
                    c.NomProducto,
                    c.PrecioUnidad

                from Compras.proveedores  p
                join  compras.productos c on  c.IdProveedor =  p.IdProveedor   
                for XML PATH('Proovedor'), ROOT('Proveedores') , ELEMENTS  
            
        )
        end;



select* from Compras.proveedores
select* from Compras.productos




 DECLARE @idoc INT, @doc VARCHAR(1000); 
SET @doc = 
' <ROOT> 
    <Customer CustomerID="VINET" ContactName="Paul Henriot">
         <Order CustomerID="VINET" EmployeeID="5" OrderDate="1996-07-04T00:00:00">
         <OrderDetail OrderID="10248" ProductID="11" Quantity="12"/> 
        <OrderDetail OrderID="10248" ProductID="42" Quantity="10"/> 
        </Order> 
    </Customer> 
    <Customer CustomerID="LILAS" ContactName="Carlos Gonzlez"> 
        <Order CustomerID="LILAS" EmployeeID="3" OrderDate="1996-08-16T00:00:00"> <OrderDetail 
        OrderID="10283" ProductID="72" Quantity="3"/> 
        </Order> 
    </Customer> 
</ROOT>';

--crear una representacion interna del documento xml 
 EXEC sp_xml_preparedocument @idoc OUTPUT, @doc; 
 -- Execute a SELECT statement that uses the OPENXML rowset provider.
 SELECT * FROM OPENXML(@idoc, '/ROOT/Customer/Order', 1) 
 WITH (
 
 CustomerID VARCHAR(10), 
 EmployeeID  int,
 OrderDate DATETIME );
 EXEC sp_xml_removedocument @idoc;
