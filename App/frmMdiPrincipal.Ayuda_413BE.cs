using SER;

namespace AppBase
{
    // Ayuda en línea (D02): manejadores nuevos del formulario principal, en archivo aparte para no tocar frmMdiPrincipal.cs.
    public partial class frmMdiPrincipal
    {
        // Ícono "?" del menú y F1 (ShortcutKeys del mismo ítem): ayuda de la pantalla hija activa, o inicio si no hay ninguna.
        private void mnuAyuda_Click_413BE(object? sender, EventArgs e)
        {
            if (!SessionManager.EstaLogueado()) return;
            AyudaHelper_413BE.Abrir_413BE(AyudaHelper_413BE.TemaDeFormulario_413BE(this.ActiveMdiChild));
        }

        private void frmMdiPrincipal_MdiChildActivate_413BE(object? sender, EventArgs e)
        {
            AyudaHelper_413BE.AplicarTooltips_413BE(this.ActiveMdiChild);
        }

        // Se ejecuta antes que idioma_Click; BeginInvoke difiere el refresco hasta que el idioma ya cambió.
        private void idioma_DropDownItemClicked_413BE(object? sender, ToolStripItemClickedEventArgs e)
        {
            BeginInvoke(new Action(() => AyudaHelper_413BE.RefrescarIdioma_413BE(this)));
        }
    }
}
