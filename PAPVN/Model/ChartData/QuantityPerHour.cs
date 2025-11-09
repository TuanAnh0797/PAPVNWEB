using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PAPVN.Model.ChartData
{
    public class QuantityPerHour
    {
        public int[] dataplan { get; set; }
        public int[] dataactual { get; set; }
        public int[] datadiff { get; set; }

        public int[] datadifftotal { get; set; }

        public int shift { get; set; }
        public string typeplan { get; set; }
    }
}