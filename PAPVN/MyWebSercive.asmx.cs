using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace PAPVN
{
    /// <summary>
    /// Summary description for MyWebSercive
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    [ScriptService()]
    public class MyWebSercive : System.Web.Services.WebService
    {

        [WebMethod]
        public string DataForLineChart()
        {
            DataTable dt = DBConnect.StoreFillDS("getdatachart", CommandType.StoredProcedure);

            var data = new
            {
                labels = dt.AsEnumerable().Select(row => row.Field<string>("NameValue")).ToArray(),
                values = dt.AsEnumerable().Select(row => row.Field<int>("DataValue")).ToArray(),
            };

            return Newtonsoft.Json.JsonConvert.SerializeObject(data);
        }
    }
}
