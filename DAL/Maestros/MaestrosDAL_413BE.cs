using System.Data;
using BE;

namespace DAL
{
    public class ConsorcioDAL_413BE
    {
        private const string Columnas = "IdConsorcio_413BE, Nombre_413BE, Direccion_413BE, CantidadUnidades_413BE, Dvh_413BE, Activo_413BE";

        private static Consorcio_413BE Mapear_413BE(DataRow fila)
        {
            Consorcio_413BE c = new Consorcio_413BE();
            c.IdConsorcio_413BE = Convert.ToInt32(fila["IdConsorcio_413BE"]);
            c.Nombre_413BE = fila["Nombre_413BE"].ToString() ?? "";
            c.Direccion_413BE = fila["Direccion_413BE"].ToString() ?? "";
            c.CantidadUnidades_413BE = Convert.ToInt32(fila["CantidadUnidades_413BE"]);
            c.Dvh_413BE = Convert.ToInt32(fila["Dvh_413BE"]);
            c.Activo_413BE = Convert.ToBoolean(fila["Activo_413BE"]);
            return c;
        }

        public List<Consorcio_413BE> ObtenerTodos_413BE()
        {
            List<Consorcio_413BE> lista = new List<Consorcio_413BE>();
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM CONSORCIO ORDER BY IdConsorcio_413BE");
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        public List<Consorcio_413BE> ObtenerActivos_413BE()
        {
            List<Consorcio_413BE> lista = new List<Consorcio_413BE>();
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM CONSORCIO WHERE Activo_413BE=1 ORDER BY IdConsorcio_413BE");
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        public Consorcio_413BE ObtenerPorId_413BE(int idConsorcio)
        {
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM CONSORCIO WHERE IdConsorcio_413BE=@id",
                AccesoDatos_413BE.Parametro_413BE("@id", idConsorcio));
            if (tabla.Rows.Count == 0) throw new InvalidOperationException("No existe el consorcio " + idConsorcio);
            return Mapear_413BE(tabla.Rows[0]);
        }

        public int Insertar_413BE(Consorcio_413BE consorcio)
        {
            return AccesoDatos_413BE.Insertar_413BE(
                "INSERT INTO CONSORCIO (Nombre_413BE, Direccion_413BE, CantidadUnidades_413BE, Dvh_413BE, Activo_413BE) VALUES (@nombre, @dir, @cant, 0, @activo)",
                AccesoDatos_413BE.Parametro_413BE("@nombre", consorcio.Nombre_413BE), AccesoDatos_413BE.Parametro_413BE("@dir", consorcio.Direccion_413BE),
                AccesoDatos_413BE.Parametro_413BE("@cant", consorcio.CantidadUnidades_413BE), AccesoDatos_413BE.Parametro_413BE("@activo", consorcio.Activo_413BE));
        }

        public void Actualizar_413BE(Consorcio_413BE consorcio)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE(
                "UPDATE CONSORCIO SET Nombre_413BE=@nombre, Direccion_413BE=@dir, CantidadUnidades_413BE=@cant, Activo_413BE=@activo WHERE IdConsorcio_413BE=@id",
                AccesoDatos_413BE.Parametro_413BE("@nombre", consorcio.Nombre_413BE), AccesoDatos_413BE.Parametro_413BE("@dir", consorcio.Direccion_413BE),
                AccesoDatos_413BE.Parametro_413BE("@cant", consorcio.CantidadUnidades_413BE), AccesoDatos_413BE.Parametro_413BE("@activo", consorcio.Activo_413BE),
                AccesoDatos_413BE.Parametro_413BE("@id", consorcio.IdConsorcio_413BE));
        }

        public void ActualizarDvh_413BE(int idConsorcio, int dvh)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE("UPDATE CONSORCIO SET Dvh_413BE=@dvh WHERE IdConsorcio_413BE=@id",
                AccesoDatos_413BE.Parametro_413BE("@dvh", dvh), AccesoDatos_413BE.Parametro_413BE("@id", idConsorcio));
        }

        public int ContarUnidadesFuncionalesActivas_413BE(int idConsorcio)
        {
            return Convert.ToInt32(AccesoDatos_413BE.Escalar_413BE(
                "SELECT COUNT(*) FROM UNIDAD_FUNCIONAL WHERE IdConsorcio_413BE=@id AND Activa_413BE=1", AccesoDatos_413BE.Parametro_413BE("@id", idConsorcio)));
        }

        public int ContarReclamosEnCurso_413BE(int idConsorcio)
        {
            return Convert.ToInt32(AccesoDatos_413BE.Escalar_413BE(
                "SELECT COUNT(*) FROM RECLAMO WHERE IdConsorcio_413BE=@id AND Estado_413BE<>'CERRADO_413BE'", AccesoDatos_413BE.Parametro_413BE("@id", idConsorcio)));
        }
    }

    public class UnidadFuncionalDAL_413BE
    {
        private const string Columnas = "IdUnidadFuncional_413BE, IdConsorcio_413BE, Identificador_413BE, Tipo_413BE, Activa_413BE, Dvh_413BE";

        private static UnidadFuncional_413BE Mapear_413BE(DataRow fila)
        {
            UnidadFuncional_413BE u = new UnidadFuncional_413BE();
            u.IdUnidadFuncional_413BE = Convert.ToInt32(fila["IdUnidadFuncional_413BE"]);
            u.IdConsorcio_413BE = Convert.ToInt32(fila["IdConsorcio_413BE"]);
            u.Identificador_413BE = fila["Identificador_413BE"].ToString() ?? "";
            u.Tipo_413BE = fila["Tipo_413BE"].ToString() ?? "";
            u.Activa_413BE = Convert.ToBoolean(fila["Activa_413BE"]);
            u.Dvh_413BE = Convert.ToInt32(fila["Dvh_413BE"]);
            return u;
        }

        public List<UnidadFuncional_413BE> ObtenerTodos_413BE()
        {
            List<UnidadFuncional_413BE> lista = new List<UnidadFuncional_413BE>();
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM UNIDAD_FUNCIONAL ORDER BY IdUnidadFuncional_413BE");
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        public void ActualizarDvh_413BE(int idUnidadFuncional, int dvh)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE("UPDATE UNIDAD_FUNCIONAL SET Dvh_413BE=@dvh WHERE IdUnidadFuncional_413BE=@id",
                AccesoDatos_413BE.Parametro_413BE("@dvh", dvh), AccesoDatos_413BE.Parametro_413BE("@id", idUnidadFuncional));
        }

        public List<UnidadFuncional_413BE> ObtenerPorConsorcio_413BE(int idConsorcio)
        {
            List<UnidadFuncional_413BE> lista = new List<UnidadFuncional_413BE>();
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE(
                "SELECT " + Columnas + " FROM UNIDAD_FUNCIONAL WHERE IdConsorcio_413BE=@id ORDER BY IdUnidadFuncional_413BE",
                AccesoDatos_413BE.Parametro_413BE("@id", idConsorcio));
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        public List<UnidadFuncional_413BE> ObtenerActivasPorConsorcio_413BE(int idConsorcio)
        {
            List<UnidadFuncional_413BE> lista = new List<UnidadFuncional_413BE>();
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE(
                "SELECT " + Columnas + " FROM UNIDAD_FUNCIONAL WHERE IdConsorcio_413BE=@id AND Activa_413BE=1 ORDER BY IdUnidadFuncional_413BE",
                AccesoDatos_413BE.Parametro_413BE("@id", idConsorcio));
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        public UnidadFuncional_413BE ObtenerPorId_413BE(int idUnidadFuncional)
        {
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT " + Columnas + " FROM UNIDAD_FUNCIONAL WHERE IdUnidadFuncional_413BE=@id",
                AccesoDatos_413BE.Parametro_413BE("@id", idUnidadFuncional));
            if (tabla.Rows.Count == 0) throw new InvalidOperationException("No existe la unidad funcional " + idUnidadFuncional);
            return Mapear_413BE(tabla.Rows[0]);
        }

        public int Insertar_413BE(UnidadFuncional_413BE unidad)
        {
            return AccesoDatos_413BE.Insertar_413BE(
                "INSERT INTO UNIDAD_FUNCIONAL (IdConsorcio_413BE, Identificador_413BE, Tipo_413BE, Activa_413BE) VALUES (@con, @ident, @tipo, @activa)",
                AccesoDatos_413BE.Parametro_413BE("@con", unidad.IdConsorcio_413BE), AccesoDatos_413BE.Parametro_413BE("@ident", unidad.Identificador_413BE),
                AccesoDatos_413BE.Parametro_413BE("@tipo", unidad.Tipo_413BE), AccesoDatos_413BE.Parametro_413BE("@activa", unidad.Activa_413BE));
        }

        public void Actualizar_413BE(UnidadFuncional_413BE unidad)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE(
                "UPDATE UNIDAD_FUNCIONAL SET Identificador_413BE=@ident, Tipo_413BE=@tipo, Activa_413BE=@activa WHERE IdUnidadFuncional_413BE=@id",
                AccesoDatos_413BE.Parametro_413BE("@ident", unidad.Identificador_413BE), AccesoDatos_413BE.Parametro_413BE("@tipo", unidad.Tipo_413BE),
                AccesoDatos_413BE.Parametro_413BE("@activa", unidad.Activa_413BE), AccesoDatos_413BE.Parametro_413BE("@id", unidad.IdUnidadFuncional_413BE));
        }

        public bool ExisteIdentificador_413BE(int idConsorcio, string identificador, int? idUnidadFuncionalExcluir)
        {
            string sql = "SELECT COUNT(*) FROM UNIDAD_FUNCIONAL WHERE IdConsorcio_413BE=@con AND LTRIM(RTRIM(Identificador_413BE))=LTRIM(RTRIM(@ident))";
            List<System.Data.SqlClient.SqlParameter> parametros = new List<System.Data.SqlClient.SqlParameter>
            {
                AccesoDatos_413BE.Parametro_413BE("@con", idConsorcio), AccesoDatos_413BE.Parametro_413BE("@ident", identificador)
            };
            if (idUnidadFuncionalExcluir != null)
            {
                sql += " AND IdUnidadFuncional_413BE<>@excluir";
                parametros.Add(AccesoDatos_413BE.Parametro_413BE("@excluir", idUnidadFuncionalExcluir));
            }
            return Convert.ToInt32(AccesoDatos_413BE.Escalar_413BE(sql, parametros.ToArray())) > 0;
        }

        public int ContarConsorcistasActivos_413BE(int idUnidadFuncional)
        {
            return Convert.ToInt32(AccesoDatos_413BE.Escalar_413BE(
                "SELECT COUNT(*) FROM CONSORCISTA WHERE IdUnidadFuncional_413BE=@id AND Activo_413BE=1", AccesoDatos_413BE.Parametro_413BE("@id", idUnidadFuncional)));
        }

        public int ContarReclamosEnCurso_413BE(int idUnidadFuncional)
        {
            return Convert.ToInt32(AccesoDatos_413BE.Escalar_413BE(
                "SELECT COUNT(*) FROM RECLAMO WHERE IdUnidadFuncional_413BE=@id AND Estado_413BE<>'CERRADO_413BE'", AccesoDatos_413BE.Parametro_413BE("@id", idUnidadFuncional)));
        }
    }

    public class ConsorcistaDAL_413BE
    {
        private const string Seleccion = "SELECT c.IdConsorcista_413BE, c.IdUnidadFuncional_413BE, c.Dni_413BE, c.Nombre_413BE, c.Email_413BE, c.EsPropietario_413BE, c.Activo_413BE, c.Dvh_413BE FROM CONSORCISTA c ";

        private static Consorcista_413BE Mapear_413BE(DataRow fila)
        {
            Consorcista_413BE c = new Consorcista_413BE();
            c.IdConsorcista_413BE = Convert.ToInt32(fila["IdConsorcista_413BE"]);
            c.IdUnidadFuncional_413BE = Convert.ToInt32(fila["IdUnidadFuncional_413BE"]);
            c.Dni_413BE = fila["Dni_413BE"].ToString() ?? "";
            c.Nombre_413BE = fila["Nombre_413BE"].ToString() ?? "";
            c.Email_413BE = fila["Email_413BE"].ToString() ?? "";
            c.EsPropietario_413BE = Convert.ToBoolean(fila["EsPropietario_413BE"]);
            c.Activo_413BE = Convert.ToBoolean(fila["Activo_413BE"]);
            c.Dvh_413BE = Convert.ToInt32(fila["Dvh_413BE"]);
            return c;
        }

        private static List<Consorcista_413BE> MapearLista_413BE(DataTable tabla)
        {
            List<Consorcista_413BE> lista = new List<Consorcista_413BE>();
            foreach (DataRow fila in tabla.Rows) lista.Add(Mapear_413BE(fila));
            return lista;
        }

        public List<Consorcista_413BE> ObtenerTodos_413BE()
        {
            return MapearLista_413BE(AccesoDatos_413BE.Consultar_413BE(Seleccion + "ORDER BY c.IdConsorcista_413BE"));
        }

        public void ActualizarDvh_413BE(int idConsorcista, int dvh)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE("UPDATE CONSORCISTA SET Dvh_413BE=@dvh WHERE IdConsorcista_413BE=@id",
                AccesoDatos_413BE.Parametro_413BE("@dvh", dvh), AccesoDatos_413BE.Parametro_413BE("@id", idConsorcista));
        }

        public List<Consorcista_413BE> ObtenerPorUnidad_413BE(int idUnidadFuncional)
        {
            return MapearLista_413BE(AccesoDatos_413BE.Consultar_413BE(Seleccion + "WHERE c.IdUnidadFuncional_413BE=@id ORDER BY c.IdConsorcista_413BE",
                AccesoDatos_413BE.Parametro_413BE("@id", idUnidadFuncional)));
        }

        public List<Consorcista_413BE> ObtenerPorConsorcio_413BE(int idConsorcio)
        {
            return MapearLista_413BE(AccesoDatos_413BE.Consultar_413BE(
                Seleccion + "INNER JOIN UNIDAD_FUNCIONAL u ON u.IdUnidadFuncional_413BE=c.IdUnidadFuncional_413BE WHERE u.IdConsorcio_413BE=@id ORDER BY c.IdConsorcista_413BE",
                AccesoDatos_413BE.Parametro_413BE("@id", idConsorcio)));
        }

        public List<Consorcista_413BE> ObtenerActivosPorUnidad_413BE(int idUnidadFuncional)
        {
            return MapearLista_413BE(AccesoDatos_413BE.Consultar_413BE(Seleccion + "WHERE c.IdUnidadFuncional_413BE=@id AND c.Activo_413BE=1 ORDER BY c.IdConsorcista_413BE",
                AccesoDatos_413BE.Parametro_413BE("@id", idUnidadFuncional)));
        }

        public List<Consorcista_413BE> ObtenerActivosPorConsorcio_413BE(int idConsorcio)
        {
            return MapearLista_413BE(AccesoDatos_413BE.Consultar_413BE(
                Seleccion + "INNER JOIN UNIDAD_FUNCIONAL u ON u.IdUnidadFuncional_413BE=c.IdUnidadFuncional_413BE WHERE u.IdConsorcio_413BE=@id AND c.Activo_413BE=1 ORDER BY c.IdConsorcista_413BE",
                AccesoDatos_413BE.Parametro_413BE("@id", idConsorcio)));
        }

        public Consorcista_413BE ObtenerPorId_413BE(int idConsorcista)
        {
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE(Seleccion + "WHERE c.IdConsorcista_413BE=@id", AccesoDatos_413BE.Parametro_413BE("@id", idConsorcista));
            if (tabla.Rows.Count == 0) throw new InvalidOperationException("No existe el consorcista " + idConsorcista);
            return Mapear_413BE(tabla.Rows[0]);
        }

        public int Insertar_413BE(Consorcista_413BE consorcista)
        {
            return AccesoDatos_413BE.Insertar_413BE(
                "INSERT INTO CONSORCISTA (IdUnidadFuncional_413BE, Dni_413BE, Nombre_413BE, Email_413BE, EsPropietario_413BE, Activo_413BE) " +
                "VALUES (@uf, @dni, @nombre, @email, @prop, @activo)",
                AccesoDatos_413BE.Parametro_413BE("@uf", consorcista.IdUnidadFuncional_413BE), AccesoDatos_413BE.Parametro_413BE("@dni", consorcista.Dni_413BE),
                AccesoDatos_413BE.Parametro_413BE("@nombre", consorcista.Nombre_413BE), AccesoDatos_413BE.Parametro_413BE("@email", consorcista.Email_413BE),
                AccesoDatos_413BE.Parametro_413BE("@prop", consorcista.EsPropietario_413BE), AccesoDatos_413BE.Parametro_413BE("@activo", consorcista.Activo_413BE));
        }

        public void Actualizar_413BE(Consorcista_413BE consorcista)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE(
                "UPDATE CONSORCISTA SET Dni_413BE=@dni, Nombre_413BE=@nombre, Email_413BE=@email, EsPropietario_413BE=@prop, Activo_413BE=@activo WHERE IdConsorcista_413BE=@id",
                AccesoDatos_413BE.Parametro_413BE("@dni", consorcista.Dni_413BE), AccesoDatos_413BE.Parametro_413BE("@nombre", consorcista.Nombre_413BE),
                AccesoDatos_413BE.Parametro_413BE("@email", consorcista.Email_413BE), AccesoDatos_413BE.Parametro_413BE("@prop", consorcista.EsPropietario_413BE),
                AccesoDatos_413BE.Parametro_413BE("@activo", consorcista.Activo_413BE), AccesoDatos_413BE.Parametro_413BE("@id", consorcista.IdConsorcista_413BE));
        }

        public int ContarReclamosEnCurso_413BE(int idConsorcista)
        {
            return Convert.ToInt32(AccesoDatos_413BE.Escalar_413BE(
                "SELECT COUNT(*) FROM RECLAMO WHERE IdConsorcista_413BE=@id AND Estado_413BE<>'CERRADO_413BE'", AccesoDatos_413BE.Parametro_413BE("@id", idConsorcista)));
        }
    }

    public class CategoriaDAL_413BE
    {
        public List<Categoria_413BE> ObtenerTodos_413BE()
        {
            List<Categoria_413BE> lista = new List<Categoria_413BE>();
            DataTable tabla = AccesoDatos_413BE.Consultar_413BE("SELECT IdCategoria_413BE, Nombre_413BE, Dvh_413BE FROM CATEGORIA ORDER BY Nombre_413BE");
            foreach (DataRow fila in tabla.Rows)
            {
                Categoria_413BE c = new Categoria_413BE();
                c.IdCategoria_413BE = Convert.ToInt32(fila["IdCategoria_413BE"]);
                c.Nombre_413BE = fila["Nombre_413BE"].ToString() ?? "";
                c.Dvh_413BE = Convert.ToInt32(fila["Dvh_413BE"]);
                lista.Add(c);
            }
            return lista;
        }

        public void ActualizarDvh_413BE(int idCategoria, int dvh)
        {
            AccesoDatos_413BE.EjecutarNoQuery_413BE("UPDATE CATEGORIA SET Dvh_413BE=@dvh WHERE IdCategoria_413BE=@id",
                AccesoDatos_413BE.Parametro_413BE("@dvh", dvh), AccesoDatos_413BE.Parametro_413BE("@id", idCategoria));
        }
    }
}
