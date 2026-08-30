/*
    =====================================================================
    AppBase - Datos iniciales
    =====================================================================
    Ejecutar despues de 01_CrearBaseDeDatos.sql

    Crea:
      - 2 idiomas (Español / Ingles) con las traducciones de todas las
        pantallas base (Login, Usuarios, Familias, Idiomas, Backup)
      - El arbol de permisos: familia "Admin" con las 4 patentes base
        (GestPermisos, GestUsuarios, GestIdiomas, GestBackup)
      - Un usuario administrador para poder entrar la primera vez:

            Usuario:    admin
            Contraseña: admin123

        (el hash guardado corresponde a SHA-256 de "admin123", igual que
        calcula SER.Encriptador.Hash en la aplicacion)
    =====================================================================
*/

USE [AppBaseDB]
GO

-- ================= Idiomas =================
INSERT INTO [dbo].[Idioma] ([Idioma_ID], [Idioma_Descripcion], [Idioma_Default]) VALUES (N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Español', 1)
INSERT INTO [dbo].[Idioma] ([Idioma_ID], [Idioma_Descripcion], [Idioma_Default]) VALUES (N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Inglés', 0)
GO

-- ================= Etiquetas =================
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'a948ecff-cdcd-4f02-8c33-7db69e9b553e', N'lb_email')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'900bf7bf-0c0e-4d6b-be6a-16172b1f8f32', N'btn_ingresar')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'115c9fd3-47d0-4715-9699-f28b5bffd357', N'btn_salir')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'75a09cab-44e7-4bc4-bd7b-a9d16a947989', N'lb_pass')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'2fe3b25e-b141-42b2-a828-25cd7b3bff62', N'lb_bienvenido')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'cc81b6ed-1384-4183-8fda-7d19a60951bb', N'lb_usuario_incorrecto')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'dc58600a-8a57-495a-9b65-6baf164212e1', N'lb_pass_incorrecta')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'e7b080a3-22ca-4017-813b-b66cbf37c7a8', N'lb_usuario_bloqueado')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'3509f38e-8ca7-4e76-9965-98d08a712980', N'lb_sesion')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'cf2b5ee7-50cb-4d2b-9549-375be52ccc22', N'lb_IniciarSesion')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'24f3d6ab-d835-4285-a744-826eafe88c17', N'lb_CerrarSesion')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'75f3ce77-b54a-4254-9d28-332683b46bf4', N'lb_Usuarios')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'044dfdb4-a803-4624-b938-c95472d8f276', N'lb_familias')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'23107bd3-f511-4c84-9528-a11346bfc11a', N'lb_Idioma')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'58a8ff7c-6ae4-4aa1-8f6d-d694cbf26855', N'lb_NuevoIdioma')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'e939cc14-7b57-466f-92e1-6a4e98fbadb1', N'lb_deslog_1')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'20f739fa-e437-4dab-9257-cdbb1ae9bb78', N'btn_desbloquear')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'f49742e2-de65-48ea-b8e2-77e249626f97', N'btn_editar_datos')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'2820e73c-a8ee-4501-80a9-afc59df9a834', N'btn_bloquear')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'84362c84-7d8f-43c4-99c1-21736e439846', N'btn_nuevo_user')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'89c4777b-288c-4084-a170-2c1044ec94a6', N'lb_permisos_user')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'2b94590e-8a9c-4182-8ae1-7371185d361d', N'lb_permisos_fam')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'3cd4d8e2-ea17-4352-91f8-ef681c8116cf', N'lb_patentes')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'da5b66ac-2cdb-41d5-8b71-2cdca5c30b4e', N'btn_quitar')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'd6a04a0d-f84d-4b58-97ea-4968a3909ad1', N'btn_agregar')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'd5d12fb0-128d-48b4-8b1b-4c768aa2f8ea', N'lb_permisos')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'd40e4b79-90cf-481f-a310-72a06a08b5d4', N'btn_aceptar')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'793b0d56-4d6d-4c4c-a4c7-6359f44e523e', N'btn_guardar')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'40dadff1-b6f3-466c-b456-b2c6613484bc', N'btn_cancelar')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'8a7e1826-55b4-4171-8f21-8afa5a5efc14', N'lb_Usuario')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'1aaa3f4d-009e-4d18-b76e-60b132be738b', N'lb_usuario_log')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'9bf705d7-364c-4fc2-a0c3-7d853a1e143c', N'btn_nueva_fam')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'6605dc45-7368-47cf-8e0a-3929bd541fbf', N'btn_crear')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'4c545932-afc9-4ea9-ba6b-d0580924c806', N'lb_NombreFamilia')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'df550ea4-4f4d-405f-bf5a-4d17b450683e', N'lb_original')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'2f05d59e-dc83-43c9-91a3-cb69639e915b', N'lb_traduccion')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'a76564e8-e6fe-4c07-86bb-8f0a89895310', N'lb_completar')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'd5bd301a-da9c-4e40-89e1-44817f341b6a', N'lb_TraduccionPara')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'b109db41-318f-40ca-8084-09bc1f196f2d', N'lb_principal')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'4372bca4-aade-4ee5-97ea-d3e3e322d6c8', N'lb_baseDeDatos')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'068e9177-a7f1-4e97-8f57-c5c9627676e6', N'lb_backupRestore')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'3c986b89-004d-45c2-8a0b-ce3c35b21c0b', N'btn_backup')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'7158a7d7-b9ef-46f0-9b73-28ea04cd142f', N'btn_restaurar')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'df1322c5-eb73-4b17-9132-0a85049c0591', N'lb_backupOk')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'bc494311-5884-4ff7-a230-ac602a95ed32', N'lb_backupError')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'e6f0a916-06d3-425f-8692-b936ce37fadc', N'lb_restoreOk')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'531c74e5-eac9-4288-b5e3-980881e4b943', N'lb_restoreError')
INSERT INTO [dbo].[Etiqueta] ([Etiqueta_ID], [Etiqueta_Descripcion]) VALUES (N'e9d5634d-f72a-4864-b775-c73185f03293', N'lb_restoreConfirm')
GO

-- ================= Traducciones =================
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'a948ecff-cdcd-4f02-8c33-7db69e9b553e', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Email')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'a948ecff-cdcd-4f02-8c33-7db69e9b553e', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'E-mail')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'900bf7bf-0c0e-4d6b-be6a-16172b1f8f32', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Ingresar')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'900bf7bf-0c0e-4d6b-be6a-16172b1f8f32', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Enter')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'115c9fd3-47d0-4715-9699-f28b5bffd357', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Salir')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'115c9fd3-47d0-4715-9699-f28b5bffd357', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Exit')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'75a09cab-44e7-4bc4-bd7b-a9d16a947989', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Contraseña')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'75a09cab-44e7-4bc4-bd7b-a9d16a947989', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Password')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2fe3b25e-b141-42b2-a828-25cd7b3bff62', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Bienvenido')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2fe3b25e-b141-42b2-a828-25cd7b3bff62', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Welcome')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'cc81b6ed-1384-4183-8fda-7d19a60951bb', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Usuario Incorrecto')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'cc81b6ed-1384-4183-8fda-7d19a60951bb', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Incorrect User')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'dc58600a-8a57-495a-9b65-6baf164212e1', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Contraseña Incorrecta')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'dc58600a-8a57-495a-9b65-6baf164212e1', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Incorrect Password')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e7b080a3-22ca-4017-813b-b66cbf37c7a8', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Usuario Bloqueado')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e7b080a3-22ca-4017-813b-b66cbf37c7a8', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Blocked User')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'3509f38e-8ca7-4e76-9965-98d08a712980', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Sesión')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'3509f38e-8ca7-4e76-9965-98d08a712980', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Session')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'cf2b5ee7-50cb-4d2b-9549-375be52ccc22', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Iniciar Sesión')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'cf2b5ee7-50cb-4d2b-9549-375be52ccc22', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Log In')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'24f3d6ab-d835-4285-a744-826eafe88c17', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Cerrar Sesión')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'24f3d6ab-d835-4285-a744-826eafe88c17', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Log Out')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'75f3ce77-b54a-4254-9d28-332683b46bf4', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Usuarios')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'75f3ce77-b54a-4254-9d28-332683b46bf4', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Users')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'044dfdb4-a803-4624-b938-c95472d8f276', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Familias')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'044dfdb4-a803-4624-b938-c95472d8f276', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Families')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'23107bd3-f511-4c84-9528-a11346bfc11a', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Idioma')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'23107bd3-f511-4c84-9528-a11346bfc11a', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Language')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'58a8ff7c-6ae4-4aa1-8f6d-d694cbf26855', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Nuevo Idioma')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'58a8ff7c-6ae4-4aa1-8f6d-d694cbf26855', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'New Language')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e939cc14-7b57-466f-92e1-6a4e98fbadb1', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'¿Quiere salir?')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e939cc14-7b57-466f-92e1-6a4e98fbadb1', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Do you want to exit?')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'20f739fa-e437-4dab-9257-cdbb1ae9bb78', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Desbloquear')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'20f739fa-e437-4dab-9257-cdbb1ae9bb78', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Unlock')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'f49742e2-de65-48ea-b8e2-77e249626f97', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Editar Datos')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'f49742e2-de65-48ea-b8e2-77e249626f97', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Edit')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2820e73c-a8ee-4501-80a9-afc59df9a834', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Bloquear')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2820e73c-a8ee-4501-80a9-afc59df9a834', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Block')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'84362c84-7d8f-43c4-99c1-21736e439846', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Nuevo Usuario')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'84362c84-7d8f-43c4-99c1-21736e439846', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'New User')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'89c4777b-288c-4084-a170-2c1044ec94a6', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Permisos Usuario')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'89c4777b-288c-4084-a170-2c1044ec94a6', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'User Permissions')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2b94590e-8a9c-4182-8ae1-7371185d361d', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Permisos de la Familia')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2b94590e-8a9c-4182-8ae1-7371185d361d', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Family Permissions')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'3cd4d8e2-ea17-4352-91f8-ef681c8116cf', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Patentes')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'3cd4d8e2-ea17-4352-91f8-ef681c8116cf', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Patents')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'da5b66ac-2cdb-41d5-8b71-2cdca5c30b4e', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Quitar-->')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'da5b66ac-2cdb-41d5-8b71-2cdca5c30b4e', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Remove-->')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd6a04a0d-f84d-4b58-97ea-4968a3909ad1', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'<--Agregar')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd6a04a0d-f84d-4b58-97ea-4968a3909ad1', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'<--Add')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd5d12fb0-128d-48b4-8b1b-4c768aa2f8ea', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Permisos')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd5d12fb0-128d-48b4-8b1b-4c768aa2f8ea', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Permissions')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd40e4b79-90cf-481f-a310-72a06a08b5d4', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Aceptar')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd40e4b79-90cf-481f-a310-72a06a08b5d4', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Ok')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'793b0d56-4d6d-4c4c-a4c7-6359f44e523e', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Guardar')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'793b0d56-4d6d-4c4c-a4c7-6359f44e523e', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Save')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'40dadff1-b6f3-466c-b456-b2c6613484bc', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Cancelar')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'40dadff1-b6f3-466c-b456-b2c6613484bc', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Cancel')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'8a7e1826-55b4-4171-8f21-8afa5a5efc14', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Usuario')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'8a7e1826-55b4-4171-8f21-8afa5a5efc14', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'User')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'1aaa3f4d-009e-4d18-b76e-60b132be738b', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Usuario Logueado')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'1aaa3f4d-009e-4d18-b76e-60b132be738b', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Logged User')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'9bf705d7-364c-4fc2-a0c3-7d853a1e143c', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Nueva Familia')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'9bf705d7-364c-4fc2-a0c3-7d853a1e143c', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'New Family')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'6605dc45-7368-47cf-8e0a-3929bd541fbf', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Crear')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'6605dc45-7368-47cf-8e0a-3929bd541fbf', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Create')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'4c545932-afc9-4ea9-ba6b-d0580924c806', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Nombre de la Familia')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'4c545932-afc9-4ea9-ba6b-d0580924c806', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Family Name')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'df550ea4-4f4d-405f-bf5a-4d17b450683e', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Original')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'df550ea4-4f4d-405f-bf5a-4d17b450683e', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Original')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2f05d59e-dc83-43c9-91a3-cb69639e915b', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Traduccion')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'2f05d59e-dc83-43c9-91a3-cb69639e915b', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Translation')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'a76564e8-e6fe-4c07-86bb-8f0a89895310', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Completar idioma')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'a76564e8-e6fe-4c07-86bb-8f0a89895310', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Complete Language')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd5bd301a-da9c-4e40-89e1-44817f341b6a', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Traduccion para')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'd5bd301a-da9c-4e40-89e1-44817f341b6a', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Translation for')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'b109db41-318f-40ca-8084-09bc1f196f2d', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Principal')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'b109db41-318f-40ca-8084-09bc1f196f2d', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Main')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'4372bca4-aade-4ee5-97ea-d3e3e322d6c8', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Base de Datos')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'4372bca4-aade-4ee5-97ea-d3e3e322d6c8', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Database')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'068e9177-a7f1-4e97-8f57-c5c9627676e6', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Backup / Restaurar')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'068e9177-a7f1-4e97-8f57-c5c9627676e6', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Backup / Restore')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'3c986b89-004d-45c2-8a0b-ce3c35b21c0b', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Hacer Backup')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'3c986b89-004d-45c2-8a0b-ce3c35b21c0b', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Make Backup')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'7158a7d7-b9ef-46f0-9b73-28ea04cd142f', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Restaurar')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'7158a7d7-b9ef-46f0-9b73-28ea04cd142f', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Restore')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'df1322c5-eb73-4b17-9132-0a85049c0591', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Backup realizado con exito')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'df1322c5-eb73-4b17-9132-0a85049c0591', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Backup completed successfully')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'bc494311-5884-4ff7-a230-ac602a95ed32', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Error al realizar el backup')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'bc494311-5884-4ff7-a230-ac602a95ed32', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Error performing backup')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e6f0a916-06d3-425f-8692-b936ce37fadc', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Base de datos restaurada con exito')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e6f0a916-06d3-425f-8692-b936ce37fadc', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Database restored successfully')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'531c74e5-eac9-4288-b5e3-980881e4b943', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Error al restaurar la base de datos')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'531c74e5-eac9-4288-b5e3-980881e4b943', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'Error restoring database')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e9d5634d-f72a-4864-b775-c73185f03293', N'66cbf8f7-3eaa-4aea-bd95-2ba8dc234db7', N'Esta accion reemplaza los datos actuales. Desea continuar?')
INSERT INTO [dbo].[Traduccion] ([Etiqueta_ID], [Idioma_ID], [Traduccion_Traduccion]) VALUES (N'e9d5634d-f72a-4864-b775-c73185f03293', N'6ff0850f-7318-4270-aaf4-3b24c9223b37', N'This action replaces the current data. Do you want to continue?')
GO

-- ================= Permisos =================
-- Familia raiz 'Admin' (Permiso_Tipo NULL = familia)
INSERT INTO [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'28a2317f-4de7-4976-8810-bf9fc517c6ea', N'Admin', NULL)
-- Patentes (Permiso_Tipo = valor del enum TipoPatente)
INSERT INTO [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'7acb2457-162c-480e-85bb-c444d223d1ab', N'GestPermisos', 1)
INSERT INTO [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'b226e845-3ae7-42fd-809a-77a5f1f0ebf1', N'GestUsuarios', 2)
INSERT INTO [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'ce0d646b-f902-472d-8c00-b94f4a026ae9', N'GestIdiomas', 3)
INSERT INTO [dbo].[Permiso] ([Permiso_ID], [Permiso_Descripcion], [Permiso_Tipo]) VALUES (N'27b3f0bd-6c96-4e03-b0ab-a2ca218200a0', N'GestBackup', 4)
GO

-- ================= Familia_Patente (arma el arbol Composite) =================
INSERT INTO [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'28a2317f-4de7-4976-8810-bf9fc517c6ea', N'7acb2457-162c-480e-85bb-c444d223d1ab')
INSERT INTO [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'28a2317f-4de7-4976-8810-bf9fc517c6ea', N'b226e845-3ae7-42fd-809a-77a5f1f0ebf1')
INSERT INTO [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'28a2317f-4de7-4976-8810-bf9fc517c6ea', N'ce0d646b-f902-472d-8c00-b94f4a026ae9')
INSERT INTO [dbo].[Familia_Patente] ([Padre_ID], [Hijo_ID]) VALUES (N'28a2317f-4de7-4976-8810-bf9fc517c6ea', N'27b3f0bd-6c96-4e03-b0ab-a2ca218200a0')
GO

-- ================= Usuario =================
-- Usuario: admin   Contraseña: admin123
INSERT INTO [dbo].[Usuario] ([Usuario_ID], [Usuario_User], [Usuario_Pass], [Usuario_Bloq], [Usuario_Baja]) VALUES (N'ce8ba34d-afa4-4c84-8738-96ceb2e87c00', N'admin', N'240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 0, 0)
GO

-- ================= Usuario_Permiso =================
INSERT INTO [dbo].[Usuario_Permiso] ([Permiso_ID], [Usuario_ID]) VALUES (N'28a2317f-4de7-4976-8810-bf9fc517c6ea', N'ce8ba34d-afa4-4c84-8738-96ceb2e87c00')
GO
