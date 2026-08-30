/*
    =====================================================================
    AppBase - Script de creacion de base de datos
    =====================================================================
    Framework generico con: Login, Permisos (Composite), Idiomas y
    Backup/Restore. No contiene tablas de negocio: agrega las tuyas
    encima de este script para el dominio que quieras implementar.

    Requiere SQL Server (Express sirve). Ejecutar este archivo primero,
    y despues 02_DatosIniciales.sql
    =====================================================================
*/

IF DB_ID(N'AppBaseDB') IS NULL
BEGIN
    CREATE DATABASE [AppBaseDB]
END
GO

USE [AppBaseDB]
GO

-- =====================================================================
-- Tabla Usuario
-- =====================================================================
IF OBJECT_ID(N'[dbo].[Usuario]', N'U') IS NOT NULL DROP TABLE [dbo].[Usuario]
GO
CREATE TABLE [dbo].[Usuario](
	[Usuario_ID] [nvarchar](50) NOT NULL,
	[Usuario_User] [nvarchar](50) NULL,
	[Usuario_Pass] [nvarchar](max) NULL,
	[Usuario_Bloq] [bit] NULL,
	[Usuario_Baja] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED ([Usuario_ID] ASC)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-- =====================================================================
-- Tabla Permiso (nodos del Composite: familias y patentes)
-- Permiso_Tipo NULL      -> es una Familia (nodo compuesto)
-- Permiso_Tipo con valor -> es una Patente (hoja, valor del enum TipoPatente)
-- =====================================================================
IF OBJECT_ID(N'[dbo].[Permiso]', N'U') IS NOT NULL DROP TABLE [dbo].[Permiso]
GO
CREATE TABLE [dbo].[Permiso](
	[Permiso_ID] [nvarchar](50) NOT NULL,
	[Permiso_Descripcion] [nvarchar](50) NULL,
	[Permiso_Tipo] [int] NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED ([Permiso_ID] ASC)
) ON [PRIMARY]
GO

-- =====================================================================
-- Tabla Familia_Patente (relacion padre/hijo del arbol de permisos)
-- =====================================================================
IF OBJECT_ID(N'[dbo].[Familia_Patente]', N'U') IS NOT NULL DROP TABLE [dbo].[Familia_Patente]
GO
CREATE TABLE [dbo].[Familia_Patente](
	[Padre_ID] [nvarchar](50) NOT NULL,
	[Hijo_ID] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

-- =====================================================================
-- Tabla Usuario_Permiso (permisos/familias asignados a cada usuario)
-- =====================================================================
IF OBJECT_ID(N'[dbo].[Usuario_Permiso]', N'U') IS NOT NULL DROP TABLE [dbo].[Usuario_Permiso]
GO
CREATE TABLE [dbo].[Usuario_Permiso](
	[Permiso_ID] [nvarchar](50) NOT NULL,
	[Usuario_ID] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

-- =====================================================================
-- Tabla Idioma
-- =====================================================================
IF OBJECT_ID(N'[dbo].[Idioma]', N'U') IS NOT NULL DROP TABLE [dbo].[Idioma]
GO
CREATE TABLE [dbo].[Idioma](
	[Idioma_ID] [nvarchar](50) NOT NULL,
	[Idioma_Descripcion] [nvarchar](50) NULL,
	[Idioma_Default] [bit] NULL,
 CONSTRAINT [PK_Idioma] PRIMARY KEY CLUSTERED ([Idioma_ID] ASC)
) ON [PRIMARY]
GO

-- =====================================================================
-- Tabla Etiqueta (claves de texto usadas por los controles, via Tag)
-- =====================================================================
IF OBJECT_ID(N'[dbo].[Etiqueta]', N'U') IS NOT NULL DROP TABLE [dbo].[Etiqueta]
GO
CREATE TABLE [dbo].[Etiqueta](
	[Etiqueta_ID] [nvarchar](50) NOT NULL,
	[Etiqueta_Descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Etiqueta] PRIMARY KEY CLUSTERED ([Etiqueta_ID] ASC)
) ON [PRIMARY]
GO

-- =====================================================================
-- Tabla Traduccion (texto de cada Etiqueta para cada Idioma)
-- =====================================================================
IF OBJECT_ID(N'[dbo].[Traduccion]', N'U') IS NOT NULL DROP TABLE [dbo].[Traduccion]
GO
CREATE TABLE [dbo].[Traduccion](
	[Etiqueta_ID] [nvarchar](50) NOT NULL,
	[Idioma_ID] [nvarchar](50) NULL,
	[Traduccion_Traduccion] [nvarchar](300) NULL
) ON [PRIMARY]
GO
