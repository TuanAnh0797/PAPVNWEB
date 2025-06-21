using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using PAPVN.MethodLoadData;
using PAPVN.Model.Common;
using PAPVN.Service;
using PAPVN.WebFormSignalR;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Timers;
using System.Web;

namespace PAPVN.SignalR
{
    [HubName("PCMHub")]
    public class PCMHub : Hub
    {
        // Lưu trữ option của từng client theo ConnectionId
        private static readonly ConcurrentDictionary<string, string> ClientOptions = new ConcurrentDictionary<string, string>();
        private static readonly Timer Timer_PCM = new Timer(5000);
        private static DataGanttChart dataGanttChart;

        static int actual1 = 500;
        static int actual2 = 700;
        static int actual3 = 550;

        static PCMHub()
        {
            Timer_PCM.Elapsed += async (sender, e) => await UpdateData();
            Timer_PCM.AutoReset = true;
            Timer_PCM.Start();

        }
        // Hàm gửi dữ liệu định kỳ
        private static async Task UpdateData()
        {
            Random rd = new Random();
            string St = "";
            int randomValue = rd.Next(1, 100);
            if (randomValue < 80)
            {
                St = "Run";
            }

            else
            {
                St = "Stop";
            }
            dataGanttChart = new DataGanttChart()
            {
                dataChart = new List<DataChart>()
            {
                new DataChart()
                {
                    Start = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 6, 0, 0),
                    End = DateTime.Now,
                    Status = St,
                    MachineName = "PCM"
                }
            },
                min = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 6, 0, 0),
                max = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 23, 59, 59),

            };



            foreach (var client in ClientOptions)
            {
                string connectionId = client.Key;
                string option = client.Value;
                SendDataToClient(connectionId, option);
            }
        }

        public override Task OnConnected()
        {
            string path = HttpContext.Current.Server.MapPath("~/wwwroot/config.ini");
            string[] config = File.ReadAllLines(path);
            Config.TimeRest = config[0].Split(',').Select(int.Parse).ToArray();
            // Mặc định option khi client kết nối (ví dụ: "All Model")
            ClientOptions.TryAdd(Context.ConnectionId, "ALL");
            // Gửi dữ liệu ban đầu ngay khi kết nối
            SendDataToClient(Context.ConnectionId, "ALL");
            return base.OnConnected();
        }
        public void GetInitialData()
        {
            // Call the same code that updates data
            SendDataToClient(Context.ConnectionId, "ALL");
        }

        public override Task OnDisconnected(bool stopCalled)
        {
            // Xóa option khi client ngắt kết nối
            ClientOptions.TryRemove(Context.ConnectionId, out _);
            return base.OnDisconnected(stopCalled);
        }

        // Client gửi option mới
        public void ChangeOption(string option)
        {
            // Cập nhật option cho client hiện tại
            ClientOptions.AddOrUpdate(Context.ConnectionId, option, (key, oldValue) => option);
            SendDataToClient(Context.ConnectionId, option);
        }

        public static void SendDataToClient(string connectionId, string Optiontable)
        {
            try
            {
                Random random = new Random();
                Quantity quantityPCM = PCM_DashBoard_Service.GetQuantity_PCM("All");
                StatusMachine statusMachine = PCM_DashBoard_Service.GetStatusMachine_PCM();
                List<StatusMachineDetail> StatusMachineDetails = PCM_DashBoard_Service.GetStatusMachineDetail_PCM("All");
                QuantitybyModel quantitybyModel = PCM_DashBoard_Service.GetQuantitybyModel_PCM("All");
                string DataLineChartQuantityPerTime = LoadDataVisualize.LineChartQuantityPerTime("All Model", "All");


                var data = new DataSend()
                {
                    quantityPCM = quantityPCM,
                    statusMachine = statusMachine,
                    statusMachineDetail = StatusMachineDetails,
                    dataGanttCharts = dataGanttChart,

                    errorChartData = new ErrorChartData
                    {
                        labels = new List<string> { "Error 1", "Error 2", "Error 3" },
                        data = new List<int> { random.Next(1, 10), random.Next(1, 10), random.Next(1, 10) }
                    },
                    oeedata = new OEEData()
                    {
                        TotalOEE = random.Next(80, 90).ToString() + "%",
                        Availability = random.Next(80, 90).ToString() + "%",
                        Performance = random.Next(80, 90).ToString() + "%",
                        Quality = random.Next(80, 90).ToString() + "%",
                    },
                    quantitybyModel = quantitybyModel,
                    DataLineChartQuantityPerTime = DataLineChartQuantityPerTime
                };
                var hub = GlobalHost.ConnectionManager.GetHubContext<PCMHub>();
                hub.Clients.All.updateData(data);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in SendDataToClient: {ex.Message}");
            }
        }

    }
    public class DataSend
    {
        public Quantity quantityPCM { get; set; }

        public StatusMachine statusMachine { get; set; }

        public List<StatusMachineDetail> statusMachineDetail { get; set; }

        public DataGanttChart dataGanttCharts { get; set; }

        public ErrorChartData errorChartData { get; set; }

        public OEEData oeedata { get; set; }

        public QuantitybyModel quantitybyModel { get; set; }

        public string DataLineChartQuantityPerTime { get; set; }

    }
}