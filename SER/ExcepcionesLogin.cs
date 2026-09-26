using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using INT;

namespace SER
{
    public class ExcepcionesLogin : Exception
    {
        public TipoResultadoLogin Resultado;
        public ExcepcionesLogin(TipoResultadoLogin resultado)
        {
            Resultado = resultado;
        }
    }
}
