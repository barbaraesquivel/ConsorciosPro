using INT;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SER
{
    public class SessionManager
    {
        private static IList<IIdiomaObserver> _observers = new List<IIdiomaObserver>();
        public static IIdioma Idioma;
        static SessionManager? _instancia;
        static object _candado = new object();
        static IUsuario? _usuario;
        static DateTime _inicio;

        private SessionManager() { }

        public static SessionManager Instancia
        {
            get
            {
                if (_instancia == null)
                    _instancia = new SessionManager();
                return _instancia;
            }
        }
        public IUsuario Usuario
        {
            get
            {
                try
                {
                    if (_usuario != null) return _usuario;
                    else throw new Exception("no hay usuario");
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }
        public DateTime Inicio { get => _inicio; }
        public static void Login(IUsuario usuario)
        {
            lock (_candado)
            {
                try
                {
                    if (_instancia == null)
                    {
                        _instancia = new SessionManager();
                        _inicio = DateTime.Now;
                        _usuario = usuario;
                    }
                    else throw new Exception("Ya hay una sesion iniciada");
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
        public static void Logout()
        {
            lock (_candado)
            {
                try
                {
                    if (_instancia != null)
                    {
                        _instancia = null;
                    }
                    else throw new Exception("No hay una sesion iniciada");
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
        public static bool EstaLogueado()
        {
            return _instancia != null;
        }
        public static void AgregarObservador(IIdiomaObserver o)
        {
            _observers.Add(o);
        }
        public static void QuitarObservador(IIdiomaObserver o)
        {
            _observers.Remove(o);
        }

        private static void Notificar(IIdioma idioma)
        {
            foreach (var o in _observers)
            {
                o.ActualizarIdioma(idioma);
            }
        }
        public static void CambiarIdioma(IIdioma idioma)
        {            
            Idioma = idioma;
            Notificar(idioma);
        }
    }
}
