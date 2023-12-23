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
        public string DataForLineChart(string DateTimeFrom, string DateTimeTo)
        {
            //DataTable dt = DBConnect.StoreFillDS("getdatachart", CommandType.StoredProcedure);

            //var data = new
            //{
            //    labels = dt.AsEnumerable().Select(row => row.Field<string>("NameValue")).ToArray(),
            //    values = dt.AsEnumerable().Select(row => row.Field<int>("DataValue")).ToArray(),
            //};
            var data = new
            {
                datefrom = DateTimeFrom,
                dateto = DateTimeTo
            };

            return Newtonsoft.Json.JsonConvert.SerializeObject(data);
        }
        [WebMethod]
        public string DataForLineChartRealTime()
        {
            DataTable dt = DBConnect.StoreFillDT("LoadDataForChart", CommandType.StoredProcedure, 2);
            var data = new
            {
                Datapiechart = new[] { (int)dt.Rows[0]["TotalOK"], (int)dt.Rows[0]["TotalNG"] },
                dataok = new[] {
                    (int)dt.Rows[0]["VPOK"],
                    (int)dt.Rows[0]["GASOILOK"],
                    (int)dt.Rows[0]["WI1WITHOK"],
                    (int)dt.Rows[0]["WI1STARTOK"],
                    (int)dt.Rows[0]["IPOK"],
                    (int)dt.Rows[0]["DFOK"],
                    (int)dt.Rows[0]["TEMPOK"],
                    (int)dt.Rows[0]["IOTOK"],
                    (int)dt.Rows[0]["WI2OK"],
                    (int)dt.Rows[0]["PANOK"],
                    (int)dt.Rows[0]["CAMBACKOK"],
                    (int)dt.Rows[0]["CAMFRONTOK"] 
                },
                datang = new[] {
                    (int)dt.Rows[0]["VPNG"],
                    (int)dt.Rows[0]["GASOILNG"],
                    (int)dt.Rows[0]["WI1WITHNG"],
                    (int)dt.Rows[0]["WI1STARTNG"],
                    (int)dt.Rows[0]["IPNG"],
                    (int)dt.Rows[0]["DFNG"],
                    (int)dt.Rows[0]["TEMPNG"],
                    (int)dt.Rows[0]["IOTNG"],
                    (int)dt.Rows[0]["WI2NG"],
                    (int)dt.Rows[0]["PANNG"],
                    (int)dt.Rows[0]["CAMBACKNG"],
                    (int)dt.Rows[0]["CAMFRONTNG"]

                },
                datapending = new[] {
                    (int)dt.Rows[0]["VPPENDING"],
                    (int)dt.Rows[0]["GASOILPENDING"],
                    (int)dt.Rows[0]["WI1WITHPENDING"],
                    (int)dt.Rows[0]["WI1STARTPENDING"],
                    (int)dt.Rows[0]["IPPENDING"],
                    (int)dt.Rows[0]["DFPENDING"],
                    (int)dt.Rows[0]["TEMPPENDING"],
                    (int)dt.Rows[0]["IOTPENDING"],
                    (int)dt.Rows[0]["WI2PENDING"],
                    (int)dt.Rows[0]["PANPENDING"],
                    (int)dt.Rows[0]["CAMBACKPENDING"],
                    (int)dt.Rows[0]["CAMFRONTPENDING"]
                },

            };

            return Newtonsoft.Json.JsonConvert.SerializeObject(data);
        }
    }
}
