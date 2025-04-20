using PAPVN.WebFormSignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Timers;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace PAPVN
{
    public class Global : HttpApplication
    {
        private static Timer timer;
        void Application_Start(object sender, EventArgs e)
        {

            
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            timer = new Timer(5000); // Cập nhật mỗi 5 giây
            timer.Elapsed += (s, args) => ChatHub.UpdateData();
            timer.AutoReset = true;
            timer.Start();
            
        }
    }
}