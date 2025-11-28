using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AMRProtocol
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            txb_pathrequest.Text = Program.PathRequest;
            txb_pathresponse.Text = Program.PathResponse;
            fsw_reponse.Path = Program.PathResponse;   
            fsw_reponse.Filter = "*.txt";
            fsw_reponse.IncludeSubdirectories = false;
            fsw_reponse.EnableRaisingEvents = true;
            tmr_request.Interval = int.Parse(Program.IntervalTimer);
            txb_intervaltimer.Text = (int.Parse(Program.IntervalTimer)/1000).ToString() + "s";
            tmr_request.Start();
        }

        private void tmr_request_Tick(object sender, EventArgs e)
        {
            string pathRequestFile = Program.PathRequest + "//Request.txt";
            if (!File.Exists(pathRequestFile))
            {
                try
                {
                    WriteToFile(pathRequestFile, "Tuấn Anh");
                }
                catch (Exception ex)
                {
                    txb_pathrequest.Text = ex.Message;
                }
            }
            else
            {
                txb_pathrequest.Text = "Robot chưa lấy dữ liệu nên không gửi file mới";
            }
        }

        private void fsw_reponse_ChangedAsync(object sender, System.IO.FileSystemEventArgs e)
        {
            string[] content = ReadFileSafely(e.FullPath);
        }

        private void fsw_reponse_CreatedAsync(object sender, System.IO.FileSystemEventArgs e)
        {
            string[] content = ReadFileSafely(e.FullPath);
        }
        private void WriteToFile(string filePath, string data)
        {
            string directory = Path.GetDirectoryName(filePath);
            if (!Directory.Exists(directory))
            {
                Directory.CreateDirectory(directory);
            }
            using (FileStream fileStream = new FileStream(filePath, FileMode.Create, FileAccess.Write,FileShare.ReadWrite))
            {
                using (StreamWriter writer = new StreamWriter(fileStream))
                {
                    writer.Write(data);
                }
            }
        }
        private string[] ReadFileSafely(string path)
        {
            const int maxRetry = 10;
            const int delay = 100;
            for (int i = 0; i < maxRetry; i++)
            {
                try
                {
                    if (File.Exists(path))
                    {
                        return File.ReadAllLines(path);
                    }
                    return null;
                }
                catch (IOException ex)
                {
                    txb_logresponse.Text = ex.Message;
                    Thread.Sleep(delay);
                }
                catch (Exception ex)
                {
                    txb_logresponse.Text = ex.Message;
                }
            }
            return null;
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            tmr_request.Stop();
        }
    }
}
