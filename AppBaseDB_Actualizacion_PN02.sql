-- Actualización de una base ya instalada: textos del CU005 y todo lo de PN02 (CU006, CU007, CU008 y serialización).
-- Se puede correr más de una vez: lo que ya existe no se vuelve a crear.
USE [AppBaseDB]
GO

-- Textos del CU005 (registrar proveedor)
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_bus_btnRegistrarProveedor')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_bus_btnRegistrarProveedor');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Registrar proveedor' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_bus_btnRegistrarProveedor' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Register supplier' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_bus_btnRegistrarProveedor' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bus_sinProveedores')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_bus_sinProveedores');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'No hay proveedores habilitados para esta categoría' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_bus_sinProveedores' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'There are no enabled suppliers for this category' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_bus_sinProveedores' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'frm_regprov_frmRegistrarProveedor')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'frm_regprov_frmRegistrarProveedor');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Registrar proveedor' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'frm_regprov_frmRegistrarProveedor' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Register supplier' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'frm_regprov_frmRegistrarProveedor' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_regprov_lblNombre')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_regprov_lblNombre');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Nombre' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_regprov_lblNombre' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Name' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_regprov_lblNombre' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_regprov_lblCuit')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_regprov_lblCuit');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'CUIT' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_regprov_lblCuit' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'CUIT' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_regprov_lblCuit' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_regprov_lblEmail')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_regprov_lblEmail');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Email' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_regprov_lblEmail' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Email' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_regprov_lblEmail' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_regprov_lblCategorias')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_regprov_lblCategorias');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Categorías' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_regprov_lblCategorias' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Categories' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_regprov_lblCategorias' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_regprov_btnGuardar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_regprov_btnGuardar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Guardar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_regprov_btnGuardar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Save' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_regprov_btnGuardar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_regprov_btnCancelar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_regprov_btnCancelar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cancelar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_regprov_btnCancelar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cancel' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_regprov_btnCancelar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_regprov_proveedorRegistrado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_regprov_proveedorRegistrado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Proveedor registrado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_regprov_proveedorRegistrado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Supplier registered' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_regprov_proveedorRegistrado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_proveedorDatosIncompletos')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_proveedorDatosIncompletos');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Complete nombre, CUIT, email y al menos una categoría' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_proveedorDatosIncompletos' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Enter name, CUIT, email and at least one category' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_proveedorDatosIncompletos' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_proveedorCuitDuplicado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_proveedorCuitDuplicado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ya existe un proveedor registrado con ese CUIT' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_proveedorCuitDuplicado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'A supplier with that CUIT is already registered' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_proveedorCuitDuplicado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO

-- 9. PN02: tablas, patentes y etiquetas de asambleas
USE [AppBaseDB]
GO
IF OBJECT_ID(N'[dbo].[PROPUESTA_ASAMBLEA]', N'U') IS NULL
CREATE TABLE [dbo].[PROPUESTA_ASAMBLEA] (
    [IdPropuesta_413BE] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_PROPUESTA_ASAMBLEA] PRIMARY KEY,
    [IdConsorcio_413BE] INT NOT NULL CONSTRAINT [FK_PROPUESTA_CONSORCIO] REFERENCES [dbo].[CONSORCIO]([IdConsorcio_413BE]),
    [FechaGeneracion_413BE] DATETIME NOT NULL,
    [PeriodoDesde_413BE] DATETIME NOT NULL,
    [PeriodoHasta_413BE] DATETIME NOT NULL,
    [UmbralRepeticion_413BE] INT NOT NULL,
    [Estado_413BE] NVARCHAR(50) NOT NULL,
    [Dvh_413BE] INT NOT NULL CONSTRAINT [DF_PROPUESTA_ASAMBLEA_Dvh] DEFAULT 0
);
GO
IF OBJECT_ID(N'[dbo].[ORDEN_DIA]', N'U') IS NULL
CREATE TABLE [dbo].[ORDEN_DIA] (
    [IdOrdenDia_413BE] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_ORDEN_DIA] PRIMARY KEY,
    [IdPropuesta_413BE] INT NOT NULL CONSTRAINT [UQ_ORDEN_DIA_PROPUESTA] UNIQUE CONSTRAINT [FK_ORDEN_DIA_PROPUESTA] REFERENCES [dbo].[PROPUESTA_ASAMBLEA]([IdPropuesta_413BE]),
    [FechaAsamblea_413BE] DATETIME NOT NULL,
    [FechaRegistro_413BE] DATETIME NOT NULL,
    [Dvh_413BE] INT NOT NULL CONSTRAINT [DF_ORDEN_DIA_Dvh] DEFAULT 0
);
GO
IF OBJECT_ID(N'[dbo].[TEMA_PROPUESTO]', N'U') IS NULL
CREATE TABLE [dbo].[TEMA_PROPUESTO] (
    [IdTema_413BE] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_TEMA_PROPUESTO] PRIMARY KEY,
    [IdPropuesta_413BE] INT NOT NULL CONSTRAINT [FK_TEMA_PROPUESTA] REFERENCES [dbo].[PROPUESTA_ASAMBLEA]([IdPropuesta_413BE]),
    [IdCategoria_413BE] INT NOT NULL CONSTRAINT [FK_TEMA_CATEGORIA] REFERENCES [dbo].[CATEGORIA]([IdCategoria_413BE]),
    [IdUnidadFuncional_413BE] INT NULL CONSTRAINT [FK_TEMA_UF] REFERENCES [dbo].[UNIDAD_FUNCIONAL]([IdUnidadFuncional_413BE]),
    [AreaComun_413BE] NVARCHAR(100) NULL,
    [CantidadReclamos_413BE] INT NOT NULL,
    [CostoAcumulado_413BE] DECIMAL(18,2) NOT NULL,
    [TiempoPromedioAbiertoDias_413BE] FLOAT NOT NULL,
    [CostoSolucion_413BE] DECIMAL(18,2) NOT NULL,
    [IdOrdenDia_413BE] INT NULL CONSTRAINT [FK_TEMA_ORDEN_DIA] REFERENCES [dbo].[ORDEN_DIA]([IdOrdenDia_413BE]),
    [OrdenEnOrdenDia_413BE] INT NULL,
    [Dvh_413BE] INT NOT NULL CONSTRAINT [DF_TEMA_PROPUESTO_Dvh] DEFAULT 0
);
GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[Permiso] WHERE [Permiso_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1031')
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1031', N'Generar propuesta de temas para asamblea', 11)
IF NOT EXISTS (SELECT 1 FROM [dbo].[Permiso] WHERE [Permiso_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1032')
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1032', N'Definir orden del día', 12)
IF NOT EXISTS (SELECT 1 FROM [dbo].[Permiso] WHERE [Permiso_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1033')
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1033', N'Consultar historial de propuestas', 13)
IF NOT EXISTS (SELECT 1 FROM [dbo].[Familia_Patente] WHERE [Padre_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1001' AND [Hijo_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1031')
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1001', N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1031')
IF NOT EXISTS (SELECT 1 FROM [dbo].[Familia_Patente] WHERE [Padre_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1001' AND [Hijo_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1032')
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1001', N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1032')
IF NOT EXISTS (SELECT 1 FROM [dbo].[Familia_Patente] WHERE [Padre_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1001' AND [Hijo_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1033')
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1001', N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1033')
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_menuAsambleas')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_menuAsambleas');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Asambleas' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_menuAsambleas' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Meetings' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_menuAsambleas' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_generarPropuesta')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_generarPropuesta');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Generar propuesta de temas para asamblea' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_generarPropuesta' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Generate meeting topics proposal' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_generarPropuesta' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_genprop_grpFiltros')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_genprop_grpFiltros');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Período de análisis' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_genprop_grpFiltros' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Analysis period' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_genprop_grpFiltros' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_genprop_lblConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_genprop_lblConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_genprop_lblConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Building' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_genprop_lblConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_genprop_lblDesde')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_genprop_lblDesde');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Desde' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_genprop_lblDesde' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'From' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_genprop_lblDesde' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_genprop_lblHasta')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_genprop_lblHasta');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Hasta' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_genprop_lblHasta' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'To' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_genprop_lblHasta' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_genprop_btnAnalizar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_genprop_btnAnalizar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Analizar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_genprop_btnAnalizar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Analyze' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_genprop_btnAnalizar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_genprop_lbUmbral')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_genprop_lbUmbral');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Umbral de repetición vigente:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_genprop_lbUmbral' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Current repetition threshold:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_genprop_lbUmbral' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_genprop_grpGrupos')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_genprop_grpGrupos');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Grupos de reclamos candidatos' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_genprop_grpGrupos' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Candidate complaint groups' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_genprop_grpGrupos' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_genprop_dgvGruposColCategoria')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_genprop_dgvGruposColCategoria');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Categoría' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvGruposColCategoria' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Category' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvGruposColCategoria' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_genprop_dgvGruposColUbicacion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_genprop_dgvGruposColUbicacion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ubicación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvGruposColUbicacion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Location' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvGruposColUbicacion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_genprop_dgvGruposColCantidad')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_genprop_dgvGruposColCantidad');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cantidad de reclamos' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvGruposColCantidad' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Number of complaints' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvGruposColCantidad' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_genprop_dgvGruposColCostoAcumulado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_genprop_dgvGruposColCostoAcumulado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Costo acumulado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvGruposColCostoAcumulado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Accumulated cost' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvGruposColCostoAcumulado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_genprop_dgvGruposColTiempoPromedio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_genprop_dgvGruposColTiempoPromedio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Tiempo promedio abierto (días)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvGruposColTiempoPromedio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Average open time (days)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvGruposColTiempoPromedio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_genprop_dgvGruposColCostoSolucion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_genprop_dgvGruposColCostoSolucion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Costo de solución' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvGruposColCostoSolucion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Solution cost' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvGruposColCostoSolucion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_genprop_btnCalcularAhorro')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_genprop_btnCalcularAhorro');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Calcular ahorro' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_genprop_btnCalcularAhorro' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Calculate savings' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_genprop_btnCalcularAhorro' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_genprop_grpRanking')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_genprop_grpRanking');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ranking de temas' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_genprop_grpRanking' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Topic ranking' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_genprop_grpRanking' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_genprop_dgvRankingColPosicion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_genprop_dgvRankingColPosicion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Posición' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvRankingColPosicion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Position' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvRankingColPosicion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_genprop_dgvRankingColCategoria')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_genprop_dgvRankingColCategoria');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Categoría' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvRankingColCategoria' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Category' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvRankingColCategoria' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_genprop_dgvRankingColUbicacion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_genprop_dgvRankingColUbicacion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ubicación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvRankingColUbicacion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Location' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvRankingColUbicacion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_genprop_dgvRankingColCantidad')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_genprop_dgvRankingColCantidad');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cantidad' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvRankingColCantidad' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Quantity' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvRankingColCantidad' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_genprop_dgvRankingColCostoAcumulado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_genprop_dgvRankingColCostoAcumulado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Costo acumulado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvRankingColCostoAcumulado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Accumulated cost' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvRankingColCostoAcumulado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_genprop_dgvRankingColCostoSolucion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_genprop_dgvRankingColCostoSolucion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Costo de solución' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvRankingColCostoSolucion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Solution cost' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvRankingColCostoSolucion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_genprop_dgvRankingColAhorro')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_genprop_dgvRankingColAhorro');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ahorro estimado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvRankingColAhorro' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Estimated savings' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_genprop_dgvRankingColAhorro' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_genprop_btnGuardarPropuesta')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_genprop_btnGuardarPropuesta');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Guardar propuesta' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_genprop_btnGuardarPropuesta' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Save proposal' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_genprop_btnGuardarPropuesta' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_genprop_btnCancelar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_genprop_btnCancelar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cancelar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_genprop_btnCancelar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cancel' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_genprop_btnCancelar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_genprop_ningunGrupo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_genprop_ningunGrupo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ningún grupo de reclamos supera el umbral de repetición' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_genprop_ningunGrupo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'No complaint group reaches the repetition threshold' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_genprop_ningunGrupo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_genprop_propuestaGenerada')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_genprop_propuestaGenerada');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Propuesta generada' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_genprop_propuestaGenerada' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Proposal generated' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_genprop_propuestaGenerada' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_sinReclamosPeriodo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_sinReclamosPeriodo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'El consorcio no tiene reclamos en el período seleccionado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_sinReclamosPeriodo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'The building has no complaints in the selected period' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_sinReclamosPeriodo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_costoSolucionInvalido')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_costoSolucionInvalido');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ingrese un costo de solución mayor a cero para cada grupo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_costoSolucionInvalido' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Enter a solution cost greater than zero for each group' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_costoSolucionInvalido' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_umbralNoConfigurado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_umbralNoConfigurado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Debe configurarse el umbral de repetición' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_umbralNoConfigurado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'The repetition threshold must be configured' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_umbralNoConfigurado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_definirOrdenDia')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_definirOrdenDia');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Definir orden del día' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_definirOrdenDia' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Define meeting agenda' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_definirOrdenDia' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_ordia_grpPropuestas')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_ordia_grpPropuestas');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Propuestas generadas' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_ordia_grpPropuestas' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Generated proposals' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_ordia_grpPropuestas' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_ordia_dgvPropuestasColId')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_ordia_dgvPropuestasColId');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvPropuestasColId' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvPropuestasColId' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_ordia_dgvPropuestasColConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_ordia_dgvPropuestasColConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvPropuestasColConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Building' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvPropuestasColConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_ordia_dgvPropuestasColFechaGeneracion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_ordia_dgvPropuestasColFechaGeneracion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Fecha de generación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvPropuestasColFechaGeneracion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Generation date' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvPropuestasColFechaGeneracion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_ordia_dgvPropuestasColPeriodo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_ordia_dgvPropuestasColPeriodo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Período' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvPropuestasColPeriodo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Period' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvPropuestasColPeriodo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_ordia_dgvPropuestasColUmbral')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_ordia_dgvPropuestasColUmbral');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Umbral' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvPropuestasColUmbral' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Threshold' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvPropuestasColUmbral' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_ordia_grpTemas')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_ordia_grpTemas');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Temas de la propuesta' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_ordia_grpTemas' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Proposal topics' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_ordia_grpTemas' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_ordia_dgvTemasColIncluir')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_ordia_dgvTemasColIncluir');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Incluir' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColIncluir' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Include' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColIncluir' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_ordia_dgvTemasColPosicion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_ordia_dgvTemasColPosicion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Posición ranking' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColPosicion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ranking position' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColPosicion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_ordia_dgvTemasColCategoria')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_ordia_dgvTemasColCategoria');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Categoría' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColCategoria' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Category' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColCategoria' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_ordia_dgvTemasColUbicacion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_ordia_dgvTemasColUbicacion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ubicación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColUbicacion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Location' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColUbicacion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_ordia_dgvTemasColCantidad')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_ordia_dgvTemasColCantidad');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cantidad de reclamos' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColCantidad' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Number of complaints' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColCantidad' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_ordia_dgvTemasColCostoAcumulado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_ordia_dgvTemasColCostoAcumulado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Costo acumulado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColCostoAcumulado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Accumulated cost' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColCostoAcumulado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_ordia_dgvTemasColCostoSolucion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_ordia_dgvTemasColCostoSolucion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Costo de solución' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColCostoSolucion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Solution cost' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColCostoSolucion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_ordia_dgvTemasColAhorro')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_ordia_dgvTemasColAhorro');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ahorro estimado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColAhorro' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Estimated savings' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_ordia_dgvTemasColAhorro' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_ordia_btnSubir')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_ordia_btnSubir');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Subir' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_ordia_btnSubir' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Move up' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_ordia_btnSubir' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_ordia_btnBajar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_ordia_btnBajar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Bajar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_ordia_btnBajar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Move down' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_ordia_btnBajar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_ordia_grpRegistro')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_ordia_grpRegistro');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Orden del día' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_ordia_grpRegistro' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Meeting agenda' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_ordia_grpRegistro' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_ordia_lblFechaAsamblea')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_ordia_lblFechaAsamblea');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Fecha de la asamblea' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_ordia_lblFechaAsamblea' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Meeting date' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_ordia_lblFechaAsamblea' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_ordia_btnRegistrarOrdenDia')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_ordia_btnRegistrarOrdenDia');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Registrar orden del día' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_ordia_btnRegistrarOrdenDia' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Register agenda' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_ordia_btnRegistrarOrdenDia' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_ordia_btnCancelar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_ordia_btnCancelar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cancelar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_ordia_btnCancelar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cancel' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_ordia_btnCancelar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_ordia_ordenRegistrado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_ordia_ordenRegistrado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Orden del día registrado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_ordia_ordenRegistrado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Meeting agenda registered' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_ordia_ordenRegistrado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_ningunTemaIncluido')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_ningunTemaIncluido');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Incluya al menos un tema en el orden del día' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_ningunTemaIncluido' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Include at least one topic in the agenda' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_ningunTemaIncluido' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_fechaAsambleaInvalida')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_fechaAsambleaInvalida');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'La fecha de la asamblea no puede ser anterior a hoy' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_fechaAsambleaInvalida' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'The meeting date cannot be earlier than today' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_fechaAsambleaInvalida' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_consultarHistorialPropuestas')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_consultarHistorialPropuestas');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consultar historial de propuestas' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_consultarHistorialPropuestas' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'View proposal history' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_consultarHistorialPropuestas' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_hisprop_grpFiltros')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_hisprop_grpFiltros');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Filtros' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_hisprop_grpFiltros' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Filters' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_hisprop_grpFiltros' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_hisprop_lblConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_hisprop_lblConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_hisprop_lblConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Building' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_hisprop_lblConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_hisprop_lblEstado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_hisprop_lblEstado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Estado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_hisprop_lblEstado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Status' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_hisprop_lblEstado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'chk_hisprop_chkDesde')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'chk_hisprop_chkDesde');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Desde' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'chk_hisprop_chkDesde' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'From' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'chk_hisprop_chkDesde' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'chk_hisprop_chkHasta')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'chk_hisprop_chkHasta');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Hasta' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'chk_hisprop_chkHasta' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'To' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'chk_hisprop_chkHasta' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_hisprop_btnFiltrar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_hisprop_btnFiltrar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Filtrar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_hisprop_btnFiltrar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Filter' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_hisprop_btnFiltrar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_hisprop_grpPropuestas')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_hisprop_grpPropuestas');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Propuestas' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_hisprop_grpPropuestas' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Proposals' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_hisprop_grpPropuestas' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColId')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_hisprop_dgvPropuestasColId');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColId' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColId' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_hisprop_dgvPropuestasColConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Building' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColFechaGeneracion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_hisprop_dgvPropuestasColFechaGeneracion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Fecha de generación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColFechaGeneracion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Generation date' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColFechaGeneracion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColPeriodo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_hisprop_dgvPropuestasColPeriodo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Período' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColPeriodo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Period' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColPeriodo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColUmbral')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_hisprop_dgvPropuestasColUmbral');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Umbral' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColUmbral' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Threshold' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColUmbral' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColEstado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_hisprop_dgvPropuestasColEstado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Estado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColEstado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Status' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvPropuestasColEstado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_hisprop_grpTemas')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_hisprop_grpTemas');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Temas de la propuesta' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_hisprop_grpTemas' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Proposal topics' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_hisprop_grpTemas' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_hisprop_dgvTemasColPosicion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_hisprop_dgvTemasColPosicion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Posición ranking' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColPosicion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ranking position' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColPosicion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_hisprop_dgvTemasColCategoria')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_hisprop_dgvTemasColCategoria');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Categoría' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColCategoria' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Category' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColCategoria' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_hisprop_dgvTemasColUbicacion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_hisprop_dgvTemasColUbicacion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ubicación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColUbicacion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Location' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColUbicacion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_hisprop_dgvTemasColCantidad')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_hisprop_dgvTemasColCantidad');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cantidad' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColCantidad' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Quantity' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColCantidad' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_hisprop_dgvTemasColCostoAcumulado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_hisprop_dgvTemasColCostoAcumulado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Costo acumulado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColCostoAcumulado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Accumulated cost' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColCostoAcumulado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_hisprop_dgvTemasColCostoSolucion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_hisprop_dgvTemasColCostoSolucion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Costo de solución' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColCostoSolucion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Solution cost' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColCostoSolucion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_hisprop_dgvTemasColAhorro')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_hisprop_dgvTemasColAhorro');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ahorro estimado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColAhorro' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Estimated savings' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColAhorro' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_hisprop_dgvTemasColIncluido')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_hisprop_dgvTemasColIncluido');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Incluido en el orden del día' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColIncluido' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Included in the agenda' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColIncluido' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_hisprop_dgvTemasColOrden')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_hisprop_dgvTemasColOrden');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Orden' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColOrden' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Order' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_hisprop_dgvTemasColOrden' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_hisprop_lbFechaAsamblea')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_hisprop_lbFechaAsamblea');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Fecha de la asamblea:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_hisprop_lbFechaAsamblea' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Meeting date:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_hisprop_lbFechaAsamblea' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_hisprop_sinOrdenDia')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_hisprop_sinOrdenDia');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Sin orden del día' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_hisprop_sinOrdenDia' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'No agenda' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_hisprop_sinOrdenDia' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_hisprop_si')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_hisprop_si');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Sí' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_hisprop_si' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Yes' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_hisprop_si' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_hisprop_no')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_hisprop_no');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'No' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_hisprop_no' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'No' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_hisprop_no' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_propuesta_todos')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_propuesta_todos');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Todos' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_propuesta_todos' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'All' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_propuesta_todos' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_propuesta_generada')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_propuesta_generada');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Generada' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_propuesta_generada' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Generated' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_propuesta_generada' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_propuesta_conOrdenDia')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_propuesta_conOrdenDia');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Con orden del día' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_propuesta_conOrdenDia' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'With agenda' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_propuesta_conOrdenDia' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[Permiso] WHERE [Permiso_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1034')
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1034', N'Serializar y deserializar propuestas', 14)
IF NOT EXISTS (SELECT 1 FROM [dbo].[Familia_Patente] WHERE [Padre_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1001' AND [Hijo_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1034')
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1001', N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1034')
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_serializarPropuestas')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_serializarPropuestas');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Serializar propuestas' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serializarPropuestas' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Serialize proposals' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serializarPropuestas' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_serprop_grpPropuestas')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_serprop_grpPropuestas');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Propuestas' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_serprop_grpPropuestas' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Proposals' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_serprop_grpPropuestas' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_serprop_dgvPropuestasColId')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_serprop_dgvPropuestasColId');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvPropuestasColId' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Id' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvPropuestasColId' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_serprop_dgvPropuestasColConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_serprop_dgvPropuestasColConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcio' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvPropuestasColConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Building' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvPropuestasColConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_serprop_dgvPropuestasColFechaGeneracion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_serprop_dgvPropuestasColFechaGeneracion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Fecha de generación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvPropuestasColFechaGeneracion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Generation date' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvPropuestasColFechaGeneracion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_serprop_dgvPropuestasColEstado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_serprop_dgvPropuestasColEstado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Estado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvPropuestasColEstado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Status' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvPropuestasColEstado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_serprop_btnSerializar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_serprop_btnSerializar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Serializar propuesta seleccionada' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_serprop_btnSerializar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Serialize selected proposal' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_serprop_btnSerializar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_serprop_btnDeserializar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_serprop_btnDeserializar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Deserializar archivo…' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_serprop_btnDeserializar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Deserialize file…' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_serprop_btnDeserializar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_serprop_grpLeidos')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_serprop_grpLeidos');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Propuesta deserializada' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_serprop_grpLeidos' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Deserialized proposal' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_serprop_grpLeidos' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColPosicion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_serprop_dgvTemasLeidosColPosicion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Posición' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColPosicion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Position' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColPosicion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColCategoria')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_serprop_dgvTemasLeidosColCategoria');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Categoría' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColCategoria' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Category' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColCategoria' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColUbicacion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_serprop_dgvTemasLeidosColUbicacion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ubicación' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColUbicacion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Location' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColUbicacion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColCantidad')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_serprop_dgvTemasLeidosColCantidad');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cantidad' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColCantidad' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Quantity' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColCantidad' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColCostoAcumulado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_serprop_dgvTemasLeidosColCostoAcumulado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Costo acumulado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColCostoAcumulado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Accumulated cost' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColCostoAcumulado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColCostoSolucion')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_serprop_dgvTemasLeidosColCostoSolucion');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Costo de solución' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColCostoSolucion' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Solution cost' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColCostoSolucion' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColAhorro')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_serprop_dgvTemasLeidosColAhorro');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Ahorro estimado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColAhorro' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Estimated savings' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColAhorro' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColOrden')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_serprop_dgvTemasLeidosColOrden');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Orden en el orden del día' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColOrden' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Order in the agenda' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_serprop_dgvTemasLeidosColOrden' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_serprop_lbOrigenDatos')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_serprop_lbOrigenDatos');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Datos leídos del archivo (no se guardan en la base)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serprop_lbOrigenDatos' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Data read from the file (not saved to the database)' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serprop_lbOrigenDatos' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_serprop_serializada')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_serprop_serializada');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Propuesta serializada' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serprop_serializada' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Proposal serialized' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serprop_serializada' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_serprop_resPropuesta')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_serprop_resPropuesta');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Propuesta:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serprop_resPropuesta' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Proposal:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serprop_resPropuesta' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_serprop_resConsorcio')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_serprop_resConsorcio');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Consorcio:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serprop_resConsorcio' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Building:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serprop_resConsorcio' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_serprop_resPeriodo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_serprop_resPeriodo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Período:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serprop_resPeriodo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Period:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serprop_resPeriodo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_serprop_resUmbral')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_serprop_resUmbral');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Umbral:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serprop_resUmbral' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Threshold:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serprop_resUmbral' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_serprop_resEstado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_serprop_resEstado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Estado:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serprop_resEstado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Status:' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_serprop_resEstado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_archivoPropuestaInvalido')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_archivoPropuestaInvalido');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'El archivo no es una propuesta válida' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_archivoPropuestaInvalido' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'The file is not a valid proposal' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_archivoPropuestaInvalido' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_seleccionePropuesta')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_seleccionePropuesta');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Seleccione una propuesta' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_seleccionePropuesta' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Select a proposal' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_seleccionePropuesta' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO

