using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace PAPVN.MethodLoadData
{
    public class LoadDataVisualize
    {
        public static string LineChartQuantityPerTime(string ModelName, string SelectedShift)
        {

            string path = HttpContext.Current.Server.MapPath("~/wwwroot/config.ini");

            string[] config = File.ReadAllLines(path);


            Config.TimeRest = config[0].Split(',').Select(int.Parse).ToArray();


            string typeplan = "3_8";
            try
            {
                DBConnect dBConnect = new DBConnect();

                string parammysql;

                //bool allday = false;

                if (ModelName.Contains("All Model"))
                {
                    parammysql = "all";
                }
                else
                {
                    parammysql = ModelName.Trim();
                }
                // Thời gian bắt đầu ca lấy từ database
                DateTime TimeStartShift = new DateTime();

                int selectshift = 0;
                int TotalPlan = 0;
                DataSet ds1;
                DataSet ds;
                DataTable dt1;
                if (SelectedShift == "Ca 1")
                {
                    selectshift = 1;
                    ds1 = dBConnect.StoreFillDS("TA_sp_LoadQuantityPlan", CommandType.StoredProcedure, parammysql, "1");
                    ds = dBConnect.StoreFillDS("TA_sp_LoadDataForLineChartPlanPanByTime", CommandType.StoredProcedure, parammysql, "1");
                    dt1 = ds.Tables[0];
                }
                else if (SelectedShift == "Ca 2")
                {
                    selectshift = 2;
                    ds1 = dBConnect.StoreFillDS("TA_sp_LoadQuantityPlan", CommandType.StoredProcedure, parammysql, "2");
                    ds = dBConnect.StoreFillDS("TA_sp_TA_sp_LoadDataForLineChartPlanPanByTime", CommandType.StoredProcedure, parammysql, "2");
                    dt1 = ds.Tables[0];
                }
                else if (SelectedShift == "Ca 3")
                {
                    selectshift = 3;
                    ds1 = dBConnect.StoreFillDS("TA_sp_LoadQuantityPlan", CommandType.StoredProcedure, parammysql, "3");
                    ds = dBConnect.StoreFillDS("TA_sp_LoadDataForLineChartPlanPanByTime", CommandType.StoredProcedure, parammysql, "3");
                    dt1 = ds.Tables[0];
                }
                else
                {
                    selectshift = 0;
                    ds1 = dBConnect.StoreFillDS("TA_sp_LoadQuantityPlan", CommandType.StoredProcedure, parammysql, "all");
                    ds = dBConnect.StoreFillDS("TA_sp_LoadDataForLineChartPlanPanByTime", CommandType.StoredProcedure, parammysql, "all");
                    dt1 = ds.Tables[0];
                    //allday = true;
                }
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    TotalPlan = Int32.Parse(ds1.Tables[0].Rows[0]["QuantityDay"].ToString());
                    TimeStartShift = DateTime.Parse(ds.Tables[1].Rows[0]["TimeStart"].ToString());
                    DateTime TimeEndShift = DateTime.Parse(ds1.Tables[1].Rows[0]["TimeEnd"].ToString());
                    if (TimeEndShift < DateTime.Now)
                    {
                        int TotalPlan1 = 0;
                        var data = new
                        {
                            dataplan = new[] { 0 },
                            dataactual = new[] { 0 },
                            datadiff = new[] { 0 },
                            shift = 0,
                            TotalPlan1,
                            typeplan = typeplan,
                        };
                        return Newtonsoft.Json.JsonConvert.SerializeObject(data);
                    }

                }
                Dictionary<string, int> listdataplan = new Dictionary<string, int>();
                List<int> listdataactual = new List<int>();
                List<int> listdatadatadiff = new List<int>();
                List<int> listdataplanactual = new List<int>();
                if (ds.Tables[1].Rows.Count > 0)
                {

                    DateTime TimeStart = DateTime.Parse(ds.Tables[1].Rows[0]["TimeStart"].ToString());
                    DateTime TimeEnd = DateTime.Parse(ds.Tables[1].Rows[0]["TimeEnd"].ToString());
                    float quantityPerSec = float.Parse(ds.Tables[1].Rows[0]["QuantityPerSec"].ToString());

                    typeplan = ds.Tables[1].Rows[0]["TypePlan"].ToString();
                    int index = 0;


                    //DateTime EndDateTime = DateTime.Now;

                    for (DateTime currentHour = TimeStart; currentHour <= TimeEnd; currentHour = currentHour.AddMinutes(5))
                    {
                        int TotalTimeNow = index * 300;

                        for (DateTime currentHour1 = TimeStart; currentHour1 <= currentHour; currentHour1 = currentHour1.AddHours(1))
                        {

                            // 2 ca 10
                            if (typeplan == "2_10")
                            {
                                if (TotalTimeNow >= Config.TimeRest2Ca[currentHour1.Hour] * 60)
                                {
                                    if (currentHour == TimeEnd)
                                    {
                                        if (currentHour1.Hour != TimeEnd.Hour)
                                        {
                                            TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca[currentHour1.Hour] * 60;
                                        }
                                    }
                                    else
                                    {
                                        if (currentHour.Date == TimeStartShift.Date)
                                        {
                                            if (currentHour.Hour > currentHour1.Hour)
                                            {
                                                TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca[currentHour1.Hour] * 60;
                                            }
                                            else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute < Config.TimeRest2Ca[currentHour1.Hour])
                                            {
                                                TotalTimeNow = TotalTimeNow - currentHour.Minute * 60;
                                            }
                                            else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute >= Config.TimeRest2Ca[currentHour1.Hour])
                                            {
                                                TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca[currentHour1.Hour] * 60;
                                            }
                                            else
                                            {
                                                break;
                                            }
                                        }
                                        else
                                        {
                                            if (currentHour1.Date == TimeStartShift.Date)
                                            {
                                                TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca[currentHour1.Hour] * 60;
                                            }
                                            else
                                            {
                                                if (currentHour.Hour > currentHour1.Hour)
                                                {
                                                    TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca[currentHour1.Hour] * 60;
                                                }
                                                else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute < Config.TimeRest2Ca[currentHour1.Hour])
                                                {
                                                    TotalTimeNow = TotalTimeNow - currentHour.Minute * 60;
                                                }
                                                else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute >= Config.TimeRest2Ca[currentHour1.Hour])
                                                {
                                                    TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca[currentHour1.Hour] * 60;
                                                }
                                                else
                                                {
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    TotalTimeNow = 0;
                                }
                            }
                            //2 ca 12 bat dau 10h
                            else if (typeplan == "2_12")
                            {
                                if (TotalTimeNow >= Config.TimeRest2Ca12[currentHour1.Hour] * 60)
                                {
                                    if (currentHour == TimeEnd)
                                    {
                                        if (currentHour1.Hour != TimeEnd.Hour)
                                        {
                                            TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca12[currentHour1.Hour] * 60;
                                        }
                                    }
                                    else
                                    {
                                        if (currentHour.Date == TimeStartShift.Date)
                                        {
                                            if (currentHour.Hour > currentHour1.Hour)
                                            {
                                                TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca12[currentHour1.Hour] * 60;
                                            }
                                            else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute < Config.TimeRest2Ca12[currentHour1.Hour])
                                            {
                                                TotalTimeNow = TotalTimeNow - currentHour.Minute * 60;
                                            }
                                            else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute >= Config.TimeRest2Ca12[currentHour1.Hour])
                                            {
                                                TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca12[currentHour1.Hour] * 60;
                                            }
                                            else
                                            {
                                                break;
                                            }
                                        }
                                        else
                                        {
                                            if (currentHour1.Date == TimeStartShift.Date)
                                            {
                                                TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca12[currentHour1.Hour] * 60;
                                            }
                                            else
                                            {
                                                if (currentHour.Hour > currentHour1.Hour)
                                                {
                                                    TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca12[currentHour1.Hour] * 60;
                                                }
                                                else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute < Config.TimeRest2Ca12[currentHour1.Hour])
                                                {
                                                    TotalTimeNow = TotalTimeNow - currentHour.Minute * 60;
                                                }
                                                else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute >= Config.TimeRest2Ca12[currentHour1.Hour])
                                                {
                                                    TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca12[currentHour1.Hour] * 60;
                                                }
                                                else
                                                {
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    TotalTimeNow = 0;
                                }
                            }
                            // 2 ca 12 bắt đầu từ 6h
                            else if (typeplan == "2_12")
                            {
                                if (TotalTimeNow >= Config.TimeRest2Ca12_6h[currentHour1.Hour] * 60)
                                {
                                    if (currentHour == TimeEnd)
                                    {
                                        if (currentHour1.Hour != TimeEnd.Hour)
                                        {
                                            TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca12_6h[currentHour1.Hour] * 60;
                                        }
                                    }
                                    else
                                    {
                                        if (currentHour.Date == TimeStartShift.Date)
                                        {
                                            if (currentHour.Hour > currentHour1.Hour)
                                            {
                                                TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca12_6h[currentHour1.Hour] * 60;
                                            }
                                            else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute < Config.TimeRest2Ca12_6h[currentHour1.Hour])
                                            {
                                                TotalTimeNow = TotalTimeNow - currentHour.Minute * 60;
                                            }
                                            else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute >= Config.TimeRest2Ca12_6h[currentHour1.Hour])
                                            {
                                                TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca12_6h[currentHour1.Hour] * 60;
                                            }
                                            else
                                            {
                                                break;
                                            }
                                        }
                                        else
                                        {
                                            if (currentHour1.Date == TimeStartShift.Date)
                                            {
                                                TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca12_6h[currentHour1.Hour] * 60;
                                            }
                                            else
                                            {
                                                if (currentHour.Hour > currentHour1.Hour)
                                                {
                                                    TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca12_6h[currentHour1.Hour] * 60;
                                                }
                                                else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute < Config.TimeRest2Ca12_6h[currentHour1.Hour])
                                                {
                                                    TotalTimeNow = TotalTimeNow - currentHour.Minute * 60;
                                                }
                                                else if (currentHour.Hour == currentHour1.Hour && currentHour.Minute >= Config.TimeRest2Ca12_6h[currentHour1.Hour])
                                                {
                                                    TotalTimeNow = TotalTimeNow - Config.TimeRest2Ca12_6h[currentHour1.Hour] * 60;
                                                }
                                                else
                                                {
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    TotalTimeNow = 0;
                                }
                            }
                            else
                            {
                                if (TotalTimeNow >= Config.TimeRest[currentHour1.Hour] * 60)
                                {
                                    if (currentHour == TimeEnd)
                                    {
                                        if (currentHour1.Hour != TimeEnd.Hour)
                                        {
                                            TotalTimeNow = TotalTimeNow - Config.TimeRest[currentHour1.Hour] * 60;
                                        }
                                    }
                                    else
                                    {
                                        if (currentHour.Date == TimeStartShift.Date)
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
                                            if (currentHour1.Date == TimeStartShift.Date)
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
                                else
                                {
                                    TotalTimeNow = 0;
                                }
                            }



                        }
                        listdataplan.Add(currentHour.ToString("yyyy-MM-dd HH:mm:ss"), (int)Math.Round(TotalTimeNow * quantityPerSec));
                        index++;
                    }


                    for (DateTime currentHour = TimeStartShift; currentHour <= DateTime.Now; currentHour = currentHour.AddMinutes(5))
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

                    //}
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
                        shift = selectshift,
                        TotalPlan,
                        typeplan = typeplan,
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
                        shift = selectshift,
                        TotalPlan,
                        typeplan = typeplan,
                    };
                    return Newtonsoft.Json.JsonConvert.SerializeObject(data);
                }
            }
            catch (Exception ex)
            {
                int TotalPlan = 0;
                var data = new
                {
                    dataplan = new[] { 0 },
                    dataactual = new[] { 0 },
                    datadiff = new[] { 0 },
                    shift = 0,
                    TotalPlan,
                    typeplan = typeplan,
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }
        }
        public static string barchartOKNGPENDING()
        {
            try
            {
                DBConnect dBConnect = new DBConnect();
                DataTable dt = dBConnect.StoreFillDT("LoadDataForChartFinalCheck", CommandType.StoredProcedure, 2);
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
            catch (Exception)
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
        public static DataSet LoadDataForTableHistory(string mode)
        {
                DBConnect dBConnect = new DBConnect();
                DataSet dt = dBConnect.StoreFillDS("LoadDataForTableHistoryFinalCheckNew", CommandType.StoredProcedure,mode);
                return dt;
        }

    }
}
