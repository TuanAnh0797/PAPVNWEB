using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PAPVN
{
    public partial class PlanGAS : System.Web.UI.Page
    {
    
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CultureInfo myculture = new CultureInfo("en-US");
                myculture.DateTimeFormat.LongTimePattern = "HH:mm:ss";
                myculture.DateTimeFormat.ShortDatePattern = "yyyy-MM-dd";
                System.Threading.Thread.CurrentThread.CurrentCulture = myculture;
                Load_model();
                
            }
        }
        protected void Load_model()
        {
            // load model
            DBConnect dBConnect = new DBConnect();
            DataTable dt = dBConnect.StoreFillDT("LoadModelPlan", CommandType.StoredProcedure);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                modelplan.Items.Add($"{dt.Rows[i][0]}");
            }

        }


    }


}