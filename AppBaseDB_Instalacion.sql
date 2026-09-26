

-- 1. Base de datos
USE [master]
GO
IF DB_ID(N'AppBaseDB') IS NULL
    CREATE DATABASE [AppBaseDB]
GO
ALTER DATABASE [AppBaseDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AppBaseDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AppBaseDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AppBaseDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AppBaseDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AppBaseDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AppBaseDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AppBaseDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AppBaseDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AppBaseDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AppBaseDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AppBaseDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AppBaseDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AppBaseDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AppBaseDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AppBaseDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AppBaseDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AppBaseDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AppBaseDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AppBaseDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AppBaseDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AppBaseDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AppBaseDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AppBaseDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AppBaseDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AppBaseDB] SET  MULTI_USER 
GO
ALTER DATABASE [AppBaseDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AppBaseDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AppBaseDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AppBaseDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AppBaseDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AppBaseDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AppBaseDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [AppBaseDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AppBaseDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 2. Tablas de seguridad, idiomas y bitacora
CREATE TABLE [dbo].[Bitacora](
	[Bitacora_ID] [uniqueidentifier] NOT NULL,
	[Bitacora_FechaHora] [datetime] NOT NULL,
	[Bitacora_UsuarioID] [uniqueidentifier] NULL,
	[Bitacora_Actividad] [nvarchar](200) NOT NULL,
	[Bitacora_EntidadId] [nvarchar](100) NULL,
	[Bitacora_Detalle] [nvarchar](max) NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[Bitacora_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE TABLE [dbo].[Etiqueta](
	[Etiqueta_ID] [nvarchar](50) NOT NULL,
	[Etiqueta_Descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Etiqueta] PRIMARY KEY CLUSTERED 
(
	[Etiqueta_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Familia_Patente](
	[Padre_ID] [nvarchar](50) NOT NULL,
	[Hijo_ID] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Idioma](
	[Idioma_ID] [nvarchar](50) NOT NULL,
	[Idioma_Descripcion] [nvarchar](50) NULL,
	[Idioma_Default] [bit] NULL,
 CONSTRAINT [PK_Idioma] PRIMARY KEY CLUSTERED 
(
	[Idioma_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Permiso](
	[Permiso_ID] [nvarchar](50) NOT NULL,
	[Permiso_Descripcion] [nvarchar](50) NULL,
	[Permiso_Tipo] [int] NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[Permiso_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Traduccion](
	[Etiqueta_ID] [nvarchar](50) NOT NULL,
	[Idioma_ID] [nvarchar](50) NULL,
	[Traduccion_Traduccion] [nvarchar](300) NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Usuario](
	[Usuario_ID] [nvarchar](50) NOT NULL,
	[Usuario_User] [nvarchar](50) NULL,
	[Usuario_Pass] [nvarchar](max) NULL,
	[Usuario_Bloq] [bit] NULL,
	[Usuario_Baja] [bit] NULL,
	[Usuario_DVH] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Usuario_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE TABLE [dbo].[Usuario_Permiso](
	[Permiso_ID] [nvarchar](50) NOT NULL,
	[Usuario_ID] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

-- 3. Tablas de negocio de PN01
CREATE TABLE [dbo].[CONSORCIO] (
    [IdConsorcio_413BE] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_CONSORCIO] PRIMARY KEY,
    [Nombre_413BE] NVARCHAR(150) NOT NULL,
    [Direccion_413BE] NVARCHAR(200) NOT NULL,
    [CantidadUnidades_413BE] INT NOT NULL,
    [Activo_413BE] BIT NOT NULL CONSTRAINT [DF_CONSORCIO_Activo] DEFAULT 1,
    [Dvh_413BE] INT NOT NULL CONSTRAINT [DF_CONSORCIO_Dvh] DEFAULT 0
);
GO
CREATE TABLE [dbo].[UNIDAD_FUNCIONAL] (
    [IdUnidadFuncional_413BE] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_UNIDAD_FUNCIONAL] PRIMARY KEY,
    [IdConsorcio_413BE] INT NOT NULL CONSTRAINT [FK_UF_CONSORCIO] REFERENCES [dbo].[CONSORCIO]([IdConsorcio_413BE]),
    [Identificador_413BE] NVARCHAR(50) NOT NULL,
    [Tipo_413BE] NVARCHAR(50) NOT NULL,
    [Activa_413BE] BIT NOT NULL,
    [Dvh_413BE] INT NOT NULL CONSTRAINT [DF_UNIDAD_FUNCIONAL_Dvh] DEFAULT 0
);
GO
CREATE TABLE [dbo].[CONSORCISTA] (
    [IdConsorcista_413BE] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_CONSORCISTA] PRIMARY KEY,
    [IdUnidadFuncional_413BE] INT NOT NULL CONSTRAINT [FK_CONSORCISTA_UF] REFERENCES [dbo].[UNIDAD_FUNCIONAL]([IdUnidadFuncional_413BE]),
    [Dni_413BE] NVARCHAR(20) NOT NULL,
    [Nombre_413BE] NVARCHAR(150) NOT NULL,
    [Email_413BE] NVARCHAR(150) NOT NULL,
    [EsPropietario_413BE] BIT NOT NULL,
    [Activo_413BE] BIT NOT NULL CONSTRAINT [DF_CONSORCISTA_Activo] DEFAULT 1,
    [Dvh_413BE] INT NOT NULL CONSTRAINT [DF_CONSORCISTA_Dvh] DEFAULT 0
);
GO
CREATE TABLE [dbo].[CATEGORIA] (
    [IdCategoria_413BE] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_CATEGORIA] PRIMARY KEY,
    [Nombre_413BE] NVARCHAR(100) NOT NULL,
    [Dvh_413BE] INT NOT NULL CONSTRAINT [DF_CATEGORIA_Dvh] DEFAULT 0
);
GO
CREATE TABLE [dbo].[PROVEEDOR] (
    [IdProveedor_413BE] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_PROVEEDOR] PRIMARY KEY,
    [Nombre_413BE] NVARCHAR(150) NOT NULL,
    [Cuit_413BE] NVARCHAR(20) NOT NULL,
    [Email_413BE] NVARCHAR(150) NOT NULL,
    [Habilitado_413BE] BIT NOT NULL,
    [Dvh_413BE] INT NOT NULL CONSTRAINT [DF_PROVEEDOR_Dvh] DEFAULT 0
);
GO
CREATE TABLE [dbo].[PROVEEDOR_CATEGORIA] (
    [IdProveedor_413BE] INT NOT NULL CONSTRAINT [FK_PC_PROVEEDOR] REFERENCES [dbo].[PROVEEDOR]([IdProveedor_413BE]),
    [IdCategoria_413BE] INT NOT NULL CONSTRAINT [FK_PC_CATEGORIA] REFERENCES [dbo].[CATEGORIA]([IdCategoria_413BE]),
    [Dvh_413BE] INT NOT NULL CONSTRAINT [DF_PROVEEDOR_CATEGORIA_Dvh] DEFAULT 0,
    CONSTRAINT [PK_PROVEEDOR_CATEGORIA] PRIMARY KEY ([IdProveedor_413BE], [IdCategoria_413BE])
);
GO
CREATE TABLE [dbo].[RECLAMO] (
    [IdReclamo_413BE] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_RECLAMO] PRIMARY KEY,
    [IdConsorcio_413BE] INT NOT NULL CONSTRAINT [FK_RECLAMO_CONSORCIO] REFERENCES [dbo].[CONSORCIO]([IdConsorcio_413BE]),
    [IdConsorcista_413BE] INT NOT NULL CONSTRAINT [FK_RECLAMO_CONSORCISTA] REFERENCES [dbo].[CONSORCISTA]([IdConsorcista_413BE]),
    [IdCategoria_413BE] INT NOT NULL CONSTRAINT [FK_RECLAMO_CATEGORIA] REFERENCES [dbo].[CATEGORIA]([IdCategoria_413BE]),
    [IdUnidadFuncional_413BE] INT NULL CONSTRAINT [FK_RECLAMO_UF] REFERENCES [dbo].[UNIDAD_FUNCIONAL]([IdUnidadFuncional_413BE]),
    [AreaComun_413BE] NVARCHAR(100) NULL,
    [IdReclamoOriginal_413BE] INT NULL CONSTRAINT [FK_RECLAMO_ORIGINAL] REFERENCES [dbo].[RECLAMO]([IdReclamo_413BE]),
    [Descripcion_413BE] NVARCHAR(1000) NOT NULL,
    [FechaAlta_413BE] DATETIME NOT NULL,
    [Estado_413BE] NVARCHAR(50) NOT NULL,
    [Prioridad_413BE] NVARCHAR(50) NULL,
    [TipoImputacion_413BE] NVARCHAR(50) NULL,
    [Reincidente_413BE] BIT NOT NULL,
    [Dvh_413BE] INT NOT NULL CONSTRAINT [DF_RECLAMO_Dvh] DEFAULT 0,
    CONSTRAINT [CK_RECLAMO_UBICACION] CHECK (
        ([IdUnidadFuncional_413BE] IS NULL AND [AreaComun_413BE] IS NOT NULL)
        OR ([IdUnidadFuncional_413BE] IS NOT NULL AND [AreaComun_413BE] IS NULL))
);
GO
CREATE TABLE [dbo].[ADJUNTO] (
    [IdAdjunto_413BE] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_ADJUNTO] PRIMARY KEY,
    [IdReclamo_413BE] INT NOT NULL CONSTRAINT [FK_ADJUNTO_RECLAMO] REFERENCES [dbo].[RECLAMO]([IdReclamo_413BE]),
    [NombreArchivo_413BE] NVARCHAR(260) NOT NULL,
    [Tipo_413BE] NVARCHAR(50) NOT NULL,
    [Dvh_413BE] INT NOT NULL CONSTRAINT [DF_ADJUNTO_Dvh] DEFAULT 0
);
GO
CREATE TABLE [dbo].[DERIVACION] (
    [IdDerivacion_413BE] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_DERIVACION] PRIMARY KEY,
    [IdReclamo_413BE] INT NOT NULL CONSTRAINT [UQ_DERIVACION_RECLAMO] UNIQUE CONSTRAINT [FK_DERIVACION_RECLAMO] REFERENCES [dbo].[RECLAMO]([IdReclamo_413BE]),
    [IdProveedor_413BE] INT NOT NULL CONSTRAINT [FK_DERIVACION_PROVEEDOR] REFERENCES [dbo].[PROVEEDOR]([IdProveedor_413BE]),
    [FechaDerivacion_413BE] DATETIME NOT NULL,
    [PlazoSlaDias_413BE] INT NOT NULL,
    [Dvh_413BE] INT NOT NULL CONSTRAINT [DF_DERIVACION_Dvh] DEFAULT 0
);
GO
CREATE TABLE [dbo].[CIERRE_RECLAMO] (
    [IdCierre_413BE] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_CIERRE_RECLAMO] PRIMARY KEY,
    [IdReclamo_413BE] INT NOT NULL CONSTRAINT [UQ_CIERRE_RECLAMO] UNIQUE CONSTRAINT [FK_CIERRE_RECLAMO] REFERENCES [dbo].[RECLAMO]([IdReclamo_413BE]),
    [FechaCierre_413BE] DATETIME NOT NULL,
    [InformeResolucion_413BE] NVARCHAR(2000) NOT NULL,
    [NumeroFactura_413BE] NVARCHAR(50) NOT NULL,
    [CuentaImputada_413BE] NVARCHAR(200) NOT NULL,
    [CostoImputado_413BE] DECIMAL(18,2) NOT NULL,
    [Dvh_413BE] INT NOT NULL CONSTRAINT [DF_CIERRE_RECLAMO_Dvh] DEFAULT 0
);
GO

-- 4. Tabla de control del digito verificador vertical
CREATE TABLE [dbo].[DigitoVerificadorVertical](
	[DVV_ID] [uniqueidentifier] NOT NULL,
	[DVV_Tabla] [nvarchar](100) NOT NULL,
	[DVV_Atributo] [nvarchar](100) NOT NULL,
	[DVV_Valor] [int] NOT NULL,
	[DVV_FechaCalculo] [datetime] NOT NULL,
 CONSTRAINT [PK_DigitoVerificadorVertical] PRIMARY KEY CLUSTERED 
(
	[DVV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- 5. Datos base: idiomas, patentes y familias del sistema, usuarios y traducciones del sistema base
INSERT [dbo].[Idioma] ([Idioma_ID], [Idioma_Descripcion], [Idioma_Default]) VALUES (N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Español', 1)
INSERT [dbo].[Idioma] ([Idioma_ID], [Idioma_Descripcion], [Idioma_Default]) VALUES (N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Inglés', 0)
GO
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'27b3f0bd-6c96-4e03-b0ab-a2ca218200a0', N'GestBackup', 4)
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'28a2317f-4de7-4976-8810-bf9fc517c6ea', N'Admin', NULL)
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'36ba3111-3d42-4766-9c54-542f17a247b2', N'BasicoAdmin', NULL)
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'5BBB22C9-99FC-4A3F-AC0A-CA25AF2157AE', N'GestBitacora', 5)
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'7acb2457-162c-480e-85bb-c444d223d1ab', N'GestPermisos', 1)
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'b226e845-3ae7-42fd-809a-77a5f1f0ebf1', N'GestUsuarios', 2)
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'ce0d646b-f902-472d-8c00-b94f4a026ae9', N'GestIdiomas', 3)
GO
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'28a2317f-4de7-4976-8810-bf9fc517c6ea', N'7acb2457-162c-480e-85bb-c444d223d1ab')
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'28a2317f-4de7-4976-8810-bf9fc517c6ea', N'b226e845-3ae7-42fd-809a-77a5f1f0ebf1')
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'28a2317f-4de7-4976-8810-bf9fc517c6ea', N'ce0d646b-f902-472d-8c00-b94f4a026ae9')
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'28a2317f-4de7-4976-8810-bf9fc517c6ea', N'27b3f0bd-6c96-4e03-b0ab-a2ca218200a0')
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'36ba3111-3d42-4766-9c54-542f17a247b2', N'27b3f0bd-6c96-4e03-b0ab-a2ca218200a0')
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'36ba3111-3d42-4766-9c54-542f17a247b2', N'ce0d646b-f902-472d-8c00-b94f4a026ae9')
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'28A2317F-4DE7-4976-8810-BF9FC517C6EA', N'5BBB22C9-99FC-4A3F-AC0A-CA25AF2157AE')
GO
INSERT [dbo].[Usuario] ([Usuario_ID], [Usuario_User], [Usuario_Pass], [Usuario_Bloq], [Usuario_Baja], [Usuario_DVH]) VALUES (N'42d88568-a6ab-4d41-a377-a242d7b3fef7', N'adminbasic', N'240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 0, 0, 56)
INSERT [dbo].[Usuario] ([Usuario_ID], [Usuario_User], [Usuario_Pass], [Usuario_Bloq], [Usuario_Baja], [Usuario_DVH]) VALUES (N'b9c09721-83e1-4874-9bb2-58d8f4520248', N'asd', N'688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 0, 1, 64)
INSERT [dbo].[Usuario] ([Usuario_ID], [Usuario_User], [Usuario_Pass], [Usuario_Bloq], [Usuario_Baja], [Usuario_DVH]) VALUES (N'ce8ba34d-afa4-4c84-8738-96ceb2e87c00', N'admin', N'240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 0, 0, 8)
GO
INSERT [dbo].[Usuario_Permiso] ([Permiso_ID], [Usuario_ID]) VALUES (N'28a2317f-4de7-4976-8810-bf9fc517c6ea', N'ce8ba34d-afa4-4c84-8738-96ceb2e87c00')
GO
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'044dfdb4-a803-4624-b938-c95472d8f276', N'lb_familias')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'068e9177-a7f1-4e97-8f57-c5c9627676e6', N'lb_backupRestore')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'06AA4364-4352-43D7-8173-3BF64875217E', N'lb_integridadRecalcularConfirm')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'0B3CF967-73F9-439F-83AC-D3BC4AA99F38', N'lb_integridadRecalcularError')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'10D71AA6-D825-40EE-B73C-257BA29B53CB', N'lb_desde')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'1146F046-85D8-4443-9842-5483A6F2EFCC', N'lb_integridadPersiste')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'115c9fd3-47d0-4715-9699-f28b5bffd357', N'btn_salir')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'1aaa3f4d-009e-4d18-b76e-60b132be738b', N'lb_usuario_log')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'209CFCCD-809D-4E6E-8C24-643D09976D89', N'lb_export_error')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'20f739fa-e437-4dab-9257-cdbb1ae9bb78', N'btn_desbloquear')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'23107bd3-f511-4c84-9528-a11346bfc11a', N'lb_Idioma')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'24f3d6ab-d835-4285-a744-826eafe88c17', N'lb_CerrarSesion')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'2820e73c-a8ee-4501-80a9-afc59df9a834', N'btn_bloquear')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'2b94590e-8a9c-4182-8ae1-7371185d361d', N'lb_permisos_fam')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'2C0315A3-3621-4543-AA61-446AE74E8630', N'lb_todos')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'2f05d59e-dc83-43c9-91a3-cb69639e915b', N'lb_traduccion')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'2fe3b25e-b141-42b2-a828-25cd7b3bff62', N'lb_bienvenido')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'317E213B-D157-401C-9765-1CEE2AA20C72', N'lb_integridadDescripcion')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'34CA2F3F-95DF-40E0-BA65-E1810511D0E5', N'lb_fecha')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'3509f38e-8ca7-4e76-9965-98d08a712980', N'lb_sesion')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'38738E04-7253-4722-8A18-88043FC2A043', N'btn_integridadRestaurar')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'3c986b89-004d-45c2-8a0b-ce3c35b21c0b', N'btn_backup')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'3cd4d8e2-ea17-4352-91f8-ef681c8116cf', N'lb_patentes')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'40dadff1-b6f3-466c-b456-b2c6613484bc', N'btn_cancelar')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'41952A9A-C1DE-473F-88FE-BCF475691B30', N'btn_buscar')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'4372bca4-aade-4ee5-97ea-d3e3e322d6c8', N'lb_baseDeDatos')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'4AE03DC9-C8A0-40C4-9FC0-EF966B33A1DF', N'lb_detalle')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'4c545932-afc9-4ea9-ba6b-d0580924c806', N'lb_NombreFamilia')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'531c74e5-eac9-4288-b5e3-980881e4b943', N'lb_restoreError')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'565E23F4-CF82-4CB8-AD2C-F3D1BA56EA1D', N'chk_filtrar_fecha')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'58a8ff7c-6ae4-4aa1-8f6d-d694cbf26855', N'lb_NuevoIdioma')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'5E5F5093-2D4C-4BDE-836D-ACBEF33750FF', N'lb_hasta')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'62BCF934-59E1-4286-B325-22488502A2B5', N'lb_integridadRestoreConfirm')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'6605dc45-7368-47cf-8e0a-3929bd541fbf', N'btn_crear')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'6C3A7ED0-92BE-4063-AF35-D5E58FCD9AD4', N'lb_sistema_no_disponible')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'6D139769-6072-49C3-8FF2-C540F058CB47', N'lb_integridadSesionInvalida')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'7158a7d7-b9ef-46f0-9b73-28ea04cd142f', N'btn_restaurar')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'73E1E71C-7CAB-45CF-8EA9-0568AE83BCE1', N'lb_export_ok')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'75a09cab-44e7-4bc4-bd7b-a9d16a947989', N'lb_pass')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'75f3ce77-b54a-4254-9d28-332683b46bf4', N'lb_Usuarios')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'7651A2F6-BBB0-491E-B46B-A717953D3753', N'lb_integridadColFila')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'793b0d56-4d6d-4c4c-a4c7-6359f44e523e', N'btn_guardar')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'84362c84-7d8f-43c4-99c1-21736e439846', N'btn_nuevo_user')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'85A02EE5-8726-4596-90F9-7BBDE9237913', N'lb_actividad')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'89c4777b-288c-4084-a170-2c1044ec94a6', N'lb_permisos_user')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'8a7e1826-55b4-4171-8f21-8afa5a5efc14', N'lb_Usuario')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'8B3100D4-CD43-48F8-ABE4-5B9436975589', N'btn_integridadRecalcular')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'8F15AC4F-2295-4CE9-A566-71DAF3B65677', N'lb_integridadTablaCompleta')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'900bf7bf-0c0e-4d6b-be6a-16172b1f8f32', N'btn_ingresar')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'9bf705d7-364c-4fc2-a0c3-7d853a1e143c', N'btn_nueva_fam')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'a76564e8-e6fe-4c07-86bb-8f0a89895310', N'lb_completar')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'a948ecff-cdcd-4f02-8c33-7db69e9b553e', N'lb_email')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'AC35DA3F-D420-45BE-B6DF-A479C63AD02C', N'lb_integridadTitulo')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'AF1F9627-6E0A-4272-9138-7AB0CA18F6FC', N'btn_exportar_csv')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'b109db41-318f-40ca-8084-09bc1f196f2d', N'lb_principal')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'B8BB1004-8AF1-404E-A12F-44F5A68ED6DD', N'lb_integridadColTabla')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'bc494311-5884-4ff7-a230-ac602a95ed32', N'lb_backupError')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'cc81b6ed-1384-4183-8fda-7d19a60951bb', N'lb_usuario_incorrecto')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'CD76E8DF-7509-4024-A0B2-1D97E5FD8768', N'lb_id')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'cf2b5ee7-50cb-4d2b-9549-375be52ccc22', N'lb_IniciarSesion')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'CFCFCD38-A935-47D1-9342-90690835715C', N'btn_integridadCancelar')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'd40e4b79-90cf-481f-a310-72a06a08b5d4', N'btn_aceptar')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'd5bd301a-da9c-4e40-89e1-44817f341b6a', N'lb_TraduccionPara')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'd5d12fb0-128d-48b4-8b1b-4c768aa2f8ea', N'lb_permisos')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'd6a04a0d-f84d-4b58-97ea-4968a3909ad1', N'btn_agregar')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'da5b66ac-2cdb-41d5-8b71-2cdca5c30b4e', N'btn_quitar')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'dc58600a-8a57-495a-9b65-6baf164212e1', N'lb_pass_incorrecta')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'df1322c5-eb73-4b17-9132-0a85049c0591', N'lb_backupOk')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'df550ea4-4f4d-405f-bf5a-4d17b450683e', N'lb_original')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'E03CC91B-B0E9-4122-81E2-5E6FBCB14E90', N'lb_bitacora')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'E5F99194-923F-49E5-8DE6-710A91AAB47E', N'lb_usuario_baja')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'E634B6ED-1020-4D33-9FE5-96CF644F8136', N'lb_integridadColCampos')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'e6f0a916-06d3-425f-8692-b936ce37fadc', N'lb_restoreOk')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'e7b080a3-22ca-4017-813b-b66cbf37c7a8', N'lb_usuario_bloqueado')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'e939cc14-7b57-466f-92e1-6a4e98fbadb1', N'lb_deslog_1')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'e9d5634d-f72a-4864-b775-c73185f03293', N'lb_restoreConfirm')
INSERT [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'f49742e2-de65-48ea-b8e2-77e249626f97', N'btn_editar_datos')
GO
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'a948ecff-cdcd-4f02-8c33-7db69e9b553e', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Email')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'a948ecff-cdcd-4f02-8c33-7db69e9b553e', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'E-mail')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'900bf7bf-0c0e-4d6b-be6a-16172b1f8f32', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Ingresar')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'900bf7bf-0c0e-4d6b-be6a-16172b1f8f32', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Enter')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'115c9fd3-47d0-4715-9699-f28b5bffd357', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Salir')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'115c9fd3-47d0-4715-9699-f28b5bffd357', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Exit')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'75a09cab-44e7-4bc4-bd7b-a9d16a947989', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Contraseña')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'75a09cab-44e7-4bc4-bd7b-a9d16a947989', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Password')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2fe3b25e-b141-42b2-a828-25cd7b3bff62', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Bienvenido')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2fe3b25e-b141-42b2-a828-25cd7b3bff62', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Welcome')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'cc81b6ed-1384-4183-8fda-7d19a60951bb', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Usuario Incorrecto')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'cc81b6ed-1384-4183-8fda-7d19a60951bb', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Incorrect User')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'dc58600a-8a57-495a-9b65-6baf164212e1', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Contraseña Incorrecta')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'dc58600a-8a57-495a-9b65-6baf164212e1', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Incorrect Password')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e7b080a3-22ca-4017-813b-b66cbf37c7a8', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Usuario Bloqueado')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e7b080a3-22ca-4017-813b-b66cbf37c7a8', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Blocked User')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'3509f38e-8ca7-4e76-9965-98d08a712980', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Sesión')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'3509f38e-8ca7-4e76-9965-98d08a712980', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Session')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'cf2b5ee7-50cb-4d2b-9549-375be52ccc22', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Iniciar Sesión')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'cf2b5ee7-50cb-4d2b-9549-375be52ccc22', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Log In')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'24f3d6ab-d835-4285-a744-826eafe88c17', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Cerrar Sesión')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'24f3d6ab-d835-4285-a744-826eafe88c17', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Log Out')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'75f3ce77-b54a-4254-9d28-332683b46bf4', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Usuarios')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'75f3ce77-b54a-4254-9d28-332683b46bf4', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Users')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'044dfdb4-a803-4624-b938-c95472d8f276', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Familias')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'044dfdb4-a803-4624-b938-c95472d8f276', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Families')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'23107bd3-f511-4c84-9528-a11346bfc11a', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Idioma')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'23107bd3-f511-4c84-9528-a11346bfc11a', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Language')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'58a8ff7c-6ae4-4aa1-8f6d-d694cbf26855', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Nuevo Idioma')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'58a8ff7c-6ae4-4aa1-8f6d-d694cbf26855', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'New Language')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e939cc14-7b57-466f-92e1-6a4e98fbadb1', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'¿Quiere salir?')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e939cc14-7b57-466f-92e1-6a4e98fbadb1', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Do you want to exit?')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'20f739fa-e437-4dab-9257-cdbb1ae9bb78', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Desbloquear')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'20f739fa-e437-4dab-9257-cdbb1ae9bb78', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Unlock')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'f49742e2-de65-48ea-b8e2-77e249626f97', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Editar Datos')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'f49742e2-de65-48ea-b8e2-77e249626f97', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Edit')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2820e73c-a8ee-4501-80a9-afc59df9a834', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Bloquear')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2820e73c-a8ee-4501-80a9-afc59df9a834', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Block')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'84362c84-7d8f-43c4-99c1-21736e439846', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Nuevo Usuario')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'84362c84-7d8f-43c4-99c1-21736e439846', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'New User')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'89c4777b-288c-4084-a170-2c1044ec94a6', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Permisos Usuario')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'89c4777b-288c-4084-a170-2c1044ec94a6', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'User Permissions')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2b94590e-8a9c-4182-8ae1-7371185d361d', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Permisos de la Familia')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2b94590e-8a9c-4182-8ae1-7371185d361d', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Family Permissions')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'3cd4d8e2-ea17-4352-91f8-ef681c8116cf', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Patentes')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'3cd4d8e2-ea17-4352-91f8-ef681c8116cf', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Patents')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'da5b66ac-2cdb-41d5-8b71-2cdca5c30b4e', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Quitar-->')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'da5b66ac-2cdb-41d5-8b71-2cdca5c30b4e', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Remove-->')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd6a04a0d-f84d-4b58-97ea-4968a3909ad1', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'<--Agregar')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd6a04a0d-f84d-4b58-97ea-4968a3909ad1', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'<--Add')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd5d12fb0-128d-48b4-8b1b-4c768aa2f8ea', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Permisos')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd5d12fb0-128d-48b4-8b1b-4c768aa2f8ea', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Permissions')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd40e4b79-90cf-481f-a310-72a06a08b5d4', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Aceptar')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd40e4b79-90cf-481f-a310-72a06a08b5d4', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Ok')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'793b0d56-4d6d-4c4c-a4c7-6359f44e523e', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Guardar')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'793b0d56-4d6d-4c4c-a4c7-6359f44e523e', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Save')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'40dadff1-b6f3-466c-b456-b2c6613484bc', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Cancelar')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'40dadff1-b6f3-466c-b456-b2c6613484bc', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Cancel')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'8a7e1826-55b4-4171-8f21-8afa5a5efc14', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Usuario')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'8a7e1826-55b4-4171-8f21-8afa5a5efc14', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'User')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'1aaa3f4d-009e-4d18-b76e-60b132be738b', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Usuario Logueado')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'1aaa3f4d-009e-4d18-b76e-60b132be738b', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Logged User')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'9bf705d7-364c-4fc2-a0c3-7d853a1e143c', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Nueva Familia')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'9bf705d7-364c-4fc2-a0c3-7d853a1e143c', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'New Family')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'6605dc45-7368-47cf-8e0a-3929bd541fbf', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Crear')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'6605dc45-7368-47cf-8e0a-3929bd541fbf', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Create')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'4c545932-afc9-4ea9-ba6b-d0580924c806', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Nombre de la Familia')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'4c545932-afc9-4ea9-ba6b-d0580924c806', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Family Name')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'df550ea4-4f4d-405f-bf5a-4d17b450683e', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Original')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'df550ea4-4f4d-405f-bf5a-4d17b450683e', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Original')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2f05d59e-dc83-43c9-91a3-cb69639e915b', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Traduccion')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2f05d59e-dc83-43c9-91a3-cb69639e915b', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Translation')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'a76564e8-e6fe-4c07-86bb-8f0a89895310', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Completar idioma')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'a76564e8-e6fe-4c07-86bb-8f0a89895310', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Complete Language')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd5bd301a-da9c-4e40-89e1-44817f341b6a', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Traduccion para')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd5bd301a-da9c-4e40-89e1-44817f341b6a', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Translation for')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'b109db41-318f-40ca-8084-09bc1f196f2d', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Principal')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'b109db41-318f-40ca-8084-09bc1f196f2d', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Main')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'4372bca4-aade-4ee5-97ea-d3e3e322d6c8', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Base de Datos')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'4372bca4-aade-4ee5-97ea-d3e3e322d6c8', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Database')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'068e9177-a7f1-4e97-8f57-c5c9627676e6', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Backup / Restaurar')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'068e9177-a7f1-4e97-8f57-c5c9627676e6', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Backup / Restore')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'3c986b89-004d-45c2-8a0b-ce3c35b21c0b', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Hacer Backup')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'3c986b89-004d-45c2-8a0b-ce3c35b21c0b', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Make Backup')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'7158a7d7-b9ef-46f0-9b73-28ea04cd142f', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Restaurar')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'7158a7d7-b9ef-46f0-9b73-28ea04cd142f', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Restore')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'df1322c5-eb73-4b17-9132-0a85049c0591', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Backup realizado con exito')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'df1322c5-eb73-4b17-9132-0a85049c0591', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Backup completed successfully')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'bc494311-5884-4ff7-a230-ac602a95ed32', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Error al realizar el backup')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'bc494311-5884-4ff7-a230-ac602a95ed32', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Error performing backup')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e6f0a916-06d3-425f-8692-b936ce37fadc', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Base de datos restaurada con exito')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e6f0a916-06d3-425f-8692-b936ce37fadc', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Database restored successfully')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'531c74e5-eac9-4288-b5e3-980881e4b943', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Error al restaurar la base de datos')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'531c74e5-eac9-4288-b5e3-980881e4b943', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Error restoring database')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e9d5634d-f72a-4864-b775-c73185f03293', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Esta accion reemplaza los datos actuales. Desea continuar?')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e9d5634d-f72a-4864-b775-c73185f03293', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'This action replaces the current data. Do you want to continue?')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'AC35DA3F-D420-45BE-B6DF-A479C63AD02C', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Resolución de integridad')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'AC35DA3F-D420-45BE-B6DF-A479C63AD02C', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Integrity resolution')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'317E213B-D157-401C-9765-1CEE2AA20C72', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Se detectó una inconsistencia en los datos (posible manipulación fuera del sistema). Elija cómo resolverla:')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'317E213B-D157-401C-9765-1CEE2AA20C72', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'An inconsistency was detected in the data (possible manipulation outside the system). Choose how to resolve it:')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'38738E04-7253-4722-8A18-88043FC2A043', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Restaurar desde backup')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'38738E04-7253-4722-8A18-88043FC2A043', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Restore from backup')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'8B3100D4-CD43-48F8-ABE4-5B9436975589', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Recalcular dígitos verificadores')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'8B3100D4-CD43-48F8-ABE4-5B9436975589', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Recalculate check digits')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'CFCFCD38-A935-47D1-9342-90690835715C', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Cancelar')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'CFCFCD38-A935-47D1-9342-90690835715C', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Cancel')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'62BCF934-59E1-4286-B325-22488502A2B5', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Esta acción reemplaza los datos actuales por los del backup. ¿Desea continuar?')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'62BCF934-59E1-4286-B325-22488502A2B5', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'This action replaces the current data with the backup data. Do you want to continue?')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'06AA4364-4352-43D7-8173-3BF64875217E', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Se tomarán como válidos los datos actuales y se recalcularán los dígitos verificadores. ¿Desea continuar?')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'06AA4364-4352-43D7-8173-3BF64875217E', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'The current data will be taken as valid and the check digits will be recalculated. Do you want to continue?')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'0B3CF967-73F9-439F-83AC-D3BC4AA99F38', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Error al recalcular los dígitos verificadores')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'0B3CF967-73F9-439F-83AC-D3BC4AA99F38', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Error recalculating the check digits')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'1146F046-85D8-4443-9842-5483A6F2EFCC', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'La integridad de los datos sigue fallando. Revise el detalle y elija otra acción.')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'1146F046-85D8-4443-9842-5483A6F2EFCC', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'The data integrity check is still failing. Review the details and choose another action.')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'6D139769-6072-49C3-8FF2-C540F058CB47', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'El backup restaurado no contiene al administrador actual. Debe iniciar sesión nuevamente.')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'6D139769-6072-49C3-8FF2-C540F058CB47', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'The restored backup does not contain the current administrator. You must log in again.')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'8F15AC4F-2295-4CE9-A566-71DAF3B65677', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'(tabla completa)')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'8F15AC4F-2295-4CE9-A566-71DAF3B65677', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'(entire table)')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'6C3A7ED0-92BE-4063-AF35-D5E58FCD9AD4', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'El sistema no está disponible en este momento
Contacte con un Administrador.')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'6C3A7ED0-92BE-4063-AF35-D5E58FCD9AD4', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'The system is not available right now.
Contact an Administrator.')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'E5F99194-923F-49E5-8DE6-710A91AAB47E', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Usuario Dado de Baja')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'E5F99194-923F-49E5-8DE6-710A91AAB47E', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'User Deactivated')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'E03CC91B-B0E9-4122-81E2-5E6FBCB14E90', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Bitácora')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'E03CC91B-B0E9-4122-81E2-5E6FBCB14E90', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Audit Log')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'565E23F4-CF82-4CB8-AD2C-F3D1BA56EA1D', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Filtrar por fecha')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'565E23F4-CF82-4CB8-AD2C-F3D1BA56EA1D', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Filter by date')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'10D71AA6-D825-40EE-B73C-257BA29B53CB', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Desde')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'10D71AA6-D825-40EE-B73C-257BA29B53CB', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'From')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'5E5F5093-2D4C-4BDE-836D-ACBEF33750FF', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Hasta')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'5E5F5093-2D4C-4BDE-836D-ACBEF33750FF', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'To')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'85A02EE5-8726-4596-90F9-7BBDE9237913', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Actividad')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'85A02EE5-8726-4596-90F9-7BBDE9237913', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Activity')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'41952A9A-C1DE-473F-88FE-BCF475691B30', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Buscar')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'41952A9A-C1DE-473F-88FE-BCF475691B30', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Search')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'AF1F9627-6E0A-4272-9138-7AB0CA18F6FC', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Exportar CSV')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'AF1F9627-6E0A-4272-9138-7AB0CA18F6FC', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Export CSV')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'34CA2F3F-95DF-40E0-BA65-E1810511D0E5', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Fecha')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'34CA2F3F-95DF-40E0-BA65-E1810511D0E5', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Date')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'4AE03DC9-C8A0-40C4-9FC0-EF966B33A1DF', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Detalle')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'4AE03DC9-C8A0-40C4-9FC0-EF966B33A1DF', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Detail')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2C0315A3-3621-4543-AA61-446AE74E8630', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'(Todos)')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2C0315A3-3621-4543-AA61-446AE74E8630', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'(All)')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'73E1E71C-7CAB-45CF-8EA9-0568AE83BCE1', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Exportación realizada con éxito')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'73E1E71C-7CAB-45CF-8EA9-0568AE83BCE1', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Export completed successfully')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'209CFCCD-809D-4E6E-8C24-643D09976D89', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Error al exportar')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'209CFCCD-809D-4E6E-8C24-643D09976D89', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Error exporting')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'CD76E8DF-7509-4024-A0B2-1D97E5FD8768', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Id')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'CD76E8DF-7509-4024-A0B2-1D97E5FD8768', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Id')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'B8BB1004-8AF1-404E-A12F-44F5A68ED6DD', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Tabla')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'B8BB1004-8AF1-404E-A12F-44F5A68ED6DD', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Table')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'7651A2F6-BBB0-491E-B46B-A717953D3753', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Fila (clave primaria)')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'7651A2F6-BBB0-491E-B46B-A717953D3753', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Row (primary key)')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'E634B6ED-1020-4D33-9FE5-96CF644F8136', N'66CBF8F7-3EAA-4AEA-BD95-2BA8DC234DB7', N'Campos con falla')
INSERT [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'E634B6ED-1020-4D33-9FE5-96CF644F8136', N'6FF0850F-7318-4270-AAF4-3B24C9223B37', N'Failing fields')
GO

-- 6. Patentes y familias de PN01 y del ABM de maestros
-- Patentes de PN01 y familia "Gestor de consorcios"
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1011', N'Cargar y clasificar reclamo', 6)
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1012', N'Buscar y derivar proveedor', 7)
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1013', N'Cerrar reclamo e imputar costo', 8)
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1014', N'Consultar historial', 9)
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1001', N'Gestor de consorcios', NULL)
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1001', N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1011')
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1001', N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1012')
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1001', N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1013')
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1001', N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1014')
-- ABM de maestros: patente "Mantenimiento de consorcios", otorgada a la familia "Admin"
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1021', N'Mantenimiento de consorcios', 10)
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'28a2317f-4de7-4976-8810-bf9fc517c6ea', N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1021')
-- Usuario Gestor (contrasena: gestor123) con la familia "Gestor de consorcios"
INSERT [dbo].[Usuario] ([Usuario_ID], [Usuario_User], [Usuario_Pass], [Usuario_Bloq], [Usuario_Baja], [Usuario_DVH]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1002', N'Gestor', N'18f2b94d784d03c222cb7c47148cdb8457f1ef3eaf3e317711f25d55747f6a35', 0, 0, 77)
INSERT [dbo].[Usuario_Permiso] ([Permiso_ID], [Usuario_ID]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1001', N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1002')
GO

-- 7. Etiquetas y traducciones de PN01 y del ABM de maestros
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_car_grpCarga')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_car_grpCarga');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cargar reclamo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_car_grpCarga' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Load complaint' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_car_grpCarga' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_car_lblConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_car_lblConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Building' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_car_lblUbicacion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_car_lblUbicacion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ubicación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblUbicacion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Location' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblUbicacion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'rdo_car_rdoUnidadFuncional')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'rdo_car_rdoUnidadFuncional');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Unidad funcional' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'rdo_car_rdoUnidadFuncional' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Unit' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'rdo_car_rdoUnidadFuncional' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'rdo_car_rdoAreaComun')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'rdo_car_rdoAreaComun');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Área común' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'rdo_car_rdoAreaComun' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Common area' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'rdo_car_rdoAreaComun' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_car_lblConsorcista')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_car_lblConsorcista');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcista' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblConsorcista' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Resident' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblConsorcista' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_car_lblCategoria')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_car_lblCategoria');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Categoría' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblCategoria' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Category' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblCategoria' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_car_lblDescripcion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_car_lblDescripcion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Descripción' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblDescripcion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Description' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblDescripcion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_car_lblFotos')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_car_lblFotos');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Fotos (opcional)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblFotos' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Photos (optional)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblFotos' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_car_btnAdjuntarFoto')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_car_btnAdjuntarFoto');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Adjuntar foto' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_car_btnAdjuntarFoto' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Attach photo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_car_btnAdjuntarFoto' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_car_btnGuardar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_car_btnGuardar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Guardar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_car_btnGuardar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Save' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_car_btnGuardar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_car_grpPendientes')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_car_grpPendientes');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reclamos pendientes de clasificación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_car_grpPendientes' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Complaints pending classification' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_car_grpPendientes' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_car_dgvPendientesColId')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_car_dgvPendientesColId');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_car_dgvPendientesColId' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_car_dgvPendientesColId' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_car_dgvPendientesColFechaAlta')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_car_dgvPendientesColFechaAlta');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Fecha de alta' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_car_dgvPendientesColFechaAlta' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Creation date' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_car_dgvPendientesColFechaAlta' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_car_dgvPendientesColConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_car_dgvPendientesColConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_car_dgvPendientesColConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Building' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_car_dgvPendientesColConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_car_dgvPendientesColUbicacion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_car_dgvPendientesColUbicacion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ubicación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_car_dgvPendientesColUbicacion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Location' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_car_dgvPendientesColUbicacion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_car_dgvPendientesColCategoria')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_car_dgvPendientesColCategoria');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Categoría' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_car_dgvPendientesColCategoria' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Category' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_car_dgvPendientesColCategoria' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_car_dgvPendientesColEstado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_car_dgvPendientesColEstado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Estado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_car_dgvPendientesColEstado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Status' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_car_dgvPendientesColEstado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_car_grpClasificacion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_car_grpClasificacion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Clasificar reclamo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_car_grpClasificacion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Classify complaint' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_car_grpClasificacion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_car_lblDatosReclamo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_car_lblDatosReclamo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Datos del reclamo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblDatosReclamo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Complaint data' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblDatosReclamo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_car_lblCategoriaClasificacion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_car_lblCategoriaClasificacion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Categoría' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblCategoriaClasificacion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Category' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblCategoriaClasificacion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_car_lblTipoImputacion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_car_lblTipoImputacion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Tipo de imputación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblTipoImputacion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Charge type' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblTipoImputacion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_car_lblPrioridad')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_car_lblPrioridad');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Prioridad' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblPrioridad' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Priority' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_lblPrioridad' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_car_btnClasificar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_car_btnClasificar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Clasificar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_car_btnClasificar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Classify' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_car_btnClasificar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_bus_grpReclamos')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_bus_grpReclamos');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reclamos clasificados' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_bus_grpReclamos' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Classified complaints' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_bus_grpReclamos' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bus_dgvReclamosColId')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bus_dgvReclamosColId');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvReclamosColId' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvReclamosColId' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bus_dgvReclamosColFechaAlta')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bus_dgvReclamosColFechaAlta');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Fecha de alta' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvReclamosColFechaAlta' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Creation date' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvReclamosColFechaAlta' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bus_dgvReclamosColConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bus_dgvReclamosColConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvReclamosColConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Building' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvReclamosColConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bus_dgvReclamosColCategoria')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bus_dgvReclamosColCategoria');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Categoría' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvReclamosColCategoria' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Category' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvReclamosColCategoria' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bus_dgvReclamosColPrioridad')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bus_dgvReclamosColPrioridad');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Prioridad' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvReclamosColPrioridad' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Priority' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvReclamosColPrioridad' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bus_dgvReclamosColTipoImputacion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bus_dgvReclamosColTipoImputacion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Tipo de imputación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvReclamosColTipoImputacion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Charge type' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvReclamosColTipoImputacion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_bus_grpProveedores')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_bus_grpProveedores');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Proveedores habilitados' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_bus_grpProveedores' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Enabled providers' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_bus_grpProveedores' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bus_dgvProveedoresColProveedor')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bus_dgvProveedoresColProveedor');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Proveedor' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvProveedoresColProveedor' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Provider' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvProveedoresColProveedor' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bus_dgvProveedoresColPrecioPromedio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bus_dgvProveedoresColPrecioPromedio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Precio promedio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvProveedoresColPrecioPromedio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Average price' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvProveedoresColPrecioPromedio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bus_dgvProveedoresColTiempoPromedio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bus_dgvProveedoresColTiempoPromedio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Tiempo promedio (días)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvProveedoresColTiempoPromedio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Average time (days)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvProveedoresColTiempoPromedio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bus_dgvProveedoresColTasaReincidencia')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bus_dgvProveedoresColTasaReincidencia');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Tasa de reincidencia (%)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvProveedoresColTasaReincidencia' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Repeat rate (%)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bus_dgvProveedoresColTasaReincidencia' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'tab_bus_tpMejorPrecio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'tab_bus_tpMejorPrecio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Mejor precio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'tab_bus_tpMejorPrecio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Best price' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'tab_bus_tpMejorPrecio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'tab_bus_tpRecomendado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'tab_bus_tpRecomendado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Recomendado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'tab_bus_tpRecomendado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Recommended' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'tab_bus_tpRecomendado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'tab_bus_tpMasRapido')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'tab_bus_tpMasRapido');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Más rápido' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'tab_bus_tpMasRapido' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Fastest' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'tab_bus_tpMasRapido' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'tab_bus_tpMasEficiente')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'tab_bus_tpMasEficiente');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Más eficiente' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'tab_bus_tpMasEficiente' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Most efficient' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'tab_bus_tpMasEficiente' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_bus_grpDerivacion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_bus_grpDerivacion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Derivación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_bus_grpDerivacion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Referral' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_bus_grpDerivacion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bus_lblSla')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_bus_lblSla');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Plazo de resolución (SLA), en días' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_bus_lblSla' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Resolution deadline (SLA), in days' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_bus_lblSla' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_bus_btnDerivar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_bus_btnDerivar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Derivar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_bus_btnDerivar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Refer' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_bus_btnDerivar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_cie_grpDerivados')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_cie_grpDerivados');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reclamos derivados' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_cie_grpDerivados' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Referred complaints' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_cie_grpDerivados' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_cie_dgvDerivadosColId')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_cie_dgvDerivadosColId');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_cie_dgvDerivadosColId' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_cie_dgvDerivadosColId' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_cie_dgvDerivadosColFechaAlta')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_cie_dgvDerivadosColFechaAlta');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Fecha de alta' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_cie_dgvDerivadosColFechaAlta' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Creation date' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_cie_dgvDerivadosColFechaAlta' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_cie_dgvDerivadosColConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_cie_dgvDerivadosColConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_cie_dgvDerivadosColConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Building' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_cie_dgvDerivadosColConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_cie_dgvDerivadosColCategoria')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_cie_dgvDerivadosColCategoria');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Categoría' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_cie_dgvDerivadosColCategoria' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Category' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_cie_dgvDerivadosColCategoria' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_cie_dgvDerivadosColPrioridad')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_cie_dgvDerivadosColPrioridad');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Prioridad' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_cie_dgvDerivadosColPrioridad' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Priority' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_cie_dgvDerivadosColPrioridad' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_cie_dgvDerivadosColTipoImputacion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_cie_dgvDerivadosColTipoImputacion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Tipo de imputación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_cie_dgvDerivadosColTipoImputacion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Charge type' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_cie_dgvDerivadosColTipoImputacion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_cie_grpCierre')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_cie_grpCierre');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cierre del reclamo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_cie_grpCierre' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Complaint closing' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_cie_grpCierre' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_cie_lblDatosReclamo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_cie_lblDatosReclamo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Datos del reclamo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cie_lblDatosReclamo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Complaint data' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cie_lblDatosReclamo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_cie_lblInforme')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_cie_lblInforme');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Informe de resolución' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cie_lblInforme' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Resolution report' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cie_lblInforme' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_cie_lblNumeroFactura')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_cie_lblNumeroFactura');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Número de factura (opcional)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cie_lblNumeroFactura' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Invoice number (optional)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cie_lblNumeroFactura' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_cie_lblCosto')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_cie_lblCosto');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Costo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cie_lblCosto' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cost' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cie_lblCosto' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_cie_btnCerrarReclamo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_cie_btnCerrarReclamo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cerrar reclamo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_cie_btnCerrarReclamo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Close complaint' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_cie_btnCerrarReclamo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_cie_grpImputacion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_cie_grpImputacion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Imputación resultante' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_cie_grpImputacion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Resulting charge' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_cie_grpImputacion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_cie_lblCuentaTitulo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_cie_lblCuentaTitulo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cuenta imputada:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cie_lblCuentaTitulo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Account charged:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cie_lblCuentaTitulo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_cie_lblMontoTitulo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_cie_lblMontoTitulo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Monto a imputar:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cie_lblMontoTitulo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Amount to charge:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cie_lblMontoTitulo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_cie_btnConfirmarCierre')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_cie_btnConfirmarCierre');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Confirmar cierre' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_cie_btnConfirmarCierre' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Confirm closing' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_cie_btnConfirmarCierre' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_cie_btnCancelar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_cie_btnCancelar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cancelar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_cie_btnCancelar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cancel' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_cie_btnCancelar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_his_grpFiltros')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_his_grpFiltros');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Filtros' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_his_grpFiltros' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Filters' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_his_grpFiltros' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_his_lblConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_his_lblConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_lblConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Building' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_lblConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_his_lblProveedor')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_his_lblProveedor');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Proveedor' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_lblProveedor' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Provider' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_lblProveedor' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_his_lblCategoria')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_his_lblCategoria');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Categoría' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_lblCategoria' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Category' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_lblCategoria' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_his_lblEstado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_his_lblEstado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Estado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_lblEstado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Status' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_lblEstado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_his_lblDesde')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_his_lblDesde');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Desde' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_lblDesde' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'From' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_lblDesde' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_his_lblHasta')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_his_lblHasta');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Hasta' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_lblHasta' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'To' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_lblHasta' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_his_btnFiltrar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_his_btnFiltrar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Filtrar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_his_btnFiltrar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Filter' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_his_btnFiltrar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_his_grpHistorial')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_his_grpHistorial');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Historial de reclamos' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_his_grpHistorial' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Complaint history' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_his_grpHistorial' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_his_dgvReclamosColId')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_his_dgvReclamosColId');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColId' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColId' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_his_dgvReclamosColFechaAlta')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_his_dgvReclamosColFechaAlta');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Fecha de alta' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColFechaAlta' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Creation date' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColFechaAlta' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_his_dgvReclamosColConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_his_dgvReclamosColConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Building' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_his_dgvReclamosColCategoria')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_his_dgvReclamosColCategoria');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Categoría' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColCategoria' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Category' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColCategoria' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_his_dgvReclamosColEstado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_his_dgvReclamosColEstado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Estado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColEstado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Status' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColEstado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_his_dgvReclamosColPrioridad')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_his_dgvReclamosColPrioridad');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Prioridad' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColPrioridad' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Priority' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColPrioridad' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_his_dgvReclamosColTipoImputacion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_his_dgvReclamosColTipoImputacion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Tipo de imputación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColTipoImputacion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Charge type' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColTipoImputacion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_his_dgvReclamosColReincidente')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_his_dgvReclamosColReincidente');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reincidente' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColReincidente' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Repeat' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColReincidente' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_his_dgvReclamosColDescripcion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_his_dgvReclamosColDescripcion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Descripción' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColDescripcion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Description' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvReclamosColDescripcion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_his_btnExportarHistorial')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_his_btnExportarHistorial');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Exportar historial' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_his_btnExportarHistorial' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Export history' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_his_btnExportarHistorial' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_his_grpDesempeno')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_his_grpDesempeno');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Desempeño histórico por proveedor' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_his_grpDesempeno' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Historical performance by provider' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_his_grpDesempeno' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_his_dgvDesempenoColProveedor')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_his_dgvDesempenoColProveedor');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Proveedor' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvDesempenoColProveedor' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Provider' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvDesempenoColProveedor' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_his_dgvDesempenoColCategoria')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_his_dgvDesempenoColCategoria');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Categoría' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvDesempenoColCategoria' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Category' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvDesempenoColCategoria' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_his_dgvDesempenoColPrecioPromedio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_his_dgvDesempenoColPrecioPromedio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Precio promedio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvDesempenoColPrecioPromedio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Average price' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvDesempenoColPrecioPromedio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_his_dgvDesempenoColTiempoPromedio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_his_dgvDesempenoColTiempoPromedio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Tiempo promedio (días)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvDesempenoColTiempoPromedio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Average time (days)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvDesempenoColTiempoPromedio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_his_dgvDesempenoColTasaReincidencia')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_his_dgvDesempenoColTasaReincidencia');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Tasa de reincidencia (%)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvDesempenoColTasaReincidencia' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Repeat rate (%)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvDesempenoColTasaReincidencia' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_his_dgvDesempenoColReclamosResueltos')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_his_dgvDesempenoColReclamosResueltos');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reclamos resueltos' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvDesempenoColReclamosResueltos' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Resolved complaints' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_his_dgvDesempenoColReclamosResueltos' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_his_btnExportarDesempeno')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_his_btnExportarDesempeno');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Exportar desempeño' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_his_btnExportarDesempeno' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Export performance' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_his_btnExportarDesempeno' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_his_lblProveedorDesempeno')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_his_lblProveedorDesempeno');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Proveedor' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_lblProveedorDesempeno' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Provider' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_lblProveedorDesempeno' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_his_btnVerDesempeno')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_his_btnVerDesempeno');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ver desempeño' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_his_btnVerDesempeno' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'View performance' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_his_btnVerDesempeno' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'tab_man_tpConsorcios')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'tab_man_tpConsorcios');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcios' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'tab_man_tpConsorcios' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Buildings' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'tab_man_tpConsorcios' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'tab_man_tpUnidadesFuncionales')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'tab_man_tpUnidadesFuncionales');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Unidades funcionales' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'tab_man_tpUnidadesFuncionales' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Units' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'tab_man_tpUnidadesFuncionales' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'tab_man_tpConsorcistas')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'tab_man_tpConsorcistas');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcistas' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'tab_man_tpConsorcistas' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Residents' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'tab_man_tpConsorcistas' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_man_dgvConsorciosColId')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_man_dgvConsorciosColId');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorciosColId' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorciosColId' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_man_dgvConsorciosColNombre')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_man_dgvConsorciosColNombre');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Nombre' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorciosColNombre' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Name' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorciosColNombre' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_man_dgvConsorciosColDireccion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_man_dgvConsorciosColDireccion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Dirección' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorciosColDireccion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Address' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorciosColDireccion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_man_dgvConsorciosColCantidadUnidades')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_man_dgvConsorciosColCantidadUnidades');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cantidad de unidades' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorciosColCantidadUnidades' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Number of units' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorciosColCantidadUnidades' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_man_dgvConsorciosColActivo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_man_dgvConsorciosColActivo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Activo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorciosColActivo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Active' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorciosColActivo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_man_lblNombre')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_man_lblNombre');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Nombre' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblNombre' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Name' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblNombre' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_man_lblDireccion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_man_lblDireccion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Dirección' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblDireccion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Address' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblDireccion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_man_lblCantidadUnidades')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_man_lblCantidadUnidades');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cantidad de unidades' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblCantidadUnidades' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Number of units' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblCantidadUnidades' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'chk_man_chkActivo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'chk_man_chkActivo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Activo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'chk_man_chkActivo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Active' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'chk_man_chkActivo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_man_btnNuevoConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_man_btnNuevoConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Nuevo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnNuevoConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'New' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnNuevoConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_man_btnGuardarConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_man_btnGuardarConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Guardar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnGuardarConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Save' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnGuardarConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_man_btnInactivarConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_man_btnInactivarConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Inactivar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnInactivarConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Deactivate' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnInactivarConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_man_btnReactivarConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_man_btnReactivarConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reactivar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnReactivarConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reactivate' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnReactivarConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_man_btnCancelarConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_man_btnCancelarConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cancelar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnCancelarConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cancel' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnCancelarConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_man_dgvUnidadesFuncionalesColId')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_man_dgvUnidadesFuncionalesColId');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvUnidadesFuncionalesColId' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvUnidadesFuncionalesColId' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_man_dgvUnidadesFuncionalesColIdentificador')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_man_dgvUnidadesFuncionalesColIdentificador');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Identificador' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvUnidadesFuncionalesColIdentificador' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Identifier' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvUnidadesFuncionalesColIdentificador' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_man_dgvUnidadesFuncionalesColTipo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_man_dgvUnidadesFuncionalesColTipo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Tipo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvUnidadesFuncionalesColTipo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Type' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvUnidadesFuncionalesColTipo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_man_dgvUnidadesFuncionalesColActiva')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_man_dgvUnidadesFuncionalesColActiva');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Activa' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvUnidadesFuncionalesColActiva' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Active' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvUnidadesFuncionalesColActiva' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_man_lblConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_man_lblConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Building' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_man_lblIdentificador')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_man_lblIdentificador');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Identificador' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblIdentificador' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Identifier' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblIdentificador' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_man_lblTipo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_man_lblTipo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Tipo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblTipo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Type' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblTipo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'chk_man_chkActiva')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'chk_man_chkActiva');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Activa' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'chk_man_chkActiva' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Active' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'chk_man_chkActiva' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_man_btnNuevoUnidadFuncional')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_man_btnNuevoUnidadFuncional');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Nuevo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnNuevoUnidadFuncional' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'New' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnNuevoUnidadFuncional' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_man_btnGuardarUnidadFuncional')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_man_btnGuardarUnidadFuncional');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Guardar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnGuardarUnidadFuncional' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Save' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnGuardarUnidadFuncional' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_man_btnInactivarUnidadFuncional')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_man_btnInactivarUnidadFuncional');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Inactivar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnInactivarUnidadFuncional' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Deactivate' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnInactivarUnidadFuncional' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_man_btnReactivarUnidadFuncional')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_man_btnReactivarUnidadFuncional');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reactivar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnReactivarUnidadFuncional' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reactivate' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnReactivarUnidadFuncional' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_man_btnCancelarUnidadFuncional')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_man_btnCancelarUnidadFuncional');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cancelar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnCancelarUnidadFuncional' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cancel' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnCancelarUnidadFuncional' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_man_dgvConsorcistasColId')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_man_dgvConsorcistasColId');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorcistasColId' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorcistasColId' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_man_dgvConsorcistasColDni')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_man_dgvConsorcistasColDni');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'DNI' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorcistasColDni' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'National ID' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorcistasColDni' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_man_dgvConsorcistasColNombre')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_man_dgvConsorcistasColNombre');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Nombre' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorcistasColNombre' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Name' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorcistasColNombre' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_man_dgvConsorcistasColEmail')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_man_dgvConsorcistasColEmail');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Email' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorcistasColEmail' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Email' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorcistasColEmail' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_man_dgvConsorcistasColTipo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_man_dgvConsorcistasColTipo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Propietario/Inquilino' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorcistasColTipo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Owner/Tenant' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorcistasColTipo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_man_dgvConsorcistasColActivo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_man_dgvConsorcistasColActivo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Activo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorcistasColActivo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Active' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_man_dgvConsorcistasColActivo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_man_lblConsorcioConsorcista')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_man_lblConsorcioConsorcista');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblConsorcioConsorcista' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Building' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblConsorcioConsorcista' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_man_lblUnidadFuncionalConsorcista')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_man_lblUnidadFuncionalConsorcista');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Unidad funcional' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblUnidadFuncionalConsorcista' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Unit' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblUnidadFuncionalConsorcista' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_man_lblDni')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_man_lblDni');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'DNI' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblDni' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'National ID' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblDni' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_man_lblNombreConsorcista')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_man_lblNombreConsorcista');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Nombre' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblNombreConsorcista' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Name' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblNombreConsorcista' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_man_lblEmailConsorcista')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_man_lblEmailConsorcista');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Email' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblEmailConsorcista' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Email' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_lblEmailConsorcista' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'rdo_man_rdoPropietario')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'rdo_man_rdoPropietario');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Propietario' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'rdo_man_rdoPropietario' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Owner' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'rdo_man_rdoPropietario' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'rdo_man_rdoInquilino')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'rdo_man_rdoInquilino');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Inquilino' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'rdo_man_rdoInquilino' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Tenant' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'rdo_man_rdoInquilino' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'chk_man_chkActivoConsorcista')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'chk_man_chkActivoConsorcista');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Activo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'chk_man_chkActivoConsorcista' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Active' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'chk_man_chkActivoConsorcista' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_man_btnNuevoConsorcista')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_man_btnNuevoConsorcista');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Nuevo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnNuevoConsorcista' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'New' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnNuevoConsorcista' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_man_btnGuardarConsorcista')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_man_btnGuardarConsorcista');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Guardar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnGuardarConsorcista' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Save' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnGuardarConsorcista' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_man_btnInactivarConsorcista')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_man_btnInactivarConsorcista');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Inactivar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnInactivarConsorcista' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Deactivate' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnInactivarConsorcista' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_man_btnReactivarConsorcista')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_man_btnReactivarConsorcista');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reactivar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnReactivarConsorcista' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reactivate' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnReactivarConsorcista' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_man_btnCancelarConsorcista')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_man_btnCancelarConsorcista');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cancelar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnCancelarConsorcista' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cancel' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_man_btnCancelarConsorcista' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_mantenimientoConsorcios')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_mantenimientoConsorcios');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Mantenimiento de consorcios' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_mantenimientoConsorcios' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Building maintenance' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_mantenimientoConsorcios' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_menuReclamos')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_menuReclamos');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reclamos' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_menuReclamos' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Complaints' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_menuReclamos' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_cargarClasificarReclamo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_cargarClasificarReclamo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cargar y clasificar reclamo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cargarClasificarReclamo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Load and classify complaint' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cargarClasificarReclamo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_buscarDerivarProveedor')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_buscarDerivarProveedor');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Buscar y derivar proveedor' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_buscarDerivarProveedor' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Search and refer provider' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_buscarDerivarProveedor' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_cerrarReclamoImputarCosto')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_cerrarReclamoImputarCosto');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cerrar reclamo e imputar costo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cerrarReclamoImputarCosto' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Close complaint and charge cost' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cerrarReclamoImputarCosto' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_consultarHistorial')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_consultarHistorial');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consultar historial' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_consultarHistorial' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'View history' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_consultarHistorial' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_tipoImputacion_comun')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_tipoImputacion_comun');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Común' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_tipoImputacion_comun' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Common' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_tipoImputacion_comun' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_tipoImputacion_particular')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_tipoImputacion_particular');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Particular' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_tipoImputacion_particular' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Individual' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_tipoImputacion_particular' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_prioridad_urgente')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_prioridad_urgente');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Urgente' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_prioridad_urgente' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Urgent' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_prioridad_urgente' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_prioridad_media')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_prioridad_media');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Media' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_prioridad_media' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Medium' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_prioridad_media' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_prioridad_baja')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_prioridad_baja');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Baja' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_prioridad_baja' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Low' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_prioridad_baja' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_estado_todos')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_estado_todos');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'(Todos)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_estado_todos' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'(All)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_estado_todos' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_estado_pendiente')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_estado_pendiente');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Pendiente de clasificación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_estado_pendiente' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Pending classification' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_estado_pendiente' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_estado_clasificado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_estado_clasificado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Clasificado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_estado_clasificado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Classified' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_estado_clasificado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_estado_derivado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_estado_derivado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Derivado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_estado_derivado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Referred' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_estado_derivado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_estado_cerrado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_estado_cerrado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cerrado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_estado_cerrado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Closed' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_estado_cerrado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_tipoUF_departamento')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_tipoUF_departamento');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Departamento' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_tipoUF_departamento' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Apartment' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_tipoUF_departamento' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_tipoUF_cochera')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_tipoUF_cochera');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cochera' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_tipoUF_cochera' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Garage' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_tipoUF_cochera' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_tipoUF_local')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_tipoUF_local');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Local' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_tipoUF_local' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Store' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_tipoUF_local' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_tipoUF_baulera')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_tipoUF_baulera');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Baulera' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_tipoUF_baulera' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Storage unit' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_tipoUF_baulera' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_gastoParticularSinUnidad')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_gastoParticularSinUnidad');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'El gasto particular requiere una unidad funcional' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_gastoParticularSinUnidad' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'An individual expense requires a unit' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_gastoParticularSinUnidad' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_plazoSlaInvalido')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_plazoSlaInvalido');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ingrese un plazo de resolución válido' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_plazoSlaInvalido' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Enter a valid resolution deadline' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_plazoSlaInvalido' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_informeCostoRequerido')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_informeCostoRequerido');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Complete el informe y un costo mayor a cero' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_informeCostoRequerido' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Complete the report and a cost greater than zero' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_informeCostoRequerido' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_fechasInvertidas')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_fechasInvertidas');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'La fecha desde no puede ser posterior a la fecha hasta' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_fechasInvertidas' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'The from date cannot be later than the to date' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_fechasInvertidas' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_consorcioDatosIncompletos')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_consorcioDatosIncompletos');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Complete el nombre, la dirección y una cantidad de unidades mayor a cero' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_consorcioDatosIncompletos' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Complete the name, address and a number of units greater than zero' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_consorcioDatosIncompletos' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_consorcioNoInactivable')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_consorcioNoInactivable');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'No se puede inactivar: el consorcio tiene unidades funcionales activas o reclamos en curso' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_consorcioNoInactivable' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cannot deactivate: the building has active units or complaints in progress' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_consorcioNoInactivable' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_unidadFuncionalNoInactivable')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_unidadFuncionalNoInactivable');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'No se puede inactivar: la unidad funcional tiene consorcistas activos o reclamos en curso' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_unidadFuncionalNoInactivable' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cannot deactivate: the unit has active residents or complaints in progress' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_unidadFuncionalNoInactivable' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_unidadFuncionalDuplicada')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_unidadFuncionalDuplicada');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ya existe una unidad funcional con ese identificador en el consorcio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_unidadFuncionalDuplicada' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'A unit with that identifier already exists in the building' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_unidadFuncionalDuplicada' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_consorcistaNoInactivable')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_consorcistaNoInactivable');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'No se puede inactivar: el consorcista tiene reclamos en curso' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_consorcistaNoInactivable' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cannot deactivate: the resident has complaints in progress' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_consorcistaNoInactivable' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_dniInvalido')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_dniInvalido');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ingrese un DNI válido' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_dniInvalido' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Enter a valid national ID' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_dniInvalido' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_emailInvalido')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_emailInvalido');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ingrese un email válido' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_emailInvalido' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Enter a valid email' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_emailInvalido' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_car_reclamoRegistrado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_car_reclamoRegistrado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reclamo registrado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_reclamoRegistrado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Complaint registered' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_reclamoRegistrado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_car_confirmarReincidencia')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_car_confirmarReincidencia');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Existe un reclamo cerrado hace menos de 30 días con la misma ubicación y categoría (N.º {0}). ¿Se trata del mismo problema?' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_confirmarReincidencia' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'There is a complaint closed less than 30 days ago with the same location and category (No. {0}). Is this the same problem?' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_confirmarReincidencia' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_car_reclamoClasificado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_car_reclamoClasificado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reclamo clasificado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_reclamoClasificado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Complaint classified' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_car_reclamoClasificado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bus_reclamoDerivado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_bus_reclamoDerivado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reclamo derivado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_bus_reclamoDerivado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Complaint referred' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_bus_reclamoDerivado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_cie_reclamoCerrado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_cie_reclamoCerrado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Reclamo cerrado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cie_reclamoCerrado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Complaint closed' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_cie_reclamoCerrado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_his_pdfGenerado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_his_pdfGenerado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'PDF generado correctamente' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_pdfGenerado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'PDF generated successfully' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_his_pdfGenerado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_man_guardado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_man_guardado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Guardado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_guardado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Saved' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_man_guardado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO

-- 8. Datos de prueba de PN01 (con los digitos verificadores ya calculados)
SET IDENTITY_INSERT [dbo].[CONSORCIO] ON
INSERT [dbo].[CONSORCIO] ([IdConsorcio_413BE], [Nombre_413BE], [Direccion_413BE], [CantidadUnidades_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (1, N'Edificio Belgrano 1450', N'Av. Belgrano 1450', 12, 1, 40)
INSERT [dbo].[CONSORCIO] ([IdConsorcio_413BE], [Nombre_413BE], [Direccion_413BE], [CantidadUnidades_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (2, N'Torre Rivadavia 320', N'Av. Rivadavia 320', 8, 1, 80)
SET IDENTITY_INSERT [dbo].[CONSORCIO] OFF
GO
SET IDENTITY_INSERT [dbo].[UNIDAD_FUNCIONAL] ON
INSERT [dbo].[UNIDAD_FUNCIONAL] ([IdUnidadFuncional_413BE], [IdConsorcio_413BE], [Identificador_413BE], [Tipo_413BE], [Activa_413BE], [Dvh_413BE]) VALUES (1, 1, N'1A', N'Departamento', 1, 83)
INSERT [dbo].[UNIDAD_FUNCIONAL] ([IdUnidadFuncional_413BE], [IdConsorcio_413BE], [Identificador_413BE], [Tipo_413BE], [Activa_413BE], [Dvh_413BE]) VALUES (2, 1, N'1B', N'Departamento', 1, 87)
INSERT [dbo].[UNIDAD_FUNCIONAL] ([IdUnidadFuncional_413BE], [IdConsorcio_413BE], [Identificador_413BE], [Tipo_413BE], [Activa_413BE], [Dvh_413BE]) VALUES (3, 1, N'2A', N'Departamento', 1, 85)
INSERT [dbo].[UNIDAD_FUNCIONAL] ([IdUnidadFuncional_413BE], [IdConsorcio_413BE], [Identificador_413BE], [Tipo_413BE], [Activa_413BE], [Dvh_413BE]) VALUES (4, 1, N'2B', N'Departamento', 1, 89)
INSERT [dbo].[UNIDAD_FUNCIONAL] ([IdUnidadFuncional_413BE], [IdConsorcio_413BE], [Identificador_413BE], [Tipo_413BE], [Activa_413BE], [Dvh_413BE]) VALUES (5, 1, N'3A', N'Departamento', 1, 87)
INSERT [dbo].[UNIDAD_FUNCIONAL] ([IdUnidadFuncional_413BE], [IdConsorcio_413BE], [Identificador_413BE], [Tipo_413BE], [Activa_413BE], [Dvh_413BE]) VALUES (6, 1, N'C1', N'Cochera', 1, 65)
INSERT [dbo].[UNIDAD_FUNCIONAL] ([IdUnidadFuncional_413BE], [IdConsorcio_413BE], [Identificador_413BE], [Tipo_413BE], [Activa_413BE], [Dvh_413BE]) VALUES (7, 2, N'1A', N'Departamento', 1, 84)
INSERT [dbo].[UNIDAD_FUNCIONAL] ([IdUnidadFuncional_413BE], [IdConsorcio_413BE], [Identificador_413BE], [Tipo_413BE], [Activa_413BE], [Dvh_413BE]) VALUES (8, 2, N'1B', N'Departamento', 1, 88)
INSERT [dbo].[UNIDAD_FUNCIONAL] ([IdUnidadFuncional_413BE], [IdConsorcio_413BE], [Identificador_413BE], [Tipo_413BE], [Activa_413BE], [Dvh_413BE]) VALUES (9, 2, N'2A', N'Departamento', 1, 86)
INSERT [dbo].[UNIDAD_FUNCIONAL] ([IdUnidadFuncional_413BE], [IdConsorcio_413BE], [Identificador_413BE], [Tipo_413BE], [Activa_413BE], [Dvh_413BE]) VALUES (10, 2, N'2B', N'Departamento', 1, 90)
INSERT [dbo].[UNIDAD_FUNCIONAL] ([IdUnidadFuncional_413BE], [IdConsorcio_413BE], [Identificador_413BE], [Tipo_413BE], [Activa_413BE], [Dvh_413BE]) VALUES (11, 2, N'3A', N'Departamento', 1, 88)
INSERT [dbo].[UNIDAD_FUNCIONAL] ([IdUnidadFuncional_413BE], [IdConsorcio_413BE], [Identificador_413BE], [Tipo_413BE], [Activa_413BE], [Dvh_413BE]) VALUES (12, 2, N'C1', N'Cochera', 1, 66)
SET IDENTITY_INSERT [dbo].[UNIDAD_FUNCIONAL] OFF
GO
SET IDENTITY_INSERT [dbo].[CONSORCISTA] ON
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (1, 1, N'20111111', N'Marta Gómez', N'marta.gomez@example.com', 1, 1, 16)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (2, 2, N'20222222', N'Luis Fernández', N'luis.fernandez@example.com', 1, 1, 78)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (3, 3, N'20333333', N'Ana Ríos', N'ana.rios@example.com', 1, 1, 24)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (4, 4, N'20444444', N'Jorge Molina', N'jorge.molina@example.com', 1, 1, 34)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (5, 5, N'20555555', N'Sofía Herrera', N'sofia.herrera@example.com', 1, 1, 74)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (6, 6, N'20666666', N'Carlos Peralta', N'carlos.peralta@example.com', 1, 1, 50)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (7, 7, N'30111111', N'Laura Benítez', N'laura.benitez@example.com', 1, 1, 85)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (8, 8, N'30222222', N'Diego Acosta', N'diego.acosta@example.com', 1, 1, 47)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (9, 9, N'30333333', N'Paula Suárez', N'paula.suarez@example.com', 1, 1, 76)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (10, 10, N'30444444', N'Martín Ortiz', N'martin.ortiz@example.com', 1, 1, 11)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (11, 11, N'30555555', N'Elena Castro', N'elena.castro@example.com', 1, 1, 63)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (12, 12, N'30666666', N'Raúl Domínguez', N'raul.dominguez@example.com', 1, 1, 76)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (13, 1, N'40111111', N'Julián Vega', N'julian.vega@example.com', 0, 1, 51)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (14, 2, N'40222222', N'Camila Torres', N'camila.torres@example.com', 0, 1, 76)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (15, 3, N'40333333', N'Nicolás Paz', N'nicolas.paz@example.com', 0, 1, 7)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (16, 7, N'50111111', N'Valeria Luna', N'valeria.luna@example.com', 0, 1, 86)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (17, 8, N'50222222', N'Andrés Rojas', N'andres.rojas@example.com', 0, 1, 20)
INSERT [dbo].[CONSORCISTA] ([IdConsorcista_413BE], [IdUnidadFuncional_413BE], [Dni_413BE], [Nombre_413BE], [Email_413BE], [EsPropietario_413BE], [Activo_413BE], [Dvh_413BE]) VALUES (18, 9, N'50333333', N'Florencia Díaz', N'florencia.diaz@example.com', 0, 1, 71)
SET IDENTITY_INSERT [dbo].[CONSORCISTA] OFF
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON
INSERT [dbo].[CATEGORIA] ([IdCategoria_413BE], [Nombre_413BE], [Dvh_413BE]) VALUES (1, N'Plomería', 33)
INSERT [dbo].[CATEGORIA] ([IdCategoria_413BE], [Nombre_413BE], [Dvh_413BE]) VALUES (2, N'Electricidad', 33)
INSERT [dbo].[CATEGORIA] ([IdCategoria_413BE], [Nombre_413BE], [Dvh_413BE]) VALUES (3, N'Ascensor', 45)
INSERT [dbo].[CATEGORIA] ([IdCategoria_413BE], [Nombre_413BE], [Dvh_413BE]) VALUES (4, N'Gas', 28)
INSERT [dbo].[CATEGORIA] ([IdCategoria_413BE], [Nombre_413BE], [Dvh_413BE]) VALUES (5, N'Cerrajería', 23)
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
SET IDENTITY_INSERT [dbo].[PROVEEDOR] ON
INSERT [dbo].[PROVEEDOR] ([IdProveedor_413BE], [Nombre_413BE], [Cuit_413BE], [Email_413BE], [Habilitado_413BE], [Dvh_413BE]) VALUES (1, N'Hidro Sur SRL', N'30-70000001-1', N'contacto@hidrosur.example.com', 1, 8)
INSERT [dbo].[PROVEEDOR] ([IdProveedor_413BE], [Nombre_413BE], [Cuit_413BE], [Email_413BE], [Habilitado_413BE], [Dvh_413BE]) VALUES (2, N'Aguas y Caños SA', N'30-70000002-2', N'contacto@aguasycanos.example.com', 1, 88)
INSERT [dbo].[PROVEEDOR] ([IdProveedor_413BE], [Nombre_413BE], [Cuit_413BE], [Email_413BE], [Habilitado_413BE], [Dvh_413BE]) VALUES (3, N'Plomería Express', N'30-70000003-3', N'contacto@plomeriaexpress.example.com', 1, 65)
INSERT [dbo].[PROVEEDOR] ([IdProveedor_413BE], [Nombre_413BE], [Cuit_413BE], [Email_413BE], [Habilitado_413BE], [Dvh_413BE]) VALUES (4, N'Electro Norte SRL', N'30-70000004-4', N'contacto@electronorte.example.com', 1, 10)
INSERT [dbo].[PROVEEDOR] ([IdProveedor_413BE], [Nombre_413BE], [Cuit_413BE], [Email_413BE], [Habilitado_413BE], [Dvh_413BE]) VALUES (5, N'Instalaciones Integrales SA', N'30-70000005-5', N'contacto@instintegrales.example.com', 1, 65)
INSERT [dbo].[PROVEEDOR] ([IdProveedor_413BE], [Nombre_413BE], [Cuit_413BE], [Email_413BE], [Habilitado_413BE], [Dvh_413BE]) VALUES (6, N'Elevar Ascensores SA', N'30-70000006-6', N'contacto@elevar.example.com', 1, 95)
INSERT [dbo].[PROVEEDOR] ([IdProveedor_413BE], [Nombre_413BE], [Cuit_413BE], [Email_413BE], [Habilitado_413BE], [Dvh_413BE]) VALUES (7, N'Cerrajería Llave Maestra', N'30-70000007-7', N'contacto@llavemaestra.example.com', 1, 96)
SET IDENTITY_INSERT [dbo].[PROVEEDOR] OFF
GO
INSERT [dbo].[PROVEEDOR_CATEGORIA] ([IdProveedor_413BE], [IdCategoria_413BE], [Dvh_413BE]) VALUES (1, 1, 50)
INSERT [dbo].[PROVEEDOR_CATEGORIA] ([IdProveedor_413BE], [IdCategoria_413BE], [Dvh_413BE]) VALUES (2, 1, 51)
INSERT [dbo].[PROVEEDOR_CATEGORIA] ([IdProveedor_413BE], [IdCategoria_413BE], [Dvh_413BE]) VALUES (3, 1, 52)
INSERT [dbo].[PROVEEDOR_CATEGORIA] ([IdProveedor_413BE], [IdCategoria_413BE], [Dvh_413BE]) VALUES (4, 2, 55)
INSERT [dbo].[PROVEEDOR_CATEGORIA] ([IdProveedor_413BE], [IdCategoria_413BE], [Dvh_413BE]) VALUES (5, 2, 56)
INSERT [dbo].[PROVEEDOR_CATEGORIA] ([IdProveedor_413BE], [IdCategoria_413BE], [Dvh_413BE]) VALUES (5, 4, 60)
INSERT [dbo].[PROVEEDOR_CATEGORIA] ([IdProveedor_413BE], [IdCategoria_413BE], [Dvh_413BE]) VALUES (6, 3, 59)
INSERT [dbo].[PROVEEDOR_CATEGORIA] ([IdProveedor_413BE], [IdCategoria_413BE], [Dvh_413BE]) VALUES (7, 5, 64)
GO
SET IDENTITY_INSERT [dbo].[RECLAMO] ON
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (1, 1, 1, 1, 1, NULL, NULL, N'Reclamo de historial: Plomería', CAST(N'2026-06-21T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'MEDIA_413BE', N'PARTICULAR_413BE', 0, 21)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (2, 1, 2, 1, 2, NULL, NULL, N'Reclamo de historial: Plomería', CAST(N'2026-07-10T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'MEDIA_413BE', N'PARTICULAR_413BE', 0, 28)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (3, 2, 7, 1, 7, NULL, NULL, N'Reclamo de historial: Plomería', CAST(N'2026-07-31T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'MEDIA_413BE', N'PARTICULAR_413BE', 0, 89)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (4, 1, 3, 1, 3, NULL, NULL, N'Reclamo de historial: Plomería', CAST(N'2026-06-27T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'BAJA_413BE', N'PARTICULAR_413BE', 0, 0)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (5, 1, 4, 1, 4, NULL, NULL, N'Reclamo de historial: Plomería', CAST(N'2026-07-18T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'MEDIA_413BE', N'PARTICULAR_413BE', 0, 1)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (6, 1, 1, 1, 1, NULL, NULL, N'Reclamo de historial: Plomería', CAST(N'2026-09-09T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'URGENTE_413BE', N'PARTICULAR_413BE', 0, 6)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (7, 2, 8, 1, 8, NULL, NULL, N'Reclamo de historial: Plomería', CAST(N'2026-08-05T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'MEDIA_413BE', N'PARTICULAR_413BE', 0, 61)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (8, 1, 5, 1, 5, NULL, NULL, N'Reclamo de historial: Plomería', CAST(N'2026-08-28T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'BAJA_413BE', N'PARTICULAR_413BE', 0, 10)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (9, 1, 3, 1, 3, NULL, 4, N'Reclamo de historial: Plomería', CAST(N'2026-08-05T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'MEDIA_413BE', N'PARTICULAR_413BE', 1, 39)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (10, 2, 7, 1, 7, NULL, 3, N'Reclamo de historial: Plomería', CAST(N'2026-08-25T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'MEDIA_413BE', N'PARTICULAR_413BE', 1, 8)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (11, 1, 1, 2, 1, NULL, NULL, N'Reclamo de historial: Electricidad', CAST(N'2026-07-15T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'MEDIA_413BE', N'PARTICULAR_413BE', 0, 79)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (12, 2, 9, 2, 9, NULL, NULL, N'Reclamo de historial: Electricidad', CAST(N'2026-08-13T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'MEDIA_413BE', N'PARTICULAR_413BE', 0, 24)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (13, 1, 2, 2, 2, NULL, NULL, N'Reclamo de historial: Electricidad', CAST(N'2026-07-27T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'URGENTE_413BE', N'PARTICULAR_413BE', 0, 26)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (14, 2, 10, 2, 10, NULL, NULL, N'Reclamo de historial: Electricidad', CAST(N'2026-08-20T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'MEDIA_413BE', N'PARTICULAR_413BE', 0, 93)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (15, 2, 9, 2, 9, NULL, 12, N'Reclamo de historial: Electricidad', CAST(N'2026-09-05T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'URGENTE_413BE', N'PARTICULAR_413BE', 1, 80)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (16, 1, 1, 3, NULL, N'Ascensor', NULL, N'Reclamo de historial: Ascensor', CAST(N'2026-07-04T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'URGENTE_413BE', N'COMUN_413BE', 0, 71)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (17, 2, 7, 3, NULL, N'Ascensor', NULL, N'Reclamo de historial: Ascensor', CAST(N'2026-08-16T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'URGENTE_413BE', N'COMUN_413BE', 0, 81)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (18, 1, 5, 4, 5, NULL, NULL, N'Reclamo de historial: Gas', CAST(N'2026-08-08T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'MEDIA_413BE', N'PARTICULAR_413BE', 0, 56)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (19, 2, 11, 5, 11, NULL, NULL, N'Reclamo de historial: Cerrajería', CAST(N'2026-08-30T12:00:00.000' AS DateTime), N'CERRADO_413BE', N'BAJA_413BE', N'PARTICULAR_413BE', 0, 69)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (20, 1, 5, 2, 5, NULL, NULL, N'Se cortó la luz del palier del tercer piso', CAST(N'2026-09-21T12:00:00.000' AS DateTime), N'PENDIENTE_CLASIFICACION_413BE', NULL, NULL, 0, 18)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (21, 2, 8, 1, NULL, N'Terraza', NULL, N'Filtración de agua en la terraza', CAST(N'2026-09-22T12:00:00.000' AS DateTime), N'PENDIENTE_CLASIFICACION_413BE', NULL, NULL, 0, 17)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (22, 1, 6, 5, 6, NULL, NULL, N'La cerradura de la cochera no gira', CAST(N'2026-09-23T12:00:00.000' AS DateTime), N'PENDIENTE_CLASIFICACION_413BE', NULL, NULL, 0, 67)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (23, 1, 4, 1, 4, NULL, NULL, N'Pérdida de agua en la cocina', CAST(N'2026-09-18T12:00:00.000' AS DateTime), N'CLASIFICADO_413BE', N'MEDIA_413BE', N'COMUN_413BE', 0, 24)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (24, 2, 12, 2, NULL, N'Sala de máquinas', NULL, N'Tablero eléctrico con chispas', CAST(N'2026-09-19T12:00:00.000' AS DateTime), N'CLASIFICADO_413BE', N'URGENTE_413BE', N'COMUN_413BE', 0, 57)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (25, 1, 5, 4, 5, NULL, NULL, N'Olor a gas en la cocina', CAST(N'2026-09-20T12:00:00.000' AS DateTime), N'CLASIFICADO_413BE', N'BAJA_413BE', N'PARTICULAR_413BE', 0, 78)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (26, 1, 2, 1, 2, NULL, NULL, N'Canilla del baño pierde agua', CAST(N'2026-09-15T12:00:00.000' AS DateTime), N'DERIVADO_413BE', N'MEDIA_413BE', N'COMUN_413BE', 0, 26)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (27, 2, 7, 3, NULL, N'Ascensor', NULL, N'El ascensor queda detenido entre pisos', CAST(N'2026-09-16T12:00:00.000' AS DateTime), N'DERIVADO_413BE', N'URGENTE_413BE', N'COMUN_413BE', 0, 65)
INSERT [dbo].[RECLAMO] ([IdReclamo_413BE], [IdConsorcio_413BE], [IdConsorcista_413BE], [IdCategoria_413BE], [IdUnidadFuncional_413BE], [AreaComun_413BE], [IdReclamoOriginal_413BE], [Descripcion_413BE], [FechaAlta_413BE], [Estado_413BE], [Prioridad_413BE], [TipoImputacion_413BE], [Reincidente_413BE], [Dvh_413BE]) VALUES (28, 1, 3, 2, 3, NULL, NULL, N'Tomacorrientes sin energía', CAST(N'2026-09-17T12:00:00.000' AS DateTime), N'DERIVADO_413BE', N'BAJA_413BE', N'PARTICULAR_413BE', 0, 31)
SET IDENTITY_INSERT [dbo].[RECLAMO] OFF
GO
GO
SET IDENTITY_INSERT [dbo].[DERIVACION] ON
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (1, 1, 1, CAST(N'2026-06-23T12:00:00.000' AS DateTime), 7, 71)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (2, 2, 1, CAST(N'2026-07-12T12:00:00.000' AS DateTime), 7, 36)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (3, 3, 1, CAST(N'2026-08-02T12:00:00.000' AS DateTime), 7, 31)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (4, 4, 2, CAST(N'2026-06-29T12:00:00.000' AS DateTime), 15, 74)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (5, 5, 2, CAST(N'2026-07-20T12:00:00.000' AS DateTime), 7, 8)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (6, 6, 1, CAST(N'2026-09-11T12:00:00.000' AS DateTime), 2, 32)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (7, 7, 2, CAST(N'2026-08-07T12:00:00.000' AS DateTime), 7, 90)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (8, 8, 2, CAST(N'2026-08-30T12:00:00.000' AS DateTime), 15, 71)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (9, 9, 1, CAST(N'2026-08-07T12:00:00.000' AS DateTime), 7, 90)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (10, 10, 1, CAST(N'2026-08-27T12:00:00.000' AS DateTime), 7, 38)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (11, 11, 4, CAST(N'2026-07-17T12:00:00.000' AS DateTime), 7, 95)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (12, 12, 4, CAST(N'2026-08-15T12:00:00.000' AS DateTime), 7, 58)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (13, 13, 5, CAST(N'2026-07-29T12:00:00.000' AS DateTime), 2, 71)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (14, 14, 5, CAST(N'2026-08-22T12:00:00.000' AS DateTime), 7, 1)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (15, 15, 5, CAST(N'2026-09-07T12:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (16, 16, 6, CAST(N'2026-07-06T12:00:00.000' AS DateTime), 2, 32)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (17, 17, 6, CAST(N'2026-08-18T12:00:00.000' AS DateTime), 2, 45)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (18, 18, 5, CAST(N'2026-08-10T12:00:00.000' AS DateTime), 7, 19)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (19, 19, 7, CAST(N'2026-09-01T12:00:00.000' AS DateTime), 15, 61)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (20, 26, 1, CAST(N'2026-09-16T12:00:00.000' AS DateTime), 7, 15)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (21, 27, 6, CAST(N'2026-09-17T12:00:00.000' AS DateTime), 2, 37)
INSERT [dbo].[DERIVACION] ([IdDerivacion_413BE], [IdReclamo_413BE], [IdProveedor_413BE], [FechaDerivacion_413BE], [PlazoSlaDias_413BE], [Dvh_413BE]) VALUES (22, 28, 4, CAST(N'2026-09-18T12:00:00.000' AS DateTime), 15, 0)
SET IDENTITY_INSERT [dbo].[DERIVACION] OFF
GO
SET IDENTITY_INSERT [dbo].[CIERRE_RECLAMO] ON
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (1, 1, CAST(N'2026-06-26T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'A-0001-00000001', N'Unidad funcional 1', CAST(45000.00 AS Decimal(18, 2)), 82)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (2, 2, CAST(N'2026-07-16T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'', N'Unidad funcional 2', CAST(40000.00 AS Decimal(18, 2)), 14)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (3, 3, CAST(N'2026-08-05T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'A-0001-00000003', N'Unidad funcional 7', CAST(44000.00 AS Decimal(18, 2)), 25)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (4, 4, CAST(N'2026-07-06T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'', N'Unidad funcional 3', CAST(28000.00 AS Decimal(18, 2)), 75)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (5, 5, CAST(N'2026-07-26T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'A-0001-00000005', N'Unidad funcional 4', CAST(31000.00 AS Decimal(18, 2)), 71)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (6, 6, CAST(N'2026-09-14T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'', N'Unidad funcional 1', CAST(46000.00 AS Decimal(18, 2)), 85)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (7, 7, CAST(N'2026-08-15T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'A-0001-00000007', N'Unidad funcional 8', CAST(30000.00 AS Decimal(18, 2)), 32)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (8, 8, CAST(N'2026-09-04T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'', N'Unidad funcional 5', CAST(29500.00 AS Decimal(18, 2)), 58)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (9, 9, CAST(N'2026-08-10T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'A-0001-00000009', N'Unidad funcional 3', CAST(43000.00 AS Decimal(18, 2)), 34)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (10, 10, CAST(N'2026-08-30T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'', N'Unidad funcional 7', CAST(42000.00 AS Decimal(18, 2)), 28)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (11, 11, CAST(N'2026-07-21T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'A-0001-00000011', N'Unidad funcional 1', CAST(60000.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (12, 12, CAST(N'2026-08-20T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'', N'Unidad funcional 9', CAST(62000.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (13, 13, CAST(N'2026-07-31T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'A-0001-00000013', N'Unidad funcional 2', CAST(75000.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (14, 14, CAST(N'2026-08-25T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'', N'Unidad funcional 10', CAST(78000.00 AS Decimal(18, 2)), 57)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (15, 15, CAST(N'2026-09-09T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'A-0001-00000015', N'Unidad funcional 9', CAST(74000.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (16, 16, CAST(N'2026-07-11T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'', N'Registro general del consorcio 1', CAST(150000.00 AS Decimal(18, 2)), 44)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (17, 17, CAST(N'2026-08-22T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'A-0001-00000017', N'Registro general del consorcio 2', CAST(140000.00 AS Decimal(18, 2)), 78)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (18, 18, CAST(N'2026-08-13T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'', N'Unidad funcional 5', CAST(52000.00 AS Decimal(18, 2)), 88)
INSERT [dbo].[CIERRE_RECLAMO] ([IdCierre_413BE], [IdReclamo_413BE], [FechaCierre_413BE], [InformeResolucion_413BE], [NumeroFactura_413BE], [CuentaImputada_413BE], [CostoImputado_413BE], [Dvh_413BE]) VALUES (19, 19, CAST(N'2026-09-02T12:00:00.000' AS DateTime), N'Trabajo resuelto por el proveedor.', N'A-0001-00000019', N'Unidad funcional 11', CAST(18000.00 AS Decimal(18, 2)), 93)
SET IDENTITY_INSERT [dbo].[CIERRE_RECLAMO] OFF
GO
-- Digito verificador vertical de cada tabla
INSERT [dbo].[DigitoVerificadorVertical] ([DVV_ID], [DVV_Tabla], [DVV_Atributo], [DVV_Valor], [DVV_FechaCalculo]) VALUES (N'6fa9630d-d1ee-4fee-ba26-aa745c8d15a9', N'Usuario', N'*', 46, CAST(N'2026-09-24T12:00:00.000' AS DateTime))
INSERT [dbo].[DigitoVerificadorVertical] ([DVV_ID], [DVV_Tabla], [DVV_Atributo], [DVV_Valor], [DVV_FechaCalculo]) VALUES (N'c8798890-dadf-43f8-8096-ef68ea62fdcc', N'CONSORCIO', N'*', 6, CAST(N'2026-09-24T12:00:00.000' AS DateTime))
INSERT [dbo].[DigitoVerificadorVertical] ([DVV_ID], [DVV_Tabla], [DVV_Atributo], [DVV_Valor], [DVV_FechaCalculo]) VALUES (N'9c3e268a-e108-4c52-aa78-375309de0048', N'UNIDAD_FUNCIONAL', N'*', 17, CAST(N'2026-09-24T12:00:00.000' AS DateTime))
INSERT [dbo].[DigitoVerificadorVertical] ([DVV_ID], [DVV_Tabla], [DVV_Atributo], [DVV_Valor], [DVV_FechaCalculo]) VALUES (N'68bd4b06-1233-4aa4-80bc-452e7c022a8f', N'CONSORCISTA', N'*', 31, CAST(N'2026-09-24T12:00:00.000' AS DateTime))
INSERT [dbo].[DigitoVerificadorVertical] ([DVV_ID], [DVV_Tabla], [DVV_Atributo], [DVV_Valor], [DVV_FechaCalculo]) VALUES (N'428874ba-e0c9-4391-85ad-4888cfd803e7', N'CATEGORIA', N'*', 73, CAST(N'2026-09-24T12:00:00.000' AS DateTime))
INSERT [dbo].[DigitoVerificadorVertical] ([DVV_ID], [DVV_Tabla], [DVV_Atributo], [DVV_Valor], [DVV_FechaCalculo]) VALUES (N'd435cf8f-5252-4094-852b-331922644dd6', N'PROVEEDOR', N'*', 46, CAST(N'2026-09-24T12:00:00.000' AS DateTime))
INSERT [dbo].[DigitoVerificadorVertical] ([DVV_ID], [DVV_Tabla], [DVV_Atributo], [DVV_Valor], [DVV_FechaCalculo]) VALUES (N'22e2c617-0209-487c-80d9-78a92d46f983', N'PROVEEDOR_CATEGORIA', N'*', 56, CAST(N'2026-09-24T12:00:00.000' AS DateTime))
INSERT [dbo].[DigitoVerificadorVertical] ([DVV_ID], [DVV_Tabla], [DVV_Atributo], [DVV_Valor], [DVV_FechaCalculo]) VALUES (N'60603364-374f-436b-809d-db1c22b27374', N'RECLAMO', N'*', 15, CAST(N'2026-09-24T12:00:00.000' AS DateTime))
INSERT [dbo].[DigitoVerificadorVertical] ([DVV_ID], [DVV_Tabla], [DVV_Atributo], [DVV_Valor], [DVV_FechaCalculo]) VALUES (N'6e4892b2-0c84-4fbd-8b8b-1fca1edf6c87', N'DERIVACION', N'*', 30, CAST(N'2026-09-24T12:00:00.000' AS DateTime))
INSERT [dbo].[DigitoVerificadorVertical] ([DVV_ID], [DVV_Tabla], [DVV_Atributo], [DVV_Valor], [DVV_FechaCalculo]) VALUES (N'8f8e7e30-ea65-44aa-b065-5ba01028136e', N'CIERRE_RECLAMO', N'*', 71, CAST(N'2026-09-24T12:00:00.000' AS DateTime))
GO

USE [master]
GO
ALTER DATABASE [AppBaseDB] SET  READ_WRITE 
GO
