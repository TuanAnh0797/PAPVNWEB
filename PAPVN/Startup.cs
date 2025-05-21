using Microsoft.Owin;
using Owin;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

[assembly: OwinStartup(typeof(PAPVN.Startup))]
namespace PAPVN
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR();
            //string path = HttpContext.Current.Server.MapPath("~/wwwroot/config.ini");

            //string[] config = File.ReadAllLines(path);


            //Config.TimeRest = config[0].Split(',').Select(int.Parse).ToArray();
        }
    }
}
