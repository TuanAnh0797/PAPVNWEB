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
                //cmb_TypePlan.Items.Add("abc");
                //loaddataplan();
                //if (DateTime.Now.Hour > 5)
                //{
                //    datenow = DateTime.Now.ToString("dd/MM/yyyy");
                //}
                //else
                //{
                //    datenow = DateTime.Now.AddDays(-1).ToString("dd/MM/yyyy");
                //}
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

            //Tổng số lượng sản phẩm làm 1 ngày
            int QuantityTotalDay = datarow.Sum(d => d.QuantityDay);
            //Tổng số lượng sản phẩm làm ca 1
            int QuantityTotal1 = datarow.Where(d => d.Quantity1 > 0).Sum(d => d.Quantity1);
            //Tổng số lượng sản phẩm làm ca 2
            int QuantityTotal2 = datarow.Where(d => d.Quantity2 > 0).Sum(d => d.Quantity2);
            //Tổng số lượng sản phẩm làm ca 3
            int QuantityTotal3 = datarow.Where(d => d.Quantity3 > 0).Sum(d => d.Quantity3);


            // Bước 1:

            // lấy thời gian bắt đầu sản xuất
            // 2 ca 10 tiếng
            if (cmb_TypePlan.Value == "Kế hoạch 2 ca")
            {
                if (QuantityTotal1 > 0)
                {
                    TimeStartall = DateTime.Now.ToString("yyyy-MM-dd") + " 12:00:00";
                }
                else
                {
                    TimeStartall = DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00";
                }
                if (QuantityTotal2 > 0)
                {
                    TimeEndall = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") + " 08:00:00";
                }
                else
                {
                    TimeEndall = DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00";
                }
            }
            // 3 ca 8 tiếng
            else
            {
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
            }

            // Bước 2:
            // Tính thời gian làm việc
            TimeSpan subtimeall = DateTime.Parse(TimeEndall) - DateTime.Parse(TimeStartall);
            // Thời gian làm việc theo giây
            double secworkall = subtimeall.TotalSeconds;
            // Trừ thời gian nghỉ và không làm
            // 2 ca
            if (cmb_TypePlan.Value == "Kế hoạch 2 ca")
            {
                for (DateTime currentHour = DateTime.Parse(TimeStartall); currentHour < DateTime.Parse(TimeEndall); currentHour = currentHour.AddHours(1))
                {
                    secworkall = secworkall - Config.TimeRest2Ca[currentHour.Hour] * 60;
                }
            }
            else
            {
                for (DateTime currentHour = DateTime.Parse(TimeStartall); currentHour < DateTime.Parse(TimeEndall); currentHour = currentHour.AddHours(1))
                {
                    secworkall = secworkall - Config.TimeRest[currentHour.Hour] * 60;
                }
            }

            // Cấu hình Cột DataPlan All Day
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
            datahavequantity.Columns.Add("TypePlan", typeof(string));
            // Cấu hình Cột DataPlan ca1
            DataTable datahavequantityca1 = new DataTable();
            datahavequantityca1.Columns.Add("Model", typeof(string));
            datahavequantityca1.Columns.Add("Quantity", typeof(int));
            datahavequantityca1.Columns.Add("QuantityPerSec", typeof(float));
            datahavequantityca1.Columns.Add("TotalTime", typeof(double));
            datahavequantityca1.Columns.Add("TimeStart", typeof(string));
            datahavequantityca1.Columns.Add("TimeEnd", typeof(string));
            datahavequantityca1.Columns.Add("TypePlan", typeof(string));
            // Cấu hình Cột DataPlan ca2
            DataTable datahavequantityca2 = new DataTable();
            datahavequantityca2.Columns.Add("Model", typeof(string));
            datahavequantityca2.Columns.Add("Quantity", typeof(int));
            datahavequantityca2.Columns.Add("QuantityPerSec", typeof(float));
            datahavequantityca2.Columns.Add("TotalTime", typeof(double));
            datahavequantityca2.Columns.Add("TimeStart", typeof(string));
            datahavequantityca2.Columns.Add("TimeEnd", typeof(string));
            datahavequantityca2.Columns.Add("TypePlan", typeof(string));
            // Cấu hình Cột DataPlan ca 3
            DataTable datahavequantityca3 = new DataTable();
            datahavequantityca3.Columns.Add("Model", typeof(string));
            datahavequantityca3.Columns.Add("Quantity", typeof(int));
            datahavequantityca3.Columns.Add("QuantityPerSec", typeof(float));
            datahavequantityca3.Columns.Add("TotalTime", typeof(double));
            datahavequantityca3.Columns.Add("TimeStart", typeof(string));
            datahavequantityca3.Columns.Add("TimeEnd", typeof(string));
            datahavequantityca3.Columns.Add("TypePlan", typeof(string));


            // Bước 3:
            // Thêm dữ liệu vào DataTable

            if (cmb_TypePlan.Value == "Kế hoạch 2 ca")
            {
                // Duyệt từng dữ liệu trong file excel
                foreach (var item in datarow)
                {
                    // Thêm dữ liệu vào bảng kế hoạch cả ngày
                    datahavequantity.Rows.Add(item.Model, item.QuantityDay, item.QuantityDay / secworkall, (item.Quantity1 > 0) ? item.Quantity1 : 0, (item.Quantity2 > 0) ? item.Quantity2 : 0, (item.Quantity3 > 0) ? item.Quantity3 : 0, secworkall, TimeStartall, TimeEndall);
                    // Thêm dữ liệu vào bảng kế hoạch ca 1
                    datahavequantityca1.Rows.Add(item.Model, (item.Quantity1 > 0) ? item.Quantity1 : 0, (item.Quantity1 > 0) ? item.Quantity1 / 32400.0 : 0, 32400, DateTime.Now.ToString("yyyy-MM-dd") + " 12:00:00", DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00");
                    // Thêm dữ liệu vào bảng kế hoạch ca 2
                    datahavequantityca2.Rows.Add(item.Model, (item.Quantity2 > 0) ? item.Quantity2 : 0, (item.Quantity2 > 0) ? item.Quantity2 / 31500.0 : 0, 31500, DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00", DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") + " 08:00:00");
                }
                // Thêm dữ liệu Total vào bảng kế hoạch cả ngày
                datahavequantity.Rows.Add("Total", QuantityTotalDay, QuantityTotalDay / secworkall, QuantityTotal1, QuantityTotal2, QuantityTotal3, secworkall, TimeStartall, TimeEndall);
                // Thêm dữ liệu Total vào bảng kế hoạch ca 1
                datahavequantityca1.Rows.Add("Total", QuantityTotal1, QuantityTotal1 / 32400.0, 32400, DateTime.Now.ToString("yyyy-MM-dd") + " 12:00:00", DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00");
                // Thêm dữ liệu Total vào bảng kế hoạch ca 2
                datahavequantityca2.Rows.Add("Total", QuantityTotal2, QuantityTotal2 / 31500.0, 31500, DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00", DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") + " 08:00:00");
            }
            else
            {
                // Duyệt từng dữ liệu trong file excel
                foreach (var item in datarow)
                {
                    // Thêm dữ liệu vào bảng kế hoạch cả ngày
                    datahavequantity.Rows.Add(item.Model, item.QuantityDay, item.QuantityDay / secworkall, (item.Quantity1 > 0) ? item.Quantity1 : 0, (item.Quantity2 > 0) ? item.Quantity2 : 0, (item.Quantity3 > 0) ? item.Quantity3 : 0, secworkall, TimeStartall, TimeEndall);
                    // Thêm dữ liệu vào bảng kế hoạch ca 1
                    datahavequantityca1.Rows.Add(item.Model, (item.Quantity1 > 0) ? item.Quantity1 : 0, (item.Quantity1 > 0) ? item.Quantity1 / 25500.0 : 0, 25500, DateTime.Now.ToString("yyyy-MM-dd") + " 06:00:00", DateTime.Now.ToString("yyyy-MM-dd") + " 14:00:00");
                    // Thêm dữ liệu vào bảng kế hoạch ca 2
                    datahavequantityca2.Rows.Add(item.Model, (item.Quantity2 > 0) ? item.Quantity2 : 0, (item.Quantity2 > 0) ? item.Quantity2 / 25500.0 : 0, 25500, DateTime.Now.ToString("yyyy-MM-dd") + " 14:00:00", DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00");
                    // Thêm dữ liệu vào bảng kế hoạch ca 3
                    datahavequantityca3.Rows.Add(item.Model, (item.Quantity3 > 0) ? item.Quantity3 : 0, (item.Quantity3 > 0) ? item.Quantity3 / 24300.0 : 0, 24300, DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00", DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") + " 06:00:00");
                }
                // Thêm dữ liệu Total vào bảng kế hoạch cả ngày
                datahavequantity.Rows.Add("Total", QuantityTotalDay, QuantityTotalDay / secworkall, QuantityTotal1, QuantityTotal2, QuantityTotal3, secworkall, TimeStartall, TimeEndall);
                // Thêm dữ liệu Total vào bảng kế hoạch ca 1
                datahavequantityca1.Rows.Add("Total", QuantityTotal1, QuantityTotal1 / 25500.0, 25500, DateTime.Now.ToString("yyyy-MM-dd") + " 06:00:00", DateTime.Now.ToString("yyyy-MM-dd") + " 14:00:00");
                // Thêm dữ liệu Total vào bảng kế hoạch ca 2
                datahavequantityca2.Rows.Add("Total", QuantityTotal2, QuantityTotal2 / 25500.0, 25500, DateTime.Now.ToString("yyyy-MM-dd") + " 14:00:00", DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00");
                // Thêm dữ liệu Total vào bảng kế hoạch ca 3
                datahavequantityca3.Rows.Add("Total", QuantityTotal3, QuantityTotal3 / 24300.0, 24300, DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00", DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") + " 06:00:00");
            }
            // Đẩy dữ liệu lên server
            DBConnect dBConnect = new DBConnect();
            // Xóa kế hoạch cũ
            dBConnect.exnonquery("TA_ClearAllPlan", CommandType.StoredProcedure);
            // Đẩy kế hoạch mới
            SaveMySql(datahavequantity, datahavequantityca1, datahavequantityca2, datahavequantityca3);
            // tải lại kế hoạch mới
            loaddataplan();
        }
        public void SaveMySql(DataTable data, DataTable dataca1, DataTable dataca2, DataTable dataca3)
        {
            using (MySqlConnector.MySqlConnection connection = new MySqlConnector.MySqlConnection(DBConnect.connection_string))
            {
                connection.Open();

                try
                {
                    var bulkCopy = new MySqlBulkCopy(connection);
                    bulkCopy.DestinationTableName = "dataplan";
                    var result = bulkCopy.WriteToServer(data);
                    bulkCopy.DestinationTableName = "dataplanca1";
                    var resultca1 = bulkCopy.WriteToServer(dataca1);
                    bulkCopy.DestinationTableName = "dataplanca2";
                    var resultca2 = bulkCopy.WriteToServer(dataca2);
                    bulkCopy.DestinationTableName = "dataplanca3";
                    var resultca3 = bulkCopy.WriteToServer(dataca3);
                }
                catch (Exception ex)
                {

                }
                connection.Close();
            }
        }
        private void loaddataplan()
        {
            string HTML = "";
            DBConnect dBConnect = new DBConnect();
            DataTable dt = dBConnect.StoreFillDT("TA_LoadDataPlan", CommandType.StoredProcedure);
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