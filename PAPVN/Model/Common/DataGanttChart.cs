using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PAPVN.Model.Common
{
    public class DataGanttChart
    {
        public List<DataChart> dataChart { get; set; }
        public DateTime min { get; set; }
        public DateTime max { get; set; }
    }
    public class DataChart
    {
        public DateTime Start { get; set; }
        public DateTime End { get; set; }
        public string Status { get; set; } // "Chạy", "Lỗi", hoặc trạng thái khác

        public string MachineName { get; set; }
    }
}