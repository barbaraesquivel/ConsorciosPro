namespace AppBase
{
    // Reporte Global: manejador del ítem de menú, en archivo aparte para no tocar frmMdiPrincipal.cs.
    public partial class frmMdiPrincipal
    {
        private void mnuReporteGlobal_Click_413BE(object? sender, EventArgs e)
        {
            AbrirHijo_413BE(new frmReporteGlobal_413BE());
        }
    }
}
