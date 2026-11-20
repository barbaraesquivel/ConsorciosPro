namespace AppBase
{
    // Ayuda en línea (D02): F1 dentro del diálogo modal, en archivo aparte para no tocar frmRegistrarProveedor_413BE.cs.
    public partial class frmRegistrarProveedor_413BE
    {
        private void frmRegistrarProveedor_HelpRequested_413BE(object? sender, HelpEventArgs hlpevent)
        {
            hlpevent.Handled = true;
            AyudaHelper_413BE.AbrirModal_413BE(AyudaHelper_413BE.TemaDeFormulario_413BE(this), this);
        }
    }
}
