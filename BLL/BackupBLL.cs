using DAL;
using System;

namespace BLL
{
    public class BackupBLL
    {
        BackupDAL _backupDAL;
        public BackupBLL()
        {
            _backupDAL = new BackupDAL();
        }
        public void HacerBackup(string rutaDestino)
        {
            if (string.IsNullOrWhiteSpace(rutaDestino))
                throw new Exception("Debe indicar una ruta de destino para el backup");
            _backupDAL.HacerBackup(rutaDestino);
        }
        public void Restaurar(string rutaOrigen)
        {
            if (string.IsNullOrWhiteSpace(rutaOrigen))
                throw new Exception("Debe indicar el archivo de backup a restaurar");
            _backupDAL.Restaurar(rutaOrigen);
        }
    }
}
