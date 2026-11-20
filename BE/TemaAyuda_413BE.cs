namespace BE
{
    // Nodo del árbol de la ayuda en línea (D02): un grupo de temas o un tema con su texto.
    public class TemaAyuda_413BE
    {
        public string Clave_413BE { get; set; } = "";
        public string Titulo_413BE { get; set; } = "";
        public List<string> Lineas_413BE { get; set; } = new List<string>();
        public List<TemaAyuda_413BE> Hijos_413BE { get; set; } = new List<TemaAyuda_413BE>();

        public bool EsGrupo_413BE => Hijos_413BE.Count > 0;

        public string Texto_413BE => string.Join(Environment.NewLine, Lineas_413BE);
    }
}
