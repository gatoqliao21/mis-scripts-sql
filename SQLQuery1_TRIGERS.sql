--  trigger procedimiento almacenado 


select*from sys.tables
select*from sys.schemas

use Negocios


CREATE TRIGGER trCategoria
ON Compras.Categorias
FOR INSERT, DELETE, UPDATE
AS
BEGIN
    PRINT 'HA REALIZADO UN CAMBIO EN LA TABLA CATEGORIAS'
END


select*from sys.triggers



insert Compras.Categorias
values (165,'Legumbres', null)
go


-- los triggers son actualizaciones automaticas al 
-- realizar una accion  definida 


select* from Compras.Categorias 

delete from Compras.categorias
where IdCategoria =165
go


-- para que no se ejecute el  trigger 

-- uso de tablas INSERTED Y DELETED 


SELECT      
   t.name as  table_name,
     s.name as  schema_name,
  t.schema_id 

  
FROM SYS.tables t join SYS.schemas s  on t.schema_id=s.schema_id

create trigger trCargo
on RRHH.Cargos 
for insert,delete,update
as begin 
    select*from inserted
    select*from deleted
    end 
    go

    select*from RRHH.Cargos



    INSERT RRHH.Cargos
    values(10, 'ANALISTA DE DATOS ')
    GO


    update RRhH.Cargos 
    set desCargo='Analista funcional'
    where idcargo = 10 
    go




    delete from RRHH.Cargos
    WHERE idcargo=10
    go


    -- begin , end es para varias instrucciones 


 
create trigger trInsertarProducto
on Compras.productos
for insert 
as 
	if (select count(*) from inserted join Compras.productos on inserted.NomProducto = Productos.NomProducto)>1
		begin 
			rollback transaction 
			print 'producto ingresado '
			end
	else 
		begin 
			print 'ya ingresado en la BD '
			end 

			go


            select*from Compras.productos  where IdCategoria=100



            INSERT Compras.productos  
            values (100,'Mermelada cibertec',8,3,'30 cajas',81,40,0)
            go

            drop trigger trInsertarProducto