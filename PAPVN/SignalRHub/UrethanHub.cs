using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using PAPVN.MethodLoadData;
using PAPVN.Model.ChartData;
using PAPVN.Model.Common;
using PAPVN.Service;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Timers;
using System.Web;

namespace PAPVN.SignalRHub
{
    [HubName("UrethanHub")]
    public class UrethanHub : Hub
    {
        private static readonly ConcurrentDictionary<string, string> ClientOptions = new ConcurrentDictionary<string, string>();
        private static readonly Timer Timer_Urethan = new Timer(5000);

        static UrethanHub()
        {
            Timer_Urethan.Elapsed += async (sender, e) => await UpdateData();
            Timer_Urethan.AutoReset = true;
            Timer_Urethan.Start();
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
        public override Task OnConnected()
        {
           
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
                DataUrethan dataUrethan = new DataUrethan();


                dataUrethan.QuantityPerTimechartCanvas = LoadDataVisualize.LineChartQuantityPerTimeObject(Optiontable, "All", "TA_sp_LoadDataForLineChartPlanUrethanByTime");
                dataUrethan.quantityByModel = LoadDataVisualize.QuantityByModel("All", "TA_sp_LoadDataForBarChartPlanurethan_unique");
                dataUrethan.quantityByModelMonitor = LoadDataVisualize.QuantityByModelMonitor("All", "TA_sp_LoadDataForBarChartPlanurethan_uniqueMonitor");
                dataUrethan.quantityByModelgroup = LoadDataVisualize.QuantityByGroupModel("All", "TA_sp_LoadDataForBarChartPlanurethan_unique");
                dataUrethan.quantityPerHour = LoadDataVisualize.LineChartQuantityPerHour(Optiontable, "All", "TA_sp_LoadDataForLineChartPlanUrethanByHour");
                //dataUrethan.QuantityPerTimechartCanvas = LoadDataVisualize.LineChartQuantityPerTimeObject(Optiontable, "All", "Test");
                //dataUrethan.quantityByModel = LoadDataVisualize.QuantityByModel("All", "Test");
                //dataUrethan.quantityByModelMonitor = LoadDataVisualize.QuantityByModelMonitor("All", "Test");
                //dataUrethan.quantityByModelgroup = LoadDataVisualize.QuantityByGroupModel("All", "Test");
                //dataUrethan.quantityPerHour = LoadDataVisualize.LineChartQuantityPerHour(Optiontable, "All", "Test");



                var hub = GlobalHost.ConnectionManager.GetHubContext<UrethanHub>();
                hub.Clients.Client(connectionId).updateData(dataUrethan);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in SendDataToClient: {ex.Message}");
            }
        }
    }
    class DataUrethan
    {
        public QuantityPerTimechartCanvas QuantityPerTimechartCanvas = new QuantityPerTimechartCanvas();
        public QuantityByModel quantityByModel = new QuantityByModel();
        public QuantityByModel quantityByModelMonitor = new QuantityByModel();
        public QuantityPerHour  quantityPerHour = new QuantityPerHour();
        public QuantityByModel quantityByModelgroup = new QuantityByModel();
    }

}