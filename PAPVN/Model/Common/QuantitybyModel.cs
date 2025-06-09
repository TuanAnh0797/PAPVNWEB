using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PAPVN.Model.Common
{
    public class QuantitybyModel
    {
        public List<string> labels { get; set; }
        public List<int> Plan { get; set; }
        public List<int> Target { get; set; }
        public List<int> Actual { get; set; }

        public int maxy { get; set; }

        public void getmax()
        {
            int maxplan = Plan.Max();
            int maxactual = Actual.Max();
            maxy = maxplan > maxactual ? maxplan : maxactual;

        }
    }
}