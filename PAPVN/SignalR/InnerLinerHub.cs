using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using PAPVN.MethodLoadData;
using PAPVN.Model.Common;
using PAPVN.Service;
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
    [HubName("InnerLinerHub")]
    public class InnerLinerHub:Hub
    {
        private static readonly ConcurrentDictionary<string, string> ClientOptions = new ConcurrentDictionary<string, string>();
        private static readonly Timer Timer_Inner = new Timer(10000);

        static InnerLinerHub()
        {
            Timer_Inner.Elapsed += async (sender, e) => await UpdateData();
            Timer_Inner.AutoReset = true;
            Timer_Inner.Start();

        }
        public void GetInitialData()
        {
            // Call the same code that updates data
            SendDataToClient(Context.ConnectionId, "ALL");
        }
        private static async Task UpdateData()
        {

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
                Quantity quantityPCM = PCM_DashBoard_Service.GetQuantity_PCM("All");
                string DataLineChartQuantityPerTime = LoadDataVisualize.LineChartQuantityPerTime("All Model", "All");
                var data = new DataSend()
                {
                    quantityPCM = quantityPCM,
                    DataLineChartQuantityPerTime = DataLineChartQuantityPerTime
                };
                var hub = GlobalHost.ConnectionManager.GetHubContext<InnerLinerHub>();
                hub.Clients.All.updateData(data);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in SendDataToClient: {ex.Message}");
            }
        }
    }
}