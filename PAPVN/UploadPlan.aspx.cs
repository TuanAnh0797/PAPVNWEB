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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loaddataplan();
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
            string connectionString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={filePath};Extended Properties=\"Excel 12.0 Xml;HDR=YES;IMEX=1;\"";

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                connection.Open();

                // Lấy tên các sheet trong file Excel
                DataTable dtSheet = connection.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                if (dtSheet != null)
                {
                    //foreach (DataRow row in dtSheet.Rows)
                    //{
                    //    string sheetName = row["TABLE_NAME"].ToString();

                    // Đọc dữ liệu từ mỗi sheet
                    string query = $"SELECT * FROM [Daily revise(3S)_Final$]";

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

        private void GetDataPlan(DataTable dt)
        {
            //TimeSpan subtime = DateTime.Parse(dateto.Value) - DateTime.Parse(datefrom.Value);
            //double timesec = subtime.TotalSeconds;
            string TimeStart;
            string TimeEnd;
            int indexcolumn = (DateTime.Now.Day - 1) * 5 + 18;
            var datarow = from row in dt.AsEnumerable()
                          where row.Table.Rows.IndexOf(row) > 10 && row[indexcolumn].ToString() != "" && !row[indexcolumn].ToString().Contains("-") && row[indexcolumn].ToString() != "0" && Int32.TryParse(row[indexcolumn].ToString(), out int rs) && row[0].ToString().Contains("NR-") && row[11].ToString().Contains("Plan")
                          select new
                          {
                              Model = row[0].ToString(),
                              QuantityDay = Int32.Parse(row[indexcolumn].ToString()),
                              //QuantityPerSec = Int32.Parse(row[indexcolumn].ToString()) / timesec,
                              Quantity1 = Int32.TryParse(row[indexcolumn + 2].ToString(), out int rs) ? Int32.Parse(row[indexcolumn + 2].ToString()) : 0,
                              Quantity2 = Int32.TryParse(row[indexcolumn + 3].ToString(), out int rs1) ? Int32.Parse(row[indexcolumn + 3].ToString()) : 0,
                              Quantity3 = Int32.TryParse(row[indexcolumn + 4].ToString(), out int rs2) ? Int32.Parse(row[indexcolumn + 4].ToString()) : 0,
                              //TotalTime = timesec,
                              //TimeStart = datefrom.Value,
                              //TimeEnd = dateto.Value
                          };


            int QuantityTotalDay = datarow.Sum(d => d.QuantityDay);
            int QuantityTotal1 = datarow.Sum(d => d.Quantity1);
            int QuantityTotal2 = datarow.Sum(d => d.Quantity2);
            int QuantityTotal3 = datarow.Sum(d => d.Quantity3);

            if (QuantityTotal1 > 0)
            {
               
                    TimeStart = DateTime.Now.ToString("yyyy-MM-dd") + " 06:00:00";
               

            }
            else if (QuantityTotal2 > 0)
            {
               
                    TimeStart = DateTime.Now.ToString("yyyy-MM-dd") + " 14:00:00";

            }
            else
            {
               
                    TimeStart = DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00";
               

            }
            if (QuantityTotal3 > 0)
            {

                    TimeEnd = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") + " 06:00:00";
               
            }
            else if (QuantityTotal2 > 0)
            {

              
                    TimeEnd = DateTime.Now.ToString("yyyy-MM-dd") + " 22:00:00";
               
            }
            else
            {

                    TimeEnd = DateTime.Now.ToString("yyyy-MM-dd") + " 14:00:00";
              
            }
            TimeSpan subtime = DateTime.Parse(TimeEnd) - DateTime.Parse(TimeStart);

            double secwork;
            // Làm ca1 đến ca 3 
            if (QuantityTotal1 > 0 && QuantityTotal3 > 0)
            {
                secwork = subtime.TotalSeconds;
            }
            //làm ca 1 đến hết ca 2
            else if (QuantityTotal1 > 0 && QuantityTotal2 > 0)
            {
                secwork = subtime.TotalSeconds;
            }
            // chỉ làm ca 1
            else if (QuantityTotal1 > 0)
            {
                secwork = subtime.TotalSeconds;
            }
            // làm ca 2 đến ca 3
            else if (QuantityTotal2 > 0 && QuantityTotal3 > 0)
            {
                secwork = subtime.TotalSeconds;
            }
            // chỉ làm ca 2
            else if (QuantityTotal2 > 0)
            {
                secwork = subtime.TotalSeconds;
            }
            // chỉ làm ca 3
            else
            {
                secwork = subtime.TotalSeconds;
            }

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
                // datahavequantity.Rows.Add(item.Model, item.QuantityDay, item.QuantityPerSec,item.TotalTime,item.TimeStart,item.TimeEnd);
                datahavequantity.Rows.Add(item.Model, item.QuantityDay, item.QuantityDay / secwork,
                    item.Quantity1, item.Quantity2, item.Quantity3, secwork, TimeStart, TimeEnd);
            }
            datahavequantity.Rows.Add("Total", QuantityTotalDay, QuantityTotalDay / secwork, QuantityTotal1, QuantityTotal2, QuantityTotal3, secwork, TimeStart, TimeEnd);
            DBConnect.exnonquery("ClearAllPlan", CommandType.StoredProcedure);
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
            DataTable dt = DBConnect.StoreFillDT("LoadDataPlan", CommandType.StoredProcedure);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                HTML += $"<tr> " +
                     $"<td> {dt.Rows[i]["Model"]} </td>" +
                     $"<td> {dt.Rows[i]["QuantityDay"]} </td>" +
                      $"<td> {dt.Rows[i]["Quantity1"]} </td>" +
                       $"<td> {dt.Rows[i]["Quantity2"]} </td>" +
                        $"<td> {dt.Rows[i]["Quantity3"]} </td>" +
                     $"<td> {dt.Rows[i]["TimeStart"]} </td>" +
                      $"<td> {dt.Rows[i]["TimeEnd"]} </td>" +
                     $"</tr>";
            }
            dt_plan.InnerHtml = HTML;

        }
    }

}