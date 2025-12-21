using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using PAPVN.MethodLoadData;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Timers;
using System.Web;

namespace PAPVN.SignalRHub
{
    [HubName("GasHub")]
    public class GasHub:Hub
    {
        private static readonly ConcurrentDictionary<string, string> ClientOptions = new ConcurrentDictionary<string, string>();
        private static readonly Timer Timer_Urethan = new Timer(5000);

        static GasHub()
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
        public override Task OnDisconnected(bool stopCalled)
        {
            // Xóa option khi client ngắt kết nối
            ClientOptions.TryRemove(Context.ConnectionId, out _);
            return base.OnDisconnected(stopCalled);
        }

        public static void SendDataToClient(string connectionId, string Optiontable)
        {
            try
            {
                string[] optionParts = Optiontable.Split(';');
                string date = optionParts[0].Length < 8 ? "" : optionParts[0];
                string shift = optionParts.Length > 1 ? optionParts[1] : "All";
                string model = optionParts.Length > 1 ? optionParts[2] : "All Model";
                DataRealTime dataUrethan = new DataRealTime();
                dataUrethan.QuantityPerTimechartCanvas = LoadDataVisualize.LineChartQuantityPerTimeObject(model, shift, "TA_sp_LoadDataForLineChartPlanGasByTime_new",date);
                dataUrethan.quantityByModel = LoadDataVisualize.QuantityByModel(shift, "TA_sp_LoadDataForBarChartPlangas_unique_new", date);
                //dataUrethan.quantityByModelMonitor = LoadDataVisualize.QuantityByModelMonitor("All", "TA_sp_LoadDataForBarChartPlanurethan_uniqueMonitor");
                dataUrethan.quantityByModelgroup = LoadDataVisualize.QuantityByGroupModel(shift, "TA_sp_LoadDataForBarChartPlangas_unique_new", date);
                dataUrethan.quantityPerHour = LoadDataVisualize.LineChartQuantityPerHour(model, shift, "TA_sp_LoadDataForLineChartPlanGasByHour_new", date);
                // dataUrethan.QuantityPerTimechartCanvas = LoadDataVisualize.LineChartQuantityPerTimeObject(Optiontable, "All", "Test");
                //dataUrethan.quantityByModel = LoadDataVisualize.QuantityByModel("All", "Test");
                //dataUrethan.quantityByModelMonitor = LoadDataVisualize.QuantityByModelMonitor("All", "Test");
                // dataUrethan.quantityByModelgroup = LoadDataVisualize.QuantityByGroupModel("All", "Test");
                //dataUrethan.quantityPerHour = LoadDataVisualize.LineChartQuantityPerHour(Optiontable, "All", "Test");
                var hub = GlobalHost.ConnectionManager.GetHubContext<UrethanHub>();
                hub.Clients.Client(connectionId).updateData(dataUrethan);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error in SendDataToClient: {ex.Message}");
            }
        }

        public void UpdateFilter(string date, string model, string shift)
        {
            if (ClientOptions.ContainsKey(Context.ConnectionId))
            {
                ClientOptions[Context.ConnectionId] = date + ";" + shift + ";" + model;
            }
        }
    }
}