using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PAPVN
{
    public class Config
    {
       //public static int RestTime1 = (5 + 10 + 30 + 10) * 60;
       //public static int RestTime2 = (5 + 10 + 30 + 10) * 60;
       //public static int RestTime3 = (10 + 10 + 45 + 10) * 60;

        //public static int RestTime6hour = 5;
        //public static int RestTime8hour = 10;
        //public static int RestTime10hour = 30;
        //public static int RestTime12hour = 10;

        //public static int RestTime14hour = 5;
        //public static int RestTime16hour = 10;
        //public static int RestTime18hour = 30;
        //public static int RestTime20hour = 10;

        //public static int RestTime22hour = 10;
        //public static int RestTime00hour = 10;
        //public static int RestTime02hour = 45;
        //public static int RestTime04hour = 10;

        public static int[] TimeRest = new int[] { 10, 0, 45, 0, 10, 0, 5, 0, 10, 0, 30, 0, 10, 0, 5, 0, 10, 0, 30, 0, 10, 0, 10, 0 };

        public static int[] QuantityPoint = new int[] { 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2 };

    }
}