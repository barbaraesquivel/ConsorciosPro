using PdfSharp.Drawing;
using PdfSharp.Fonts;
using PdfSharp.Pdf;

namespace SER
{
    public class ExportadorPdfService_413BE
    {
        private const double Margen = 30;

        static ExportadorPdfService_413BE()
        {
            try
            {
                GlobalFontSettings.UseWindowsFontsUnderWindows = true;
            }
            catch (InvalidOperationException)
            {
            }
        }

        public void ExportarTabla_413BE(string titulo, List<string> encabezados, List<List<string>> filas, string ruta)
        {
            PdfDocument documento = new PdfDocument();
            documento.Info.Title = titulo;
            XFont fuenteTitulo = new XFont("Arial", 14, XFontStyleEx.Bold);
            XFont fuenteEncabezado = new XFont("Arial", 9, XFontStyleEx.Bold);
            XFont fuenteCelda = new XFont("Arial", 9, XFontStyleEx.Regular);
            double altoFila = 16;

            PdfPage pagina = documento.AddPage();
            pagina.Size = PdfSharp.PageSize.A4;
            pagina.Orientation = PdfSharp.PageOrientation.Landscape;
            XGraphics grafico = XGraphics.FromPdfPage(pagina);
            double anchoUtil = pagina.Width.Point - 2 * Margen;
            double anchoColumna = anchoUtil / Math.Max(1, encabezados.Count);
            double y = Margen;

            grafico.DrawString(titulo, fuenteTitulo, XBrushes.Black, new XPoint(Margen, y + 10));
            y += 30;
            DibujarFila(grafico, encabezados, fuenteEncabezado, y, anchoColumna, altoFila, true);
            y += altoFila;

            foreach (List<string> fila in filas)
            {
                if (y + altoFila > pagina.Height.Point - Margen)
                {
                    grafico.Dispose();
                    pagina = documento.AddPage();
                    pagina.Size = PdfSharp.PageSize.A4;
                    pagina.Orientation = PdfSharp.PageOrientation.Landscape;
                    grafico = XGraphics.FromPdfPage(pagina);
                    y = Margen;
                    DibujarFila(grafico, encabezados, fuenteEncabezado, y, anchoColumna, altoFila, true);
                    y += altoFila;
                }
                DibujarFila(grafico, fila, fuenteCelda, y, anchoColumna, altoFila, false);
                y += altoFila;
            }
            grafico.Dispose();
            documento.Save(ruta);
        }

        private static void DibujarFila(XGraphics grafico, List<string> celdas, XFont fuente, double y, double anchoColumna, double alto, bool encabezado)
        {
            for (int i = 0; i < celdas.Count; i++)
            {
                XRect rect = new XRect(Margen + i * anchoColumna, y, anchoColumna, alto);
                if (encabezado)
                {
                    grafico.DrawRectangle(XBrushes.LightGray, rect);
                }
                grafico.DrawRectangle(XPens.Gray, rect);
                grafico.DrawString(celdas[i] ?? "", fuente, XBrushes.Black,
                    new XRect(rect.X + 2, rect.Y, rect.Width - 4, rect.Height), XStringFormats.CenterLeft);
            }
        }
    }
}
