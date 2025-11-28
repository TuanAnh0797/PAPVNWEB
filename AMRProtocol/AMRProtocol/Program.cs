using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AMRProtocol
{
    internal static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        /// 
        public static string PathRequest = ConfigurationManager.AppSettings["PathRequest"];
        public static string PathResponse = ConfigurationManager.AppSettings["PathResponse"];
        public static string IntervalTimer = ConfigurationManager.AppSettings["IntervalTimer"];
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Form1());
        }
    }
}
