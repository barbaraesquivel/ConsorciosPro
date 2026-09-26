using INT;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Etiqueta : IEtiqueta
    {
        public Etiqueta()
        {
            Id = Guid.NewGuid();
        }
        public Etiqueta(Guid id)
        {
            Id = id;
        }

        public string Nombre { get; set; }
        public Guid Id { get; set; }
        public TipoEstado Estado { get; set; }
        public bool Baja { get; set; }
    }
}
