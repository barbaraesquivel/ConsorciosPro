using PdfSharp.Drawing;
using PdfSharp.Drawing.Layout;
using PdfSharp.Fonts;
using PdfSharp.Pdf;

namespace SER
{
    // Exporta el Reporte Global a PDF con el mismo estilo que ExportadorPdfService_413BE
    // (PdfSharp, A4 apaisado, Arial, encabezado gris), más filas resaltadas, fila de totales y gráfico de barras.
    public class ReporteGlobalPdfService_413BE
    {
        private const double Margen_413BE = 30;
        private const double AltoFila_413BE = 16;
        private const double AltoEncabezado_413BE = 36;

        static ReporteGlobalPdfService_413BE()
        {
            try
            {
                GlobalFontSettings.UseWindowsFontsUnderWindows = true;
            }
            catch (InvalidOperationException)
            {
            }
        }

        // anchos: peso relativo de cada columna. resaltadas: índices de filas que van en rojo.
        // La última fila de "filas" se dibuja en negrita si totalAlFinal es true.
        public void Exportar_413BE(string titulo, string subtitulo, string leyenda, List<string> encabezados, List<double> anchos,
            List<List<string>> filas, ISet<int> resaltadas, bool totalAlFinal, string tituloGrafico, List<(string Etiqueta, decimal Valor)> barras, string ruta)
        {
            PdfDocument documento = new PdfDocument();
            documento.Info.Title = titulo;
            XFont fuenteTitulo = new XFont("Arial", 14, XFontStyleEx.Bold);
            XFont fuenteSubtitulo = new XFont("Arial", 9, XFontStyleEx.Regular);
            XFont fuenteEncabezado = new XFont("Arial", 9, XFontStyleEx.Bold);
            XFont fuenteCelda = new XFont("Arial", 9, XFontStyleEx.Regular);
            XFont fuenteTotal = new XFont("Arial", 9, XFontStyleEx.Bold);
            XBrush rojo = new XSolidBrush(XColor.FromArgb(178, 34, 34));

            XGraphics grafico = NuevaPagina_413BE(documento, out PdfPage pagina);
            double anchoUtil = pagina.Width.Point - 2 * Margen_413BE;
            double sumaPesos = anchos.Sum();
            List<double> columnas = anchos.Select(a => anchoUtil * a / sumaPesos).ToList();
            double y = Margen_413BE;

            grafico.DrawString(titulo, fuenteTitulo, XBrushes.Black, new XPoint(Margen_413BE, y + 10));
            y += 22;
            grafico.DrawString(subtitulo, fuenteSubtitulo, XBrushes.Black, new XPoint(Margen_413BE, y + 6));
            y += 18;
            DibujarEncabezado_413BE(grafico, encabezados, fuenteEncabezado, y, columnas);
            y += AltoEncabezado_413BE;

            for (int i = 0; i < filas.Count; i++)
            {
                if (y + AltoFila_413BE > pagina.Height.Point - Margen_413BE)
                {
                    grafico.Dispose();
                    grafico = NuevaPagina_413BE(documento, out pagina);
                    y = Margen_413BE;
                    DibujarEncabezado_413BE(grafico, encabezados, fuenteEncabezado, y, columnas);
                    y += AltoEncabezado_413BE;
                }
                bool esTotal = totalAlFinal && i == filas.Count - 1;
                DibujarFila_413BE(grafico, filas[i], esTotal ? fuenteTotal : fuenteCelda, resaltadas.Contains(i) ? rojo : XBrushes.Black, y, columnas, esTotal);
                y += AltoFila_413BE;
            }

            y += 8;
            if (y + AltoFila_413BE > pagina.Height.Point - Margen_413BE)
            {
                grafico.Dispose();
                grafico = NuevaPagina_413BE(documento, out pagina);
                y = Margen_413BE;
            }
            grafico.DrawString(leyenda, fuenteSubtitulo, rojo, new XPoint(Margen_413BE, y + 8));
            y += 24;

            if (barras.Count > 0)
            {
                double altoGrafico = 24 + barras.Count * 20;
                if (y + altoGrafico > pagina.Height.Point - Margen_413BE)
                {
                    grafico.Dispose();
                    grafico = NuevaPagina_413BE(documento, out pagina);
                    y = Margen_413BE;
                }
                DibujarBarras_413BE(grafico, tituloGrafico, barras, fuenteEncabezado, fuenteCelda, y, anchoUtil);
            }
            grafico.Dispose();
            documento.Save(ruta);
        }

        private static XGraphics NuevaPagina_413BE(PdfDocument documento, out PdfPage pagina)
        {
            pagina = documento.AddPage();
            pagina.Size = PdfSharp.PageSize.A4;
            pagina.Orientation = PdfSharp.PageOrientation.Landscape;
            return XGraphics.FromPdfPage(pagina);
        }

        // Encabezado gris con el texto en hasta tres líneas, para que no se corten los títulos largos.
        private static void DibujarEncabezado_413BE(XGraphics grafico, List<string> celdas, XFont fuente, double y, List<double> columnas)
        {
            XTextFormatter formateador = new XTextFormatter(grafico);
            double x = Margen_413BE;
            for (int i = 0; i < celdas.Count && i < columnas.Count; i++)
            {
                XRect rect = new XRect(x, y, columnas[i], AltoEncabezado_413BE);
                grafico.DrawRectangle(XBrushes.LightGray, rect);
                grafico.DrawRectangle(XPens.Gray, rect);
                formateador.DrawString(celdas[i] ?? "", fuente, XBrushes.Black,
                    new XRect(rect.X + 2, rect.Y + 2, rect.Width - 4, rect.Height - 4), XStringFormats.TopLeft);
                x += columnas[i];
            }
        }

        private static void DibujarFila_413BE(XGraphics grafico, List<string> celdas, XFont fuente, XBrush color, double y, List<double> columnas, bool fondoGris)
        {
            double x = Margen_413BE;
            for (int i = 0; i < celdas.Count && i < columnas.Count; i++)
            {
                XRect rect = new XRect(x, y, columnas[i], AltoFila_413BE);
                if (fondoGris)
                {
                    grafico.DrawRectangle(XBrushes.LightGray, rect);
                }
                grafico.DrawRectangle(XPens.Gray, rect);
                grafico.DrawString(Recortar_413BE(grafico, celdas[i] ?? "", fuente, columnas[i] - 4), fuente, color,
                    new XRect(rect.X + 2, rect.Y, rect.Width - 4, rect.Height), XStringFormats.CenterLeft);
                x += columnas[i];
            }
        }

        // Barras horizontales, la más larga ocupa el ancho disponible; el valor se escribe al final de cada barra.
        private static void DibujarBarras_413BE(XGraphics grafico, string titulo, List<(string Etiqueta, decimal Valor)> barras,
            XFont fuenteTitulo, XFont fuente, double y, double anchoUtil)
        {
            grafico.DrawString(titulo, fuenteTitulo, XBrushes.Black, new XPoint(Margen_413BE, y + 10));
            y += 20;
            double anchoEtiqueta = 150;
            double anchoValor = 90;
            double anchoMaximo = anchoUtil - anchoEtiqueta - anchoValor;
            decimal maximo = Math.Max(1m, barras.Max(b => b.Valor));
            XBrush colorBarra = new XSolidBrush(XColor.FromArgb(70, 110, 160));
            foreach ((string etiqueta, decimal valor) in barras)
            {
                grafico.DrawString(Recortar_413BE(grafico, etiqueta, fuente, anchoEtiqueta - 6), fuente, XBrushes.Black,
                    new XRect(Margen_413BE, y, anchoEtiqueta - 6, 14), XStringFormats.CenterLeft);
                double largo = (double)(valor / maximo) * anchoMaximo;
                if (largo > 0)
                {
                    grafico.DrawRectangle(colorBarra, new XRect(Margen_413BE + anchoEtiqueta, y + 1, largo, 12));
                }
                grafico.DrawString(valor.ToString("N2"), fuente, XBrushes.Black,
                    new XRect(Margen_413BE + anchoEtiqueta + largo + 4, y, anchoValor, 14), XStringFormats.CenterLeft);
                y += 20;
            }
        }

        private static string Recortar_413BE(XGraphics grafico, string texto, XFont fuente, double ancho)
        {
            if (grafico.MeasureString(texto, fuente).Width <= ancho) return texto;
            while (texto.Length > 1 && grafico.MeasureString(texto + "…", fuente).Width > ancho)
            {
                texto = texto.Substring(0, texto.Length - 1);
            }
            return texto + "…";
        }
    }
}
