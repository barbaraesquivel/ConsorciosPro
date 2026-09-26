using INT;
using System;

namespace BE
{
    public class DigitoVerificadorVertical : Entity, IEntity
    {
        public DigitoVerificadorVertical()
        {
            Tabla = "";
            Atributo = "*";
        }
        public DigitoVerificadorVertical(Guid id)
        {
            _id = id;
            Tabla = "";
            Atributo = "*";
        }
        public string Tabla { get; set; }
        public string Atributo { get; set; }
        public int Valor { get; set; }
        public DateTime FechaCalculo { get; set; }
    }
}
