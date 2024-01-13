using Google.Protobuf.WellKnownTypes;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;
using System.Web.DynamicData;
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
            DBConnect dBConnect = new DBConnect();
            DataTable dt = dBConnect.StoreFillDT("LoadDataForChartHistory", CommandType.StoredProcedure, DateTimeFrom, DateTimeTo);
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
            DBConnect dBConnect = new DBConnect();
            DataTable dt = dBConnect.StoreFillDT("LoadDataForChart", CommandType.StoredProcedure, 2);
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
        public string DataForBarChart()
        {
            DBConnect dBConnect = new DBConnect();
            DataTable dt = dBConnect.StoreFillDT("LoadDataForBarChartPlanGas", CommandType.StoredProcedure);
            DateTime datetimenow = DateTime.Now;
            if (dt.Rows.Count > 1)
            {
                int[] dataplan = new int[dt.Rows.Count - 1];
                int[] dataplanpertime = new int[dt.Rows.Count - 1];
                int[] dataactual = new int[dt.Rows.Count - 1];
                string[] labels = new string[dt.Rows.Count - 1];
                for (int i = 0; i < dt.Rows.Count - 1; i++)
                {
                    labels[i] = dt.Rows[i]["Model"].ToString();
                    dataplan[i] = Int32.Parse(dt.Rows[i]["QuantityDay"].ToString());
                    dataactual[i] = Int32.Parse(dt.Rows[i]["QuantityActual"].ToString());
                    DateTime TimeStart = DateTime.Parse(dt.Rows[i]["TimeStart"].ToString());
                    DateTime TimeEnd = DateTime.Parse(dt.Rows[i]["TimeEnd"].ToString());
                    TimeSpan subtimenow = datetimenow - TimeStart;
                    TimeSpan subtimemaster = TimeEnd - TimeStart;
                    if (subtimenow.TotalSeconds <= 0)
                    {
                        dataplanpertime[i] = 0;
                    }
                    else if (subtimemaster <= subtimenow)
                    {
                        dataplanpertime[i] = dataplan[i];
                    }
                    else
                    {
                        double totalsec = subtimenow.TotalSeconds;
                        if (datetimenow.Hour > 5)
                        {
                            for (int currentHour = TimeStart.Hour; currentHour <= datetimenow.Hour; currentHour++)
                            {
                                if (currentHour < datetimenow.Hour)
                                {
                                    totalsec = totalsec - Config.TimeRest[currentHour] * 60;
                                }
                                else
                                {
                                    if (datetimenow.Minute >= Config.TimeRest[currentHour])
                                    {
                                        totalsec = totalsec - Config.TimeRest[currentHour] * 60;
                                    }
                                    else
                                    {
                                        totalsec = totalsec - datetimenow.Minute * 60;
                                    }
                                }

                            }
                        }
                        else
                        {
                            for (int currentHour = TimeStart.Hour; currentHour <= 23; currentHour++)
                            {
                                if (currentHour > 5)
                                {
                                    totalsec = totalsec - Config.TimeRest[currentHour] * 60;
                                }
                            }
                            for (int j = 0; j <= TimeEnd.Hour; j++)
                            {
                                if (j < datetimenow.Hour)
                                {
                                    totalsec = totalsec - Config.TimeRest[j] * 60;
                                }
                                else
                                {
                                    if (datetimenow.Minute >= Config.TimeRest[j])
                                    {
                                        totalsec = totalsec - Config.TimeRest[j] * 60;
                                    }
                                    else
                                    {
                                        totalsec = totalsec - datetimenow.Minute * 60;
                                    }
                                }
                            }
                               
                        }
                        int QuantityPlan = (int)Math.Round(totalsec * float.Parse(dt.Rows[i]["QuantityPerSec"].ToString()));
                        if (QuantityPlan >= dataplan[i])
                        {
                            dataplanpertime[i] = dataplan[i];
                        }
                        else
                        {
                            dataplanpertime[i] = QuantityPlan;
                        }
                    }

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
            else
            {
                var data = new
                {
                    dataplan = new[] { 0 },
                    dataplanpertime = new[] { 0 },
                    dataactual = new[] { 0 },
                    labels = new[] { "" },
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
        }
        [WebMethod]
        public string DataForBarChartMonitor()
        {
            DBConnect dBConnect = new DBConnect();
            DateTime datetimenow = DateTime.Now;
            DataTable dt = dBConnect.StoreFillDT("LoadDataForBarChartPlanGasMonitor", CommandType.StoredProcedure);
            if (dt.Rows.Count > 0)
            {
                int[] dataplan = new int[dt.Rows.Count];
                int[] dataplanpertime = new int[dt.Rows.Count];
                int[] dataactual = new int[dt.Rows.Count];
                string[] labels = new string[dt.Rows.Count];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    labels[i] = dt.Rows[i]["Model"].ToString();
                    dataplan[i] = Int32.Parse(dt.Rows[i]["QuantityDay"].ToString());
                    dataactual[i] = Int32.Parse(dt.Rows[i]["QuantityActual"].ToString());
                    DateTime TimeStart = DateTime.Parse(dt.Rows[i]["TimeStart"].ToString());
                    DateTime TimeEnd = DateTime.Parse(dt.Rows[i]["TimeEnd"].ToString());
                    TimeSpan subtimenow = datetimenow - TimeStart;
                    TimeSpan subtimemaster = TimeEnd - TimeStart;
                    if (subtimenow.TotalSeconds <= 0)
                    {
                        dataplanpertime[i] = 0;
                    }
                    else if (subtimemaster <= subtimenow)
                    {
                        dataplanpertime[i] = dataplan[i];
                    }
                    else
                    {
                        double totalsec = subtimenow.TotalSeconds;
                        if (datetimenow.Hour > 5)
                        {
                            for (int currentHour = TimeStart.Hour; currentHour <= datetimenow.Hour; currentHour++)
                            {
                                if (currentHour < datetimenow.Hour)
                                {
                                    totalsec = totalsec - Config.TimeRest[currentHour] * 60;
                                }
                                else
                                {
                                    if (datetimenow.Minute >= Config.TimeRest[currentHour])
                                    {
                                        totalsec = totalsec - Config.TimeRest[currentHour] * 60;
                                    }
                                    else
                                    {
                                        totalsec = totalsec - datetimenow.Minute * 60;
                                    }
                                }

                            }
                        }
                        else
                        {
                            for (int currentHour = TimeStart.Hour; currentHour <= 23; currentHour++)
                            {
                                if (currentHour > 5)
                                {
                                    totalsec = totalsec - Config.TimeRest[currentHour] * 60;
                                }
                            }
                            for (int j = 0; j <= TimeEnd.Hour; j++)
                            {
                                if (j < datetimenow.Hour)
                                {
                                    totalsec = totalsec - Config.TimeRest[j] * 60;
                                }
                                else
                                {
                                    if (datetimenow.Minute >= Config.TimeRest[j])
                                    {
                                        totalsec = totalsec - Config.TimeRest[j] * 60;
                                    }
                                    else
                                    {
                                        totalsec = totalsec - datetimenow.Minute * 60;
                                    }
                                }
                            }

                        }
                        int QuantityPlan = (int)Math.Round(totalsec * float.Parse(dt.Rows[i]["QuantityPerSec"].ToString()));
                        if (QuantityPlan >= dataplan[i])
                        {
                            dataplanpertime[i] = dataplan[i];
                        }
                        else
                        {
                            dataplanpertime[i] = QuantityPlan;
                        }
                    }
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
            else
            {
                var data = new
                {
                    dataplan = new[] { 0 },
                    dataplanpertime = new[] { 0 },
                    dataactual = new[] { 0 },
                    labels = new[] { "" },
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
        }

        [WebMethod]
        public string DataForLineChart(string ModelName)
        {
            DBConnect dBConnect = new DBConnect();
            int TotalPlan = 0;
            string parammysql;
            if (ModelName.Contains("All Model"))
            {
                parammysql = "all";
            }
            else
            {
                parammysql = ModelName.Trim();
            }
            DataTable dt = dBConnect.StoreFillDT("LoadQuantityPlan", CommandType.StoredProcedure, parammysql);
            if (dt.Rows.Count > 0)
            {
                TotalPlan = Int32.Parse(dt.Rows[0]["QuantityDay"].ToString());
            }
            DataSet ds = dBConnect.StoreFillDS("LoadDataForLineChartPlanGasByTime", CommandType.StoredProcedure, parammysql);
            DataTable dt1 = ds.Tables[0];
            Dictionary<string, int> listdataplan = new Dictionary<string, int>();
            List<int> listdataactual = new List<int>();
            List<int> listdatadatadiff = new List<int>();
            List<int> listdataplanactual = new List<int>();
            if (ds.Tables[1].Rows.Count > 0)
            {
                DateTime TimeStart = DateTime.Parse(ds.Tables[1].Rows[0]["TimeStart"].ToString());
                DateTime TimeEnd = DateTime.Parse(ds.Tables[1].Rows[0]["TimeEnd"].ToString());
                float quantityPerSec = float.Parse(ds.Tables[1].Rows[0]["QuantityPerSec"].ToString());
                int index = 1;
                DateTime EndDateTime = DateTime.Now;
                for (DateTime currentHour = TimeStart.AddMinutes(5); currentHour <= TimeEnd; currentHour = currentHour.AddMinutes(5))
                {
                    int TotalTimeNow = index * 300;
                    for (DateTime currentHour1 = TimeStart; currentHour1 <= currentHour; currentHour1 = currentHour1.AddHours(1))
                    {
                        if (currentHour == TimeEnd)
                        {
                            if (currentHour1.Hour != 6)
                            {
                                TotalTimeNow = TotalTimeNow - Config.TimeRest[currentHour1.Hour] * 60;
                            }

                        }
                        else
                        {
                            if (currentHour.Hour > 5)
                            {
                                if (currentHour.Hour > currentHour1.Hour)
                                {
                                    TotalTimeNow = TotalTimeNow - Config.TimeRest[currentHour1.Hour] * 60;
                                }
                                else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute < Config.TimeRest[currentHour1.Hour])
                                {
                                    TotalTimeNow = TotalTimeNow - currentHour.Minute * 60;
                                }
                                else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute >= Config.TimeRest[currentHour1.Hour])
                                {
                                    TotalTimeNow = TotalTimeNow - Config.TimeRest[currentHour1.Hour] * 60;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            else
                            {
                                if (currentHour1.Hour > 5)
                                {
                                    TotalTimeNow = TotalTimeNow - Config.TimeRest[currentHour1.Hour] * 60;
                                }
                                else
                                {
                                    if (currentHour.Hour > currentHour1.Hour)
                                    {
                                        TotalTimeNow = TotalTimeNow - Config.TimeRest[currentHour1.Hour] * 60;
                                    }
                                    else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute < Config.TimeRest[currentHour1.Hour])
                                    {
                                        TotalTimeNow = TotalTimeNow - currentHour.Minute * 60;
                                    }
                                    else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute >= Config.TimeRest[currentHour1.Hour])
                                    {
                                        TotalTimeNow = TotalTimeNow - Config.TimeRest[currentHour1.Hour] * 60;
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                            }
                        }

                    }
                    listdataplan.Add(currentHour.ToString("yyyy-MM-dd HH:mm:ss"), (int)Math.Round(TotalTimeNow * quantityPerSec));
                    index++;
                }
                string dateindex;
                if (DateTime.Now.Hour > 5)
                {
                    dateindex = DateTime.Now.ToString("yyyy-MM-dd");
                }
                else
                {
                    dateindex = DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd");
                }
                for (DateTime currentHour = DateTime.Parse(dateindex + " 06:00:00"); currentHour <= DateTime.Now; currentHour = currentHour.AddMinutes(5))
                {
                    if (listdataplan.Keys.Contains(currentHour.ToString("yyyy-MM-dd HH:mm:ss")))
                    {
                        listdataplanactual.Add(listdataplan[currentHour.ToString("yyyy-MM-dd HH:mm:ss")]);
                        //var datarow = (from row in dt1.AsEnumerable()
                        //              where row["TimeDataActual"].ToString() == currentHour.ToString("yyyy-MM-dd HH:mm:ss")
                        //              select row["TimeDataActual"].ToString()).FirstOrDefault();
                        int sumquantityactual = dt1.AsEnumerable()
                                                 .Where(row => DateTime.Parse(row["TimeDataActual"].ToString()) <= currentHour)
                                                 .Sum(row => Int32.Parse(row["mycount"].ToString()));
                        listdataactual.Add(sumquantityactual);
                        listdatadatadiff.Add(sumquantityactual - listdataplan[currentHour.ToString("yyyy-MM-dd HH:mm:ss")]);
                    }
                    else
                    {
                        listdataplanactual.Add(0);
                        int sumquantityactual = dt1.AsEnumerable()
                                                 .Where(row => DateTime.Parse(row["TimeDataActual"].ToString()) <= currentHour)
                                                 .Sum(row => Int32.Parse(row["mycount"].ToString()));
                        listdataactual.Add(sumquantityactual);
                        listdatadatadiff.Add(sumquantityactual);
                    }
                }
                int[] dataplan = new int[listdataplanactual.Count];
                int[] dataactual = new int[listdataplanactual.Count];
                int[] datadiff = new int[listdataplanactual.Count];
                for (int i = 0; i < listdataplanactual.Count; i++)
                {
                    dataplan[i] = listdataplanactual[i];
                    dataactual[i] = listdataactual[i];
                    datadiff[i] = listdatadatadiff[i];
                }
                var data = new
                {
                    dataplan,
                    dataactual,
                    datadiff,
                    TotalPlan,
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
            else
            {
                var data = new
                {
                    dataplan = new[] {0},
                    dataactual = new[] { 0 },
                    datadiff = new[] { 0 },
                    TotalPlan,
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }


            
        }
        [WebMethod]
        public string MonitorSpecial(string ModelName)
        {
            string _model = ModelName.Trim();
            DBConnect dBConnect = new DBConnect();
            int dt = dBConnect.exnonquery("MonitorSpecial", CommandType.StoredProcedure, _model);
            if (dt > 0)
            {
                var data = new
                {
                    rs = '1'
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
            else
            {
                var data = new
                {
                    rs = '0'
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
        }
        [WebMethod]
        public string UpdateDateTimePlan(string ModelName, string TimeFrom, string TimeTo)
        {
            DBConnect dBConnect = new DBConnect();
            DataTable dt = dBConnect.StoreFillDT("GetStartTimeAndEndTimePlan", CommandType.StoredProcedure);
            if (dt.Rows.Count > 0)
            {
                if (DateTime.Parse(TimeFrom.Trim() + ":00") < DateTime.Parse(dt.Rows[0]["TimeStart"].ToString()) || DateTime.Parse(TimeTo.Trim() + ":00") > DateTime.Parse(dt.Rows[0]["TimeEnd"].ToString()))
                {
                    return "0";
                }
                else
                {
                    TimeSpan subtime = DateTime.Parse(TimeTo) - DateTime.Parse(TimeFrom);
                    double secwork = subtime.TotalSeconds;
                    for (DateTime currentHour = DateTime.Parse(TimeFrom.Trim() + ":00"); currentHour <= DateTime.Parse(TimeTo.Trim() + ":00"); currentHour.AddMinutes(5))
                    {
                        if (DateTime.Parse(TimeTo.Trim() + ":00") > currentHour && currentHour.Minute == Config.TimeRest[currentHour.Hour])
                        {
                            secwork = secwork - Config.TimeRest[currentHour.Hour] * 60;
                        }
                        else
                        {
                            if (currentHour == DateTime.Parse(TimeTo.Trim() + ":00"))
                            {
                                if (currentHour.Minute >= Config.TimeRest[currentHour.Hour])
                                {
                                    secwork = secwork - Config.TimeRest[currentHour.Hour] * 60;
                                }
                                else
                                {
                                    secwork = secwork - currentHour.Minute * 60;
                                }
                            }
                        }
                    }
                    dBConnect.exnonquery("UpdateDateTimePlan", CommandType.StoredProcedure, ModelName.Trim(), TimeFrom.Trim() + ":00", TimeTo.Trim() + ":00", secwork);
                    return "1";
                }
            }
            return "0";
        }
        //[WebMethod]
        //public string DataForLineChart(string ModelName)
        //{
        //    DBConnect dBConnect = new DBConnect();
        //    int TotalPlan = 0;
        //    string parammysql;
        //    if (ModelName.Contains("All Model"))
        //    {
        //        parammysql = "all";
        //    }
        //    else
        //    {
        //        parammysql = ModelName.Trim();
        //    }
        //    DataTable dt = dBConnect.StoreFillDT("LoadQuantityPlan", CommandType.StoredProcedure, parammysql);
        //    if (dt.Rows[0]["QuantityDay"].ToString() != "")
        //    {
        //        TotalPlan = Int32.Parse(dt.Rows[0]["QuantityDay"].ToString());
        //    }
        //    DataSet ds = dBConnect.StoreFillDS("LoadDataForLineChartPlanGas", CommandType.StoredProcedure, parammysql);
        //    int hournow = int.Parse(DateTime.Now.ToString("HH"));
        //    Dictionary<int, int> listdataplan = new Dictionary<int, int>();
        //    List<int> listdataactual = new List<int>();
        //    List<int> listdatadatadiff = new List<int>();
        //    List<int> listdataplanactual = new List<int>();
        //    if (ds.Tables[1].Rows.Count > 0)
        //    {
        //        DateTime TimeStart = DateTime.Parse(ds.Tables[1].Rows[0]["TimeStart"].ToString());
        //        DateTime TimeEnd = DateTime.Parse(ds.Tables[1].Rows[0]["TimeEnd"].ToString());
        //        float quantityPerSec = float.Parse(ds.Tables[1].Rows[0]["QuantityPerSec"].ToString());
        //        int TotalTime = Int32.Parse(ds.Tables[1].Rows[0]["TotalTime"].ToString());
        //        TimeSpan subtimenow = DateTime.Now - TimeStart;
        //        double totalsec = subtimenow.TotalSeconds;
        //        int hourstart = Int32.Parse(TimeStart.ToString("HH"));
        //        int hoursend = Int32.Parse(TimeEnd.ToString("HH"));
        //        int index = 1;
        //        for (DateTime currentHour = TimeStart; currentHour < TimeEnd; currentHour = currentHour.AddHours(1))
        //        {
        //            int TotalTimeNow = index * 3600;
        //            for (DateTime currentHour1 = TimeStart; currentHour1 <= currentHour; currentHour1 = currentHour1.AddHours(1))
        //            {
        //                TotalTimeNow = TotalTimeNow - Config.TimeRest[currentHour1.Hour] * 60;
        //            }
        //            listdataplan.Add(currentHour.Hour, (int)Math.Round(TotalTimeNow * quantityPerSec));
        //            index++;
        //        }
        //        if (DateTime.Now.Hour > 5)
        //        {
        //            for (DateTime currentHour = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd") + " 06:00:00"); currentHour < DateTime.Now; currentHour = currentHour.AddHours(1))
        //            {
        //                if (listdataplan.Keys.Contains(currentHour.Hour))
        //                {
        //                    int prhour;
        //                    if (currentHour.Hour != 0)
        //                    {
        //                        prhour = currentHour.Hour - 1;
        //                    }
        //                    else
        //                    {
        //                        prhour = 23;
        //                    }
        //                    for (int i = 0; i < Config.QuantityPoint[currentHour.Hour]; i++)
        //                    {
        //                        if (currentHour.Hour == 6)
        //                        {
        //                            listdataplanactual.Add(0);
        //                            listdataactual.Add(0);
        //                            listdatadatadiff.Add(0);
        //                        }
        //                        else if (currentHour.Hour == hourstart)
        //                        {
        //                            listdataplanactual.Add(0);
        //                            int sumquantityactual = 0;
        //                            for (int j = 6; j <= prhour; j++)
        //                            {
        //                                sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
        //                            }
        //                            listdataactual.Add(sumquantityactual);
        //                            listdatadatadiff.Add(sumquantityactual);
        //                        }
        //                        else if (i < Config.QuantityPoint[currentHour.Hour] - 1)
        //                        {
        //                            listdataplanactual.Add(listdataplanactual[listdataplanactual.Count - 1]);
        //                            listdataactual.Add(listdataactual[listdataactual.Count - 1]);
        //                            listdatadatadiff.Add(listdatadatadiff[listdatadatadiff.Count - 1]);
        //                        }
        //                        else
        //                        {
        //                            listdataplanactual.Add(listdataplan[prhour]);
        //                            int sumquantityactual = 0;
        //                            for (int j = 6; j <= prhour; j++)
        //                            {
        //                                sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
        //                            }
        //                            listdataactual.Add(sumquantityactual);
        //                            listdatadatadiff.Add(sumquantityactual - listdataplan[prhour]);
        //                        }
        //                    }
        //                }
        //                else
        //                {
        //                    int prhour;
        //                    if (currentHour.Hour != 0)
        //                    {
        //                        prhour = currentHour.Hour - 1;
        //                    }
        //                    else
        //                    {
        //                        prhour = 23;
        //                    }
        //                    for (int i = 0; i < Config.QuantityPoint[currentHour.Hour]; i++)
        //                    {
        //                        if (i < Config.QuantityPoint[currentHour.Hour] - 1)
        //                        {
        //                            listdataplanactual.Add(0);
        //                            listdataactual.Add(listdataactual[listdataactual.Count - 1]);
        //                            listdatadatadiff.Add(listdatadatadiff[listdatadatadiff.Count - 1]);
        //                        }
        //                        else
        //                        {
        //                            listdataplanactual.Add(0);
        //                            int sumquantityactual = 0;
        //                            for (int j = 6; j <= prhour; j++)
        //                            {
        //                                sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
        //                            }
        //                            listdataactual.Add(sumquantityactual);
        //                            listdatadatadiff.Add(sumquantityactual);
        //                        }
        //                    }
        //                }
        //            }
        //        }
        //        else
        //        {
        //            for (DateTime currentHour = DateTime.Parse(DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd") + " 06:00:00"); currentHour < DateTime.Now; currentHour = currentHour.AddHours(1))
        //            {
        //                if (listdataplan.Keys.Contains(currentHour.Hour))
        //                {
        //                    int prhour;
        //                    if (currentHour.Hour != 0)
        //                    {
        //                        prhour = currentHour.Hour - 1;
        //                    }
        //                    else
        //                    {
        //                        prhour = 23;
        //                    }
        //                    for (int i = 0; i < Config.QuantityPoint[currentHour.Hour]; i++)
        //                    {
        //                        if (currentHour.Hour == 6)
        //                        {
        //                            listdataplanactual.Add(0);
        //                            listdataactual.Add(0);
        //                            listdatadatadiff.Add(0);
        //                        }
        //                        else if (currentHour.Hour == hourstart)
        //                        {
        //                            listdataplanactual.Add(0);
        //                            if (currentHour.Hour > 5)
        //                            {
        //                                int sumquantityactual = 0;
        //                                for (int j = 6; j <= prhour; j++)
        //                                {
        //                                    sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
        //                                }
        //                                listdataactual.Add(sumquantityactual);
        //                                listdatadatadiff.Add(sumquantityactual);
        //                            }
        //                            else
        //                            {
        //                                int sumquantityactual = 0;
        //                                for (int j = 6; j <= 23; j++)
        //                                {
        //                                    sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
        //                                }
        //                                if (prhour <= 5)
        //                                {
        //                                    for (int k = 0; k <= prhour; k++)
        //                                    {
        //                                        sumquantityactual += Int32.Parse(ds.Tables[0].Rows[k]["Quantity"].ToString());
        //                                    }
        //                                }
        //                                listdataactual.Add(sumquantityactual);
        //                                listdatadatadiff.Add(sumquantityactual);
        //                            }
        //                        }
        //                        else if (i < Config.QuantityPoint[currentHour.Hour] - 1)
        //                        {
        //                            listdataplanactual.Add(listdataplanactual[listdataplanactual.Count - 1]);
        //                            listdataactual.Add(listdataactual[listdataactual.Count - 1]);
        //                            listdatadatadiff.Add(listdatadatadiff[listdatadatadiff.Count - 1]);
        //                        }
        //                        else
        //                        {
        //                            listdataplanactual.Add(listdataplan[prhour]);
        //                            if (currentHour.Hour > 5)
        //                            {
        //                                int sumquantityactual = 0;
        //                                for (int j = 6; j <= prhour; j++)
        //                                {
        //                                    sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
        //                                }
        //                                listdataactual.Add(sumquantityactual);
        //                                listdatadatadiff.Add(sumquantityactual - listdataplan[prhour]);
        //                            }
        //                            else
        //                            {
        //                                int sumquantityactual = 0;
        //                                for (int j = 6; j <= 23; j++)
        //                                {
        //                                    sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
        //                                }
        //                                if (prhour <= 5)
        //                                {
        //                                    for (int k = 0; k <= prhour; k++)
        //                                    {
        //                                        sumquantityactual += Int32.Parse(ds.Tables[0].Rows[k]["Quantity"].ToString());
        //                                    }
        //                                }
        //                                listdataactual.Add(sumquantityactual);
        //                                listdatadatadiff.Add(sumquantityactual - listdataplan[prhour]);
        //                            }
        //                        }
        //                    }
        //                }
        //                else
        //                {
        //                    int prhour;
        //                    if (currentHour.Hour != 0)
        //                    {
        //                        prhour = currentHour.Hour - 1;
        //                    }
        //                    else
        //                    {
        //                        prhour = 23;
        //                    }
        //                    for (int i = 0; i < Config.QuantityPoint[currentHour.Hour]; i++)
        //                    {
        //                        if (i < Config.QuantityPoint[currentHour.Hour] - 1)
        //                        {
        //                            listdataplanactual.Add(0);
        //                            listdataactual.Add(listdataactual[listdataactual.Count - 1]);
        //                            listdatadatadiff.Add(listdatadatadiff[listdatadatadiff.Count - 1]);
        //                        }
        //                        else
        //                        {
        //                            listdataplanactual.Add(0);
        //                            if (currentHour.Hour > 5)
        //                            {
        //                                int sumquantityactual = 0;
        //                                for (int j = 6; j <= prhour; j++)
        //                                {
        //                                    sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
        //                                }
        //                                listdataactual.Add(sumquantityactual);
        //                                listdatadatadiff.Add(sumquantityactual);
        //                            }
        //                            else
        //                            {
        //                                int sumquantityactual = 0;
        //                                for (int j = 6; j <= 23; j++)
        //                                {
        //                                    sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
        //                                }
        //                                if (prhour <= 5)
        //                                {
        //                                    for (int k = 0; k <= prhour; k++)
        //                                    {
        //                                        sumquantityactual += Int32.Parse(ds.Tables[0].Rows[k]["Quantity"].ToString());
        //                                    }
        //                                }
        //                                listdataactual.Add(sumquantityactual);
        //                                listdatadatadiff.Add(sumquantityactual);
        //                            }
        //                        }
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    int[] dataplan = new int[listdataplanactual.Count];
        //    int[] dataactual = new int[listdataplanactual.Count];
        //    int[] datadiff = new int[listdataplanactual.Count];
        //    for (int i = 0; i < listdataplanactual.Count; i++)
        //    {
        //        dataplan[i] = listdataplanactual[i];
        //        dataactual[i] = listdataactual[i];
        //        datadiff[i] = listdatadatadiff[i];
        //    }
        //    var data = new
        //    {
        //        dataplan,
        //        dataactual,
        //        datadiff,
        //        TotalPlan,
        //    };
        //    return Newtonsoft.Json.JsonConvert.SerializeObject(data);
        //}
        //[WebMethod]
        //public string DataForPieChart()
        //{
        //    DBConnect dBConnect = new DBConnect();
        //    DataTable dt = dBConnect.StoreFillDS("LoadDataForPieChartPlan", CommandType.StoredProcedure).Tables[0];
        //    if (dt.Rows[0][0].ToString() != "")
        //    {
        //        var data = new
        //        {
        //            Datapiechart = new[] { (int)dt.Rows[0]["DataOK"], (int)dt.Rows[0]["DataNG"] }
        //            // Datapiechart = new[] { 3, 0 }
        //        };
        //        return Newtonsoft.Json.JsonConvert.SerializeObject(data);
        //    }
        //    else
        //    {
        //        var data = new
        //        {
        //            Datapiechart = new[] { 0, 0 }
        //        };
        //        return Newtonsoft.Json.JsonConvert.SerializeObject(data);
        //    }
        //}
    }
}
