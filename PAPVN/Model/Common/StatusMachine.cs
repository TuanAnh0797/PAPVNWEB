using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PAPVN.Model.Common
{
    public class StatusMachine
    {
       public string Status { get; set; }
        public string ReasonStop { get; set; }
        public string TimeStop { get; set; }
        public string TotalTimeStop { get; set; }
    }
}