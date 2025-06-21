using Antlr.Runtime.Misc;
using Google.Protobuf.WellKnownTypes;
using PAPVN.Model.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PAPVN.Service
{
    public class PCM_DashBoard_Service
    {
        public static Quantity GetQuantity_PCM(string option)
        {
            Quantity quantity = new Quantity();
            DataTable dt = DBConnectStatic.StoreFillDT("GetQuantity_PCM", System.Data.CommandType.StoredProcedure, option);
            if (dt.Rows.Count > 0 )
            {
                quantity.PlanQuantity = dt.Rows[0]["PlanQuantity"].ToString();
                quantity.OkQuantity = dt.Rows[0]["OkQuantity"].ToString();
                quantity.NgQuantity = dt.Rows[0]["NgQuantity"].ToString();
                quantity.RemainQuantity = dt.Rows[0]["RemainQuantity"].ToString();
            }
            return quantity;
            
        }
        public static StatusMachine GetStatusMachine_PCM()
        {
            StatusMachine statusMachine = new StatusMachine();
            DataTable dt = DBConnectStatic.StoreFillDT("GetStatusMachine_PCM", System.Data.CommandType.StoredProcedure);
            if (dt.Rows.Count > 0)
            {
                statusMachine.Status = dt.Rows[0]["Status"].ToString();
                statusMachine.ReasonStop = dt.Rows[0]["ReasonStop"].ToString();
                statusMachine.TimeStop = dt.Rows[0]["TimeStop"].ToString();
                statusMachine.TotalTimeStop = dt.Rows[0]["TotalTimeStop"].ToString();
            }
            return statusMachine;

        }
        public static List<StatusMachineDetail> GetStatusMachineDetail_PCM(string option)
        {
            List<StatusMachineDetail> statusMachineDetails = new List<StatusMachineDetail>();
            DataTable dt = DBConnectStatic.StoreFillDT("GetStatusMachineDetail_PCM", System.Data.CommandType.StoredProcedure, option);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    statusMachineDetails.Add(new StatusMachineDetail()
                    {
                        Status = item["Status"].ToString(),
                        Reason = item["Reason"].ToString(),
                        TimeInsert = item["TimeInsert"].ToString()
                    });
                }

               
            }
            return statusMachineDetails;
        }
        public  static DataGanttChart GetDataGanttChart_PCM(string option)
        {
            DataGanttChart dataGanttChart = new DataGanttChart();
            DataSet ds = DBConnectStatic.StoreFillDS("GetDataGanttChart_PCM", System.Data.CommandType.StoredProcedure, option);
            DataTable dtminmax = ds.Tables[0];
            DataTable datachart = ds.Tables[1];
            dataGanttChart.min = (DateTime)dtminmax.Rows[0]["Min"];
            dataGanttChart.max = (DateTime)dtminmax.Rows[0]["Max"];
            List<DataChart> datacharts = new List<DataChart>();

            for (int i = 0; i < datachart.Rows.Count; i++)
            {
                DataChart chart = new DataChart()
                {
                    Start = (DateTime)datachart.Rows[i]["Start"],
                    End = (DateTime)datachart.Rows[i]["End"],
                    Status = datachart.Rows[i]["Status"].ToString(),
                    MachineName = datachart.Rows[i]["MachineName"].ToString()
                };
                datacharts.Add(chart);
            }

            dataGanttChart.dataChart = datacharts;

            return dataGanttChart;
        }
        public static ErrorChartData GetErrorChartData_PCM(string option)
        {
            ErrorChartData errorChartData = new ErrorChartData();
            DataTable dt = DBConnectStatic.StoreFillDT("GetErrorChartData_PCM", System.Data.CommandType.StoredProcedure, option);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    errorChartData.labels.Add(item["Error"].ToString());
                    errorChartData.data.Add((int)item["Quantity"]);
                }
            }
            return errorChartData;
        }
        public static OEEData GetOEEData_PCM(string option)
        {
            OEEData oEEData = new OEEData();
            DataTable dt = DBConnectStatic.StoreFillDT("GetOEEData_PCM", System.Data.CommandType.StoredProcedure, option);
            if (dt.Rows.Count > 0)
            {
                oEEData.TotalOEE = dt.Rows[0]["TotalOEE"].ToString();
                oEEData.Availability = dt.Rows[0]["Availability"].ToString();
                oEEData.Performance = dt.Rows[0]["Performance"].ToString();
                oEEData.Quality = dt.Rows[0]["Quality"].ToString();
            }
            return oEEData;
        }
        public static QuantitybyModel GetQuantitybyModel_PCM(string option)
        {
            QuantitybyModel quantitybyModel = new QuantitybyModel();
            DataTable dt = DBConnectStatic.StoreFillDT("GetQuantitybyModel_PCM", System.Data.CommandType.StoredProcedure, option);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    quantitybyModel.labels.Add(item["Model"].ToString());
                    quantitybyModel.Plan.Add(double.Parse(item["Plan"].ToString()));
                    quantitybyModel.Plan.Add(double.Parse(item["Target"].ToString()));
                    quantitybyModel.Plan.Add(double.Parse(item["Actual"].ToString()));
                   
                }
            }
            return quantitybyModel;
        }
    }
}