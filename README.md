# AppBase

Base genérica en capas (.NET 8 / WinForms) extraída de tu proyecto original,
**sin nada del negocio de neumáticos/logística**. Queda solo la infraestructura
reutilizable para arrancar cualquier sistema nuevo:

- **Login** y manejo de sesión (`SER.SessionManager`, Singleton)
- **Permisos** con patrón **Composite** (`SER.Composite`: `Familia`, `Patente`, `PermisoCompuesto`)
- **Traducción de idiomas** (Observer: `IIdiomaObserver` + `TraductorBLL`/`TraductorDAL`)
- **Backup y Restore** de la base de datos (agregado nuevo — no existía en el
  proyecto original, no se encontró esa funcionalidad en el código fuente)
- Capa de **Servicio** (SER), **BLL**, **DAL** y **BE** genéricas, listas para
  que agregues tus propias entidades de negocio encima.

## Estructura

```
AppBase.sln
├── BE/            Entidades base: Entity, Usuario, Idioma, Etiqueta, Traduccion
├── INT/           Interfaces y enums (IEntity, ICrud<T>, IUsuario, IPermiso, TipoPatente, ...)
├── SER/           Servicios: SessionManager, Encriptador, Composite/ (permisos)
├── DAL/           Acceso a datos: DAO, AbstractDAL<T>, UsuarioDAL, PermisoDAL,
│                  TraductorDAL, BackupDAL (nuevo)
├── BLL/           Lógica: AbstractBLL<T>, UsuarioBLL, PermisoBLL, TraductorBLL,
│                  BackupBLL (nuevo)
├── App/           WinForms: frmLogin, frmMdiPrincipal, frmUsuarios, frmFamilias,
│                  frmEditarIdiomas, frmBackup (nuevo)
└── Database/      Scripts SQL Server
    ├── 01_CrearBaseDeDatos.sql
    └── 02_DatosIniciales.sql
```

## Qué se quitó

Todas las entidades, DAL, BLL, forms y enums de negocio (`Viaje`, `Cubierta`,
`Palet`, `Pedido`, `Calle`, `Despacho`, `Operario`, `SolicitudBloqueo`,
`TipoCubierta`, `TipoEstadoViaje`, y las 10 pantallas asociadas a viajes/
consolidación/despacho). El enum `TipoPatente` quedó reducido a los permisos
genéricos: `GestPermisos`, `GestUsuarios`, `GestIdiomas`, `GestBackup`.

## Puesta en marcha

1. Abrí `AppBase.sln` en Visual Studio 2022 (o `dotnet build` desde consola,
   requiere el workload de escritorio de .NET para el proyecto `App`, que es
   `net8.0-windows` + WinForms).
2. Ejecutá en SQL Server, en este orden:
   - `Database/01_CrearBaseDeDatos.sql`
   - `Database/02_DatosIniciales.sql`
3. Ajustá la cadena de conexión `Conexion` en `App/App.config` (y en
   `App/Settings1.settings` si usás el diseñador) con tu servidor.
4. Compilá y ejecutá el proyecto `App`. Iniciá sesión con:

   ```
   Usuario:    admin
   Contraseña: admin123
   ```

   Este usuario tiene la familia de permisos **Admin**, que incluye las 4
   patentes base (gestión de permisos, usuarios, idiomas y backup/restore).
   Cambiá la contraseña o creá tu propio usuario administrador antes de
   pasar a producción.

## Cómo agregar tu negocio

1. **BE**: creá tus entidades heredando de `Entity` (te da `Id`, `Estado`,
   `Baja`).
2. **DAL**: heredá de `AbstractDAL<T>` (te da `Save`, `Delete`, `GetAll`,
   `GetByID` con el patrón de sincronización por `TipoEstado`); implementá
   `Sincronizar()` para tu tabla.
3. **BLL**: heredá de `AbstractBLL<T>` y sumá tu lógica particular.
4. **INT**: agregá tus propias interfaces/enums si los necesitás.
5. **Permisos**: agregá tus propios valores a `TipoPatente` y creá nuevas
   `Patente` en la tabla `Permiso`/`Familia_Patente` para controlar el acceso
   a tus pantallas nuevas, siguiendo el mismo patrón que usa
   `frmMdiPrincipal.ValidarPermisos`.
6. **Idiomas**: para que tus pantallas nuevas soporten traducción, seteá
   `Tag` en cada control con una clave de texto, implementá
   `IIdiomaObserver`, y llamá `f.CambiarIdiomaFormulario(this, idioma)` (como
   hacen `frmUsuarios`, `frmFamilias`, etc.) — agregá las filas
   correspondientes en `Etiqueta`/`Traduccion`.

## Backup / Restore

Nuevo, implementado con comandos nativos de SQL Server
(`BACKUP DATABASE` / `RESTORE DATABASE`) sobre la base indicada en la cadena
de conexión (`DAL/BackupDAL.cs`). Se accede desde el menú **Base de Datos**
del `frmMdiPrincipal`, visible solo para usuarios con el permiso
`GestBackup`. Tené en cuenta que:

- La cuenta con la que corre SQL Server necesita permiso de escritura/lectura
  en la carpeta donde se guarda/lee el archivo `.bak`.
- El restore pone la base en modo `SINGLE_USER` momentáneamente para poder
  reemplazarla.
