using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace INT
{
    public interface IUsuario : IEntity
    {
        string Email { get; set; }
        string Password { get; set; }
        bool Bloq { get; set; }
    }
}
