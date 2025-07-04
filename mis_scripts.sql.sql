USE [master]
GO
/****** Object:  Database [Negocios]    Script Date: 25/06/2025 21:24:23 ******/
CREATE DATABASE [Negocios]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Negocios', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Negocios.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Negocios_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Negocios_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Negocios] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Negocios].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Negocios] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Negocios] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Negocios] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Negocios] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Negocios] SET ARITHABORT OFF 
GO
ALTER DATABASE [Negocios] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Negocios] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Negocios] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Negocios] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Negocios] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Negocios] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Negocios] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Negocios] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Negocios] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Negocios] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Negocios] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Negocios] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Negocios] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Negocios] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Negocios] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Negocios] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Negocios] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Negocios] SET RECOVERY FULL 
GO
ALTER DATABASE [Negocios] SET  MULTI_USER 
GO
ALTER DATABASE [Negocios] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Negocios] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Negocios] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Negocios] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Negocios] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Negocios] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Negocios', N'ON'
GO
ALTER DATABASE [Negocios] SET QUERY_STORE = ON
GO
ALTER DATABASE [Negocios] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Negocios]
GO
/****** Object:  Schema [Compras]    Script Date: 25/06/2025 21:24:23 ******/
CREATE SCHEMA [Compras]
GO
/****** Object:  Schema [RRHH]    Script Date: 25/06/2025 21:24:23 ******/
CREATE SCHEMA [RRHH]
GO
/****** Object:  Schema [Ventas]    Script Date: 25/06/2025 21:24:23 ******/
CREATE SCHEMA [Ventas]
GO
/****** Object:  UserDefinedFunction [dbo].[cantidadporid]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function   [dbo].[cantidadporid](@Idcategoria int ) returns int 

 as begin 
	declare @resultado int 

  select @resultado =count(*) from Compras.productos

 where IdCategoria=@Idcategoria
 return @resultado
 
 end
GO
/****** Object:  UserDefinedFunction [dbo].[pedidoEmpleado]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create function [dbo].[pedidoEmpleado](@p_idempleado int )
 RETURNS int
		as begin 
		declare @pedidos  int 
		select @pedidos =   count(*)  from ventas.pedidoscabe
		where  IdEmpleado = @p_idempleado

		return @pedidos 
end 
GO
/****** Object:  UserDefinedFunction [dbo].[PrecioPromedio]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[PrecioPromedio]()  RETURNS decimal
as begin 
		declare @prom  decimal
		select @prom   = AVG(precioUnidad) from Compras.productos

		return @prom 
end 
GO
/****** Object:  Table [Ventas].[paises]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[paises](
	[Idpais] [char](3) NOT NULL,
	[NombrePais] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Idpais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[clientes]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[clientes](
	[IdCliente] [varchar](5) NOT NULL,
	[NomCliente] [varchar](40) NOT NULL,
	[DirCliente] [varchar](60) NOT NULL,
	[idpais] [char](3) NULL,
	[fonoCliente] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[Clientes]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE FUNCTION [dbo].[Clientes]() RETURNS TABLE AS

RETURN (Select c.idcliente as 'codigo', c.NomCliente as 'Cliente', c.DirCliente, p.NombrePais as 'Pais'

		From Ventas.clientes c JOIN Ventas.paises p

		ON c.idpais = p.idpais)

GO
/****** Object:  UserDefinedFunction [dbo].[Clientes1]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  function  [dbo].[Clientes1]()  returns 
table as 
	return (select c.idcliente as 'codigo',c.NomCliente as 'cliente ',c.DirCliente ,p.NombrePais as 'pais'  
	from Ventas.clientes c join Ventas.paises p  on c.idpais = p.idpais)
GO
/****** Object:  Table [Compras].[categorias]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[categorias](
	[IdCategoria] [int] NOT NULL,
	[NombreCategoria] [varchar](15) NOT NULL,
	[Descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Compras].[productos]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[productos](
	[IdProducto] [int] NOT NULL,
	[NomProducto] [varchar](40) NOT NULL,
	[IdProveedor] [int] NULL,
	[IdCategoria] [int] NULL,
	[CantxUnidad] [varchar](20) NOT NULL,
	[PrecioUnidad] [decimal](10, 0) NOT NULL,
	[UnidadesEnExistencia] [smallint] NOT NULL,
	[UnidadesEnPedido] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[buscarProducto]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[buscarProducto](@categ  int)
returns table 
as 
return (
	
	select 
	p.NomProducto,
	c.NombreCategoria,
	p.IdCategoria,
	c.Descripcion,
	p.UnidadesEnExistencia


from compras.categorias   c join compras.productos  p 
on c.IdCategoria = p.IdCategoria

where p.IdCategoria =@categ
	
	)
GO
/****** Object:  Table [Compras].[proveedores]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compras].[proveedores](
	[IdProveedor] [int] NOT NULL,
	[NomProveedor] [varchar](40) NOT NULL,
	[DirProveedor] [varchar](60) NOT NULL,
	[NomContacto] [varchar](80) NOT NULL,
	[CargoContacto] [varchar](50) NOT NULL,
	[idpais] [char](3) NULL,
	[fonoProveedor] [varchar](15) NOT NULL,
	[FaxProveedor] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RRHH].[Cargos]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RRHH].[Cargos](
	[idcargo] [int] NOT NULL,
	[desCargo] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idcargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RRHH].[Distritos]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RRHH].[Distritos](
	[idDistrito] [int] NOT NULL,
	[nomDistrito] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDistrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RRHH].[empleados]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RRHH].[empleados](
	[IdEmpleado] [int] NOT NULL,
	[ApeEmpleado] [varchar](50) NOT NULL,
	[NomEmpleado] [varchar](50) NOT NULL,
	[FecNac] [datetime] NOT NULL,
	[DirEmpleado] [varchar](60) NOT NULL,
	[idDistrito] [int] NULL,
	[fonoEmpleado] [varchar](15) NULL,
	[idCargo] [int] NULL,
	[FecContrata] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[pedidoscabe]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[pedidoscabe](
	[IdPedido] [int] NOT NULL,
	[IdCliente] [varchar](5) NULL,
	[IdEmpleado] [int] NULL,
	[FechaPedido] [datetime] NOT NULL,
	[FechaEntrega] [datetime] NULL,
	[FechaEnvio] [datetime] NULL,
	[EnvioPedido] [char](1) NULL,
	[CantidaPedido] [int] NULL,
	[Destinatario] [varchar](40) NULL,
	[DirDestinatario] [varchar](60) NULL,
	[CiuDestinatario] [varchar](60) NULL,
	[RefDestnatario] [varchar](60) NULL,
	[DepDestinatario] [varchar](60) NULL,
	[PaiDestinatario] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[pedidosdeta]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[pedidosdeta](
	[IdPedido] [int] NULL,
	[IdProducto] [int] NULL,
	[PrecioUnidad] [decimal](10, 0) NOT NULL,
	[Cantidad] [smallint] NOT NULL,
	[Descuento] [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Ventas].[pedidoscabe] ADD  DEFAULT (getdate()) FOR [FechaPedido]
GO
ALTER TABLE [Ventas].[pedidoscabe] ADD  DEFAULT ('0') FOR [EnvioPedido]
GO
ALTER TABLE [Compras].[productos]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [Compras].[categorias] ([IdCategoria])
GO
ALTER TABLE [Compras].[productos]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [Compras].[proveedores] ([IdProveedor])
GO
ALTER TABLE [Compras].[proveedores]  WITH CHECK ADD FOREIGN KEY([idpais])
REFERENCES [Ventas].[paises] ([Idpais])
GO
ALTER TABLE [RRHH].[empleados]  WITH CHECK ADD FOREIGN KEY([idCargo])
REFERENCES [RRHH].[Cargos] ([idcargo])
GO
ALTER TABLE [RRHH].[empleados]  WITH CHECK ADD FOREIGN KEY([idDistrito])
REFERENCES [RRHH].[Distritos] ([idDistrito])
GO
ALTER TABLE [Ventas].[clientes]  WITH CHECK ADD FOREIGN KEY([idpais])
REFERENCES [Ventas].[paises] ([Idpais])
GO
ALTER TABLE [Ventas].[pedidoscabe]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [Ventas].[clientes] ([IdCliente])
GO
ALTER TABLE [Ventas].[pedidoscabe]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [RRHH].[empleados] ([IdEmpleado])
GO
ALTER TABLE [Ventas].[pedidosdeta]  WITH CHECK ADD FOREIGN KEY([IdPedido])
REFERENCES [Ventas].[pedidoscabe] ([IdPedido])
GO
ALTER TABLE [Ventas].[pedidosdeta]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [Compras].[productos] ([IdProducto])
GO
/****** Object:  StoredProcedure [dbo].[usp_003]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_003]

@p_idcliente char(10),
@p_canPed Smallint output 
as
begin 
	set @p_canPed = (select count(IdPedido)
					from Ventas.pedidoscabe
					where IdCliente =@p_idcliente)

					end 
GO
/****** Object:  StoredProcedure [dbo].[USP_INGCAT]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_INGCAT]

@p_NombreCategoria varchar(50)

as
begin 
	insert Compras.categoriaa
	values 
	(@p_NombreCategoria)
	end
GO
/****** Object:  StoredProcedure [Ventas].[USP_001]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Ventas].[USP_001]

@p_idpais char(3)
as 
BEGIN 

	SELECT*FROM Ventas.clientes
	where idpais = @p_idpais

END

GO
/****** Object:  StoredProcedure [Ventas].[USP_002]    Script Date: 25/06/2025 21:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure  [Ventas].[USP_002]
@p_Fecha date, @p_Fecha2 date
as 
BEGIN 
	begin try 
		if @p_Fecha<@p_Fecha2
	
				SELECT*FROM Ventas.pedidoscabe

			where FechaPedido between  @p_Fecha and @p_Fecha2	
		else
			
		raiserror ('Error...', 16, 1)
	END  try 	
	
	Begin Catch

		Print Error_message()

	End Catch

end

GO
USE [master]
GO
ALTER DATABASE [Negocios] SET  READ_WRITE 
GO
