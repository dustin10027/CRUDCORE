USE [master]
GO
/****** Object:  Database [DBCRUDCORE]    Script Date: 19/09/2024 11:46:20 ******/
CREATE DATABASE [DBCRUDCORE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBCRUDCORE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBCRUDCORE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBCRUDCORE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBCRUDCORE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBCRUDCORE] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBCRUDCORE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBCRUDCORE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBCRUDCORE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBCRUDCORE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBCRUDCORE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBCRUDCORE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET RECOVERY FULL 
GO
ALTER DATABASE [DBCRUDCORE] SET  MULTI_USER 
GO
ALTER DATABASE [DBCRUDCORE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBCRUDCORE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBCRUDCORE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBCRUDCORE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBCRUDCORE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBCRUDCORE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBCRUDCORE', N'ON'
GO
ALTER DATABASE [DBCRUDCORE] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBCRUDCORE] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBCRUDCORE]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 19/09/2024 11:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Dni] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([IdUsuario], [Nombre], [Apellido], [Dni], [Correo]) VALUES (1, N'Victor Hugo', N'Perez', N'7124567890', N'hugo@gmail.com')
INSERT [dbo].[usuario] ([IdUsuario], [Nombre], [Apellido], [Dni], [Correo]) VALUES (2, N'Thalia', N'Gomez', N'345678907', N'thalia@gmail.com')
INSERT [dbo].[usuario] ([IdUsuario], [Nombre], [Apellido], [Dni], [Correo]) VALUES (4, N'Miguel', N'Torres', N'345678923', N'miguel@gmail.com')
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_Editar]    Script Date: 19/09/2024 11:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Editar](
@IdUsuario int,
@Nombre varchar(100),
@Apellido varchar(100),
@Dni varchar(100),
@Correo varchar(100)
)
as
begin
	update usuario set Nombre = @Nombre, Apellido = @Apellido, Dni = @Dni, Correo = @Correo where IdUsuario = @IdUsuario
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Eliminar]    Script Date: 19/09/2024 11:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Eliminar](
@IdUsuario int
)
as
begin
	delete from usuario where IdUsuario = @IdUsuario
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Guardar]    Script Date: 19/09/2024 11:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Guardar](
@Nombre varchar(100),
@Apellido varchar(100),
@Dni varchar(100),
@Correo varchar(100)
)
as
begin
	insert into usuario(Nombre,Apellido,Dni,Correo) values (@Nombre,@Apellido,@Dni,@Correo)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Listar]    Script Date: 19/09/2024 11:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Listar]
as
begin
	select * from usuario
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Obtener]    Script Date: 19/09/2024 11:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Obtener](
@IdUsuario int
)
as
begin
	select * from usuario where IdUsuario = @IdUsuario
end
GO
USE [master]
GO
ALTER DATABASE [DBCRUDCORE] SET  READ_WRITE 
GO
