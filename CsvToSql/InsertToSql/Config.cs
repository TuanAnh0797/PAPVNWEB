using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsertToSql
{
    internal class Config
    {
        //Data Source=DESKTOP-CEVMTEM\SQLEXPRESS;Initial Catalog=DataQCCheck;User ID=sa;Password=123@123a
            public string ConnectionString { get; set; }
            public string StartCheck { get; set; }
            public Watch_Folder WatchFolder { get; set; }
            public History_Folder HistoryFolder { get; set; }
            public Name_Table NameTable { get; set; }
            public Quantity_Column QuantityColumn { get; set; }
            public Share_File ShareFile { get; set; }    

        public class Share_File
        {
            public TEMP TEMP { get; set; }
            public IOT IOT { get; set; }
            public CAMBACK CAMBACK { get; set; }
            public CAMFRONT CAMFRONT { get; set; }
        }
        public class CAMBACK
        {
            public string UserName { get; set; }
            public string PassWord { get; set; }
        }

        public class CAMFRONT
        {
            public string UserName { get; set; }
            public string PassWord { get; set; }
        }
        public class IOT
        {
            public string UserName { get; set; }
            public string PassWord { get; set; }
        }
        public class TEMP
        {
            public string UserName { get; set; }
            public string PassWord { get; set; }
        }
        public class Watch_Folder
        {
            public string VP { get; set; }
            public string GAS1 { get; set; }
            public string GAS2 { get; set; }
            public string WI1WITH { get; set; }
            public string WI1START { get; set; }
            public string IP { get; set; }
            public string DF { get; set; }
            public string TEMP { get; set; }
            public string IOT { get; set; }
            public string WI2 { get; set; }
            public string PAN { get; set; }
            public string CAMBACK { get; set; }
            public string CAMFRONT { get; set; }
            public string PCM { get; set; }
            public string StatusPCM { get; set; }
        }
        public class History_Folder
        {
            public string VP { get; set; }
            public string GAS1 { get; set; }
            public string GAS2{ get; set; }
            public string WI1WITH { get; set; }
            public string WI1START { get; set; }
            public string IP { get; set; }
            public string DF { get; set; }
            public string TEMP { get; set; }
            public string IOT { get; set; }
            public string WI2 { get; set; }
            public string PAN { get; set; }
            public string CAMBACK { get; set; }
            public string CAMFRONT { get; set; }
            public string PCM { get; set; }
            public string StatusPCM { get; set; }
        }
        public class Name_Table
        {
            public string VP { get; set; }
            public string GAS { get; set; }
            public string WI1WITH { get; set; }
            public string WI1START { get; set; }
            public string IP { get; set; }
            public string DF { get; set; }
            public string TEMP { get; set; }
            public string IOT { get; set; }
            public string WI2 { get; set; }
            public string PAN { get; set; }
            public string CAMBACK { get; set; }
            public string CAMFRONT { get; set; }

            public string PCM { get; set; }
            public string StatusPCM { get; set; }
        }
        public class Quantity_Column
        {
            public int VP { get; set; }
            public int GAS { get; set; }
            public int WI1WITH { get; set; }
            public int WI1START { get; set; }
            public int IP { get; set; }
            public int DF { get; set; }
            public int TEMP { get; set; }
            public int IOT { get; set; }
            public int WI2 { get; set; }
            public int PAN { get; set; }
            public int CAMBACK { get; set; }
            public int CAMFRONT { get; set; }
            public int PCM { get; set; }
            public int StatusPCM { get; set; }

        }


    }
}
