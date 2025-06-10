using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using PAPVN.MethodLoadData;
using PAPVN.Model.Common;
using PAPVN.WebFormSignalR;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
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
        private static readonly Timer Timer = new Timer(10000);
        private static DataGanttChart dataGanttChart;


        static PCMHub()
        {
            Timer.Elapsed += async (sender, e) => await UpdateData();
            Timer.AutoReset = true;
            Timer.Start();

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
                    Start = DateTime.Now.AddMinutes(-30),
                    End = DateTime.Now.AddMinutes(30),
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
            // Mặc định option khi client kết nối (ví dụ: "All Model")
            ClientOptions.TryAdd(Context.ConnectionId, "ALL");
            // Gửi dữ liệu ban đầu ngay khi kết nối
            SendDataToClient(Context.ConnectionId, "ALL");
            return base.OnConnected();
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
                Quantity quantityPCM = new Quantity()
                {
                    PlanQuantity = random.Next(1000, 3000).ToString(),
                    OkQuantity = random.Next(1000, 2000).ToString(),
                    NgQuantity = random.Next(500, 2000).ToString(),
                    RemainQuantity = random.Next(500, 2000).ToString()
                };




                StatusMachine statusMachine = new StatusMachine()
                {
                    Status = "Stop",
                    ReasonStop = "No issues",
                    TimeStop = "2",
                    TotalTimeStop = "00:00:00"
                };

                string DataLineChartQuantityPerTime = LoadDataVisualize.LineChartQuantityPerTime("All Model", "All");


                var data = new DataSend()
                {
                    quantityPCM = quantityPCM,
                    statusMachine = statusMachine,
                    statusMachineDetail = new List<StatusMachineDetail>
                    {
                        new StatusMachineDetail { TimeInsert = "2023-10-01 10:00:00", Status = "Running", Reason = "No issues" },
                        new StatusMachineDetail { TimeInsert = "2023-10-01 11:00:00", Status = "Stop", Reason = "Maintenance" },
                        new StatusMachineDetail { TimeInsert = "2023-10-01 12:00:00", Status = "Running", Reason = "No issues" },
                         new StatusMachineDetail { TimeInsert = "2023-10-01 11:00:00", Status = "Stop", Reason = "Maintenance" },
                        new StatusMachineDetail { TimeInsert = "2023-10-01 12:00:00", Status = "Running", Reason = "No issues" },
                         new StatusMachineDetail { TimeInsert = "2023-10-01 11:00:00", Status = "Stop", Reason = "Maintenance" },
                        new StatusMachineDetail { TimeInsert = "2023-10-01 12:00:00", Status = "Running", Reason = "No issues" },
                         new StatusMachineDetail { TimeInsert = "2023-10-01 11:00:00", Status = "Stop", Reason = "Maintenance" },
                        new StatusMachineDetail { TimeInsert = "2023-10-01 12:00:00", Status = "Running", Reason = "No issues" }
                    },
                    dataGanttCharts = dataGanttChart,
                    errorChartData = new ErrorChartData
                    {
                        labels = new List<string> { "Error 1", "Error 2", "Error 3" },
                        data = new List<int> { random.Next(1, 10), random.Next(1, 10), random.Next(1, 10) }
                    },
                    oeedata = new OEEData()
                    {
                        TotalOEE = random.Next(60, 90).ToString() + "%",
                        Availability = random.Next(60, 90).ToString() + "%",
                        Performance = random.Next(60, 90).ToString() + "%",
                        Quality = random.Next(60, 90).ToString() + "%",
                    },

                    quantitybyModel = new QuantitybyModel()
                    {
                        Actual = new List<int> { random.Next(100, 500), random.Next(100, 500), random.Next(100, 500) },
                        Plan = new List<int> { random.Next(100, 500), random.Next(100, 500), random.Next(100, 500) },
                        Target = new List<int> { random.Next(100, 500), random.Next(100, 500), random.Next(100, 500) },
                        labels = new List<string> { "Model A", "Model B", "Model C" },
                        maxy = 500

                    },
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