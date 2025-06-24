using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using PAPVN.MethodLoadData;
using PAPVN.Model.Common;
using PAPVN.Service;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Timers;
using System.Web;

namespace PAPVN.SignalR
{
    [HubName("InnerLinerHub")]
    public class InnerLinerHub : Hub
    {
        private static readonly ConcurrentDictionary<string, string> ClientOptions = new ConcurrentDictionary<string, string>();
        private static Timer Timer_Inner;
        private static readonly object TimerLock = new object();
        private static bool _timerInitialized = false;

        static InnerLinerHub()
        {
            InitializeTimer();
        }

        private static void InitializeTimer()
        {
            lock (TimerLock)
            {
                if (!_timerInitialized)
                {
                    Timer_Inner = new Timer(2000);
                    Timer_Inner.Elapsed += TimerElapsedHandler;
                    Timer_Inner.AutoReset = true;
                    Timer_Inner.Enabled = true;
                    Timer_Inner.Start();
                    _timerInitialized = true;
                    Debug.WriteLine("InnerLinerHub timer initialized at: " + DateTime.Now);
                }
            }
        }

        private static void TimerElapsedHandler(object sender, ElapsedEventArgs e)
        {
            try
            {
                UpdateData().Wait();
                Debug.WriteLine("Timer elapsed at: " + DateTime.Now);
            }
            catch (Exception ex)
            {
                Debug.WriteLine("Error in timer callback: " + ex.Message);
                
                // If timer was disabled due to exception, restart it
                if (Timer_Inner != null && !Timer_Inner.Enabled)
                {
                    Timer_Inner.Start();
                    Debug.WriteLine("Timer restarted after error at: " + DateTime.Now);
                }
            }
        }

        // Ensure timer is running when application starts
        public static void EnsureTimerStarted()
        {
            if (Timer_Inner == null || !Timer_Inner.Enabled)
            {
                InitializeTimer();
            }
        }

        public void GetInitialData()
        {
            // Call the same code that updates data
            SendDataToClient(Context.ConnectionId, "ALL");
            Debug.WriteLine("GetInitialData called by client: " + Context.ConnectionId);
        }

        private static async Task UpdateData()
        {
            Debug.WriteLine($"UpdateData executing with {ClientOptions.Count} clients");
            if (ClientOptions.Count == 0)
            {
                Debug.WriteLine("No clients connected, still updating data");
            }

            foreach (var client in ClientOptions)
            {
                string connectionId = client.Key;
                string option = client.Value;
                SendDataToClient(connectionId, option);
            }
        }

        public override Task OnConnected()
        {
            try
            {
                // Ensure timer is running
                EnsureTimerStarted();

                string path = HttpContext.Current.Server.MapPath("~/wwwroot/config.ini");
                string[] config = File.ReadAllLines(path);
                Config.TimeRest = config[0].Split(',').Select(int.Parse).ToArray();
                
                // Mặc định option khi client kết nối (ví dụ: "All Model")
                ClientOptions.TryAdd(Context.ConnectionId, "ALL");
                
                // Gửi dữ liệu ban đầu ngay khi kết nối
                SendDataToClient(Context.ConnectionId, "ALL");
                Debug.WriteLine($"Client connected: {Context.ConnectionId}, Total clients: {ClientOptions.Count}");
            }
            catch (Exception ex)
            {
                Debug.WriteLine("Error in OnConnected: " + ex.Message);
            }
            return base.OnConnected();
        }

        public override Task OnDisconnected(bool stopCalled)
        {
            // Xóa option khi client ngắt kết nối
            string option;
            ClientOptions.TryRemove(Context.ConnectionId, out option);
            Debug.WriteLine($"Client disconnected: {Context.ConnectionId}, Total clients: {ClientOptions.Count}");
            return base.OnDisconnected(stopCalled);
        }

        // Client gửi option mới
        public void ChangeOption(string option)
        {
            // Cập nhật option cho client hiện tại
            ClientOptions.AddOrUpdate(Context.ConnectionId, option, (key, oldValue) => option);
            SendDataToClient(Context.ConnectionId, option);
            Debug.WriteLine($"Client {Context.ConnectionId} changed option to: {option}");
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
                Debug.WriteLine($"Data sent to clients at: {DateTime.Now}");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error in SendDataToClient: {ex.Message}");
            }
        }
    }
}