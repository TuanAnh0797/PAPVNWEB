using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySqlX.XDevAPI.Relational;
using MySql.Data.MySqlClient;
using static Org.BouncyCastle.Math.EC.ECCurve;
using System.Data.SqlClient;
using MySqlConnector;
namespace PAPVN
{
    public partial class UploadPlan : System.Web.UI.Page
    {
        protected string datenow;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //loaddataplan();
                if (DateTime.Now.Hour > 5)
                {
                    datenow = DateTime.Now.ToString("dd/MM/yyyy");
                }
                else
                {
                    datenow = DateTime.Now.AddDays(-1).ToString("dd/MM/yyyy");
                }
            }
            //else
            //{
            //}
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "Lỗi", true);
        }
        protected void Importdata_Click(object sender, EventArgs e)
        {
            string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
            if (ext == ".xlsx")
            {
                //getting the path of the file 
                string path = Server.MapPath("~/DataPlan/" + FileUpload1.FileName);
                //saving the file inside the MyFolder of the server
                FileUpload1.SaveAs(path);
                ReadExcelFile(path);
                System.IO.File.Delete(path);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", "alert('File upload phải có định dạng .xlsx')", true);
            }
        }
        private void ReadExcelFile(string filePath)
        {
            try
            {
                string connectionString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={filePath};Extended Properties=\"Excel 12.0 Xml;HDR=YES;IMEX=1;\"";
                using (OleDbConnection connection = new OleDbConnection(connectionString))
                {
                    connection.Open();
                    // Lấy tên các sheet trong file Excel
                    DataTable dtSheet = connection.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                    if (dtSheet != null)
                    {

                        string query = $"SELECT * FROM [Daily revise (3S)$]";
                        using (OleDbDataAdapter adapter = new OleDbDataAdapter(query, connection))
                        {
                            DataTable dt = new DataTable();
                            adapter.Fill(dt);
                            GetDataPlan(dt);
                        }
                        //}
                    }
                }
            }
            catch (Exception ex)
            {



                if (ex.Message.Contains("Daily revise"))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", $"alert('File excel không tồn tại Sheet:Daily revise (3S)')", true);
                }

               

            }

        }
        private void GetDataPlan(DataTable dt)
        {
            string TimeStartall;
            string TimeEndall;
            int indexcolumn = (DateTime.Now.Day - 1) * 5 + 18;
            var datarow = from row in dt.AsEnumerable()
                          where row.Table.Rows.IndexOf(row) > 10 && row[indexcolumn].ToString() != "" && !row[indexcolumn].ToString().Contains("-") && row[indexcolumn].ToString() != "0" && Int32.TryParse(row[indexcolumn].ToString(), out int rs) && row[0].ToString().Contains("NR-") && row[11].ToString().Contains("Plan")
                          select new
                          {
                              Model = row[0].ToString(),
                              QuantityDay = Int32.Parse(row[indexcolumn].ToString()),
                              Quantity1 = Int32.TryParse(row[indexcolumn + 2].ToString(), out int rs) ? Int32.Parse(row[indexcolumn + 2].ToString()) : 0,
                              Quantity2 = Int32.TryParse(row[indexcolumn + 3].ToString(), out int rs1) ? Int32.Parse(row[indexcolumn + 3].ToString()) : 0,
                              Quantity3 = Int32.TryParse(row[indexcolumn + 4].ToString(), out int rs2) ? Int32.Parse(row[indexcolumn + 4].ToString()) : 0,
                          };
            int QuantityTotalDay = datarow.Sum(d => d.QuantityDay);
            int QuantityTotal1 = datarow.Sum(d => d.Quantity1);
            int QuantityTotal2 = datarow.Sum(d => d.Quantity2);
            int QuantityTotal3 = datarow.Sum(d => d.Quantity3);
            if (QuantityTotal1 > 0)
            {
                TimeStartall = DateTime.Now.ToString("yyyy-MM-dd") + " 06:00:00";
            }
            else if (QuantityTotal2 > 0)
            {
                TimeStartall = DateTime.Now.ToString("yyyy-MM-dd") + " 14:00:00";
            }
            else
            {
                TimeStartall = DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00";
            }
            if (QuantityTotal3 > 0)
            {
                TimeEndall = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") + " 06:00:00";
            }
            else if (QuantityTotal2 > 0)
            {
                TimeEndall = DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00";
            }
            else
            {
                TimeEndall = DateTime.Now.ToString("yyyy-MM-dd") + " 14:00:00";
            }
            TimeSpan subtimeall = DateTime.Parse(TimeEndall) - DateTime.Parse(TimeStartall);
            double secworkall = subtimeall.TotalSeconds;
            for (DateTime currentHour = DateTime.Parse(TimeStartall); currentHour < DateTime.Parse(TimeEndall); currentHour = currentHour.AddHours(1))
            {
                secworkall = secworkall - Config.TimeRest[currentHour.Hour] * 60;
            }
            // Cấu hình Cột DataPlan
            DataTable datahavequantity = new DataTable();
            datahavequantity.Columns.Add("Model", typeof(string));
            datahavequantity.Columns.Add("QuantityDay", typeof(int));
            datahavequantity.Columns.Add("QuantityPerSec", typeof(float));
            datahavequantity.Columns.Add("Quantity1", typeof(int));
            datahavequantity.Columns.Add("Quantity2", typeof(int));
            datahavequantity.Columns.Add("Quantity3", typeof(int));
            datahavequantity.Columns.Add("TotalTime", typeof(double));
            datahavequantity.Columns.Add("TimeStart", typeof(string));
            datahavequantity.Columns.Add("TimeEnd", typeof(string));
            // Thêm dữ liệu vào DataTable
            foreach (var item in datarow)
            {
                string TimeStart;
                string TimeEnd;
                if (item.Quantity1 > 0)
                {
                    TimeStart = DateTime.Now.ToString("yyyy-MM-dd") + " 06:00:00";
                }
                else if (item.Quantity2 > 0)
                {
                    TimeStart = DateTime.Now.ToString("yyyy-MM-dd") + " 14:00:00";
                }
                else
                {
                    TimeStart = DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00";
                }
                if (item.Quantity3 > 0)
                {
                    TimeEnd = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") + " 06:00:00";
                }
                else if (item.Quantity2 > 0)
                {
                    TimeEnd = DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00";
                }
                else
                {
                    TimeEnd = DateTime.Now.ToString("yyyy-MM-dd") + " 14:00:00";
                }
                TimeSpan subtime = DateTime.Parse(TimeEnd) - DateTime.Parse(TimeStart);
                double secwork = subtime.TotalSeconds;
               
                for (DateTime currentHour  = DateTime.Parse(TimeStart); currentHour < DateTime.Parse(TimeEnd); currentHour = currentHour.AddHours(1))
                {
                    secwork = secwork - Config.TimeRest[currentHour.Hour] * 60;
                }
                datahavequantity.Rows.Add(item.Model, item.QuantityDay, item.QuantityDay / secwork,
                    item.Quantity1, item.Quantity2, item.Quantity3, secwork, TimeStart, TimeEnd);
            }
            datahavequantity.Rows.Add("Total", QuantityTotalDay, QuantityTotalDay / secworkall, QuantityTotal1, QuantityTotal2, QuantityTotal3, secworkall, TimeStartall, TimeEndall);
            DBConnect dBConnect = new DBConnect();

            dBConnect.exnonquery("ClearAllPlan", CommandType.StoredProcedure);
            SaveMySql(datahavequantity);
            loaddataplan();
        }
        public void SaveMySql(DataTable data)
        {
            using (MySqlConnector.MySqlConnection connection = new MySqlConnector.MySqlConnection(DBConnect.connection_string))
            {
                connection.Open();
                //try
                //{
                var bulkCopy = new MySqlBulkCopy(connection);
                bulkCopy.DestinationTableName = "dataplan";
                var result = bulkCopy.WriteToServer(data);
                //}
                //catch (Exception)
                //{
                //}
                connection.Close();
            }
        }
        private void loaddataplan()
        {
            string HTML = "";
            DBConnect dBConnect = new DBConnect();
            DataTable dt = dBConnect.StoreFillDT("LoadDataPlan", CommandType.StoredProcedure);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["Model"].ToString() != "Total")
                {
                    if (Int32.Parse(dt.Rows[i]["MonitorSpecial"].ToString()) == 0)
                    {
                        HTML += $"<tr> " +
                        $"<td> {dt.Rows[i]["Model"]} </td>" +
                        $"<td> {dt.Rows[i]["QuantityDay"]} </td>" +
                         $"<td> {dt.Rows[i]["Quantity1"]} </td>" +
                          $"<td> {dt.Rows[i]["Quantity2"]} </td>" +
                           $"<td> {dt.Rows[i]["Quantity3"]} </td>" +
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
                       $"<td> {dt.Rows[i]["QuantityDay"]} </td>" +
                        $"<td> {dt.Rows[i]["Quantity1"]} </td>" +
                         $"<td> {dt.Rows[i]["Quantity2"]} </td>" +
                          $"<td> {dt.Rows[i]["Quantity3"]} </td>" +
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