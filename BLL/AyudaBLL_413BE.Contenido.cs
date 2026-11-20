// Contenido de la ayuda en línea (D02). Textos por defecto en español: se usan si falta la clave de traducción.
// Las claves y sus traducciones están en AppBaseDB_Instalacion.sql (bloque "D02 - Ayuda en línea").
namespace BLL
{
    public partial class AyudaBLL_413BE
    {
        private static readonly (string Clave_413BE, string Titulo_413BE)[] _grupos_413BE =
        {
            ("pri", "Primeros pasos"),
            ("rec", "Reclamos"),
            ("asa", "Asambleas"),
            ("con", "Conceptos"),
            ("faq", "Preguntas frecuentes"),
            ("sop", "Soporte"),
        };

        private static readonly (string Grupo_413BE, string Clave_413BE, string Titulo_413BE, string[] Lineas_413BE)[] _temas_413BE =
        {
            ("pri", "pri_ingreso", "Ingreso al sistema", new[]
            {
                "Desde Sesión > Iniciar Sesión se abre la pantalla de ingreso. Escriba su usuario y su contraseña y presione Ingresar.",
                "Al ingresar, el menú muestra solo las opciones para las que su usuario tiene permiso.",
                "Si la contraseña es incorrecta se muestra Contraseña Incorrecta. Después de 4 intentos fallidos, el siguiente intento bloquea la cuenta (Usuario Bloqueado).",
                "Una cuenta bloqueada solo la puede desbloquear un administrador desde el menú Usuarios.",
                "Si el usuario fue dado de baja se muestra Usuario Dado de Baja y no se permite el ingreso.",
                "Al ingresar se verifica la integridad de los datos. Si falla, solo un administrador puede ingresar y resolverlo.",
                "Para salir use Sesión > Cerrar Sesión: se cierran todas las pantallas abiertas.",
            }),
            ("pri", "pri_recorrido", "Recorrido general", new[]
            {
                "El circuito principal de un reclamo tiene cuatro pasos, cada uno en el menú Reclamos o Asambleas.",
                "1. Cargar y clasificar reclamo: se registra el reclamo (queda Pendiente de clasificación) y luego se le asigna categoría, tipo de imputación y prioridad (queda Clasificado).",
                "2. Buscar y derivar proveedor: se elige un proveedor de la categoría y un plazo de resolución; el reclamo queda Derivado.",
                "3. Cerrar reclamo e imputar costo: se carga el informe y el costo, y el sistema imputa el gasto; el reclamo queda Cerrado.",
                "4. Armar la asamblea: Generar propuesta agrupa los reclamos repetidos y Definir orden del día fija los temas y la fecha de la asamblea.",
                "Presione F1 o el ícono ? del menú en cualquier pantalla para ver la ayuda de esa pantalla.",
            }),
            ("rec", "rec_cargar", "Cargar y clasificar reclamo", new[]
            {
                "Registra un reclamo nuevo y clasifica los reclamos pendientes.",
                "Carga: elija el consorcio, indique si es de una unidad funcional o de un área común, elija el consorcista y la categoría, escriba la descripción y, si quiere, adjunte fotos. Presione Guardar.",
                "Si en los últimos 30 días se cerró un reclamo del mismo consorcio, categoría y ubicación, el sistema pregunta si es una reincidencia y, si confirma, lo marca como reincidente.",
                "Clasificación: seleccione un reclamo de la grilla de pendientes, revise la categoría y elija el tipo de imputación (Común o Particular) y la prioridad (Urgente, Media o Baja). Presione Clasificar.",
                "La prioridad define el plazo propuesto al derivar: Urgente 2 días, Media 7 días y Baja 15 días.",
                "Errores comunes: el botón Guardar sigue deshabilitado hasta completar todos los datos; un gasto Particular sobre un área común da el error El gasto particular requiere una unidad funcional.",
            }),
            ("rec", "rec_derivar", "Buscar y derivar proveedor", new[]
            {
                "Asigna un proveedor a un reclamo clasificado.",
                "Seleccione un reclamo de Reclamos clasificados: se listan los proveedores habilitados para su categoría.",
                "Las pestañas ordenan los proveedores: Mejor precio (precio promedio), Más rápido (tiempo promedio), Más eficiente (menor tasa de reincidencia) y Recomendado (puntaje que combina los tres). Los proveedores sin historial aparecen al final.",
                "El plazo de resolución (SLA) se propone según la prioridad: Urgente 2, Media 7 y Baja 15 días. Puede modificarlo antes de presionar Derivar.",
                "Si no hay proveedores para la categoría, use Registrar proveedor para dar de alta uno nuevo.",
                "Errores comunes: un plazo de cero días da el error Ingrese un plazo de resolución válido.",
            }),
            ("rec", "rec_registrarProv", "Registrar proveedor", new[]
            {
                "Da de alta un proveedor nuevo desde la pantalla Buscar y derivar proveedor.",
                "Complete nombre, CUIT y email, marque al menos una categoría de trabajo y presione Guardar.",
                "Al guardar, el proveedor queda habilitado y aparece en la lista de la categoría del reclamo.",
                "Errores comunes: Complete nombre, CUIT, email y al menos una categoría; Ingrese un email válido; Ya existe un proveedor registrado con ese CUIT.",
            }),
            ("rec", "rec_cerrar", "Cerrar reclamo e imputar costo", new[]
            {
                "Cierra un reclamo derivado y registra a qué cuenta se imputa el costo.",
                "Seleccione un reclamo de Reclamos derivados, escriba el informe de resolución, el número de factura (opcional) y el costo.",
                "Presione Cerrar reclamo para ver la imputación resultante: un gasto Particular se imputa a la unidad funcional y uno Común al registro general del consorcio.",
                "Revise la cuenta y el monto y presione Confirmar cierre; con Cancelar vuelve atrás sin cerrar.",
                "Errores comunes: Complete el informe y un costo mayor a cero.",
            }),
            ("rec", "rec_historial", "Consultar historial y exportar a PDF", new[]
            {
                "Consulta los reclamos con filtros y el desempeño histórico de cada proveedor.",
                "Elija consorcio, proveedor, categoría, estado y el rango de fechas, y presione Filtrar.",
                "Exportar historial genera un PDF con los reclamos de la grilla.",
                "En Desempeño histórico por proveedor elija un proveedor, presione Ver desempeño y, si quiere, Exportar desempeño a PDF.",
                "Errores comunes: La fecha desde no puede ser posterior a la fecha hasta.",
            }),
            ("asa", "asa_generar", "Generar propuesta", new[]
            {
                "Propone temas para la asamblea agrupando los reclamos repetidos de un consorcio.",
                "Elija el consorcio y el período (desde y hasta) y presione Analizar: se agrupan los reclamos por categoría y ubicación.",
                "Solo quedan como candidatos los grupos con una cantidad de reclamos igual o mayor al umbral de repetición, que se lee de la clave UmbralRepeticion de Configuracion_413BE.txt.",
                "Ingrese el costo de solución de cada grupo y presione Calcular ahorro: el ranking ordena por ahorro estimado (costo acumulado menos costo de solución).",
                "Presione Guardar propuesta; queda en estado Generada.",
                "Errores comunes: El consorcio no tiene reclamos en el período seleccionado; Ningún grupo de reclamos supera el umbral de repetición; Ingrese un costo de solución mayor a cero para cada grupo; Debe configurarse el umbral de repetición.",
            }),
            ("asa", "asa_orden", "Definir orden del día", new[]
            {
                "Convierte una propuesta generada en el orden del día de la asamblea.",
                "Seleccione una propuesta de Propuestas generadas: se listan sus temas.",
                "Marque los temas a incluir y ordénelos con Subir y Bajar.",
                "Elija la fecha de la asamblea y presione Registrar orden del día; la propuesta pasa a Con orden del día.",
                "Errores comunes: Incluya al menos un tema en el orden del día; La fecha de la asamblea no puede ser anterior a hoy.",
            }),
            ("asa", "asa_historial", "Historial de propuestas", new[]
            {
                "Consulta las propuestas generadas y sus temas.",
                "Filtre por consorcio y estado y, si quiere, marque Desde y Hasta para limitar las fechas. Presione Filtrar.",
                "Al seleccionar una propuesta se muestran sus temas y, si tiene orden del día, la fecha de la asamblea.",
                "Exportar a PDF genera un PDF con las propuestas de la grilla.",
                "Errores comunes: La fecha desde no puede ser posterior a la fecha hasta.",
            }),
            ("asa", "asa_serializar", "Serializar y deserializar propuestas", new[]
            {
                "Guarda una propuesta en un archivo XML y lee archivos XML de propuestas.",
                "Serializar: seleccione una propuesta y presione Serializar propuesta seleccionada; el archivo incluye sus temas y el orden del día si existe.",
                "Deserializar: presione Deserializar archivo y elija un XML; se muestran los datos leídos.",
                "Los datos deserializados solo se muestran: no se guardan en la base.",
                "Errores comunes: Seleccione una propuesta; El archivo no es una propuesta válida.",
            }),
            ("con", "con_consorcio", "Consorcio", new[]
            {
                "Un consorcio es el edificio administrado y es la base sobre la que se registran los reclamos.",
                "Datos: nombre, dirección, cantidad de unidades y si está activo.",
                "Agrupa las unidades funcionales y, a través de ellas, a los consorcistas.",
                "Al cargar un reclamo solo se pueden elegir consorcios activos.",
                "Los gastos de imputación Común se imputan al registro general del consorcio.",
                "Las propuestas de temas para la asamblea se generan por consorcio y período.",
            }),
            ("con", "con_unidad", "Unidad funcional y área común", new[]
            {
                "Una unidad funcional es una parte privada del consorcio: departamento, cochera, local o baulera.",
                "Datos: consorcio al que pertenece, identificador (por ejemplo 1A) único dentro del consorcio, tipo y si está activa.",
                "Un área común es un espacio compartido del consorcio: Hall, Ascensor, Terraza, Sala de máquinas, Cocheras, Salón de usos múltiples o Jardín.",
                "Todo reclamo indica su ubicación: una unidad funcional activa o un área común.",
                "Un gasto Particular solo se admite en reclamos de una unidad funcional y se imputa a esa unidad.",
                "La ubicación, junto con la categoría, se usa para detectar reincidencias y para agrupar reclamos en la propuesta de asamblea.",
            }),
            ("con", "con_consorcista", "Consorcista", new[]
            {
                "Un consorcista es la persona vinculada a una unidad funcional del consorcio que hace los reclamos.",
                "Datos: unidad funcional, DNI, nombre, email, si es propietario o inquilino y si está activo.",
                "Cada reclamo queda asociado al consorcista que lo hizo.",
                "En un reclamo de unidad funcional se elige entre los consorcistas activos de esa unidad; en uno de área común, entre los consorcistas activos de todo el consorcio.",
            }),
            ("con", "con_categoria", "Categoría", new[]
            {
                "Una categoría es el tipo de problema o rubro de trabajo, por ejemplo Plomería, Electricidad, Ascensor, Gas o Cerrajería.",
                "Datos: nombre.",
                "Clasifica el reclamo: se elige al cargarlo y se confirma o corrige al clasificarlo.",
                "Determina a qué proveedores se puede derivar: solo a los proveedores habilitados que trabajan en esa categoría.",
                "Se usa para detectar reincidencias y para agrupar los reclamos repetidos en la propuesta de asamblea.",
            }),
            ("con", "con_proveedor", "Proveedor", new[]
            {
                "Un proveedor es la empresa o persona que resuelve los reclamos derivados.",
                "Datos: nombre, CUIT (no se puede repetir), email, una o más categorías en las que trabaja y si está habilitado.",
                "Al derivar un reclamo solo aparecen los proveedores habilitados de su categoría.",
                "Con los reclamos que resolvió se calcula su desempeño (precio promedio, tiempo promedio y tasa de reincidencia), que ordena la lista al derivar.",
                "Cada alta o cambio de sus datos queda registrado como una versión en la bitácora de cambios de proveedores.",
            }),
            ("faq", "faq_bloqueada", "Mi cuenta está bloqueada", new[]
            {
                "El bloqueo de la cuenta ocurre al superar 4 intentos fallidos de contraseña.",
                "Solo un administrador puede desbloquearla desde el menú Usuarios con el botón Desbloquear.",
                "Luego vuelva a ingresar con su contraseña correcta.",
            }),
            ("faq", "faq_idioma", "Cómo cambiar el idioma", new[]
            {
                "Abra el menú Idioma y elija el idioma deseado.",
                "Los menús, las pantallas abiertas y esta ayuda se actualizan al nuevo idioma.",
                "Los textos sin traducción se muestran en español.",
            }),
            ("faq", "faq_permiso", "El menú no muestra una opción", new[]
            {
                "Las opciones del menú dependen de los permisos (patentes) de su usuario.",
                "Si una opción no aparece o está deshabilitada, a su usuario le falta la patente correspondiente.",
                "Pida a un administrador que se la asigne desde Usuarios o Familias y vuelva a iniciar sesión.",
            }),
            ("faq", "faq_pdf", "Cómo exportar a PDF", new[]
            {
                "Historial de reclamos: filtre y presione Exportar historial; para un proveedor use Ver desempeño y Exportar desempeño.",
                "Historial de propuestas: filtre y presione Exportar a PDF.",
                "Elija dónde guardar el archivo; al terminar se muestra PDF generado correctamente.",
            }),
            ("sop", "sop_soporte", "Cómo pedir ayuda", new[]
            {
                "Antes de pedir ayuda revise el tema de la pantalla con F1 y las preguntas frecuentes.",
                "Al pedir ayuda indique la pantalla, qué estaba haciendo y el mensaje exacto que apareció.",
            }),
        };

        private static readonly (string Formulario_413BE, string Control_413BE, string Clave_413BE, string Texto_413BE)[] _tooltips_413BE =
        {
            ("frmCargarClasificarReclamo_413BE", "cboConsorcio", "tt_car_cboConsorcio", "Consorcio donde se produjo el problema"),
            ("frmCargarClasificarReclamo_413BE", "rdoUnidadFuncional", "tt_car_rdoUnidadFuncional", "Elija si el reclamo es de una unidad funcional"),
            ("frmCargarClasificarReclamo_413BE", "rdoAreaComun", "tt_car_rdoAreaComun", "Elija si el reclamo es de un área común"),
            ("frmCargarClasificarReclamo_413BE", "cboUnidadFuncional", "tt_car_cboUnidadFuncional", "Unidad funcional afectada"),
            ("frmCargarClasificarReclamo_413BE", "cboAreaComun", "tt_car_cboAreaComun", "Área común afectada"),
            ("frmCargarClasificarReclamo_413BE", "cboConsorcista", "tt_car_cboConsorcista", "Consorcista que hace el reclamo"),
            ("frmCargarClasificarReclamo_413BE", "cboCategoria", "tt_car_cboCategoria", "Tipo de problema (categoría)"),
            ("frmCargarClasificarReclamo_413BE", "txtDescripcion", "tt_car_txtDescripcion", "Describa el problema con detalle"),
            ("frmCargarClasificarReclamo_413BE", "btnAdjuntarFoto", "tt_car_btnAdjuntarFoto", "Adjunte fotos del problema (opcional)"),
            ("frmCargarClasificarReclamo_413BE", "cboCategoriaClasificacion", "tt_car_cboCategoriaClasif", "Confirme o corrija la categoría"),
            ("frmCargarClasificarReclamo_413BE", "cboTipoImputacion", "tt_car_cboTipoImputacion", "Común: lo paga el consorcio. Particular: lo paga la unidad"),
            ("frmCargarClasificarReclamo_413BE", "cboPrioridad", "tt_car_cboPrioridad", "Urgente 2 días, Media 7 días, Baja 15 días"),
            ("frmBuscarDerivarProveedor_413BE", "dgvReclamos", "tt_der_dgvReclamos", "Seleccione el reclamo clasificado a derivar"),
            ("frmBuscarDerivarProveedor_413BE", "tabCriterios", "tt_der_tabCriterios", "Criterio para ordenar los proveedores"),
            ("frmBuscarDerivarProveedor_413BE", "dgvProveedores", "tt_der_dgvProveedores", "Seleccione el proveedor que resolverá el reclamo"),
            ("frmBuscarDerivarProveedor_413BE", "numSla", "tt_der_numSla", "Días para resolver; se propone según la prioridad"),
            ("frmBuscarDerivarProveedor_413BE", "btnRegistrarProveedor", "tt_der_btnRegistrarProveedor", "Dé de alta un proveedor si no hay ninguno adecuado"),
            ("frmCerrarReclamo_413BE", "dgvDerivados", "tt_cer_dgvDerivados", "Seleccione el reclamo derivado a cerrar"),
            ("frmCerrarReclamo_413BE", "txtInforme", "tt_cer_txtInforme", "Describa el trabajo realizado"),
            ("frmCerrarReclamo_413BE", "txtNumeroFactura", "tt_cer_txtNumeroFactura", "Número de la factura del proveedor (opcional)"),
            ("frmCerrarReclamo_413BE", "numCosto", "tt_cer_numCosto", "Costo total, mayor a cero"),
            ("frmCerrarReclamo_413BE", "btnCerrarReclamo", "tt_cer_btnCerrarReclamo", "Calcula la imputación antes de confirmar"),
        };
    }
}
