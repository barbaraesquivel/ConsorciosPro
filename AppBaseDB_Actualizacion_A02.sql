-- Actualización de una base ya instalada: texto del botón para exportar a PDF el historial de propuestas.
-- Se puede correr más de una vez: lo que ya existe no se vuelve a crear.
USE [AppBaseDB]
GO

IF NOT EXISTS (SELECT 1 FROM Etiqueta WHERE Etiqueta_Descripcion = N'btn_hisprop_btnExportarHistorial')
INSERT INTO Etiqueta (Etiqueta_ID, Etiqueta_Descripcion) VALUES (NEWID(), N'btn_hisprop_btnExportarHistorial');
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Exportar a PDF' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_hisprop_btnExportarHistorial' AND I.Idioma_Descripcion = N'Español'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
INSERT INTO Traduccion (Etiqueta_ID, Idioma_ID, Traduccion_Traduccion)
SELECT E.Etiqueta_ID, I.Idioma_ID, N'Export to PDF' FROM Etiqueta E CROSS JOIN Idioma I
WHERE E.Etiqueta_Descripcion = N'btn_hisprop_btnExportarHistorial' AND I.Idioma_Descripcion = N'Inglés'
AND NOT EXISTS (SELECT 1 FROM Traduccion T WHERE T.Etiqueta_ID = E.Etiqueta_ID AND T.Idioma_ID = I.Idioma_ID);
GO
