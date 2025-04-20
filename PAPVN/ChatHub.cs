using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PAPVN
{
    using Google.Protobuf.WellKnownTypes;
    using Microsoft.AspNet.SignalR;
    using PAPVN.MethodLoadData;
    using System;
    using System.Collections.Generic;
    using System.Data;

    namespace WebFormSignalR
    {
        public class ChatHub : Hub
        {
            //private static List<DataItem> data = new List<DataItem>();

            public void GetInitialData(Data data)
            {
                Clients.Caller.updateTable(data);
            }
            public static void UpdateData()
            {
                //
                string DataLineChartQuantityPerTime = LoadDataVisualize.LineChartQuantityPerTime("All Model", "All");
                //
                string DatabarchartOKNGPENDING = LoadDataVisualize.barchartOKNGPENDING();
                //
                var data = new Data()
                {
                    DataLineChartQuantityPerTime = DataLineChartQuantityPerTime,
                    DatabarchartOKNGPENDING = DatabarchartOKNGPENDING,
                };
                
                var hub = GlobalHost.ConnectionManager.GetHubContext<ChatHub>();
                hub.Clients.All.updateTable(data);
            }
        }

        public class Data
        {
            public string DataLineChartQuantityPerTime { get; set; }
            public string DatabarchartOKNGPENDING { get; set; }
        }




    }
}
