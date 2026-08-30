using INT;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Usuario : Entity, IUsuario
    {
        private IList<IPermiso> _permisos;
        public Usuario()
        {
            _permisos = new List<IPermiso>();
            Email = "";
            Password = "";
            _id = Guid.NewGuid();
        }
        public Usuario(Guid id)
        {
            _permisos = new List<IPermiso>();
            Email = "";
            Password = "";
            _id = id;
        }
        public string Email { get; set; }
        public string Password { get; set; }
        public bool Bloq { get; set; }
        public IList<IPermiso> Permisos
        {
            get
            {
                return _permisos;
            }
        }
    }
}
