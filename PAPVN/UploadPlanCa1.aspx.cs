using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PAPVN
{
    public partial class UploadPlanCa1 : System.Web.UI.Page
    {
        protected string datenow;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (DateTime.Now.Hour > 5)
                {
                    datenow = DateTime.Now.ToString("dd/MM/yyyy");
                }
                else
                {
                    datenow = DateTime.Now.AddDays(-1).ToString("dd/MM/yyyy");
                }
            }
        }
    }
}