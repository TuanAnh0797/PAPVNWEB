using Google.Protobuf.WellKnownTypes;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
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
        [WebMethod]
        public string DataForBarChart()
        {
            DBConnect dBConnect = new DBConnect();
            DataTable dt = dBConnect.StoreFillDT("LoadDataForBarChartPlanGas", CommandType.StoredProcedure);
            if (dt.Rows.Count > 1)
            {
                int[] dataplan = new int[dt.Rows.Count-1];
                int[] dataplanpertime = new int[dt.Rows.Count-1];
                int[] dataactual = new int[dt.Rows.Count - 1];
                string[] labels = new string[dt.Rows.Count - 1];
                for (int i = 0; i < dt.Rows.Count-1; i++)
                {
                    labels[i] = dt.Rows[i]["Model"].ToString();
                    dataplan[i] = Int32.Parse(dt.Rows[i]["QuantityDay"].ToString());
                    dataactual[i] = Int32.Parse(dt.Rows[i]["QuantityActual"].ToString());
                    DateTime TimeStart = DateTime.Parse(dt.Rows[i]["TimeStart"].ToString());
                    DateTime TimeEnd = DateTime.Parse(dt.Rows[i]["TimeEnd"].ToString());
                    TimeSpan subtimenow = DateTime.Now - TimeStart;
                    TimeSpan subtimemaster = TimeEnd - TimeStart;
                    if (subtimenow.TotalSeconds <= 0)
                    {
                        dataplanpertime[i] = 0;
                    }
                    else if(subtimemaster <= subtimenow)
                    {
                        dataplanpertime[i] = dataplan[i];
                    }
                    else
                    {
                        double totalsec = subtimenow.TotalSeconds;
                        for (DateTime currentHour = TimeStart; currentHour < DateTime.Now; currentHour = currentHour.AddHours(1))
                        {
                            totalsec = totalsec - Config.TimeRest[currentHour.Hour] * 60;
                        }
                        dataplanpertime[i] = (int)Math.Round(totalsec*float.Parse(dt.Rows[i]["QuantityPerSec"].ToString()));
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
            string parammysql;
            if (ModelName.Contains("All Model"))
            {
                parammysql = "all";
            }
            else
            {
                parammysql = ModelName.Trim();
            }
            DBConnect dBConnect = new DBConnect();
            DataSet ds = dBConnect.StoreFillDS("LoadDataForLineChartPlanGas", CommandType.StoredProcedure, parammysql);
            int hournow = int.Parse(DateTime.Now.ToString("HH"));
            Dictionary<int,int> listdataplan = new Dictionary<int,int>();
            List<int> listdataactual = new List<int>();
            List<int> listdatadatadiff = new List<int>();
            List<int> listdataplanactual = new List<int>();
            if (ds.Tables[1].Rows.Count > 0)
            {
                DateTime TimeStart = DateTime.Parse(ds.Tables[1].Rows[0]["TimeStart"].ToString());
                DateTime TimeEnd = DateTime.Parse(ds.Tables[1].Rows[0]["TimeEnd"].ToString());
                float quantityPerSec = float.Parse(ds.Tables[1].Rows[0]["QuantityPerSec"].ToString());
                int TotalTime = Int32.Parse(ds.Tables[1].Rows[0]["TotalTime"].ToString());
                TimeSpan subtimenow = DateTime.Now - TimeStart;

                double totalsec = subtimenow.TotalSeconds;
                int hourstart = Int32.Parse(TimeStart.ToString("HH"));
                int hoursend = Int32.Parse(TimeEnd.ToString("HH"));
                int index = 1;

                for (DateTime currentHour = TimeStart; currentHour < TimeEnd; currentHour = currentHour.AddHours(1))
                {
                    int TotalTimeNow = index * 3600;
                    for (DateTime currentHour1 = TimeStart; currentHour1 <= currentHour; currentHour1 = currentHour1.AddHours(1))
                    {
                        TotalTimeNow = TotalTimeNow - Config.TimeRest[currentHour1.Hour] * 60;
                    }
                    listdataplan.Add(currentHour.Hour, (int)Math.Round(TotalTimeNow * quantityPerSec));
                    index++;
                }

                if (DateTime.Now.Hour > 5)
                {
                    for (DateTime currentHour = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd") + " 06:00:00"); currentHour < DateTime.Now; currentHour = currentHour.AddHours(1))
                    {
                        if (listdataplan.Keys.Contains(currentHour.Hour))
                        {

                            int prhour;

                            if (currentHour.Hour != 0)
                            {
                                prhour = currentHour.Hour -1;
                            }
                            else
                            {
                                prhour = 23;
                            }

                            for (int i = 0; i < Config.QuantityPoint[currentHour.Hour]; i++)
                            {
                                if (currentHour.Hour == 6)
                                {
                                    listdataplanactual.Add(0);
                                    listdataactual.Add(0);
                                    listdatadatadiff.Add(0);
                                }
                                else if (currentHour.Hour == hourstart)
                                {
                                    listdataplanactual.Add(0);
                                    int sumquantityactual = 0;
                                    for (int j = 6; j <= prhour; j++)
                                    {
                                        sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
                                    }
                                    listdataactual.Add(sumquantityactual);
                                    listdatadatadiff.Add(sumquantityactual);

                                }
                                else if (i < Config.QuantityPoint[currentHour.Hour] - 1)
                                {
                                    listdataplanactual.Add(listdataplanactual[listdataplanactual.Count-1]);
                                    listdataactual.Add(listdataactual[listdataactual.Count - 1]);
                                    listdatadatadiff.Add(listdatadatadiff[listdatadatadiff.Count - 1]);
                                }
                                else
                                {
                                    listdataplanactual.Add(listdataplan[prhour]);
                                   
                                    int sumquantityactual = 0;
                                    for (int j = 6; j <= prhour; j++)
                                    {
                                        sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
                                    }
                                    listdataactual.Add(sumquantityactual);
                                   
                                    listdatadatadiff.Add(sumquantityactual - listdataplan[prhour]);
                                }

                            }

                        }
                        else
                        {
                            int prhour;

                            if (currentHour.Hour != 0)
                            {
                                prhour = currentHour.Hour - 1;
                            }
                            else
                            {
                                prhour = 23;
                            }
                            for (int i = 0; i < Config.QuantityPoint[currentHour.Hour]; i++)
                            {

                                if (i < Config.QuantityPoint[currentHour.Hour] - 1)
                                {
                                    listdataplanactual.Add(0);
                                    listdataactual.Add(listdataactual[listdataactual.Count - 1]);
                                    listdatadatadiff.Add(listdatadatadiff[listdatadatadiff.Count - 1]);
                                }
                                else
                                {
                                    listdataplanactual.Add(0);
                                    int sumquantityactual = 0;
                                    for (int j = 6; j <= prhour; j++)
                                    {
                                        sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
                                    }
                                    listdataactual.Add(sumquantityactual);
                                    listdatadatadiff.Add(sumquantityactual);
                                }

                               

                            }
                        }
                    }
                }
                else
                {
                    for (DateTime currentHour = DateTime.Parse(DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd") + " 06:00:00"); currentHour < DateTime.Now; currentHour = currentHour.AddHours(1))
                    {
                        if (listdataplan.Keys.Contains(currentHour.Hour))
                        {

                            int prhour;

                            if (currentHour.Hour != 0)
                            {
                                prhour = currentHour.Hour - 1;
                            }
                            else
                            {
                                prhour = 23;
                            }

                            for (int i = 0; i < Config.QuantityPoint[currentHour.Hour]; i++)
                            {
                                if (currentHour.Hour == 6)
                                {
                                    listdataplanactual.Add(0);
                                    listdataactual.Add(0);
                                    listdatadatadiff.Add(0);
                                }
                                else if (currentHour.Hour == hourstart)
                                {
                                    listdataplanactual.Add(0);

                                   

                                    if (currentHour.Hour > 5)
                                    {
                                        int sumquantityactual = 0;
                                        for (int j = 6; j <= prhour; j++)
                                        {
                                            sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
                                        }
                                        listdataactual.Add(sumquantityactual);
                                        listdatadatadiff.Add(sumquantityactual);
                                    }
                                    else
                                    {
                                        int sumquantityactual = 0;
                                        for (int j = 6; j <= 23; j++)
                                        {
                                            sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
                                        }
                                        if (prhour <=5)
                                        {
                                            for (int k = 0; k <= prhour; k++)
                                            {
                                                sumquantityactual += Int32.Parse(ds.Tables[0].Rows[k]["Quantity"].ToString());
                                            }
                                        }
                                        listdataactual.Add(sumquantityactual);
                                        listdatadatadiff.Add(sumquantityactual);
                                    }




                                }
                                else if (i < Config.QuantityPoint[currentHour.Hour] - 1)
                                {
                                    listdataplanactual.Add(listdataplanactual[listdataplanactual.Count - 1]);
                                    listdataactual.Add(listdataactual[listdataactual.Count - 1]);
                                    listdatadatadiff.Add(listdatadatadiff[listdatadatadiff.Count - 1]);
                                }
                                else
                                {
                                    listdataplanactual.Add(listdataplan[prhour]);



                                    if (currentHour.Hour > 5)
                                    {
                                        int sumquantityactual = 0;
                                        for (int j = 6; j <= prhour; j++)
                                        {
                                            sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
                                        }
                                        listdataactual.Add(sumquantityactual);
                                        listdatadatadiff.Add(sumquantityactual - listdataplan[prhour]);
                                    }
                                    else
                                    {
                                        int sumquantityactual = 0;
                                        for (int j = 6; j <= 23; j++)
                                        {
                                            sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
                                        }
                                        if (prhour <= 5)
                                        {
                                            for (int k = 0; k <= prhour; k++)
                                            {
                                                sumquantityactual += Int32.Parse(ds.Tables[0].Rows[k]["Quantity"].ToString());
                                            }
                                        }
                                       
                                        listdataactual.Add(sumquantityactual);
                                        listdatadatadiff.Add(sumquantityactual - listdataplan[prhour]);
                                    }

                                   
                                }

                            }

                        }
                        else
                        {
                            int prhour;

                            if (currentHour.Hour != 0)
                            {
                                prhour = currentHour.Hour - 1;
                            }
                            else
                            {
                                prhour = 23;
                            }
                            for (int i = 0; i < Config.QuantityPoint[currentHour.Hour]; i++)
                            {
                                if (i < Config.QuantityPoint[currentHour.Hour] - 1)
                                {
                                    listdataplanactual.Add(0);
                                    listdataactual.Add(listdataactual[listdataactual.Count - 1]);
                                    listdatadatadiff.Add(listdatadatadiff[listdatadatadiff.Count - 1]);
                                }
                                else
                                {
                                    listdataplanactual.Add(0);
                                    if (currentHour.Hour > 5)
                                    {
                                        int sumquantityactual = 0;
                                        for (int j = 6; j <= prhour; j++)
                                        {
                                            sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
                                        }
                                        listdataactual.Add(sumquantityactual);
                                        listdatadatadiff.Add(sumquantityactual);
                                    }
                                    else
                                    {
                                        int sumquantityactual = 0;
                                        for (int j = 6; j <= 23; j++)
                                        {
                                            sumquantityactual += Int32.Parse(ds.Tables[0].Rows[j]["Quantity"].ToString());
                                        }
                                        if (prhour <=5)
                                        {
                                            for (int k = 0; k <= prhour; k++)
                                            {
                                                sumquantityactual += Int32.Parse(ds.Tables[0].Rows[k]["Quantity"].ToString());
                                            }
                                        }
                                        
                                        listdataactual.Add(sumquantityactual);
                                        listdatadatadiff.Add(sumquantityactual);
                                    }
                                }
                               

                            }
                        }
                    }
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
               
            };
            return Newtonsoft.Json.JsonConvert.SerializeObject(data);
        }
    }
}
