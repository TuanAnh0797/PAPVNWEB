using Google.Protobuf.WellKnownTypes;
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
        public string DataForPieChart()
        {
            #region demo
            //Random random1 = new Random();
            //Random random2 = new Random();
            //int ok = random1.Next(20, 100);
            //int ng = random2.Next(10, 30);
            //var data = new
            //{
            //    Datapiechart = new[] { ok, ng }
            //};
            //return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            #endregion
            DataTable dt = DBConnect.StoreFillDT("LoadDataOkNgForChartGas", CommandType.StoredProcedure);
            if (dt.Rows[0][0].ToString() == "")
            {
                var data = new
                {
                    Datapiechart = new[] { (int)dt.Rows[0]["DataOK"], (int)dt.Rows[0]["DataNG"] }
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
            else
            {
                var data = new
                {
                    Datapiechart = new[] {0,0}
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
        }
        [WebMethod]
        public string DataForBarChart()
        {
            #region demo
            //Random random = new Random();
            //int[] dataplan = new int[30];
            //int[] dataplanpertime = new int[30];
            //int[] dataactual = new int[30];
            //string[] labels = new string[30];
            //for (int i = 0; i < 30; i++)
            //{
            //    dataplan[i] = random.Next(200, 400);
            //    dataplanpertime[i] = random.Next(100, 200);
            //    dataactual[i] = random.Next(50, 150);
            //    labels[i] = "Model" + (i+1).ToString();
            //}
            //var data = new
            //{
            //    dataplan,
            //    dataplanpertime,
            //    dataactual,
            //    labels,
            //};
            //return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            #endregion
            DataSet ds = DBConnect.StoreFillDS("LoadDataBarchartPlanGas", CommandType.StoredProcedure);
            if (ds.Tables[0].Rows.Count > 1)
            {
                int[] dataplan;
                int[] dataplanpertime;
                int[] dataactual;
                string[] labels;
                DateTime DateStart = DateTime.Parse(ds.Tables[1].Rows[0]["DateStart"].ToString());
                DateTime DateEnd = DateTime.Parse(ds.Tables[1].Rows[0]["DateEnd"].ToString());
                TimeSpan subtimemaster = DateEnd - DateStart;
                int TypeDate = (int)Math.Round(float.Parse(ds.Tables[0].Rows[0]["TypeData"].ToString()));
                TimeSpan subtimenow = DateTime.Now - DateStart;
                double totalsec = subtimenow.TotalSeconds;
                int hournow = Int32.Parse(DateTime.Now.ToString("HH"));
                if (subtimemaster <= subtimenow) 
                {
                    totalsec = subtimemaster.TotalSeconds;
                }
                else
                {
                    if (TypeDate == 13 || TypeDate == 12 || TypeDate == 1)
                    {
                        if (hournow >= 6 && hournow < 8)
                        {
                            totalsec = totalsec - Config.RestTime6hour * 60;
                        }
                        else if (hournow >= 8 && hournow < 10)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour) * 60;
                        }
                        else if (hournow >= 10 && hournow < 12)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour) * 60;
                        }
                        else if (hournow >= 12 && hournow < 14)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour) * 60;
                        }
                        else if (hournow >= 14 && hournow < 16)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour + Config.RestTime14hour) * 60;
                        }
                        else if (hournow >= 16 && hournow < 18)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour + Config.RestTime14hour + Config.RestTime16hour) * 60;
                        }
                        else if (hournow >= 18 && hournow < 20)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour + Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour) * 60;
                        }
                        else if (hournow >= 20 && hournow < 22)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour + Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour) * 60;
                        }
                        else if (hournow >= 22)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour + Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour + Config.RestTime22hour) * 60;
                        }
                        else if (hournow >= 00 && hournow < 2)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour + Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour + Config.RestTime22hour + Config.RestTime00hour) * 60;
                        }
                        else if (hournow >= 2 && hournow < 4)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour + Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour + Config.RestTime22hour + Config.RestTime00hour + Config.RestTime02hour) * 60;
                        }
                        else
                        {
                            totalsec = totalsec - Config.RestTime1 - Config.RestTime2 - Config.RestTime3;
                        }
                    }
                    else if (TypeDate == 23 || TypeDate == 2)
                    {
                        if (hournow >= 14 && hournow < 16)
                        {
                            totalsec = totalsec - (Config.RestTime14hour) * 60;
                        }
                        else if (hournow >= 16 && hournow < 18)
                        {
                            totalsec = totalsec - (Config.RestTime14hour + Config.RestTime16hour) * 60;
                        }
                        else if (hournow >= 18 && hournow < 20)
                        {
                            totalsec = totalsec - (Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour) * 60;
                        }
                        else if (hournow >= 20 && hournow < 22)
                        {
                            totalsec = totalsec - (Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour) * 60;
                        }
                        else if (hournow >= 22)
                        {
                            totalsec = totalsec - (Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour + Config.RestTime22hour) * 60;
                        }
                        else if (hournow >= 00 && hournow < 2)
                        {
                            totalsec = totalsec - (Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour + Config.RestTime22hour + Config.RestTime00hour) * 60;
                        }
                        else if (hournow >= 2 && hournow < 4)
                        {
                            totalsec = totalsec - (Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour + Config.RestTime22hour + Config.RestTime00hour + Config.RestTime02hour) * 60;
                        }
                        else
                        {
                            totalsec = totalsec - Config.RestTime2 - Config.RestTime3;
                        }
                    }
                    else
                    {
                        if (hournow >= 22)
                        {
                            totalsec = totalsec - (Config.RestTime22hour) * 60;
                        }
                        else if (hournow >= 00 && hournow < 2)
                        {
                            totalsec = totalsec - (Config.RestTime22hour + Config.RestTime00hour) * 60;
                        }
                        else if (hournow >= 2 && hournow < 4)
                        {
                            totalsec = totalsec - (Config.RestTime22hour + Config.RestTime00hour + Config.RestTime02hour) * 60;
                        }
                        else
                        {
                            totalsec = totalsec - Config.RestTime3;
                        }
                    }
                }
                labels = ds.Tables[0].AsEnumerable().Select(row => row.Field<string>("Model")).ToArray();
                dataplan = ds.Tables[0].AsEnumerable().Select(row => (int)Math.Round(float.Parse(row["QuantityPlan"].ToString()))).ToArray();
                dataplanpertime = ds.Tables[0].AsEnumerable().Select(row => (int)Math.Round(float.Parse(row["QuantityPlanPerTime"].ToString()) * totalsec)).ToArray();
                dataactual = ds.Tables[0].AsEnumerable().Select(row => (int)Math.Round(float.Parse(row["QuantityActual"].ToString()))).ToArray();
                var data = new
                {
                    dataplan,
                    dataplanpertime,
                    dataactual,
                    labels,
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
            else
            {
                var data = new
                {
                    dataplan = new[] {0}, 
                    dataplanpertime = new[] {0},
                    dataactual = new[] { 0 },
                    labels = new[] { "" },
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
        }
        [WebMethod]
        public string DataForLineChart()
        {
            #region demo
            //Random random = new Random();
            //int[] dataplan = new int[36];
            //int[] dataactual = new int[36];
            //int[] datadiff = new int[36];
            //for (int i = 0; i < 36; i++)
            //{
            //    if (i == 0)
            //    {
            //        dataplan[i] = 0;
            //        datadiff[i] = 0;
            //        dataactual[i] = 0;
            //    }
            //    else if (i % 3 == 1)
            //    {
            //        dataplan[i] = dataplan[i - 1];
            //        datadiff[i] = datadiff[i - 1];
            //        dataactual[i] = dataactual[i - 1];
            //    }
            //    else
            //    {
            //        dataactual[i] = random.Next(50, 200);
            //        dataplan[i] = random.Next(50, 200);
            //        datadiff[i] = dataactual[i] - dataplan[i];
            //    }
            //}
            //var data = new
            //{
            //    dataplan,
            //    dataactual,
            //    datadiff
            //};
            //return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            #endregion
            DataSet ds = DBConnect.StoreFillDS("LoadDataBarchartPlanGas", CommandType.StoredProcedure);
            if (ds.Tables[0].Rows.Count > 1)
            {
                int[] dataplan;
                int[] dataactual;
                int[] datadiff;
                string[] labels;
                DateTime DateStart = DateTime.Parse(ds.Tables[1].Rows[0]["DateStart"].ToString());
                DateTime DateEnd = DateTime.Parse(ds.Tables[1].Rows[0]["DateEnd"].ToString());
                TimeSpan subtimemaster = DateEnd - DateStart;
                int TypeDate = (int)Math.Round(float.Parse(ds.Tables[0].Rows[0]["TypeData"].ToString()));
                TimeSpan subtimenow = DateTime.Now - DateStart;
                double totalsec = subtimenow.TotalSeconds;
                int hournow = Int32.Parse(DateTime.Now.ToString("HH"));
                if (subtimemaster <= subtimenow)
                {
                    totalsec = subtimemaster.TotalSeconds;
                }
                else
                {
                    if (TypeDate == 13 || TypeDate == 12 || TypeDate == 1)
                    {
                        if (hournow >= 6 && hournow < 8)
                        {
                            totalsec = totalsec - Config.RestTime6hour * 60;
                        }
                        else if (hournow >= 8 && hournow < 10)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour) * 60;
                        }
                        else if (hournow >= 10 && hournow < 12)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour) * 60;
                        }
                        else if (hournow >= 12 && hournow < 14)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour) * 60;
                        }
                        else if (hournow >= 14 && hournow < 16)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour + Config.RestTime14hour) * 60;
                        }
                        else if (hournow >= 16 && hournow < 18)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour + Config.RestTime14hour + Config.RestTime16hour) * 60;
                        }
                        else if (hournow >= 18 && hournow < 20)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour + Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour) * 60;
                        }
                        else if (hournow >= 20 && hournow < 22)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour + Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour) * 60;
                        }
                        else if (hournow >= 22)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour + Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour + Config.RestTime22hour) * 60;
                        }
                        else if (hournow >= 00 && hournow < 2)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour + Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour + Config.RestTime22hour + Config.RestTime00hour) * 60;
                        }
                        else if (hournow >= 2 && hournow < 4)
                        {
                            totalsec = totalsec - (Config.RestTime6hour + Config.RestTime8hour + Config.RestTime10hour + Config.RestTime12hour + Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour + Config.RestTime22hour + Config.RestTime00hour + Config.RestTime02hour) * 60;
                        }
                        else
                        {
                            totalsec = totalsec - Config.RestTime1 - Config.RestTime2 - Config.RestTime3;
                        }
                    }
                    else if (TypeDate == 23 || TypeDate == 2)
                    {
                        if (hournow >= 14 && hournow < 16)
                        {
                            totalsec = totalsec - (Config.RestTime14hour) * 60;
                        }
                        else if (hournow >= 16 && hournow < 18)
                        {
                            totalsec = totalsec - (Config.RestTime14hour + Config.RestTime16hour) * 60;
                        }
                        else if (hournow >= 18 && hournow < 20)
                        {
                            totalsec = totalsec - (Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour) * 60;
                        }
                        else if (hournow >= 20 && hournow < 22)
                        {
                            totalsec = totalsec - (Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour) * 60;
                        }
                        else if (hournow >= 22)
                        {
                            totalsec = totalsec - (Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour + Config.RestTime22hour) * 60;
                        }
                        else if (hournow >= 00 && hournow < 2)
                        {
                            totalsec = totalsec - (Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour + Config.RestTime22hour + Config.RestTime00hour) * 60;
                        }
                        else if (hournow >= 2 && hournow < 4)
                        {
                            totalsec = totalsec - (Config.RestTime14hour + Config.RestTime16hour + Config.RestTime18hour + Config.RestTime20hour + Config.RestTime22hour + Config.RestTime00hour + Config.RestTime02hour) * 60;
                        }
                        else
                        {
                            totalsec = totalsec - Config.RestTime2 - Config.RestTime3;
                        }
                    }
                    else
                    {
                        if (hournow >= 22)
                        {
                            totalsec = totalsec - (Config.RestTime22hour) * 60;
                        }
                        else if (hournow >= 00 && hournow < 2)
                        {
                            totalsec = totalsec - (Config.RestTime22hour + Config.RestTime00hour) * 60;
                        }
                        else if (hournow >= 2 && hournow < 4)
                        {
                            totalsec = totalsec - (Config.RestTime22hour + Config.RestTime00hour + Config.RestTime02hour) * 60;
                        }
                        else
                        {
                            totalsec = totalsec - Config.RestTime3;
                        }
                    }
                }
                //int[] dataplan;
                //int[] dataactual;
                //int[] datadiff;
                //string[] labels;


                labels = ds.Tables[0].AsEnumerable().Select(row => row.Field<string>("Model")).ToArray();
                dataplan = ds.Tables[0].AsEnumerable().Select(row => (int)Math.Round(float.Parse(row["QuantityPlan"].ToString()))).ToArray();
                datadiff = ds.Tables[0].AsEnumerable().Select(row => (int)Math.Round(float.Parse(row["QuantityPlanPerTime"].ToString()) * totalsec)).ToArray();
                dataactual = ds.Tables[0].AsEnumerable().Select(row => (int)Math.Round(float.Parse(row["QuantityActual"].ToString()))).ToArray();
                var data = new
                {
                    dataplan,
                    dataactual,
                    datadiff,
                    labels,
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
            else
            {
                var data = new
                {
                    dataplan = new[] { 0 },
                    dataactual = new[] { 0 },
                    datadiff = new[] { 0 },
                    labels = new[] { "" },
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
        }
    }
}
