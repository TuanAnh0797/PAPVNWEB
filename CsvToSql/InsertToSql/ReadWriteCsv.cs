using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsertToSql
{
    public class ReadWriteCsv
    {
        public List<string> ReadFile(string FilePath, int skipline )
        {
            List<string> datacsv = new List<string>();
            using (FileStream fs = new FileStream(FilePath,FileMode.Open,FileAccess.Read,FileShare.ReadWrite))
            {
                using (StreamReader sr = new StreamReader(fs, Encoding.UTF8))
                {
                    while (!sr.EndOfStream)
                    {
                        datacsv.Add(sr.ReadLine());
                    }
                }
            }
            for (int i = 0; i < skipline; i++)
            {
                datacsv.RemoveAt(i);
            }
            return datacsv;
        }
        public DataTable ConvertListToDatatable(List<string> datacsv)
        {
            DataTable dt = new DataTable();
            int numbercolumn = datacsv[0].Split(',').Length;
            for (int i = 0; i < numbercolumn; i++)
            {
                dt.Columns.Add();
            }
            foreach (string datacsvrow in datacsv)
            {
                DataRow dr = dt.NewRow();
                string[] datarow = datacsvrow.Split(',');
                for (int i = 0; i < numbercolumn; i++)
                {
                    dr[i] = datarow[i].Trim();
                }
                dt.Rows.Add(dr);
            }
            return dt;
        }
        public void RenameFile(string filepath, string newname)
        {
            string newFilePath = Path.Combine(Path.GetDirectoryName(filepath), newname);
            File.Move(filepath, newFilePath);
        }
        public void SaveSql(string connectionString,string nametable, DataTable data)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlBulkCopy bulkCopy = new SqlBulkCopy(connection))
                {
                    bulkCopy.DestinationTableName = nametable;
                    bulkCopy.WriteToServer(data);
                }
                connection.Close();
            }
        }

    }
}
