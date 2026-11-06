-- Actualización de una base ya instalada: mantenimiento y bitácora de cambios de proveedores.
-- Se puede correr más de una vez: lo que ya existe no se vuelve a crear.
USE [AppBaseDB]
GO

-- Permisos y su relación con la familia Admin
IF NOT EXISTS (SELECT 1 FROM [dbo].[Permiso] WHERE [Permiso_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1035')
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1035', N'Mantenimiento de proveedores', 15)
IF NOT EXISTS (SELECT 1 FROM [dbo].[Permiso] WHERE [Permiso_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1036')
INSERT [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1036', N'Bitácora de cambios de proveedores', 16)
IF NOT EXISTS (SELECT 1 FROM [dbo].[Familia_Patente] WHERE [Padre_ID] = N'28a2317f-4de7-4976-8810-bf9fc517c6ea' AND [Hijo_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1035')
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'28a2317f-4de7-4976-8810-bf9fc517c6ea', N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1035')
IF NOT EXISTS (SELECT 1 FROM [dbo].[Familia_Patente] WHERE [Padre_ID] = N'28a2317f-4de7-4976-8810-bf9fc517c6ea' AND [Hijo_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1036')
INSERT [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'28a2317f-4de7-4976-8810-bf9fc517c6ea', N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1036')
GO

-- Textos de los menús, las pantallas y los mensajes nuevos
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_menuMaestros')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_menuMaestros');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Maestros' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_menuMaestros' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Master data' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_menuMaestros' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_mantenimientoProveedores')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_mantenimientoProveedores');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Mantenimiento de proveedores' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_mantenimientoProveedores' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Supplier maintenance' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_mantenimientoProveedores' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bitacoraProveedores')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_bitacoraProveedores');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Bitácora de cambios de proveedores' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_bitacoraProveedores' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Supplier change log' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_bitacoraProveedores' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'frm_bitprov_frmBitacoraProveedores')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'frm_bitprov_frmBitacoraProveedores');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Bitácora de cambios de proveedores' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'frm_bitprov_frmBitacoraProveedores' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Supplier change log' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'frm_bitprov_frmBitacoraProveedores' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_bitprov_grpFiltros')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_bitprov_grpFiltros');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Filtros' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_bitprov_grpFiltros' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Filters' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_bitprov_grpFiltros' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bitprov_lblCodigo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_bitprov_lblCodigo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Código de proveedor' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_bitprov_lblCodigo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Supplier code' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_bitprov_lblCodigo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bitprov_lblNombre')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_bitprov_lblNombre');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Nombre' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_bitprov_lblNombre' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Name' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_bitprov_lblNombre' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_bitprov_grpBitacora')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_bitprov_grpBitacora');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Versiones registradas' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_bitprov_grpBitacora' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Recorded versions' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_bitprov_grpBitacora' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColCodigo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bitprov_dgvBitacoraColCodigo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Cod. proveedor' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColCodigo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Supplier code' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColCodigo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColFecha')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bitprov_dgvBitacoraColFecha');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Fecha' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColFecha' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Date' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColFecha' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColHora')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bitprov_dgvBitacoraColHora');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Hora' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColHora' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Time' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColHora' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColNombre')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bitprov_dgvBitacoraColNombre');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Nombre' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColNombre' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Name' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColNombre' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColCuit')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bitprov_dgvBitacoraColCuit');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'CUIT' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColCuit' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'CUIT' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColCuit' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColEmail')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bitprov_dgvBitacoraColEmail');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Email' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColEmail' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Email' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColEmail' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColHabilitado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bitprov_dgvBitacoraColHabilitado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Habilitado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColHabilitado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Enabled' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColHabilitado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColAct')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_bitprov_dgvBitacoraColAct');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Act' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColAct' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Current' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_bitprov_dgvBitacoraColAct' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_bitprov_btnAplicar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_bitprov_btnAplicar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Aplicar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_bitprov_btnAplicar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Apply' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_bitprov_btnAplicar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_bitprov_btnSalir')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_bitprov_btnSalir');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Salir' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_bitprov_btnSalir' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Exit' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_bitprov_btnSalir' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_bitprov_todos')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'enum_bitprov_todos');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Todos' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_bitprov_todos' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'All' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'enum_bitprov_todos' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'frm_mantprov_frmMantenimientoProveedores')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'frm_mantprov_frmMantenimientoProveedores');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Mantenimiento de proveedores' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'frm_mantprov_frmMantenimientoProveedores' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Supplier maintenance' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'frm_mantprov_frmMantenimientoProveedores' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_mantprov_grpProveedores')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_mantprov_grpProveedores');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Proveedores' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_mantprov_grpProveedores' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Suppliers' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_mantprov_grpProveedores' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_mantprov_dgvProveedoresColCodigo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_mantprov_dgvProveedoresColCodigo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Código' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_mantprov_dgvProveedoresColCodigo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Code' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_mantprov_dgvProveedoresColCodigo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_mantprov_dgvProveedoresColNombre')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_mantprov_dgvProveedoresColNombre');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Nombre' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_mantprov_dgvProveedoresColNombre' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Name' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_mantprov_dgvProveedoresColNombre' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_mantprov_dgvProveedoresColCuit')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_mantprov_dgvProveedoresColCuit');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'CUIT' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_mantprov_dgvProveedoresColCuit' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'CUIT' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_mantprov_dgvProveedoresColCuit' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_mantprov_dgvProveedoresColEmail')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_mantprov_dgvProveedoresColEmail');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Email' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_mantprov_dgvProveedoresColEmail' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Email' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_mantprov_dgvProveedoresColEmail' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_mantprov_dgvProveedoresColHabilitado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'col_mantprov_dgvProveedoresColHabilitado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Habilitado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_mantprov_dgvProveedoresColHabilitado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Enabled' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'col_mantprov_dgvProveedoresColHabilitado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_mantprov_grpDatos')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'grp_mantprov_grpDatos');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Datos del proveedor' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_mantprov_grpDatos' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Supplier details' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'grp_mantprov_grpDatos' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_mantprov_lblNombre')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_mantprov_lblNombre');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Nombre' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_mantprov_lblNombre' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Name' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_mantprov_lblNombre' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_mantprov_lblCuit')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_mantprov_lblCuit');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'CUIT' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_mantprov_lblCuit' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'CUIT' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_mantprov_lblCuit' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_mantprov_lblEmail')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'lb_mantprov_lblEmail');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Email' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_mantprov_lblEmail' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Email' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'lb_mantprov_lblEmail' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_mantprov_btnNuevo')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_mantprov_btnNuevo');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Nuevo' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_mantprov_btnNuevo' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'New' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_mantprov_btnNuevo' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_mantprov_btnModificar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_mantprov_btnModificar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Modificar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_mantprov_btnModificar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Modify' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_mantprov_btnModificar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_mantprov_btnInhabilitar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_mantprov_btnInhabilitar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Inhabilitar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_mantprov_btnInhabilitar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Disable' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_mantprov_btnInhabilitar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_mantprov_btnHabilitar')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_mantprov_btnHabilitar');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Habilitar' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_mantprov_btnHabilitar' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Enable' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_mantprov_btnHabilitar' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'msg_proveedorModificado')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'msg_proveedorModificado');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Proveedor modificado' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'msg_proveedorModificado' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Supplier modified' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'msg_proveedorModificado' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_versionYaVigente')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_versionYaVigente');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'La versión seleccionada ya es la vigente' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_versionYaVigente' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'The selected version is already the current one' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_versionYaVigente' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'ex_versionNoSeleccionada')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'ex_versionNoSeleccionada');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Seleccione una versión de la bitácora' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_versionNoSeleccionada' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Select a version from the change log' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'ex_versionNoSeleccionada' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'msg_versionAplicada')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'msg_versionAplicada');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Versión aplicada' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'msg_versionAplicada' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Version applied' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'msg_versionAplicada' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
