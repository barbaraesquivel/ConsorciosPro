using BE;
using DAL;
using INT;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reflection;

namespace BLL
{
    public class VerificadorBLL
    {
        private const int MODULO = 97;

        public int CalcularDVH(IVerificable entidad)
        {
            long suma = 0;
            string[] atributos = entidad.AtributosVerificables;
            for (int posAtributo = 1; posAtributo <= atributos.Length; posAtributo++)
            {
                PropertyInfo prop = entidad.GetType().GetProperty(atributos[posAtributo - 1]);
                string valor = ConvertirAString(prop.GetValue(entidad));
                for (int posCaracter = 1; posCaracter <= valor.Length; posCaracter++)
                {
                    suma += (long)valor[posCaracter - 1] * posCaracter * posAtributo;
                }
            }
            return (int)(suma % MODULO);
        }

        private static string ConvertirAString(object? valor)
        {
            switch (valor)
            {
                case null:
                    return "";
                case DateTime fecha:
                    return fecha.ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);
                case IFormattable formateable:
                    return formateable.ToString(null, CultureInfo.InvariantCulture);
                default:
                    return valor.ToString() ?? "";
            }
        }

        public void ActualizarDVH(IVerificable entidad)
        {
            entidad.DVH = CalcularDVH(entidad);
        }

        public bool VerificarDVH(IVerificable entidad)
        {
            return entidad.DVH == CalcularDVH(entidad);
        }

        public int CalcularDVV(IList<IVerificable> filas)
        {
            long suma = 0;
            IList<IVerificable> ordenadas = filas.OrderBy(f => f.Id).ToList();
            for (int posFila = 1; posFila <= ordenadas.Count; posFila++)
            {
                suma += (long)CalcularDVH(ordenadas[posFila - 1]) * posFila;
            }
            return (int)(suma % MODULO);
        }

        public void ActualizarDVV(string tabla, IList<IVerificable> filas)
        {
            int valor = CalcularDVV(filas);
            DigitoVerificadorVerticalDAL dal = new DigitoVerificadorVerticalDAL();
            DigitoVerificadorVertical dvv = dal.ObtenerPorTabla(tabla);
            if (dvv == null)
            {
                dvv = new DigitoVerificadorVertical();
                dvv.Tabla = tabla;
                dvv.Estado = TipoEstado.Agregado;
            }
            else
            {
                dvv.Estado = TipoEstado.Modificado;
            }
            dvv.Valor = valor;
            dvv.FechaCalculo = DateTime.Now;
            dal.Save(dvv);
        }

        public ResultadoIntegridad VerificarIntegridad(IList<IVerificable> filas)
        {
            ResultadoIntegridad resultado = new ResultadoIntegridad();
            if (filas.Count == 0) return resultado;
            string tabla = filas[0].NombreTabla;
            foreach (IVerificable fila in filas)
            {
                if (!VerificarDVH(fila))
                {
                    resultado.Discrepancias.Add(new DiscrepanciaIntegridad { Tabla = tabla, FilaId = fila.Id, ErrorHorizontal = true });
                }
            }
            DigitoVerificadorVertical dvvAlmacenado = new DigitoVerificadorVerticalDAL().ObtenerPorTabla(tabla);
            int dvvCalculado = CalcularDVV(filas);
            if (dvvAlmacenado == null || dvvAlmacenado.Valor != dvvCalculado)
            {
                resultado.Discrepancias.Add(new DiscrepanciaIntegridad { Tabla = tabla, FilaId = null, ErrorVertical = true });
            }
            return resultado;
        }

        public bool EstaInicializado()
        {
            return new DigitoVerificadorVerticalDAL().GetAll().Count > 0;
        }

        public void Inicializar()
        {
            RecalcularDigitosVerificadores();
        }

        private static IList<(string Tabla, IList<IVerificable> Filas)> TablasVerificables()
        {
            return new List<(string, IList<IVerificable>)>
            {
                ("Usuario", new UsuarioDAL().GetAll().Cast<IVerificable>().ToList()),
                ("CONSORCIO", new ConsorcioDAL_413BE().ObtenerTodos_413BE().Cast<IVerificable>().ToList()),
                ("UNIDAD_FUNCIONAL", new UnidadFuncionalDAL_413BE().ObtenerTodos_413BE().Cast<IVerificable>().ToList()),
                ("CONSORCISTA", new ConsorcistaDAL_413BE().ObtenerTodos_413BE().Cast<IVerificable>().ToList()),
                ("CATEGORIA", new CategoriaDAL_413BE().ObtenerTodos_413BE().Cast<IVerificable>().ToList()),
                ("PROVEEDOR", new ProveedorDAL_413BE().ObtenerTodos_413BE().Cast<IVerificable>().ToList()),
                ("PROVEEDOR_CATEGORIA", new ProveedorCategoriaDAL_413BE().ObtenerTodos_413BE().Cast<IVerificable>().ToList()),
                ("RECLAMO", new ReclamoDAL_413BE().ObtenerTodos_413BE().Cast<IVerificable>().ToList()),
                ("ADJUNTO", new AdjuntoDAL_413BE().ObtenerTodos_413BE().Cast<IVerificable>().ToList()),
                ("DERIVACION", new DerivacionDAL_413BE().ObtenerTodos_413BE().Cast<IVerificable>().ToList()),
                ("CIERRE_RECLAMO", new CierreReclamoDAL_413BE().ObtenerTodos_413BE().Cast<IVerificable>().ToList()),
            };
        }

        private static void PersistirDvh(string tabla, IVerificable fila)
        {
            switch (tabla)
            {
                case "Usuario": new UsuarioDAL().ActualizarDVH(fila.Id, fila.DVH); break;
                case "CONSORCIO": new ConsorcioDAL_413BE().ActualizarDvh_413BE(((Consorcio_413BE)fila).IdConsorcio_413BE, fila.DVH); break;
                case "UNIDAD_FUNCIONAL": new UnidadFuncionalDAL_413BE().ActualizarDvh_413BE(((UnidadFuncional_413BE)fila).IdUnidadFuncional_413BE, fila.DVH); break;
                case "CONSORCISTA": new ConsorcistaDAL_413BE().ActualizarDvh_413BE(((Consorcista_413BE)fila).IdConsorcista_413BE, fila.DVH); break;
                case "CATEGORIA": new CategoriaDAL_413BE().ActualizarDvh_413BE(((Categoria_413BE)fila).IdCategoria_413BE, fila.DVH); break;
                case "PROVEEDOR": new ProveedorDAL_413BE().ActualizarDvh_413BE(((Proveedor_413BE)fila).IdProveedor_413BE, fila.DVH); break;
                case "PROVEEDOR_CATEGORIA":
                    ProveedorCategoria_413BE pc = (ProveedorCategoria_413BE)fila;
                    new ProveedorCategoriaDAL_413BE().ActualizarDvh_413BE(pc.IdProveedor_413BE, pc.IdCategoria_413BE, fila.DVH);
                    break;
                case "RECLAMO": new ReclamoDAL_413BE().ActualizarDvh_413BE(((Reclamo_413BE)fila).IdReclamo_413BE, fila.DVH); break;
                case "ADJUNTO": new AdjuntoDAL_413BE().ActualizarDvh_413BE(((Adjunto_413BE)fila).IdAdjunto_413BE, fila.DVH); break;
                case "DERIVACION": new DerivacionDAL_413BE().ActualizarDvh_413BE(((Derivacion_413BE)fila).IdDerivacion_413BE, fila.DVH); break;
                case "CIERRE_RECLAMO": new CierreReclamoDAL_413BE().ActualizarDvh_413BE(((CierreReclamo_413BE)fila).IdCierre_413BE, fila.DVH); break;
            }
        }

        public void RecalcularDigitosVerificadores()
        {
            foreach (var (tabla, filas) in TablasVerificables())
            {
                foreach (IVerificable fila in filas)
                {
                    fila.DVH = CalcularDVH(fila);
                    PersistirDvh(tabla, fila);
                }
                if (filas.Count > 0)
                {
                    ActualizarDVV(tabla, filas);
                }
            }
        }

        public ResultadoIntegridad VerificarIntegridadSistema()
        {
            ResultadoIntegridad resultado = new ResultadoIntegridad();
            foreach (var (_, filas) in TablasVerificables())
            {
                foreach (DiscrepanciaIntegridad d in VerificarIntegridad(filas).Discrepancias)
                {
                    resultado.Discrepancias.Add(d);
                }
            }
            return resultado;
        }
    }
}
