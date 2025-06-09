namespace InsertToSql
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.Time_VP = new System.Windows.Forms.Timer(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.Timer_GAS = new System.Windows.Forms.Timer(this.components);
            this.Timer_WI1WITH = new System.Windows.Forms.Timer(this.components);
            this.Timer_WI1START = new System.Windows.Forms.Timer(this.components);
            this.Timer_IP = new System.Windows.Forms.Timer(this.components);
            this.Timer_DF = new System.Windows.Forms.Timer(this.components);
            this.Timer_WI2 = new System.Windows.Forms.Timer(this.components);
            this.Timer_PAN = new System.Windows.Forms.Timer(this.components);
            this.panel1 = new System.Windows.Forms.Panel();
            this.lbl_vp = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.btn_log = new System.Windows.Forms.Button();
            this.btn_his = new System.Windows.Forms.Button();
            this.panel2 = new System.Windows.Forms.Panel();
            this.lbl_gas = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.panel3 = new System.Windows.Forms.Panel();
            this.lbl_WI1WITH = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.panel4 = new System.Windows.Forms.Panel();
            this.lbl_WI1START = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.panel5 = new System.Windows.Forms.Panel();
            this.lbl_PAN = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.panel6 = new System.Windows.Forms.Panel();
            this.lbl_WI2 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.panel7 = new System.Windows.Forms.Panel();
            this.lbl_DF = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.panel8 = new System.Windows.Forms.Panel();
            this.lbl_IP = new System.Windows.Forms.Label();
            this.label16 = new System.Windows.Forms.Label();
            this.Timer_IOT = new System.Windows.Forms.Timer(this.components);
            this.panel9 = new System.Windows.Forms.Panel();
            this.lbl_TEMP = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.panel10 = new System.Windows.Forms.Panel();
            this.lbl_IOT = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.panel11 = new System.Windows.Forms.Panel();
            this.lbl_CAMBACK = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.panel12 = new System.Windows.Forms.Panel();
            this.lbl_CAMFRONT = new System.Windows.Forms.Label();
            this.label17 = new System.Windows.Forms.Label();
            this.Timer_TEMP = new System.Windows.Forms.Timer(this.components);
            this.Timer_CAMBACK = new System.Windows.Forms.Timer(this.components);
            this.Timer_CAMFRONT = new System.Windows.Forms.Timer(this.components);
            this.panel13 = new System.Windows.Forms.Panel();
            this.lbl_StatusMachinePCM = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.panel14 = new System.Windows.Forms.Panel();
            this.lbl_PCM = new System.Windows.Forms.Label();
            this.label15 = new System.Windows.Forms.Label();
            this.Timer_PCM = new System.Windows.Forms.Timer(this.components);
            this.Timer_StatusPCM = new System.Windows.Forms.Timer(this.components);
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel4.SuspendLayout();
            this.panel5.SuspendLayout();
            this.panel6.SuspendLayout();
            this.panel7.SuspendLayout();
            this.panel8.SuspendLayout();
            this.panel9.SuspendLayout();
            this.panel10.SuspendLayout();
            this.panel11.SuspendLayout();
            this.panel12.SuspendLayout();
            this.panel13.SuspendLayout();
            this.panel14.SuspendLayout();
            this.SuspendLayout();
            // 
            // Time_VP
            // 
            this.Time_VP.Interval = 5000;
            this.Time_VP.Tick += new System.EventHandler(this.Time_VP_Tick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(137, 4);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(398, 31);
            this.label1.TabIndex = 0;
            this.label1.Text = "Đẩy dữ liệu lên SQL SERVER";
            // 
            // Timer_GAS
            // 
            this.Timer_GAS.Interval = 5000;
            this.Timer_GAS.Tick += new System.EventHandler(this.Timer_GAS_Tick);
            // 
            // Timer_WI1WITH
            // 
            this.Timer_WI1WITH.Interval = 5000;
            this.Timer_WI1WITH.Tick += new System.EventHandler(this.Timer_WI1WITH_Tick);
            // 
            // Timer_WI1START
            // 
            this.Timer_WI1START.Interval = 5000;
            this.Timer_WI1START.Tick += new System.EventHandler(this.Timer_WI1START_Tick);
            // 
            // Timer_IP
            // 
            this.Timer_IP.Interval = 5000;
            this.Timer_IP.Tick += new System.EventHandler(this.Timer_IP_Tick);
            // 
            // Timer_DF
            // 
            this.Timer_DF.Interval = 5000;
            this.Timer_DF.Tick += new System.EventHandler(this.Timer_DF_Tick);
            // 
            // Timer_WI2
            // 
            this.Timer_WI2.Interval = 5000;
            this.Timer_WI2.Tick += new System.EventHandler(this.Timer_WI2_Tick);
            // 
            // Timer_PAN
            // 
            this.Timer_PAN.Interval = 5000;
            this.Timer_PAN.Tick += new System.EventHandler(this.Timer_PAN_Tick);
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.lbl_vp);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Location = new System.Drawing.Point(12, 74);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(308, 34);
            this.panel1.TabIndex = 1;
            // 
            // lbl_vp
            // 
            this.lbl_vp.AutoSize = true;
            this.lbl_vp.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_vp.Location = new System.Drawing.Point(176, 7);
            this.lbl_vp.Name = "lbl_vp";
            this.lbl_vp.Size = new System.Drawing.Size(128, 20);
            this.lbl_vp.TabIndex = 3;
            this.lbl_vp.Text = "Đang chờ dữ liệu";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(3, 7);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(112, 20);
            this.label2.TabIndex = 2;
            this.label2.Text = "Công đoạn VP";
            // 
            // btn_log
            // 
            this.btn_log.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_log.Location = new System.Drawing.Point(12, 41);
            this.btn_log.Name = "btn_log";
            this.btn_log.Size = new System.Drawing.Size(108, 28);
            this.btn_log.TabIndex = 2;
            this.btn_log.Text = "Mở Log File";
            this.btn_log.UseVisualStyleBackColor = true;
            this.btn_log.Click += new System.EventHandler(this.btn_log_Click);
            // 
            // btn_his
            // 
            this.btn_his.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_his.Location = new System.Drawing.Point(126, 41);
            this.btn_his.Name = "btn_his";
            this.btn_his.Size = new System.Drawing.Size(108, 28);
            this.btn_his.TabIndex = 4;
            this.btn_his.Text = "Mở History";
            this.btn_his.UseVisualStyleBackColor = true;
            this.btn_his.Click += new System.EventHandler(this.btn_his_Click);
            // 
            // panel2
            // 
            this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel2.Controls.Add(this.lbl_gas);
            this.panel2.Controls.Add(this.label4);
            this.panel2.Location = new System.Drawing.Point(12, 114);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(308, 34);
            this.panel2.TabIndex = 4;
            // 
            // lbl_gas
            // 
            this.lbl_gas.AutoSize = true;
            this.lbl_gas.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_gas.Location = new System.Drawing.Point(176, 7);
            this.lbl_gas.Name = "lbl_gas";
            this.lbl_gas.Size = new System.Drawing.Size(128, 20);
            this.lbl_gas.TabIndex = 3;
            this.lbl_gas.Text = "Đang chờ dữ liệu";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(3, 7);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(126, 20);
            this.label4.TabIndex = 2;
            this.label4.Text = "Công đoạn GAS";
            // 
            // panel3
            // 
            this.panel3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel3.Controls.Add(this.lbl_WI1WITH);
            this.panel3.Controls.Add(this.label6);
            this.panel3.Location = new System.Drawing.Point(12, 154);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(308, 34);
            this.panel3.TabIndex = 4;
            // 
            // lbl_WI1WITH
            // 
            this.lbl_WI1WITH.AutoSize = true;
            this.lbl_WI1WITH.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_WI1WITH.Location = new System.Drawing.Point(176, 7);
            this.lbl_WI1WITH.Name = "lbl_WI1WITH";
            this.lbl_WI1WITH.Size = new System.Drawing.Size(128, 20);
            this.lbl_WI1WITH.TabIndex = 3;
            this.lbl_WI1WITH.Text = "Đang chờ dữ liệu";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(3, 7);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(161, 20);
            this.label6.TabIndex = 2;
            this.label6.Text = "Công đoạn WI1WITH";
            // 
            // panel4
            // 
            this.panel4.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel4.Controls.Add(this.lbl_WI1START);
            this.panel4.Controls.Add(this.label8);
            this.panel4.Location = new System.Drawing.Point(12, 194);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(308, 34);
            this.panel4.TabIndex = 4;
            // 
            // lbl_WI1START
            // 
            this.lbl_WI1START.AutoSize = true;
            this.lbl_WI1START.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_WI1START.Location = new System.Drawing.Point(176, 7);
            this.lbl_WI1START.Name = "lbl_WI1START";
            this.lbl_WI1START.Size = new System.Drawing.Size(128, 20);
            this.lbl_WI1START.TabIndex = 3;
            this.lbl_WI1START.Text = "Đang chờ dữ liệu";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(3, 7);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(172, 20);
            this.label8.TabIndex = 2;
            this.label8.Text = "Công đoạn WI1START";
            // 
            // panel5
            // 
            this.panel5.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel5.Controls.Add(this.lbl_PAN);
            this.panel5.Controls.Add(this.label10);
            this.panel5.Location = new System.Drawing.Point(326, 194);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(319, 34);
            this.panel5.TabIndex = 6;
            // 
            // lbl_PAN
            // 
            this.lbl_PAN.AutoSize = true;
            this.lbl_PAN.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_PAN.Location = new System.Drawing.Point(184, 7);
            this.lbl_PAN.Name = "lbl_PAN";
            this.lbl_PAN.Size = new System.Drawing.Size(128, 20);
            this.lbl_PAN.TabIndex = 3;
            this.lbl_PAN.Text = "Đang chờ dữ liệu";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(6, 7);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(123, 20);
            this.label10.TabIndex = 2;
            this.label10.Text = "Công đoạn PAN";
            // 
            // panel6
            // 
            this.panel6.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel6.Controls.Add(this.lbl_WI2);
            this.panel6.Controls.Add(this.label12);
            this.panel6.Location = new System.Drawing.Point(326, 154);
            this.panel6.Name = "panel6";
            this.panel6.Size = new System.Drawing.Size(319, 34);
            this.panel6.TabIndex = 7;
            // 
            // lbl_WI2
            // 
            this.lbl_WI2.AutoSize = true;
            this.lbl_WI2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_WI2.Location = new System.Drawing.Point(184, 7);
            this.lbl_WI2.Name = "lbl_WI2";
            this.lbl_WI2.Size = new System.Drawing.Size(128, 20);
            this.lbl_WI2.TabIndex = 3;
            this.lbl_WI2.Text = "Đang chờ dữ liệu";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.Location = new System.Drawing.Point(6, 7);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(120, 20);
            this.label12.TabIndex = 2;
            this.label12.Text = "Công đoạn WI2";
            // 
            // panel7
            // 
            this.panel7.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel7.Controls.Add(this.lbl_DF);
            this.panel7.Controls.Add(this.label14);
            this.panel7.Location = new System.Drawing.Point(12, 274);
            this.panel7.Name = "panel7";
            this.panel7.Size = new System.Drawing.Size(308, 34);
            this.panel7.TabIndex = 8;
            // 
            // lbl_DF
            // 
            this.lbl_DF.AutoSize = true;
            this.lbl_DF.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_DF.Location = new System.Drawing.Point(167, 7);
            this.lbl_DF.Name = "lbl_DF";
            this.lbl_DF.Size = new System.Drawing.Size(128, 20);
            this.lbl_DF.TabIndex = 3;
            this.lbl_DF.Text = "Đang chờ dữ liệu";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label14.Location = new System.Drawing.Point(6, 7);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(113, 20);
            this.label14.TabIndex = 2;
            this.label14.Text = "Công đoạn DF";
            // 
            // panel8
            // 
            this.panel8.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel8.Controls.Add(this.lbl_IP);
            this.panel8.Controls.Add(this.label16);
            this.panel8.Location = new System.Drawing.Point(12, 234);
            this.panel8.Name = "panel8";
            this.panel8.Size = new System.Drawing.Size(308, 34);
            this.panel8.TabIndex = 5;
            // 
            // lbl_IP
            // 
            this.lbl_IP.AutoSize = true;
            this.lbl_IP.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_IP.Location = new System.Drawing.Point(167, 7);
            this.lbl_IP.Name = "lbl_IP";
            this.lbl_IP.Size = new System.Drawing.Size(128, 20);
            this.lbl_IP.TabIndex = 3;
            this.lbl_IP.Text = "Đang chờ dữ liệu";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label16.Location = new System.Drawing.Point(6, 7);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(106, 20);
            this.label16.TabIndex = 2;
            this.label16.Text = "Công đoạn IP";
            // 
            // Timer_IOT
            // 
            this.Timer_IOT.Interval = 5000;
            this.Timer_IOT.Tick += new System.EventHandler(this.Timer_IOT_Tick);
            // 
            // panel9
            // 
            this.panel9.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel9.Controls.Add(this.lbl_TEMP);
            this.panel9.Controls.Add(this.label5);
            this.panel9.Location = new System.Drawing.Point(326, 74);
            this.panel9.Name = "panel9";
            this.panel9.Size = new System.Drawing.Size(319, 34);
            this.panel9.TabIndex = 8;
            // 
            // lbl_TEMP
            // 
            this.lbl_TEMP.AutoSize = true;
            this.lbl_TEMP.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_TEMP.Location = new System.Drawing.Point(184, 7);
            this.lbl_TEMP.Name = "lbl_TEMP";
            this.lbl_TEMP.Size = new System.Drawing.Size(128, 20);
            this.lbl_TEMP.TabIndex = 3;
            this.lbl_TEMP.Text = "Đang chờ dữ liệu";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(6, 7);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(134, 20);
            this.label5.TabIndex = 2;
            this.label5.Text = "Công đoạn TEMP";
            // 
            // panel10
            // 
            this.panel10.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel10.Controls.Add(this.lbl_IOT);
            this.panel10.Controls.Add(this.label9);
            this.panel10.Location = new System.Drawing.Point(326, 114);
            this.panel10.Name = "panel10";
            this.panel10.Size = new System.Drawing.Size(319, 34);
            this.panel10.TabIndex = 9;
            // 
            // lbl_IOT
            // 
            this.lbl_IOT.AutoSize = true;
            this.lbl_IOT.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_IOT.Location = new System.Drawing.Point(184, 7);
            this.lbl_IOT.Name = "lbl_IOT";
            this.lbl_IOT.Size = new System.Drawing.Size(128, 20);
            this.lbl_IOT.TabIndex = 3;
            this.lbl_IOT.Text = "Đang chờ dữ liệu";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(6, 7);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(117, 20);
            this.label9.TabIndex = 2;
            this.label9.Text = "Công đoạn IOT";
            // 
            // panel11
            // 
            this.panel11.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel11.Controls.Add(this.lbl_CAMBACK);
            this.panel11.Controls.Add(this.label13);
            this.panel11.Location = new System.Drawing.Point(326, 234);
            this.panel11.Name = "panel11";
            this.panel11.Size = new System.Drawing.Size(319, 34);
            this.panel11.TabIndex = 7;
            // 
            // lbl_CAMBACK
            // 
            this.lbl_CAMBACK.AutoSize = true;
            this.lbl_CAMBACK.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_CAMBACK.Location = new System.Drawing.Point(185, 7);
            this.lbl_CAMBACK.Name = "lbl_CAMBACK";
            this.lbl_CAMBACK.Size = new System.Drawing.Size(128, 20);
            this.lbl_CAMBACK.TabIndex = 3;
            this.lbl_CAMBACK.Text = "Đang chờ dữ liệu";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label13.Location = new System.Drawing.Point(6, 7);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(173, 20);
            this.label13.TabIndex = 2;
            this.label13.Text = "Công đoạn CAM BACK";
            // 
            // panel12
            // 
            this.panel12.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel12.Controls.Add(this.lbl_CAMFRONT);
            this.panel12.Controls.Add(this.label17);
            this.panel12.Location = new System.Drawing.Point(326, 274);
            this.panel12.Name = "panel12";
            this.panel12.Size = new System.Drawing.Size(319, 34);
            this.panel12.TabIndex = 8;
            // 
            // lbl_CAMFRONT
            // 
            this.lbl_CAMFRONT.AutoSize = true;
            this.lbl_CAMFRONT.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_CAMFRONT.Location = new System.Drawing.Point(184, 7);
            this.lbl_CAMFRONT.Name = "lbl_CAMFRONT";
            this.lbl_CAMFRONT.Size = new System.Drawing.Size(128, 20);
            this.lbl_CAMFRONT.TabIndex = 3;
            this.lbl_CAMFRONT.Text = "Đang chờ dữ liệu";
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label17.Location = new System.Drawing.Point(6, 7);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(184, 20);
            this.label17.TabIndex = 2;
            this.label17.Text = "Công đoạn CAM FRONT";
            // 
            // Timer_TEMP
            // 
            this.Timer_TEMP.Interval = 5000;
            this.Timer_TEMP.Tick += new System.EventHandler(this.Timer_TEMP_Tick);
            // 
            // Timer_CAMBACK
            // 
            this.Timer_CAMBACK.Interval = 5000;
            this.Timer_CAMBACK.Tick += new System.EventHandler(this.Timer_CAMBACK_Tick);
            // 
            // Timer_CAMFRONT
            // 
            this.Timer_CAMFRONT.Interval = 5000;
            this.Timer_CAMFRONT.Tick += new System.EventHandler(this.Timer_CAMFRONT_Tick);
            // 
            // panel13
            // 
            this.panel13.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel13.Controls.Add(this.lbl_StatusMachinePCM);
            this.panel13.Controls.Add(this.label7);
            this.panel13.Location = new System.Drawing.Point(326, 314);
            this.panel13.Name = "panel13";
            this.panel13.Size = new System.Drawing.Size(319, 34);
            this.panel13.TabIndex = 10;
            // 
            // lbl_StatusMachinePCM
            // 
            this.lbl_StatusMachinePCM.AutoSize = true;
            this.lbl_StatusMachinePCM.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_StatusMachinePCM.Location = new System.Drawing.Point(184, 7);
            this.lbl_StatusMachinePCM.Name = "lbl_StatusMachinePCM";
            this.lbl_StatusMachinePCM.Size = new System.Drawing.Size(128, 20);
            this.lbl_StatusMachinePCM.TabIndex = 3;
            this.lbl_StatusMachinePCM.Text = "Đang chờ dữ liệu";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(6, 7);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(158, 20);
            this.label7.TabIndex = 2;
            this.label7.Text = "PCM Status Machine";
            // 
            // panel14
            // 
            this.panel14.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel14.Controls.Add(this.lbl_PCM);
            this.panel14.Controls.Add(this.label15);
            this.panel14.Location = new System.Drawing.Point(12, 314);
            this.panel14.Name = "panel14";
            this.panel14.Size = new System.Drawing.Size(308, 34);
            this.panel14.TabIndex = 11;
            // 
            // lbl_PCM
            // 
            this.lbl_PCM.AutoSize = true;
            this.lbl_PCM.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_PCM.Location = new System.Drawing.Point(167, 7);
            this.lbl_PCM.Name = "lbl_PCM";
            this.lbl_PCM.Size = new System.Drawing.Size(128, 20);
            this.lbl_PCM.TabIndex = 3;
            this.lbl_PCM.Text = "Đang chờ dữ liệu";
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label15.Location = new System.Drawing.Point(6, 7);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(125, 20);
            this.label15.TabIndex = 2;
            this.label15.Text = "Công đoạn PCM";
            // 
            // Timer_PCM
            // 
            this.Timer_PCM.Interval = 5000;
            this.Timer_PCM.Tick += new System.EventHandler(this.Timer_PCM_Tick);
            // 
            // Timer_StatusPCM
            // 
            this.Timer_StatusPCM.Interval = 5000;
            this.Timer_StatusPCM.Tick += new System.EventHandler(this.Timer_StatusPCM_Tick);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(655, 365);
            this.Controls.Add(this.panel13);
            this.Controls.Add(this.panel14);
            this.Controls.Add(this.panel12);
            this.Controls.Add(this.panel11);
            this.Controls.Add(this.panel10);
            this.Controls.Add(this.panel9);
            this.Controls.Add(this.panel5);
            this.Controls.Add(this.panel4);
            this.Controls.Add(this.panel6);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.panel7);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel8);
            this.Controls.Add(this.btn_his);
            this.Controls.Add(this.btn_log);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.label1);
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Form1";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Form1_FormClosed);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.panel5.ResumeLayout(false);
            this.panel5.PerformLayout();
            this.panel6.ResumeLayout(false);
            this.panel6.PerformLayout();
            this.panel7.ResumeLayout(false);
            this.panel7.PerformLayout();
            this.panel8.ResumeLayout(false);
            this.panel8.PerformLayout();
            this.panel9.ResumeLayout(false);
            this.panel9.PerformLayout();
            this.panel10.ResumeLayout(false);
            this.panel10.PerformLayout();
            this.panel11.ResumeLayout(false);
            this.panel11.PerformLayout();
            this.panel12.ResumeLayout(false);
            this.panel12.PerformLayout();
            this.panel13.ResumeLayout(false);
            this.panel13.PerformLayout();
            this.panel14.ResumeLayout(false);
            this.panel14.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Timer Time_VP;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Timer Timer_GAS;
        private System.Windows.Forms.Timer Timer_WI1WITH;
        private System.Windows.Forms.Timer Timer_WI1START;
        private System.Windows.Forms.Timer Timer_IP;
        private System.Windows.Forms.Timer Timer_DF;
        private System.Windows.Forms.Timer Timer_WI2;
        private System.Windows.Forms.Timer Timer_PAN;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btn_his;
        private System.Windows.Forms.Button btn_log;
        private System.Windows.Forms.Label lbl_vp;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.Label lbl_PAN;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Label lbl_WI1START;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.Label lbl_WI2;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Label lbl_WI1WITH;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Panel panel7;
        private System.Windows.Forms.Label lbl_DF;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label lbl_gas;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Panel panel8;
        private System.Windows.Forms.Label lbl_IP;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Timer Timer_IOT;
        private System.Windows.Forms.Panel panel9;
        private System.Windows.Forms.Label lbl_TEMP;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Panel panel10;
        private System.Windows.Forms.Label lbl_IOT;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Panel panel11;
        private System.Windows.Forms.Label lbl_CAMBACK;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Panel panel12;
        private System.Windows.Forms.Label lbl_CAMFRONT;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.Timer Timer_TEMP;
        private System.Windows.Forms.Timer Timer_CAMBACK;
        private System.Windows.Forms.Timer Timer_CAMFRONT;
        private System.Windows.Forms.Panel panel13;
        private System.Windows.Forms.Label lbl_StatusMachinePCM;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Panel panel14;
        private System.Windows.Forms.Label lbl_PCM;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.Timer Timer_PCM;
        private System.Windows.Forms.Timer Timer_StatusPCM;
    }
}

