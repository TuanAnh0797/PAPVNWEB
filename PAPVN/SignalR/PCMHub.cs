using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using PAPVN.WebFormSignalR;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace PAPVN.SignalR
{
    [HubName("PCMHub")]
    public class PCMHub: Hub
    {
        // Lưu trữ option của từng client theo ConnectionId
        private static readonly ConcurrentDictionary<string, string> ClientOptions = new ConcurrentDictionary<string, string>();

        public override Task OnConnected()
        {
            // Mặc định option khi client kết nối (ví dụ: "All Model")
            ClientOptions.TryAdd(Context.ConnectionId, "ALL");
            // Gửi dữ liệu ban đầu ngay khi kết nối
            SendChartData("ALL");
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

        private void SendDataToClient(string connectionId, string option)
        {
            // Logic to send data to the client based on the option
            // This is a placeholder for actual implementation
        }


        //
        public void GetInitialData(Data data)
        {
            Clients.Caller.UpdateData(data);
        }


        // Thêm phương thức này vào PCMHub class
        public async Task SendChartData(string option = "ALL")
        {
            try
            {
                var chartData = GenerateChartData(option);
                // Gửi dữ liệu đến client gọi phương thức này
                await Clients.Caller.SendAsync("UpdateData", chartData);
            }
            catch (Exception)
            {
               
            }
        }

        // Phương thức tạo dữ liệu cho chart
        private List<object> GenerateChartData(string option = "ALL")
        {
            var chartData = new List<object>();
            var random = new Random();
            var statuses = new[] { "Chạy", "Lỗi", "Dừng" };

            // Thời gian bắt đầu và kết thúc trong ngày
            var baseDate = DateTime.Today;
            var startTime = baseDate.AddHours(8); // 8:00 AM
            var endTime = baseDate.AddHours(24);  // 12:00 AM

            var currentTime = startTime;
            var id = 1;

            // Tạo dữ liệu mẫu
            while (currentTime < endTime)
            {
                // Thời gian hoạt động ngẫu nhiên từ 15 phút đến 2 giờ
                var durationMinutes = random.Next(15, 120);
                var taskEndTime = currentTime.AddMinutes(durationMinutes);

                // Đảm bảo không vượt quá thời gian kết thúc
                if (taskEndTime > endTime)
                    taskEndTime = endTime;

                // Chọn trạng thái ngẫu nhiên
                var status = statuses[random.Next(statuses.Length)];

                // Tạo object dữ liệu cho chart
                var dataPoint = new
                {
                    id = id++,
                    start = currentTime.ToString("yyyy-MM-ddTHH:mm:ss"),
                    end = taskEndTime.ToString("yyyy-MM-ddTHH:mm:ss"),
                    status = status,
                    duration = (int)(taskEndTime - currentTime).TotalMinutes,
                    machine = "Máy 1"
                };

                chartData.Add(dataPoint);

                // Chuyển sang thời gian tiếp theo
                currentTime = taskEndTime;

                // Thêm khoảng nghỉ ngẫu nhiên (0-15 phút)
                if (currentTime < endTime)
                {
                    var breakMinutes = random.Next(0, 16);
                    currentTime = currentTime.AddMinutes(breakMinutes);
                }
            }

            return chartData;
        }


    }
}