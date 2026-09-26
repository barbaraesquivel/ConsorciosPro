using BE;
using DAL;
using INT;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class TraductorBLL
    {
        TraductorDAL traductorDAL;
        public TraductorBLL()
        {
            traductorDAL = new TraductorDAL();
        }
        public IIdioma ObtenerIdiomaDefault()
        {
            return traductorDAL.ObtenerIdiomaDefault();
        }
        public IDictionary<string, ITraduccion> ObtenerTraduccion(IIdioma idioma = null)
        {
            if (idioma == null)
                idioma = ObtenerIdiomaDefault();
            IDictionary<string, ITraduccion> _traducciones = new Dictionary<string, ITraduccion>();
            _traducciones = traductorDAL.ObtenerTraduccion(idioma);
            return _traducciones;
        }
        public IList<Idioma> ObtenerIdiomas()
        {
            IList<Idioma> _traducciones = new List<Idioma>();
            foreach (IIdioma i in traductorDAL.ObtenerIdiomas())
            {
                Idioma idi = new Idioma(i.Id);
                idi.Nombre = i.Nombre;
                idi.Estado = i.Estado;
                idi.Default = i.Default;
                _traducciones.Add(idi);
            }
            return _traducciones;
        }
        public void CrearIdioma(List<ITraduccion> diccionario, IIdioma nuevoIdioma)
        {
            traductorDAL.Crear(diccionario, nuevoIdioma);
        }
    }
}
