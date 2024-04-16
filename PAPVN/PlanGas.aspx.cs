using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
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
                Load_shift();


            }
        }
        protected void Load_model()
        {
            // load model
            DBConnect dBConnect = new DBConnect();
            DataTable dt = dBConnect.StoreFillDT("TA_sp_LoadModelPlan", CommandType.StoredProcedure);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                modelplan.Items.Add($"{dt.Rows[i][0]}");
            }

        }
        protected void Load_shift()
        {
            DBConnect dBConnect = new DBConnect();
            DataTable dt = dBConnect.StoreFillDT("TA_sp_LoadShift", CommandType.StoredProcedure);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["TypePlan"].ToString() == "2_10")
                {
                    cmb_shift.Items.Add("Ca1");
                    cmb_shift.Items.Add("Ca2");
                }
                else
                {
                    cmb_shift.Items.Add("Ca1");
                    cmb_shift.Items.Add("Ca2");
                    cmb_shift.Items.Add("Ca3");
                    
                }
            }
        }


    }


}