using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PAPVN.Model.Common
{
    public class QuantitybyModel
    {
        public List<string> labels { get; set; } = new List<string>();
        public List<double> Plan { get; set; } = new List<double>();
        public List<double> Target { get; set; } = new List<double>();
        public List<double> Actual { get; set; } = new List<double>();
        public int maxy { get; set; }

        
    }
}