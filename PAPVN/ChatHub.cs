using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PAPVN
{
    using Google.Protobuf.WellKnownTypes;
    using Microsoft.AspNet.SignalR;
    using Microsoft.AspNet.SignalR.Hubs;
    using PAPVN.MethodLoadData;
    using System;
    using System.Collections.Concurrent;
    using System.Collections.Generic;
    using System.Data;
    using System.IO;
    using System.Timers;
    using System.Web;

    namespace WebFormSignalR
    {
        [HubName("chatHub")]
        public class ChatHub : Hub
        {
            //private static List<DataItem> data = new List<DataItem>();
            // Lưu trữ option của từng client theo ConnectionId
            private static readonly ConcurrentDictionary<string, string> ClientOptions = new ConcurrentDictionary<string, string>();
            private static readonly Timer Timer = new Timer(10000);
            static ChatHub()
            {
                Timer.Elapsed += async (sender, e) => await UpdateData();
                Timer.AutoReset = true;
                Timer.Start();
            }
            public override Task OnConnected()
            {
                //string path = HttpContext.Current.Server.MapPath("~/wwwroot/config.ini");
                //string[] config = File.ReadAllLines(path);
                //Config.TimeRest = config[0].Split(',').Select(int.Parse).ToArray();
                // Mặc định option khi client kết nối (ví dụ: "All Model")
                ClientOptions.TryAdd(Context.ConnectionId, "ALL");
                // Gửi dữ liệu ban đầu ngay khi kết nối
                SendDataToClient(Context.ConnectionId, "ALL");
                return base.OnConnected();
            }
            public override Task OnDisconnected(bool stopCalled)
            {
                // Xóa option khi client ng?t k?t n?i
                ClientOptions.TryRemove(Context.ConnectionId, out _);
                return base.OnDisconnected(stopCalled);
            }

            // Client gửi option mới
            public void changeOption(string option)
            {
                // Cập nhật option cho client hiện tại
                ClientOptions.AddOrUpdate(Context.ConnectionId, option, (key, oldValue) => option);
                SendDataToClient(Context.ConnectionId, option);
            }
            // Hàm gửi dữ liệu định kỳ
            private static async Task UpdateData()
            {
                foreach (var client in ClientOptions)
                {
                    string connectionId = client.Key;
                    string option = client.Value;
                    SendDataToClient(connectionId, option);
                }
            }


            public void GetInitialData(Data data)
            {
                Clients.Caller.updateTable(data);
            }
            public static void SendDataToClient(string connectionId,string Optiontable)
            {
                //
                string DataLineChartQuantityPerTime = LoadDataVisualize.LineChartQuantityPerTime("All Model", "All");
                //
                string DatabarchartOKNGPENDING = LoadDataVisualize.barchartOKNGPENDING();
                //
                DataSet ds = LoadDataVisualize.LoadDataForTableHistory(Optiontable);

                if (ds == null)
                {
                    return;
                }

                DataTable datahistory = ds.Tables[0];
                DataRow productitem = ds.Tables[1].Rows[0];

                List<Product> pr = new List<Product>();
                CurrentProduct productcurrent;
                foreach(DataRow item in datahistory.Rows)
                {
                    pr.Add(new Product() { CodeBack = item["CodeBack"].ToString(), Judge = item["Judge_Total"].ToString(), TimeUpdate = ((DateTime)item["TimeUpdate"]).ToString("HH:mm:ss dd/MM/yyyy"),ReasonError= item["ReasonError"].ToString(),PersonConfirm= item["PersonConfirm"].ToString() });
                }
                //CodeBack, Judge_VP, Judge_GAS, Judge_WI1WITH, Judge_WI1START, Judge_IP, Judge_DF, Judge_TEMP, Judge_IOT, Judge_WI2, Judge_PAN, Judge_CAMBACK, Judge_CAMFRONT, Judge_Total, ReasonError, PersonConfirm, TimeUpdate
                productcurrent = new CurrentProduct()
                {
                    CodeBack = productitem["CodeBack"].ToString(),
                    JudgeVP = productitem["Judge_VP"].ToString(),
                    JudgeGAS = productitem["Judge_GAS"].ToString(),
                    JudgeWI1W = productitem["Judge_WI1WITH"].ToString(),
                    JudgeWI1S = productitem["Judge_WI1START"].ToString(),
                    JudgeIP = productitem["Judge_IP"].ToString(),
                    JudgeDF = productitem["Judge_DF"].ToString(),
                    JudgeTEMP = productitem["Judge_TEMP"].ToString(),
                    JudgeIOT = productitem["Judge_IOT"].ToString(),
                    JudgeWI2 = productitem["Judge_WI2"].ToString(),
                    JudgePAN = productitem["Judge_PAN"].ToString(),
                    JudgeCAMB = productitem["Judge_CAMBACK"].ToString(),
                    JudgeCAMF = productitem["Judge_CAMFRONT"].ToString(),
                    JudgeTotal = productitem["Judge_Total"].ToString()
                };


                var data = new Data()
                {
                    DataLineChartQuantityPerTime = DataLineChartQuantityPerTime,
                    DatabarchartOKNGPENDING = DatabarchartOKNGPENDING,
                    Datahistory = pr,
                    CurrentData = productcurrent,
                };
                
                var hub = GlobalHost.ConnectionManager.GetHubContext<ChatHub>();
                hub.Clients.All.updateTable(data);
            }
        }

        public class Data
        {
            public string DataLineChartQuantityPerTime { get; set; }
            public string DatabarchartOKNGPENDING { get; set; }
            public List<Product> Datahistory { get; set; }
            public CurrentProduct CurrentData { get; set; }

        }
        public class Product
        {
            public string CodeBack { get; set; }
            public string Judge { get; set; }
            public string TimeUpdate { get; set; }
            public string ReasonError { get; set; }
            public string PersonConfirm { get; set; }
        }
        public class CurrentProduct
        {
            public string CodeBack { get; set; }
            public string JudgeVP { get; set; }
            public string JudgeGAS { get; set; }
            public string JudgeWI1W { get; set; }
            public string JudgeWI1S { get; set; }
            public string JudgeIP { get; set; }
            public string JudgeDF { get; set; }
            public string JudgeTEMP { get; set; }
            public string JudgeIOT { get; set; }
            public string JudgeWI2 { get; set; }
            public string JudgePAN { get; set; }
            public string JudgeCAMB { get; set; }
            public string JudgeCAMF { get; set; }
            public string JudgeOK { get; set; }
            public string JudgeTotal { get; set; }

        }




    }
}
