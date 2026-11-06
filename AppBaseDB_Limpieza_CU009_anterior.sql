-- Limpieza de lo que cargó el script anterior de la bitácora de reclamos.
-- Se puede correr más de una vez: si algo ya no está, no hace nada.
USE [AppBaseDB]
GO

-- Permiso "Consultar bitácora de cambios" y su relación con la familia Admin
IF EXISTS (SELECT 1 FROM [dbo].[Familia_Patente] WHERE [Padre_ID] = N'28a2317f-4de7-4976-8810-bf9fc517c6ea' AND [Hijo_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1035')
DELETE FROM [dbo].[Familia_Patente] WHERE [Padre_ID] = N'28a2317f-4de7-4976-8810-bf9fc517c6ea' AND [Hijo_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1035';
GO
IF EXISTS (SELECT 1 FROM [dbo].[Permiso] WHERE [Permiso_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1035')
DELETE FROM [dbo].[Permiso] WHERE [Permiso_ID] = N'6d0a1f40-8c2e-4b7a-9a11-0f6c5b7d1035';
GO

-- Textos de la pantalla (primero las traducciones y después las etiquetas)
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'lb_bitacoraCambios')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'lb_bitacoraCambios';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bitacoraCambios')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bitacoraCambios';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'grp_bitcam_grpFiltros')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'grp_bitcam_grpFiltros';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_bitcam_grpFiltros')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_bitcam_grpFiltros';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'lb_bitcam_lblTabla')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'lb_bitcam_lblTabla';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bitcam_lblTabla')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bitcam_lblTabla';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'lb_bitcam_lblOperacion')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'lb_bitcam_lblOperacion';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bitcam_lblOperacion')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bitcam_lblOperacion';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'lb_bitcam_lblUsuario')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'lb_bitcam_lblUsuario';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bitcam_lblUsuario')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bitcam_lblUsuario';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'chk_bitcam_chkDesde')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'chk_bitcam_chkDesde';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'chk_bitcam_chkDesde')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'chk_bitcam_chkDesde';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'chk_bitcam_chkHasta')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'chk_bitcam_chkHasta';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'chk_bitcam_chkHasta')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'chk_bitcam_chkHasta';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'btn_bitcam_btnFiltrar')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'btn_bitcam_btnFiltrar';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_bitcam_btnFiltrar')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_bitcam_btnFiltrar';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'grp_bitcam_grpCambios')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'grp_bitcam_grpCambios';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_bitcam_grpCambios')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_bitcam_grpCambios';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColFecha')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColFecha';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColFecha')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColFecha';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColTabla')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColTabla';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColTabla')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColTabla';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColIdRegistro')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColIdRegistro';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColIdRegistro')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColIdRegistro';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColOperacion')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColOperacion';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColOperacion')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColOperacion';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColUsuarioApp')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColUsuarioApp';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColUsuarioApp')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColUsuarioApp';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColUsuarioSql')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColUsuarioSql';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColUsuarioSql')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColUsuarioSql';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColCamposModificados')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColCamposModificados';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColCamposModificados')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'col_bitcam_dgvCambiosColCamposModificados';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'grp_bitcam_grpDetalle')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'grp_bitcam_grpDetalle';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_bitcam_grpDetalle')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'grp_bitcam_grpDetalle';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'lb_bitcam_camposModificados')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'lb_bitcam_camposModificados';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bitcam_camposModificados')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'lb_bitcam_camposModificados';
GO
IF EXISTS (SELECT 1 FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'enum_bitcam_todas')
DELETE T FROM Traduccion T INNER JOIN Etiqueta E ON E.Etiqueta_ID = T.Etiqueta_ID WHERE E.Etiqueta_Descripcion = N'enum_bitcam_todas';
GO
IF EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_bitcam_todas')
DELETE FROM Etiqueta WHERE Etiqueta_Descripcion = N'enum_bitcam_todas';
GO
