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
            DataTable dt = DBConnect.StoreFillDT("LoadDataForChartHistory", CommandType.StoredProcedure, DateTimeFrom, DateTimeTo);
            if (dt.Rows[0]["VPOK"].ToString() != "")
            {
                var data = new
                {
                    Datapiechart = new[] { int.Parse(dt.Rows[0]["TotalOK"].ToString()), int.Parse(dt.Rows[0]["TotalNG"].ToString()) },
                    dataok = new[] {
                    int.Parse(dt.Rows[0]["VPOK"].ToString()),
                    int.Parse(dt.Rows[0]["GASOILOK"].ToString()),
                    int.Parse(dt.Rows[0]["WI1WITHOK"].ToString()),
                     int.Parse(dt.Rows[0]["WI1STARTOK"].ToString()),
                     int.Parse(dt.Rows[0]["IPOK"].ToString()),
                    int.Parse(dt.Rows[0]["DFOK"].ToString()),
                     int.Parse(dt.Rows[0]["TEMPOK"].ToString()),
                     int.Parse(dt.Rows[0]["IOTOK"].ToString()),
                     int.Parse(dt.Rows[0]["WI2OK"].ToString()),
                     int.Parse(dt.Rows[0]["PANOK"].ToString()),
                     int.Parse(dt.Rows[0]["CAMBACKOK"].ToString()),
                     int.Parse(dt.Rows[0]["CAMFRONTOK"].ToString())
                },
                    datang = new[] {
                    int.Parse(dt.Rows[0]["VPNG"].ToString()),
                    int.Parse(dt.Rows[0]["GASOILNG"].ToString()),
                    int.Parse(dt.Rows[0]["WI1WITHNG"].ToString()),
                     int.Parse(dt.Rows[0]["WI1STARTNG"].ToString()),
                     int.Parse(dt.Rows[0]["IPNG"].ToString()),
                    int.Parse(dt.Rows[0]["DFNG"].ToString()),
                     int.Parse(dt.Rows[0]["TEMPNG"].ToString()),
                     int.Parse(dt.Rows[0]["IOTNG"].ToString()),
                     int.Parse(dt.Rows[0]["WI2NG"].ToString()),
                     int.Parse(dt.Rows[0]["PANNG"].ToString()),
                     int.Parse(dt.Rows[0]["CAMBACKNG"].ToString()),
                     int.Parse(dt.Rows[0]["CAMFRONTNG"].ToString())
                },
                    datapending = new[] {
                   int.Parse(dt.Rows[0]["VPPENDING"].ToString()),
                    int.Parse(dt.Rows[0]["GASOILPENDING"].ToString()),
                    int.Parse(dt.Rows[0]["WI1WITHPENDING"].ToString()),
                     int.Parse(dt.Rows[0]["WI1STARTPENDING"].ToString()),
                     int.Parse(dt.Rows[0]["IPPENDING"].ToString()),
                    int.Parse(dt.Rows[0]["DFPENDING"].ToString()),
                     int.Parse(dt.Rows[0]["TEMPPENDING"].ToString()),
                     int.Parse(dt.Rows[0]["IOTPENDING"].ToString()),
                     int.Parse(dt.Rows[0]["WI2PENDING"].ToString()),
                     int.Parse(dt.Rows[0]["PANPENDING"].ToString()),
                     int.Parse(dt.Rows[0]["CAMBACKPENDING"].ToString()),
                     int.Parse(dt.Rows[0]["CAMFRONTPENDING"].ToString())
                },
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
            else
            {
                var data = new
                {
                    Datapiechart = new[] { 0, 0 },
                    dataok = new[] {
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0
                },
                    datang = new[] {
                    0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0
                },
                    datapending = new[] {
                   0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0
                },
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
        }
        [WebMethod]
        public string DataForLineChartRealTime()
        {
            DataTable dt = DBConnect.StoreFillDT("LoadDataForChart", CommandType.StoredProcedure, 2);
            if (dt.Rows[0]["VPOK"].ToString() != "")
            {
                var data = new
                {
                    Datapiechart = new[] { int.Parse(dt.Rows[0]["TotalOK"].ToString()), int.Parse(dt.Rows[0]["TotalNG"].ToString()) },
                    dataok = new[] {
                    int.Parse(dt.Rows[0]["VPOK"].ToString()),
                    int.Parse(dt.Rows[0]["GASOILOK"].ToString()),
                    int.Parse(dt.Rows[0]["WI1WITHOK"].ToString()),
                     int.Parse(dt.Rows[0]["WI1STARTOK"].ToString()),
                     int.Parse(dt.Rows[0]["IPOK"].ToString()),
                    int.Parse(dt.Rows[0]["DFOK"].ToString()),
                     int.Parse(dt.Rows[0]["TEMPOK"].ToString()),
                     int.Parse(dt.Rows[0]["IOTOK"].ToString()),
                     int.Parse(dt.Rows[0]["WI2OK"].ToString()),
                     int.Parse(dt.Rows[0]["PANOK"].ToString()),
                     int.Parse(dt.Rows[0]["CAMBACKOK"].ToString()),
                     int.Parse(dt.Rows[0]["CAMFRONTOK"].ToString())
                },
                    datang = new[] {
                    int.Parse(dt.Rows[0]["VPNG"].ToString()),
                    int.Parse(dt.Rows[0]["GASOILNG"].ToString()),
                    int.Parse(dt.Rows[0]["WI1WITHNG"].ToString()),
                     int.Parse(dt.Rows[0]["WI1STARTNG"].ToString()),
                     int.Parse(dt.Rows[0]["IPNG"].ToString()),
                    int.Parse(dt.Rows[0]["DFNG"].ToString()),
                     int.Parse(dt.Rows[0]["TEMPNG"].ToString()),
                     int.Parse(dt.Rows[0]["IOTNG"].ToString()),
                     int.Parse(dt.Rows[0]["WI2NG"].ToString()),
                     int.Parse(dt.Rows[0]["PANNG"].ToString()),
                     int.Parse(dt.Rows[0]["CAMBACKNG"].ToString()),
                     int.Parse(dt.Rows[0]["CAMFRONTNG"].ToString())
                },
                    datapending = new[] {
                   int.Parse(dt.Rows[0]["VPPENDING"].ToString()),
                    int.Parse(dt.Rows[0]["GASOILPENDING"].ToString()),
                    int.Parse(dt.Rows[0]["WI1WITHPENDING"].ToString()),
                     int.Parse(dt.Rows[0]["WI1STARTPENDING"].ToString()),
                     int.Parse(dt.Rows[0]["IPPENDING"].ToString()),
                    int.Parse(dt.Rows[0]["DFPENDING"].ToString()),
                     int.Parse(dt.Rows[0]["TEMPPENDING"].ToString()),
                     int.Parse(dt.Rows[0]["IOTPENDING"].ToString()),
                     int.Parse(dt.Rows[0]["WI2PENDING"].ToString()),
                     int.Parse(dt.Rows[0]["PANPENDING"].ToString()),
                     int.Parse(dt.Rows[0]["CAMBACKPENDING"].ToString()),
                     int.Parse(dt.Rows[0]["CAMFRONTPENDING"].ToString())
                },
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
            else
            {
                var data = new
                {
                    Datapiechart = new[] { 0, 0 },
                    dataok = new[] {
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0
                },
                    datang = new[] {
                    0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0
                },
                    datapending = new[] {
                   0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0
                },
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
        }
        [WebMethod]
        public string DataForQuantitybyHour()
        {
            DataTable dt = DBConnect.StoreFillDT("LoadDataQuantityByHour", CommandType.StoredProcedure, 2);
            if (dt.Rows[0]["VPOK"].ToString() != "")
            {
                var data = new
                {
                    values = dt.AsEnumerable().Select(row => row.Field<int>("DataValue")).ToArray(),
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
            else
            {
                var data = new
                {
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
        }
        [WebMethod]
        public string DataForPieChart()
        {
            Random random1 = new Random();
            Random random2 = new Random();
            int ok = random1.Next(20, 100);
            int ng = random2.Next(10, 30);
            var data = new
            {
                Datapiechart = new[] { ok, ng }
            };
            return Newtonsoft.Json.JsonConvert.SerializeObject(data);
        }
        [WebMethod]
        public string DataForBarChart()
        {
            Random random = new Random();

            int[] dataplan = new int[30];
            int[] dataplanpertime = new int[30];
            int[] dataactual = new int[30];
            string[] labels = new string[30];

            for (int i = 0; i < 30; i++)
            {
                dataplan[i] = random.Next(200, 400);
                dataplanpertime[i] = random.Next(100, 200);
                dataactual[i] = random.Next(50, 150);
                labels[i] = "Model" + (i+1).ToString();

            }

            var data = new
            {
                dataplan,
                dataplanpertime,
                dataactual,
                labels,
            };
            return Newtonsoft.Json.JsonConvert.SerializeObject(data);
        }
        [WebMethod]
        public string DataForLineChart()
        {
           
            Random random = new Random();
            int[] dataplan = new int[36];
            int[] dataactual = new int[36];
            int[] datadiff = new int[36];
            for (int i = 0; i < 36; i++)
            {
               
                if (i == 0)
                {
                    dataplan[i] = 0;
                    datadiff[i] = 0;
                    dataactual[i] = 0;
                }
                else if (i%3 == 1)
                {
                    dataplan[i] = dataplan[i - 1];
                    datadiff[i] = datadiff[i - 1];
                    dataactual[i] = dataactual[i - 1];
                }
                else
                {
                    dataactual[i] = random.Next(50, 200);
                    dataplan[i] = random.Next(50, 200);
                    datadiff[i] = dataactual[i] - dataplan[i];
                }
               
              
               
            }


            var data = new
            {
                //dataplan = dataplan,
                //dataactual = dataactual,
                //datadiff = datadiff
                dataplan,
                 dataactual,
                datadiff

            };
            return Newtonsoft.Json.JsonConvert.SerializeObject(data);
        }
    }
}
