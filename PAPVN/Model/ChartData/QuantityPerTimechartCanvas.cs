using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PAPVN.Model.ChartData
{
    public class QuantityPerTimechartCanvas
    {
        public int[] dataplan { get; set; } 
        public int[] dataactual { get; set; } 
        public int[] datadiff { get; set; }
        public int shift { get; set; }
        public string typeplan { get; set; }
        public int TotalPlan { get; set; }


        public int TimePlan { get; set; }
        public int Actual { get; set; }
        public int Diff { get; set; }
        public int Remain { get; set; }

        public string[] labels { get; set; }


    }
}