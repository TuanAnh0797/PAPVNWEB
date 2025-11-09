using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PAPVN.Model.ChartData
{
    public class QuantityByModel
    {
        public int[] dataplan { get; set; }
        public int[] dataplanpertime { get; set; }
        public int[] dataactual { get; set; }
        //public int[] datadiff { get; set; }
        public string[] labels { get; set; }
    }
}