USE [master]
GO
/****** Object:  Database [GESTION_ESTUDIANTES]    Script Date: 28/2/2023 10:52:24 a. m. ******/
CREATE DATABASE [GESTION_ESTUDIANTES]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GESTION_ESTUDIANTES', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GESTION_ESTUDIANTES.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GESTION_ESTUDIANTES_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GESTION_ESTUDIANTES_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GESTION_ESTUDIANTES].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET ARITHABORT OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET  MULTI_USER 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET QUERY_STORE = OFF
GO
USE [GESTION_ESTUDIANTES]
GO
/****** Object:  Table [dbo].[tbl_Asignatura]    Script Date: 28/2/2023 10:52:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Asignatura](
	[Id_Asignatura] [int] NOT NULL,
	[Nombre_Asig] [varchar](75) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Asignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Control_asistencia]    Script Date: 28/2/2023 10:52:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Control_asistencia](
	[Id_Control_asistencia] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [varchar](13) NULL,
	[Estado] [varchar](50) NULL,
	[matr_estudiante] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Control_asistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Docente]    Script Date: 28/2/2023 10:52:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Docente](
	[Id_Docente] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Asig_Encargado] [varchar](75) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Docente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Estudiante]    Script Date: 28/2/2023 10:52:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Estudiante](
	[Matricula] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Sexo] [varchar](13) NULL,
	[Email] [varchar](50) NULL,
	[Calificacion] [int] NULL,
	[Asignatura_activa] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_Asignatura] ([Id_Asignatura], [Nombre_Asig]) VALUES (1, N'Lengua española')
INSERT [dbo].[tbl_Asignatura] ([Id_Asignatura], [Nombre_Asig]) VALUES (2, N'Matemáticas')
INSERT [dbo].[tbl_Asignatura] ([Id_Asignatura], [Nombre_Asig]) VALUES (3, N'Ciencias sociales')
INSERT [dbo].[tbl_Asignatura] ([Id_Asignatura], [Nombre_Asig]) VALUES (4, N'Ciencias naturales')
SET IDENTITY_INSERT [dbo].[tbl_Control_asistencia] ON 

INSERT [dbo].[tbl_Control_asistencia] ([Id_Control_asistencia], [Fecha], [Estado], [matr_estudiante]) VALUES (1, N'26-02-2023', N'P', 1)
INSERT [dbo].[tbl_Control_asistencia] ([Id_Control_asistencia], [Fecha], [Estado], [matr_estudiante]) VALUES (2, N'26-02-2023', N'A', 2)
INSERT [dbo].[tbl_Control_asistencia] ([Id_Control_asistencia], [Fecha], [Estado], [matr_estudiante]) VALUES (3, N'02-28-2023', N'A', 3)
SET IDENTITY_INSERT [dbo].[tbl_Control_asistencia] OFF
INSERT [dbo].[tbl_Docente] ([Id_Docente], [Nombre], [Apellidos], [Email], [Asig_Encargado]) VALUES (1, N'Pedro', N'Beltré', N'pbeltre@gmail.com', N'Lengua Española')
SET IDENTITY_INSERT [dbo].[tbl_Estudiante] ON 

INSERT [dbo].[tbl_Estudiante] ([Matricula], [Nombre], [Apellidos], [Sexo], [Email], [Calificacion], [Asignatura_activa]) VALUES (1, N'Luis', N'Campos', N'Masculino', N'lcampos25@gmail.com', 98, 1)
INSERT [dbo].[tbl_Estudiante] ([Matricula], [Nombre], [Apellidos], [Sexo], [Email], [Calificacion], [Asignatura_activa]) VALUES (2, N'Lorena', N'Rivas', N'Femenino', N'lrivas@gmail.com', 85, 2)
INSERT [dbo].[tbl_Estudiante] ([Matricula], [Nombre], [Apellidos], [Sexo], [Email], [Calificacion], [Asignatura_activa]) VALUES (3, N'Lissa', N'Capois', N'Femenino', N'lcapois@gmail.com', 87, 4)
INSERT [dbo].[tbl_Estudiante] ([Matricula], [Nombre], [Apellidos], [Sexo], [Email], [Calificacion], [Asignatura_activa]) VALUES (4, N'Maria', N'Perez', N'Femenino', N'mperez@gmail.com', 100, 4)
SET IDENTITY_INSERT [dbo].[tbl_Estudiante] OFF
ALTER TABLE [dbo].[tbl_Control_asistencia]  WITH CHECK ADD FOREIGN KEY([matr_estudiante])
REFERENCES [dbo].[tbl_Estudiante] ([Matricula])
GO
ALTER TABLE [dbo].[tbl_Estudiante]  WITH CHECK ADD FOREIGN KEY([Asignatura_activa])
REFERENCES [dbo].[tbl_Asignatura] ([Id_Asignatura])
GO
USE [master]
GO
ALTER DATABASE [GESTION_ESTUDIANTES] SET  READ_WRITE 
GO
