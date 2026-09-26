using System.Text.RegularExpressions;
using BE;
using DAL;
using INT;

namespace BLL
{
    public class ConsorcioBLL_413BE
    {
        private readonly ConsorcioDAL_413BE _consorcioDAL = new ConsorcioDAL_413BE();

        public List<Consorcio_413BE> ObtenerTodos_413BE()
        {
            return _consorcioDAL.ObtenerTodos_413BE();
        }

        public List<Consorcio_413BE> ObtenerActivos_413BE()
        {
            return _consorcioDAL.ObtenerActivos_413BE();
        }

        public Consorcio_413BE ObtenerPorId_413BE(int idConsorcio)
        {
            return _consorcioDAL.ObtenerPorId_413BE(idConsorcio);
        }

        public int Insertar_413BE(Consorcio_413BE consorcio)
        {
            ValidarDatos_413BE(consorcio);
            consorcio.Activo_413BE = true;
            int id = _consorcioDAL.Insertar_413BE(consorcio);
            consorcio.IdConsorcio_413BE = id;
            RecalcularDigitos_413BE(consorcio);
            return id;
        }

        public void Actualizar_413BE(Consorcio_413BE consorcio)
        {
            ValidarDatos_413BE(consorcio);
            _consorcioDAL.Actualizar_413BE(consorcio);
            RecalcularDigitos_413BE(consorcio);
        }

        public void Inactivar_413BE(int idConsorcio)
        {
            if (_consorcioDAL.ContarUnidadesFuncionalesActivas_413BE(idConsorcio) > 0 || _consorcioDAL.ContarReclamosEnCurso_413BE(idConsorcio) > 0)
            {
                throw new InvalidOperationException(TraduccionAyuda_413BE.Obtener_413BE("ex_consorcioNoInactivable", "No se puede inactivar: el consorcio tiene unidades funcionales activas o reclamos en curso"));
            }
            Consorcio_413BE consorcio = _consorcioDAL.ObtenerPorId_413BE(idConsorcio);
            consorcio.Activo_413BE = false;
            _consorcioDAL.Actualizar_413BE(consorcio);
            RecalcularDigitos_413BE(consorcio);
        }

        public void Reactivar_413BE(int idConsorcio)
        {
            Consorcio_413BE consorcio = _consorcioDAL.ObtenerPorId_413BE(idConsorcio);
            consorcio.Activo_413BE = true;
            _consorcioDAL.Actualizar_413BE(consorcio);
            RecalcularDigitos_413BE(consorcio);
        }

        private static void ValidarDatos_413BE(Consorcio_413BE consorcio)
        {
            if (string.IsNullOrWhiteSpace(consorcio.Nombre_413BE) || string.IsNullOrWhiteSpace(consorcio.Direccion_413BE) || consorcio.CantidadUnidades_413BE <= 0)
            {
                throw new ArgumentException(TraduccionAyuda_413BE.Obtener_413BE("ex_consorcioDatosIncompletos", "Complete el nombre, la dirección y una cantidad de unidades mayor a cero"));
            }
        }

        private void RecalcularDigitos_413BE(Consorcio_413BE consorcio)
        {
            VerificadorBLL verificador = new VerificadorBLL();
            consorcio.Dvh_413BE = verificador.CalcularDVH(consorcio);
            _consorcioDAL.ActualizarDvh_413BE(consorcio.IdConsorcio_413BE, consorcio.Dvh_413BE);
            verificador.ActualizarDVV("CONSORCIO", _consorcioDAL.ObtenerTodos_413BE().Cast<IVerificable>().ToList());
        }
    }

    public class UnidadFuncionalBLL_413BE
    {
        public static readonly string[] TiposFijos_413BE = { "Departamento", "Cochera", "Local", "Baulera" };

        private readonly UnidadFuncionalDAL_413BE _unidadDAL = new UnidadFuncionalDAL_413BE();

        public List<UnidadFuncional_413BE> ObtenerPorConsorcio_413BE(int idConsorcio)
        {
            return _unidadDAL.ObtenerPorConsorcio_413BE(idConsorcio);
        }

        public List<UnidadFuncional_413BE> ObtenerActivasPorConsorcio_413BE(int idConsorcio)
        {
            return _unidadDAL.ObtenerActivasPorConsorcio_413BE(idConsorcio);
        }

        public UnidadFuncional_413BE ObtenerPorId_413BE(int idUnidadFuncional)
        {
            return _unidadDAL.ObtenerPorId_413BE(idUnidadFuncional);
        }

        public int Insertar_413BE(UnidadFuncional_413BE unidad)
        {
            ValidarDatos_413BE(unidad, null);
            unidad.Activa_413BE = true;
            int id = _unidadDAL.Insertar_413BE(unidad);
            unidad.IdUnidadFuncional_413BE = id;
            RecalcularDigitos_413BE(unidad);
            return id;
        }

        public void Actualizar_413BE(UnidadFuncional_413BE unidad)
        {
            ValidarDatos_413BE(unidad, unidad.IdUnidadFuncional_413BE);
            _unidadDAL.Actualizar_413BE(unidad);
            RecalcularDigitos_413BE(unidad);
        }

        public void Inactivar_413BE(int idUnidadFuncional)
        {
            if (_unidadDAL.ContarConsorcistasActivos_413BE(idUnidadFuncional) > 0 || _unidadDAL.ContarReclamosEnCurso_413BE(idUnidadFuncional) > 0)
            {
                throw new InvalidOperationException(TraduccionAyuda_413BE.Obtener_413BE("ex_unidadFuncionalNoInactivable", "No se puede inactivar: la unidad funcional tiene consorcistas activos o reclamos en curso"));
            }
            UnidadFuncional_413BE unidad = _unidadDAL.ObtenerPorId_413BE(idUnidadFuncional);
            unidad.Activa_413BE = false;
            _unidadDAL.Actualizar_413BE(unidad);
            RecalcularDigitos_413BE(unidad);
        }

        public void Reactivar_413BE(int idUnidadFuncional)
        {
            UnidadFuncional_413BE unidad = _unidadDAL.ObtenerPorId_413BE(idUnidadFuncional);
            unidad.Activa_413BE = true;
            _unidadDAL.Actualizar_413BE(unidad);
            RecalcularDigitos_413BE(unidad);
        }

        private void RecalcularDigitos_413BE(UnidadFuncional_413BE unidad)
        {
            VerificadorBLL verificador = new VerificadorBLL();
            unidad.Dvh_413BE = verificador.CalcularDVH(unidad);
            _unidadDAL.ActualizarDvh_413BE(unidad.IdUnidadFuncional_413BE, unidad.Dvh_413BE);
            verificador.ActualizarDVV("UNIDAD_FUNCIONAL", _unidadDAL.ObtenerTodos_413BE().Cast<IVerificable>().ToList());
        }

        private void ValidarDatos_413BE(UnidadFuncional_413BE unidad, int? idExcluir)
        {
            if (_unidadDAL.ExisteIdentificador_413BE(unidad.IdConsorcio_413BE, unidad.Identificador_413BE, idExcluir))
            {
                throw new ArgumentException(TraduccionAyuda_413BE.Obtener_413BE("ex_unidadFuncionalDuplicada", "Ya existe una unidad funcional con ese identificador en el consorcio"));
            }
        }
    }

    public class ConsorcistaBLL_413BE
    {
        private static readonly Regex Dni = new Regex(@"^\d{7,8}$");
        private static readonly Regex Email = new Regex(@"^[^@\s]+@[^@\s]+\.[^@\s]+$");

        private readonly ConsorcistaDAL_413BE _consorcistaDAL = new ConsorcistaDAL_413BE();

        public List<Consorcista_413BE> ObtenerPorUnidad_413BE(int idUnidadFuncional)
        {
            return _consorcistaDAL.ObtenerPorUnidad_413BE(idUnidadFuncional);
        }

        public List<Consorcista_413BE> ObtenerPorConsorcio_413BE(int idConsorcio)
        {
            return _consorcistaDAL.ObtenerPorConsorcio_413BE(idConsorcio);
        }

        public List<Consorcista_413BE> ObtenerActivosPorUnidad_413BE(int idUnidadFuncional)
        {
            return _consorcistaDAL.ObtenerActivosPorUnidad_413BE(idUnidadFuncional);
        }

        public List<Consorcista_413BE> ObtenerActivosPorConsorcio_413BE(int idConsorcio)
        {
            return _consorcistaDAL.ObtenerActivosPorConsorcio_413BE(idConsorcio);
        }

        public Consorcista_413BE ObtenerPorId_413BE(int idConsorcista)
        {
            return _consorcistaDAL.ObtenerPorId_413BE(idConsorcista);
        }

        public int Insertar_413BE(Consorcista_413BE consorcista)
        {
            ValidarDatos_413BE(consorcista);
            consorcista.Activo_413BE = true;
            int id = _consorcistaDAL.Insertar_413BE(consorcista);
            consorcista.IdConsorcista_413BE = id;
            RecalcularDigitos_413BE(consorcista);
            return id;
        }

        public void Actualizar_413BE(Consorcista_413BE consorcista)
        {
            ValidarDatos_413BE(consorcista);
            _consorcistaDAL.Actualizar_413BE(consorcista);
            RecalcularDigitos_413BE(consorcista);
        }

        public void Inactivar_413BE(int idConsorcista)
        {
            if (_consorcistaDAL.ContarReclamosEnCurso_413BE(idConsorcista) > 0)
            {
                throw new InvalidOperationException(TraduccionAyuda_413BE.Obtener_413BE("ex_consorcistaNoInactivable", "No se puede inactivar: el consorcista tiene reclamos en curso"));
            }
            Consorcista_413BE consorcista = _consorcistaDAL.ObtenerPorId_413BE(idConsorcista);
            consorcista.Activo_413BE = false;
            _consorcistaDAL.Actualizar_413BE(consorcista);
            RecalcularDigitos_413BE(consorcista);
        }

        public void Reactivar_413BE(int idConsorcista)
        {
            Consorcista_413BE consorcista = _consorcistaDAL.ObtenerPorId_413BE(idConsorcista);
            consorcista.Activo_413BE = true;
            _consorcistaDAL.Actualizar_413BE(consorcista);
            RecalcularDigitos_413BE(consorcista);
        }

        private void RecalcularDigitos_413BE(Consorcista_413BE consorcista)
        {
            VerificadorBLL verificador = new VerificadorBLL();
            consorcista.Dvh_413BE = verificador.CalcularDVH(consorcista);
            _consorcistaDAL.ActualizarDvh_413BE(consorcista.IdConsorcista_413BE, consorcista.Dvh_413BE);
            verificador.ActualizarDVV("CONSORCISTA", _consorcistaDAL.ObtenerTodos_413BE().Cast<IVerificable>().ToList());
        }

        private static void ValidarDatos_413BE(Consorcista_413BE consorcista)
        {
            if (!Dni.IsMatch(consorcista.Dni_413BE ?? ""))
            {
                throw new ArgumentException(TraduccionAyuda_413BE.Obtener_413BE("ex_dniInvalido", "Ingrese un DNI válido"));
            }
            if (!string.IsNullOrWhiteSpace(consorcista.Email_413BE) && !Email.IsMatch(consorcista.Email_413BE))
            {
                throw new ArgumentException(TraduccionAyuda_413BE.Obtener_413BE("ex_emailInvalido", "Ingrese un email válido"));
            }
        }
    }

    public class CategoriaBLL_413BE
    {
        public List<Categoria_413BE> ObtenerTodos_413BE()
        {
            return new CategoriaDAL_413BE().ObtenerTodos_413BE();
        }
    }
}
