using System.Text;
using System.Xml.Serialization;

namespace SER
{
    public class SerializacionService_413BE
    {
        public void Serializar_413BE<T>(T objeto, string ruta)
        {
            XmlSerializer serializador = new XmlSerializer(typeof(T));
            using (StreamWriter escritor = new StreamWriter(ruta, false, new UTF8Encoding(false)))
            {
                serializador.Serialize(escritor, objeto);
            }
        }

        public T Deserializar_413BE<T>(string ruta)
        {
            try
            {
                XmlSerializer serializador = new XmlSerializer(typeof(T));
                using (StreamReader lector = new StreamReader(ruta, Encoding.UTF8))
                {
                    object? resultado = serializador.Deserialize(lector);
                    if (resultado is T objeto) return objeto;
                }
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException("El archivo no es una propuesta válida", ex);
            }
            throw new InvalidOperationException("El archivo no es una propuesta válida");
        }
    }
}
