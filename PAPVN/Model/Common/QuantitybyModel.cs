using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PAPVN.Model.Common
{
    public class QuantitybyModel
    {
        public List<string> labels { get; set; } = new List<string>();
        public List<int> Plan { get; set; } = new List<int>();
        public List<int> Target { get; set; } = new List<int>();
        public List<int> Actual { get; set; } = new List<int>();
        public int maxy { get; set; }

        
    }
}