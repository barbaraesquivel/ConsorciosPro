using System.Security.Cryptography;
using System.Text;

namespace SER
{
    public static class Encriptador
    {
        public static string Hash(string s)
        {
            try
            {
                SHA256 _SHA256 = SHA256.Create();
                ASCIIEncoding encoding = new ASCIIEncoding();
                byte[] stream = null;
                StringBuilder sb = new StringBuilder();
                stream = _SHA256.ComputeHash(Encoding.ASCII.GetBytes(s));
                for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
                return sb.ToString();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
