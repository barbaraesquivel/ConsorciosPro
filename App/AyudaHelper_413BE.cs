using BLL;

namespace AppBase
{
    // Punto único de entrada a la ayuda en línea (D02) desde la interfaz.
    public static class AyudaHelper_413BE
    {
        // Pantalla -> tema de ayuda contextual.
        private static readonly Dictionary<string, string> _temasPorFormulario_413BE = new Dictionary<string, string>
        {
            { nameof(frmCargarClasificarReclamo_413BE), "rec_cargar" },
            { nameof(frmBuscarDerivarProveedor_413BE), "rec_derivar" },
            { nameof(frmRegistrarProveedor_413BE), "rec_registrarProv" },
            { nameof(frmCerrarReclamo_413BE), "rec_cerrar" },
            { nameof(frmHistorialReclamos_413BE), "rec_historial" },
            { nameof(frmReporteGlobal_413BE), "rec_reporteGlobal" },
            { nameof(frmGenerarPropuesta_413BE), "asa_generar" },
            { nameof(frmDefinirOrdenDia_413BE), "asa_orden" },
            { nameof(frmHistorialPropuestas_413BE), "asa_historial" },
            { nameof(frmSerializacionPropuestas_413BE), "asa_serializar" },
            { nameof(frmMantenimientoConsorcios_413BE), "con_consorcio" },
            { nameof(frmMantenimientoProveedores_413BE), "con_consorcio" },
            { nameof(frmBitacoraProveedores_413BE), "con_consorcio" },
            { nameof(frmLogin), "pri_ingreso" },
        };

        // Tooltips creados por formulario abierto.
        private static readonly Dictionary<Form, ToolTip> _tooltips_413BE = new Dictionary<Form, ToolTip>();

        // Abre la ayuda general (o la trae al frente si ya está abierta) posicionada en el tema indicado.
        // Con tema null conserva el tema que ya se estaba mostrando.
        public static void Abrir_413BE(string? tema)
        {
            frmMdiPrincipal? principal = Application.OpenForms.OfType<frmMdiPrincipal>().FirstOrDefault();
            if (principal == null) return;

            frmAyuda_413BE? ayuda = principal.MdiChildren.OfType<frmAyuda_413BE>().FirstOrDefault(f => !f.IsDisposed);
            bool nueva = ayuda == null;
            if (ayuda == null)
            {
                ayuda = new frmAyuda_413BE();
                ayuda.MdiParent = principal;
                ayuda.Show();
            }
            if (tema != null || nueva)
            {
                ayuda.MostrarTema_413BE(tema ?? AyudaBLL_413BE.TemaInicio_413BE);
            }
            ayuda.BringToFront();
            ayuda.Activate();
        }

        // Variante para diálogos modales (el principal está deshabilitado mientras el diálogo está abierto):
        // abre una ayuda propia del diálogo, también modal, en el tema indicado.
        public static void AbrirModal_413BE(string? tema, Form propietario)
        {
            using (frmAyuda_413BE ayuda = new frmAyuda_413BE())
            {
                ayuda.MostrarTema_413BE(tema ?? AyudaBLL_413BE.TemaInicio_413BE);
                frmMdiPrincipal? principal = Application.OpenForms.OfType<frmMdiPrincipal>().FirstOrDefault();
                principal?.CambiarIdiomaFormulario(ayuda, SER.SessionManager.Idioma);
                ayuda.ShowDialog(propietario);
            }
        }

        // Tema de la pantalla activa; inicio si no hay pantalla o no tiene tema; null si la activa es la propia ayuda.
        public static string? TemaDeFormulario_413BE(Form? formulario)
        {
            if (formulario is frmAyuda_413BE) return null;
            if (formulario != null && _temasPorFormulario_413BE.TryGetValue(formulario.GetType().Name, out string? tema)) return tema;
            return AyudaBLL_413BE.TemaInicio_413BE;
        }

        // Aplica los tooltips traducidos de la pantalla (solo la primera vez que se activa).
        public static void AplicarTooltips_413BE(Form? formulario)
        {
            if (formulario == null || formulario.IsDisposed || _tooltips_413BE.ContainsKey(formulario)) return;
            CargarTooltips_413BE(formulario);
        }

        // Tras un cambio de idioma: vuelve a traducir los tooltips y actualiza la ayuda abierta.
        public static void RefrescarIdioma_413BE(frmMdiPrincipal principal)
        {
            foreach (Form hijo in principal.MdiChildren)
            {
                if (hijo.IsDisposed) continue;
                if (_tooltips_413BE.ContainsKey(hijo)) CargarTooltips_413BE(hijo);
                if (hijo is frmAyuda_413BE ayuda) ayuda.ActualizarIdioma(SER.SessionManager.Idioma);
            }
        }

        private static void CargarTooltips_413BE(Form formulario)
        {
            Dictionary<string, string> textos;
            try
            {
                textos = new AyudaBLL_413BE().ObtenerTooltips_413BE(formulario.GetType().Name);
            }
            catch (Exception)
            {
                return;
            }
            if (textos.Count == 0) return;

            if (!_tooltips_413BE.TryGetValue(formulario, out ToolTip? tooltip))
            {
                tooltip = new ToolTip();
                _tooltips_413BE.Add(formulario, tooltip);
                formulario.FormClosed += Formulario_FormClosed_413BE;
            }
            foreach (KeyValuePair<string, string> par in textos)
            {
                Control? control = formulario.Controls.Find(par.Key, true).FirstOrDefault();
                if (control != null) tooltip.SetToolTip(control, par.Value);
            }
        }

        private static void Formulario_FormClosed_413BE(object? sender, FormClosedEventArgs e)
        {
            if (sender is not Form formulario) return;
            formulario.FormClosed -= Formulario_FormClosed_413BE;
            if (_tooltips_413BE.TryGetValue(formulario, out ToolTip? tooltip))
            {
                _tooltips_413BE.Remove(formulario);
                tooltip.Dispose();
            }
        }
    }
}
