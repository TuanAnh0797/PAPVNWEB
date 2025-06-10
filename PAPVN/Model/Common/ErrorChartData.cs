using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PAPVN.Model.Common
{
    public class ErrorChartData
    {
        public List<string> labels { get; set; } = new List<string>();
        public List<int> data { get; set; } = new List<int>();
    }
}