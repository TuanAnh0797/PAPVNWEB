using System;
using System.Collections.Generic;
using System.Data;
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
                loaddataplan();
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
        private void loaddataplan()
        {
            string HTML = "";
            DBConnect dBConnect = new DBConnect();
            DataTable dt = dBConnect.StoreFillDT("TA_LoadDataPlanCa1", CommandType.StoredProcedure);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["Model"].ToString() != "Total")
                {
                    if (Int32.Parse(dt.Rows[i]["MonitorSpecial"].ToString()) == 0)
                    {
                        HTML += $"<tr> " +
                        $"<td> {dt.Rows[i]["Model"]} </td>" +
                        $"<td> {dt.Rows[i]["Quantity"]} </td>" +
                        $"<td> {dt.Rows[i]["TimeStart"]} </td>" +
                         $"<td> {dt.Rows[i]["TimeEnd"]} </td>" +
                          $"<td> <button style=\"width:120px\" type=\"button\" Class=\"btn-success\" onclick=\"MonitorSpecial(this)\"> <i class=\"fas fa-plus\"></i> Add </button> </td>" +
                          $"<td> <button style=\"width:120px\" type=\"button\" onclick=\"showPopup(this)\"><i class=\"fas fa-edit\"></i>Edit</button> </td>" +
                        $"</tr>";
                    }
                    else
                    {
                        HTML += $"<tr> " +
                       $"<td> {dt.Rows[i]["Model"]} </td>" +
                       $"<td> {dt.Rows[i]["Quantity"]} </td>" +
                       $"<td> {dt.Rows[i]["TimeStart"]} </td>" +
                        $"<td> {dt.Rows[i]["TimeEnd"]} </td>" +
                         $"<td> <button style=\"width:120px\" type=\"button\" Class=\"btn-danger\" onclick=\"MonitorSpecial(this)\"> <i class=\"fas fa-trash\"></i> Remove</button> </td>" +
                         $"<td> <button style=\"width:120px\" type=\"button\" onclick=\"showPopup(this)\"><i class=\"fas fa-edit\"></i>Edit</button> </td>" +
                       $"</tr>";
                    }
                }
            }
            dt_plan.InnerHtml = HTML;
        }

    }
}