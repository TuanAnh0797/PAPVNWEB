//using MySql.Data.MySqlClient;
using MySqlConnector;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
//using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace InsertToSql
{
    public partial class Form1 : Form
    {
        //ReadWriteCsv csv_VP = new ReadWriteCsv();
        //ReadWriteCsv csv_GAS = new ReadWriteCsv();
        //ReadWriteCsv csv_WI1WITH = new ReadWriteCsv();
        //ReadWriteCsv csv_WI1START = new ReadWriteCsv();
        //ReadWriteCsv csv_IP = new ReadWriteCsv();
        //ReadWriteCsv csv_DF = new ReadWriteCsv();
        //ReadWriteCsv csv_TEMP = new ReadWriteCsv();
        //ReadWriteCsv csv_IOT = new ReadWriteCsv();
        //ReadWriteCsv csv_PAN = new ReadWriteCsv();
        //ReadWriteCsv csv_CAMBACK = new ReadWriteCsv();
        //ReadWriteCsv csv_CAMFRONT = new ReadWriteCsv();
        bool is_VP_run = false;
        bool is_GAS_run = false;
        bool is_WI1WITH_run = false;
        bool is_WI1START_run = false;
        bool is_IP_run = false;
        bool is_DF_run = false;
        bool is_WI2_run = false;
        bool is_PAN_run = false;
        bool is_TEMP_run = false;
        bool is_IOT_run = false;
        bool is_CAMBACK_run = false;
        bool is_CAMFRONT_run = false;
        bool is_PCM_run = false;
        bool is_StatusPCM_run = false;


        static Config myconfig;
        static string currentdirec = "";

        public Form1()
        {
            InitializeComponent();
            try
            {
                currentdirec = Directory.GetCurrentDirectory();
                string fileconfig = currentdirec + "\\config.json";
                string contentconfig = "";
                using (FileStream fs = new FileStream(fileconfig, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
                {
                    using (StreamReader sr = new StreamReader(fs, Encoding.UTF8))
                    {
                        contentconfig = sr.ReadToEnd();
                    }
                }
                myconfig = JsonConvert.DeserializeObject<Config>(contentconfig);
                InnitWatchFile();

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }

        }
        public void InnitWatchFile()
        {
            if (myconfig.StartCheck.ToUpper() != "STOP")
            {
                //1.VP
                Time_VP.Start();
                //2.GAS
                Timer_GAS.Start();
                //3.WI1WITH
                Timer_WI1WITH.Start();
                //4.WITH1START
                Timer_WI1START.Start();
                //5.IP
                Timer_IP.Start();
                //6.DF
                Timer_DF.Start();
                //7.TEMP
                //8.IOT
                Timer_IOT.Start();
                //9.WI2
                Timer_WI2.Start();
                //10.PAN
                Timer_PAN.Start();
                //11.CAMBACK
                Timer_CAMBACK.Start();
                //12.CAMFRONT
                Timer_CAMFRONT.Start();
                //13.PCM
                Timer_PCM.Start();
                //14.StatusPCM
                Timer_StatusPCM.Start();
            }
        }
        // Coppy File Local
        public void CoppyFile(string historyfolder, string sourcefile, string namefile)
        {
            string strdate = DateTime.Now.ToString("ddMMyyyy");
            if (Directory.Exists(historyfolder + "\\" + strdate))
            {
                File.Copy(sourcefile, historyfolder + "\\" + strdate + "\\" + namefile, true);
            }
            else
            {
                Directory.CreateDirectory(historyfolder + "\\" + strdate);
                File.Copy(sourcefile, historyfolder + "\\" + strdate + "\\" + namefile, true);
            }

        }
        // Coppy File Share
        //public void CoppyFileShare(string historyfolder, string sourcefile, string namefile, string username, string password)
        //{
        //    string strdate = DateTime.Now.ToString("ddMMyyyy");
        //    if (Directory.Exists(historyfolder + "\\" + strdate))
        //    {
        //        using (new NetworkConnection(sourcefile, new System.Net.NetworkCredential(username, password)))
        //        {
        //            // Sao chép file từ chia sẻ mạng vào máy local
        //            File.Copy(sourcefile, historyfolder + "\\" + strdate + "\\" + namefile, true);
        //        }

        //    }
        //    else
        //    {
        //        Directory.CreateDirectory(historyfolder + "\\" + strdate);
        //        using (new NetworkConnection(sourcefile, new System.Net.NetworkCredential(username, password)))
        //        {
        //            // Sao chép file từ chia sẻ mạng vào máy local
        //            File.Copy(sourcefile, historyfolder + "\\" + strdate + "\\" + namefile, true);
        //        }
        //    }

        //}

        // ReadFile
        public List<string> ReadFile(string FilePath, int skipline)
        {
            List<string> datacsv = new List<string>();
            using (FileStream fs = new FileStream(FilePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
            {
                using (StreamReader sr = new StreamReader(fs, Encoding.UTF8))
                {
                    while (!sr.EndOfStream)
                    {
                        datacsv.Add(sr.ReadLine());
                    }
                }
                if (datacsv.Count >= skipline)
                {
                    for (int i = 0; i < skipline; i++)
                    {
                        datacsv.RemoveAt(0);
                    }
                }
            }
            return datacsv;
        }
        // ReadFileShare
        public List<string> ReadFileShare(string FilePath, int skipline)
        {
            List<string> datacsv = new List<string>();
            //System.Net.NetworkCredential networkCredential = new System.Net.NetworkCredential(username, password);
            //Uri fileUri = new Uri(FilePath);
            //System.Net.CredentialCache credentialCache = new System.Net.CredentialCache();
            //credentialCache.Add(fileUri, "Basic", networkCredential);

            using (FileStream fs = new FileStream(FilePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
            {
                using (StreamReader sr = new StreamReader(fs, Encoding.UTF8))
                {
                    while (!sr.EndOfStream)
                    {
                        datacsv.Add(sr.ReadLine());
                    }
                }
                if (datacsv.Count >= skipline)
                {
                    for (int i = 0; i < skipline; i++)
                    {
                        datacsv.RemoveAt(0);
                    }
                }
            }
            return datacsv;
        }

        // Convert CSV to Datatable File PLC
        public DataTable ConvertListToDatatable(List<string> datacsv, int numbercolumn, string FileLog)
        {
            DataTable dt = new DataTable();
            if (datacsv.Count > 0)
            {
                //int numbercolumn = datacsv[0].Split(',').Length;
                for (int i = 0; i < numbercolumn; i++)
                {
                    dt.Columns.Add();
                }
                foreach (string datacsvrow in datacsv)
                {
                    try
                    {
                        DataRow dr = dt.NewRow();
                        string[] datarowarray = datacsvrow.Split(',');
                        List<string> datarow = new List<string>();
                        datarow.AddRange(datarowarray);
                        if (datarow.Count < numbercolumn)
                        {
                            for (int i = 0; i < numbercolumn - datarow.Count; i++)
                            {
                                datarow.Add(" ");
                            }
                        }
                        for (int i = 0; i < numbercolumn; i++)
                        {
                            if (i == 0)
                            {
                                dr[i] = datarow[i].Replace('/', '-').Trim();
                            }
                            else if (i == 1 && datarow[i].Length > 19)
                            {
                                dr[i] = datarow[i].Substring(0, 19);
                            }
                            else if (i == 4 && datarow[i].Length > 2)
                            {
                                dr[i] = datarow[i].Substring(0, 2);
                            }
                            else
                            {
                                dr[i] = datarow[i].Trim();
                            }

                        }
                        dt.Rows.Add(dr);
                    }
                    catch (Exception ex)
                    {
                        SaveLog(currentdirec + $"\\Log\\{FileLog}", datacsvrow + ": " + ex.Message);
                        continue;
                    }
                }
            }
            return dt;
        }
        // Convert CSV to Datatable File CAM
        public DataTable ConvertListToDatatableCameraChecker(List<string> datacsv, int numbercolumn, string FileLog)
        {
            DataTable dt = new DataTable();
            if (datacsv.Count > 0)
            {
                for (int i = 0; i < numbercolumn; i++)
                {
                    dt.Columns.Add();
                }
                foreach (string datacsvrow in datacsv)
                {
                    try
                    {
                        DataRow dr = dt.NewRow();
                        string[] datarowarray = datacsvrow.Split(',');
                        List<string> datarow = new List<string>();
                        datarow.AddRange(datarowarray);
                        if (datarow.Count < numbercolumn)
                        {
                            for (int i = 0; i < numbercolumn - datarow.Count; i++)
                            {
                                datarow.Add(" ");
                            }
                        }
                        for (int i = 0; i < numbercolumn; i++)
                        {
                            if (i == 0)
                            {
                                string strdate = datarow[i].Substring(0, 10).Trim().Replace('_', '-');
                                string strtime = datarow[i].Substring(11, 8).Trim().Replace('_', ':');
                                dr[i] = strdate + " " + strtime;
                            }
                            else if (i == 1)
                            {
                                dr[i] = datarow[i] + datarow[2];
                               
                            }
                            else if (i == 2)
                            {
                                dr[i] = datarow[i-1];

                            }
                            else if (i == 4)
                            {
                                dr[i] = dr[i-1].ToString() == "1" ? "NG" : "OK";
                            }
                            else
                            {
                                dr[i] = datarow[i-1].Trim();
                            }

                        }
                        dt.Rows.Add(dr);
                    }
                    catch (Exception ex)
                    {
                        SaveLog(currentdirec + $"\\Log\\{FileLog}", datacsvrow + ": " + ex.Message);
                        continue;
                    }
                }
            }
            return dt;
        }


        // Rename
        public void RenameFile(string filepath, string newname)
        {
            string newFilePath = Path.Combine(Path.GetDirectoryName(filepath), newname);
            File.Move(filepath, newFilePath);
        }
        // Save SQL
        //public void SaveSql(string nametable, DataTable data)
        //{
        //    using (SqlConnection connection = new SqlConnection(myconfig.ConnectionString))
        //    {
        //        connection.Open();
        //        using (SqlBulkCopy bulkCopy = new SqlBulkCopy(connection))
        //        {
        //            bulkCopy.DestinationTableName = nametable;
        //            bulkCopy.WriteToServer(data);
        //        }
        //        connection.Close();
        //    }
        //}

        //SaveMySQL
        public void  SaveMySql(string nametable, DataTable data)
        {
            
            
            using (MySqlConnection connection = new MySqlConnection(myconfig.ConnectionString))
            {
                connection.Open();
                var bulkCopy = new MySqlBulkCopy(connection);
                bulkCopy.DestinationTableName = nametable;
                var result =  bulkCopy.WriteToServer(data);
                connection.Close();
            }
        }
        // Save ERROR LOG
        public void SaveLog(string filepath, string content)
        {
            using (StreamWriter sw = new StreamWriter(filepath, true, Encoding.UTF8))
            {
                string datetimenow = DateTime.Now.ToString("HH:mm:ss dd/MM/yyyy");
                sw.WriteLine(datetimenow + ": " + content);
            }
        }

        // Main Method Local
        public async Task GetAllFile(string pathfolder, string nametable, string HistoryFoler, string FileLog, int numbercolumn)
        {
            try
            {
                await Task.Factory.StartNew(() =>
                {
                    foreach (string filePath in Directory.EnumerateFiles(pathfolder, "*.csv", SearchOption.AllDirectories))
                    {
                        try
                        {
                            List<string> datacsv = ReadFile(filePath, 3);
                            DataTable data = ConvertListToDatatable(datacsv, numbercolumn, FileLog);
                            SaveMySql(nametable, data);
                            CoppyFile(HistoryFoler, filePath, Path.GetFileName(filePath));
                            File.Delete(filePath);
                        }
                        catch (Exception ex)
                        {
                            SaveLog(currentdirec + $"\\Log\\{FileLog}", filePath + ": " + ex.Message);
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                SaveLog(currentdirec + $"\\Log\\{FileLog}", ex.Message);
            }
        }
        // Main Method ShareFile
        public async Task GetAllFileShareCameraChecker(string pathfolder, string nametable, string HistoryFoler, string FileLog, int numbercolumn, string username, string password)
        {
            try
            {
                await Task.Factory.StartNew(() =>
                {
                    foreach (string filePath in Directory.EnumerateFiles(pathfolder, "*.csv", SearchOption.AllDirectories))
                    {
                        try
                        {
                            List<string> datacsv = ReadFile(filePath, 1);
                            DataTable data = ConvertListToDatatableCameraChecker(datacsv, numbercolumn, FileLog);
                            SaveMySql(nametable, data);
                            CoppyFile(HistoryFoler, filePath, Path.GetFileName(filePath));
                            File.Delete(filePath);
                        }
                        catch (Exception ex)
                        {
                            SaveLog(currentdirec + $"\\Log\\{FileLog}", filePath + ": " + ex.Message);
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                SaveLog(currentdirec + $"\\Log\\{FileLog}", ex.Message);
            }
        }

        private async void Time_VP_Tick(object sender, EventArgs e)
        {
            if (!is_VP_run)
            {
                lbl_vp?.Invoke(new Action(() =>
                {
                    lbl_vp.Text = "Đang đẩy dữ liệu";
                }));
                is_VP_run = true;
                string logfile = "VP_" + DateTime.Now.ToString("ddMMyyyy") + ".txt";
                await GetAllFile(myconfig.WatchFolder.VP, myconfig.NameTable.VP, currentdirec + "\\History\\" + myconfig.HistoryFolder.VP, logfile, myconfig.QuantityColumn.VP);
                is_VP_run = false;
                lbl_vp?.Invoke(new Action(() =>
                {
                    lbl_vp.Text = "Đang chờ dữ liệu";
                }));
            }
        }

        private async void Timer_GAS_Tick(object sender, EventArgs e)
        {
            if (!is_GAS_run)
            {
                lbl_gas?.Invoke(new Action(() =>
                {
                    lbl_gas.Text = "Đang đẩy dữ liệu";
                }));
                is_GAS_run = true;
                string logfilegas1 = "GAS1_" + DateTime.Now.ToString("ddMMyyyy") + ".txt";
                string logfilegas2 = "GAS2_" + DateTime.Now.ToString("ddMMyyyy") + ".txt";
                await GetAllFile(myconfig.WatchFolder.GAS1, myconfig.NameTable.GAS, currentdirec + "\\History\\" + myconfig.HistoryFolder.GAS1, logfilegas1, myconfig.QuantityColumn.GAS);
                await Task.Delay(500);
                await GetAllFile(myconfig.WatchFolder.GAS2, myconfig.NameTable.GAS, currentdirec + "\\History\\" + myconfig.HistoryFolder.GAS2, logfilegas2, myconfig.QuantityColumn.GAS);
                is_GAS_run = false;
                lbl_gas?.Invoke(new Action(() =>
                {
                    lbl_gas.Text = "Đang chờ dữ liệu";
                }));
            }
        }

        private async void Timer_WI1WITH_Tick(object sender, EventArgs e)
        {
            if (!is_WI1WITH_run)
            {
                lbl_WI1WITH?.Invoke(new Action(() =>
                {
                    lbl_WI1WITH.Text = "Đang đẩy dữ liệu";
                }));
                is_WI1WITH_run = true;
                string logfile = "WI1WITH_" + DateTime.Now.ToString("ddMMyyyy") + ".txt";
                await GetAllFile(myconfig.WatchFolder.WI1WITH, myconfig.NameTable.WI1WITH, currentdirec + "\\History\\" + myconfig.HistoryFolder.WI1WITH, logfile, myconfig.QuantityColumn.WI1WITH);
                is_WI1WITH_run = false;
                lbl_WI1WITH?.Invoke(new Action(() =>
                {
                    lbl_WI1WITH.Text = "Đang chờ dữ liệu";
                }));
            }
        }

        private async void Timer_WI1START_Tick(object sender, EventArgs e)
        {
            if (!is_WI1START_run)
            {
                lbl_WI1START?.Invoke(new Action(() =>
                {
                    lbl_WI1START.Text = "Đang đẩy dữ liệu";
                }));
                is_WI1START_run = true;
                string logfile = "WI1START_" + DateTime.Now.ToString("ddMMyyyy") + ".txt";
                await GetAllFile(myconfig.WatchFolder.WI1START, myconfig.NameTable.WI1START, currentdirec + "\\History\\" + myconfig.HistoryFolder.WI1START, logfile, myconfig.QuantityColumn.WI1START);
                is_WI1START_run = false;
                lbl_WI1START?.Invoke(new Action(() =>
                {
                    lbl_WI1START.Text = "Đang chờ dữ liệu";
                }));
            }
        }

        private async void Timer_IP_Tick(object sender, EventArgs e)
        {
            if (!is_IP_run)
            {
                lbl_IP?.Invoke(new Action(() =>
                {
                    lbl_IP.Text = "Đang đẩy dữ liệu";
                }));
                is_IP_run = true;
                string logfile = "IP_" + DateTime.Now.ToString("ddMMyyyy") + ".txt";
                await GetAllFile(myconfig.WatchFolder.IP, myconfig.NameTable.IP, currentdirec + "\\History\\" + myconfig.HistoryFolder.IP, logfile, myconfig.QuantityColumn.IP);
                is_IP_run = false;
                lbl_IP?.Invoke(new Action(() =>
                {
                    lbl_IP.Text = "Đang chờ dữ liệu";
                }));
            }
        }

        private async void Timer_DF_Tick(object sender, EventArgs e)
        {
            if (!is_DF_run)
            {
                lbl_DF?.Invoke(new Action(() =>
                {
                    lbl_DF.Text = "Đang đẩy dữ liệu";
                }));
                is_DF_run = true;
                string logfile = "DF_" + DateTime.Now.ToString("ddMMyyyy") + ".txt";
                await GetAllFile(myconfig.WatchFolder.DF, myconfig.NameTable.DF, currentdirec + "\\History\\" + myconfig.HistoryFolder.DF, logfile, myconfig.QuantityColumn.DF);
                is_DF_run = false;
                lbl_DF?.Invoke(new Action(() =>
                {
                    lbl_DF.Text = "Đang chờ dữ liệu";
                }));
            }
        }

        private async void Timer_WI2_Tick(object sender, EventArgs e)
        {
            if (!is_WI2_run)
            {
                lbl_WI2?.Invoke(new Action(() =>
                {
                    lbl_WI2.Text = "Đang đẩy dữ liệu";
                }));
                is_WI2_run = true;
                string logfile = "WI2_" + DateTime.Now.ToString("ddMMyyyy") + ".txt";
                await GetAllFile(myconfig.WatchFolder.WI2, myconfig.NameTable.WI2, currentdirec + "\\History\\" + myconfig.HistoryFolder.WI2, logfile, myconfig.QuantityColumn.WI2);
                is_WI2_run = false;
                lbl_WI2?.Invoke(new Action(() =>
                {
                    lbl_WI2.Text = "Đang chờ dữ liệu";
                }));
            }
        }

        private async void Timer_PAN_Tick(object sender, EventArgs e)
        {
            if (!is_PAN_run)
            {
                lbl_PAN?.Invoke(new Action(() =>
                {
                    lbl_PAN.Text = "Đang đẩy dữ liệu";
                }));
                is_PAN_run = true;
                string logfile = "PAN_" + DateTime.Now.ToString("ddMMyyyy") + ".txt";
                await GetAllFile(myconfig.WatchFolder.PAN, myconfig.NameTable.PAN, currentdirec + "\\History\\" + myconfig.HistoryFolder.PAN, logfile, myconfig.QuantityColumn.PAN);
                is_PAN_run = false;
                lbl_PAN?.Invoke(new Action(() =>
                {
                    lbl_PAN.Text = "Đang chờ dữ liệu";
                }));
            }
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Bạn chắc chắn muốn tắt chương trình?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.No)
            {
                e.Cancel = true;
            }

        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            //1.VP
            Time_VP.Stop();
            //2.GAS
            Timer_GAS.Stop();
            //3.WI1WITH
            Timer_WI1WITH.Stop();
            //4.WITH1START
            Timer_WI1START.Stop();
            //5.IP
            Timer_IP.Stop();
            //6.DF
            Timer_DF.Stop();
            //7.TEMP
            Timer_TEMP.Stop();
            //8.IOT
            Timer_IOT.Stop();
            //9.WI2
            Timer_WI2.Stop();
            //10.PAN
            Timer_PAN.Stop();
            //11.CAMBACK
            Timer_CAMBACK.Stop();
            //12.CAMFRONT
            Timer_CAMFRONT.Stop();
            //13.PCM
            Timer_PCM.Stop();
            //14.StatusPCM
            Timer_StatusPCM.Stop();

        }

        private void btn_log_Click(object sender, EventArgs e)
        {
            Process.Start("explorer.exe", currentdirec + "\\Log");
        }

        private void btn_his_Click(object sender, EventArgs e)
        {
            Process.Start("explorer.exe", currentdirec + "\\History");
        }

        private void Timer_IOT_Tick(object sender, EventArgs e)
        {

        }

        private void Timer_TEMP_Tick(object sender, EventArgs e)
        {

        }

        private async void Timer_CAMBACK_Tick(object sender, EventArgs e)
        {
            if (!is_CAMBACK_run)
            {
                lbl_CAMBACK?.Invoke(new Action(() =>
                {
                    lbl_CAMBACK.Text = "Đang đẩy dữ liệu";
                }));
                is_CAMBACK_run = true;
                string logfile = "CAMBACK_" + DateTime.Now.ToString("ddMMyyyy") + ".txt";
                await GetAllFileShareCameraChecker(myconfig.WatchFolder.CAMBACK, myconfig.NameTable.CAMBACK, currentdirec + "\\History\\" + myconfig.HistoryFolder.CAMBACK, logfile, myconfig.QuantityColumn.CAMBACK, myconfig.ShareFile.CAMBACK.UserName, myconfig.ShareFile.CAMBACK.PassWord);
                is_CAMBACK_run = false;
                lbl_CAMBACK?.Invoke(new Action(() =>
                {
                    lbl_CAMBACK.Text = "Đang chờ dữ liệu";
                }));
            }
        }

        private async void Timer_CAMFRONT_Tick(object sender, EventArgs e)
        {
            if (!is_CAMFRONT_run)
            {
                lbl_CAMFRONT?.Invoke(new Action(() =>
                {
                    lbl_CAMFRONT.Text = "Đang đẩy dữ liệu";
                }));
                is_CAMFRONT_run = true;
                string logfile = "CAMFront_" + DateTime.Now.ToString("ddMMyyyy") + ".txt";
                await GetAllFileShareCameraChecker(myconfig.WatchFolder.CAMFRONT, myconfig.NameTable.CAMFRONT, currentdirec + "\\History\\" + myconfig.HistoryFolder.CAMFRONT, logfile, myconfig.QuantityColumn.CAMFRONT, myconfig.ShareFile.CAMFRONT.UserName, myconfig.ShareFile.CAMFRONT.PassWord);
                is_CAMFRONT_run = false;
                lbl_CAMFRONT?.Invoke(new Action(() =>
                {
                    lbl_CAMFRONT.Text = "Đang chờ dữ liệu";
                }));
            }
        }

        public async Task GetAllFileV2(string pathfolder, string nametable, string HistoryFoler, string FileLog, int numbercolumn)
        {
            try
            {
                await Task.Factory.StartNew(() =>
                {
                    foreach (string filePath in Directory.EnumerateFiles(pathfolder, "*.csv", SearchOption.AllDirectories))
                    {
                        try
                        {
                            List<string> datacsv = ReadFile(filePath, 3);
                            DataTable data = ConvertListToDatatableV2(datacsv, numbercolumn, FileLog);
                            SaveMySql(nametable, data);
                            CoppyFile(HistoryFoler, filePath, Path.GetFileName(filePath));
                            File.Delete(filePath);
                        }
                        catch (Exception ex)
                        {
                            SaveLog(currentdirec + $"\\Log\\{FileLog}", filePath + ": " + ex.Message);
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                SaveLog(currentdirec + $"\\Log\\{FileLog}", ex.Message);
            }
        }
        public DataTable ConvertListToDatatableV2(List<string> datacsv, int numbercolumn, string FileLog)
        {
            DataTable dt = new DataTable();
            if (datacsv.Count > 0)
            {
                //int numbercolumn = datacsv[0].Split(',').Length;
                for (int i = 0; i < numbercolumn; i++)
                {
                    dt.Columns.Add();
                }
                foreach (string datacsvrow in datacsv)
                {
                    try
                    {
                        DataRow dr = dt.NewRow();
                        string[] datarowarray = datacsvrow.Split(',');
                        List<string> datarow = new List<string>();
                        datarow.AddRange(datarowarray);
                        if (datarow.Count < numbercolumn)
                        {
                            for (int i = 0; i < numbercolumn - datarow.Count; i++)
                            {
                                datarow.Add(" ");
                            }
                        }
                        for (int i = 0; i < numbercolumn; i++)
                        {
                            if (i == 0)
                            {
                                dr[i] = datarow[i].Replace('/', '-').Trim();
                            }
                            else if (i == 1)
                            {
                                dr[i] = datarow[i].Split('-')[2];
                                dr[i+1] = datarow[i].Trim();
                            }
                            else if (i == 2)
                            {
                                continue; // Bỏ qua cột thứ 2
                            }
                            else
                            {
                                dr[i] = datarow[i].Trim();
                            }

                        }
                        dt.Rows.Add(dr);
                    }
                    catch (Exception ex)
                    {
                        SaveLog(currentdirec + $"\\Log\\{FileLog}", datacsvrow + ": " + ex.Message);
                        continue;
                    }
                }
            }
            return dt;
        }


        private async void Timer_PCM_Tick(object sender, EventArgs e)
        {
            if (!is_PCM_run)
            {
                lbl_PCM?.Invoke(new Action(() =>
                {
                    lbl_PCM.Text = "Đang đẩy dữ liệu";
                }));
                is_PCM_run = true;
                string logfile = "PCM_" + DateTime.Now.ToString("ddMMyyyy") + ".txt";
                await GetAllFileV2(myconfig.WatchFolder.PCM, myconfig.NameTable.PCM, currentdirec + "\\History\\" + myconfig.HistoryFolder.PCM, logfile, myconfig.QuantityColumn.PCM);
                is_PCM_run = false;
                lbl_PCM?.Invoke(new Action(() =>
                {
                    lbl_PCM.Text = "Đang chờ dữ liệu";
                }));
            }
        }
        public async Task GetAllFileV3(string pathfolder, string nametable, string HistoryFoler, string FileLog, int numbercolumn)
        {
            try
            {
                await Task.Factory.StartNew(() =>
                {
                    foreach (string filePath in Directory.EnumerateFiles(pathfolder, "*.csv", SearchOption.AllDirectories))
                    {
                        try
                        {
                            List<string> datacsv = ReadFile(filePath, 3);
                            DataTable data = ConvertListToDatatableV3(datacsv, numbercolumn, FileLog);
                            SaveMySql(nametable, data);
                            CoppyFile(HistoryFoler, filePath, Path.GetFileName(filePath));
                            File.Delete(filePath);
                        }
                        catch (Exception ex)
                        {
                            SaveLog(currentdirec + $"\\Log\\{FileLog}", filePath + ": " + ex.Message);
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                SaveLog(currentdirec + $"\\Log\\{FileLog}", ex.Message);
            }
        }
        public DataTable ConvertListToDatatableV3(List<string> datacsv, int numbercolumn, string FileLog)
        {
            DataTable dt = new DataTable();
            if (datacsv.Count > 0)
            {
                //int numbercolumn = datacsv[0].Split(',').Length;
                for (int i = 0; i < numbercolumn; i++)
                {
                    dt.Columns.Add();
                }
                foreach (string datacsvrow in datacsv)
                {
                    try
                    {
                        DataRow dr = dt.NewRow();
                        string[] datarowarray = datacsvrow.Split(',');
                        List<string> datarow = new List<string>();
                        datarow.AddRange(datarowarray);
                        if (datarow.Count < numbercolumn)
                        {
                            for (int i = 0; i < numbercolumn - datarow.Count; i++)
                            {
                                datarow.Add(" ");
                            }
                        }
                        for (int i = 0; i < numbercolumn; i++)
                        {
                            if (i == 0)
                            {
                                dr[i] = datarow[i].Replace('/', '-').Trim();
                            }
                            else if (i == 1)
                            {
                                dr[i] = "PCM";
                               
                            }
                           
                            else
                            {
                                dr[i] = datarow[i].Trim();
                            }

                        }
                        dt.Rows.Add(dr);
                    }
                    catch (Exception ex)
                    {
                        SaveLog(currentdirec + $"\\Log\\{FileLog}", datacsvrow + ": " + ex.Message);
                        continue;
                    }
                }
            }
            return dt;
        }

        private void Timer_StatusPCM_Tick(object sender, EventArgs e)
        {

        }
    }
}
