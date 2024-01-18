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
    /// Summary description for ModifyPlan
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    [ScriptService()]
    public class ModifyPlan : System.Web.Services.WebService
    {
        // ALL
        [WebMethod]
        public string MonitorSpecial(string ModelName)
        {
            try
            {
                string _model = ModelName.Trim();
                DBConnect dBConnect = new DBConnect();
                int dt = dBConnect.exnonquery("TA_MonitorSpecial", CommandType.StoredProcedure, _model,"all");
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
            catch (Exception)
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
            try
            {
                DBConnect dBConnect = new DBConnect();
                DataTable dt = dBConnect.StoreFillDT("TA_GetStartTimeAndEndTimePlan", CommandType.StoredProcedure,"all");
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

                        for (DateTime currentHour = DateTime.Parse(TimeFrom.Trim() + ":00").AddHours(1); currentHour < DateTime.Parse(TimeTo.Trim() + ":00"); currentHour = currentHour.AddHours(1))
                        {
                            secwork = secwork - Config.TimeRest[currentHour.Hour] * 60;
                        }
                        if (DateTime.Parse(TimeTo.Trim() + ":00").Minute >= Config.TimeRest[DateTime.Parse(TimeTo.Trim() + ":00").Hour])
                        {
                            secwork = secwork - Config.TimeRest[DateTime.Parse(TimeTo.Trim() + ":00").Hour] * 60;
                        }
                        else
                        {
                            secwork = secwork - DateTime.Parse(TimeTo.Trim() + ":00").Minute * 60;
                        }
                        if (DateTime.Parse(TimeFrom.Trim() + ":00").Minute < Config.TimeRest[DateTime.Parse(TimeFrom.Trim() + ":00").Hour])
                        {
                            secwork = secwork - (Config.TimeRest[DateTime.Parse(TimeFrom.Trim() + ":00").Hour] - DateTime.Parse(TimeFrom.Trim() + ":00").Minute) * 60;
                        }
                        dBConnect.exnonquery("TA_UpdateDateTimePlan", CommandType.StoredProcedure, ModelName.Trim(), TimeFrom.Trim() + ":00", TimeTo.Trim() + ":00", secwork,"all");
                        return "1";
                    }
                }
                return "0";
            }
            catch (Exception)
            {
                return "0";
            }

        }
        //Ca1
        [WebMethod]
        public string MonitorSpecialCa1(string ModelName)
        {
            try
            {
                string _model = ModelName.Trim();
                DBConnect dBConnect = new DBConnect();
                int dt = dBConnect.exnonquery("TA_MonitorSpecial", CommandType.StoredProcedure, _model,"1");
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
            catch (Exception)
            {

                var data = new
                {
                    rs = '0'
                };
                return Newtonsoft.Json.JsonConvert.SerializeObject(data);
            }

        }
        [WebMethod]
        public string UpdateDateTimePlanca1(string ModelName, string TimeFrom, string TimeTo)
        {
            try
            {
                DBConnect dBConnect = new DBConnect();
                DataTable dt = dBConnect.StoreFillDT("TA_GetStartTimeAndEndTimePlan", CommandType.StoredProcedure,"1");
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

                        for (DateTime currentHour = DateTime.Parse(TimeFrom.Trim() + ":00").AddHours(1); currentHour < DateTime.Parse(TimeTo.Trim() + ":00"); currentHour = currentHour.AddHours(1))
                        {
                            secwork = secwork - Config.TimeRest[currentHour.Hour] * 60;
                        }
                        if (DateTime.Parse(TimeTo.Trim() + ":00").Minute >= Config.TimeRest[DateTime.Parse(TimeTo.Trim() + ":00").Hour])
                        {
                            secwork = secwork - Config.TimeRest[DateTime.Parse(TimeTo.Trim() + ":00").Hour] * 60;
                        }
                        else
                        {
                            secwork = secwork - DateTime.Parse(TimeTo.Trim() + ":00").Minute * 60;
                        }
                        if (DateTime.Parse(TimeFrom.Trim() + ":00").Minute < Config.TimeRest[DateTime.Parse(TimeFrom.Trim() + ":00").Hour])
                        {
                            secwork = secwork - (Config.TimeRest[DateTime.Parse(TimeFrom.Trim() + ":00").Hour] - DateTime.Parse(TimeFrom.Trim() + ":00").Minute) * 60;
                        }
                        dBConnect.exnonquery("TA_UpdateDateTimePlan", CommandType.StoredProcedure, ModelName.Trim(), TimeFrom.Trim() + ":00", TimeTo.Trim() + ":00", secwork,"1");
                        return "1";
                    }
                }
                return "0";
            }
            catch (Exception)
            {
                return "0";
            }

        }
    }
}
