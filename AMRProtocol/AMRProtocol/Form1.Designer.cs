namespace AMRProtocol
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txb_pathrequest = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txb_logrequest = new System.Windows.Forms.TextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.txb_pathresponse = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txb_logresponse = new System.Windows.Forms.TextBox();
            this.tmr_request = new System.Windows.Forms.Timer(this.components);
            this.fsw_reponse = new System.IO.FileSystemWatcher();
            this.label4 = new System.Windows.Forms.Label();
            this.txb_intervaltimer = new System.Windows.Forms.TextBox();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.fsw_reponse)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 26.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.label1.Location = new System.Drawing.Point(225, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(309, 39);
            this.label1.TabIndex = 0;
            this.label1.Text = "AMR PROTOCOL";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.txb_intervaltimer);
            this.groupBox1.Controls.Add(this.txb_pathrequest);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.txb_logrequest);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.ForeColor = System.Drawing.Color.Green;
            this.groupBox1.Location = new System.Drawing.Point(12, 66);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(351, 231);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Request";
            // 
            // txb_pathrequest
            // 
            this.txb_pathrequest.Location = new System.Drawing.Point(49, 29);
            this.txb_pathrequest.Name = "txb_pathrequest";
            this.txb_pathrequest.ReadOnly = true;
            this.txb_pathrequest.Size = new System.Drawing.Size(296, 29);
            this.txb_pathrequest.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Black;
            this.label2.Location = new System.Drawing.Point(6, 35);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(46, 20);
            this.label2.TabIndex = 1;
            this.label2.Text = "Path:";
            // 
            // txb_logrequest
            // 
            this.txb_logrequest.Location = new System.Drawing.Point(6, 98);
            this.txb_logrequest.Multiline = true;
            this.txb_logrequest.Name = "txb_logrequest";
            this.txb_logrequest.Size = new System.Drawing.Size(339, 127);
            this.txb_logrequest.TabIndex = 0;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.txb_pathresponse);
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.txb_logresponse);
            this.groupBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.groupBox2.Location = new System.Drawing.Point(382, 66);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(355, 231);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Response";
            // 
            // txb_pathresponse
            // 
            this.txb_pathresponse.Location = new System.Drawing.Point(51, 29);
            this.txb_pathresponse.Name = "txb_pathresponse";
            this.txb_pathresponse.ReadOnly = true;
            this.txb_pathresponse.Size = new System.Drawing.Size(296, 29);
            this.txb_pathresponse.TabIndex = 2;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Black;
            this.label3.Location = new System.Drawing.Point(8, 35);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(46, 20);
            this.label3.TabIndex = 1;
            this.label3.Text = "Path:";
            // 
            // txb_logresponse
            // 
            this.txb_logresponse.Location = new System.Drawing.Point(12, 63);
            this.txb_logresponse.Multiline = true;
            this.txb_logresponse.Name = "txb_logresponse";
            this.txb_logresponse.Size = new System.Drawing.Size(335, 161);
            this.txb_logresponse.TabIndex = 0;
            // 
            // tmr_request
            // 
            this.tmr_request.Enabled = true;
            this.tmr_request.Interval = 20000;
            this.tmr_request.Tick += new System.EventHandler(this.tmr_request_Tick);
            // 
            // fsw_reponse
            // 
            this.fsw_reponse.EnableRaisingEvents = true;
            this.fsw_reponse.SynchronizingObject = this;
            this.fsw_reponse.Changed += new System.IO.FileSystemEventHandler(this.fsw_reponse_ChangedAsync);
            this.fsw_reponse.Created += new System.IO.FileSystemEventHandler(this.fsw_reponse_CreatedAsync);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.Black;
            this.label4.Location = new System.Drawing.Point(6, 69);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(108, 20);
            this.label4.TabIndex = 3;
            this.label4.Text = "Interval Timer:";
            // 
            // txb_intervaltimer
            // 
            this.txb_intervaltimer.Location = new System.Drawing.Point(120, 63);
            this.txb_intervaltimer.Name = "txb_intervaltimer";
            this.txb_intervaltimer.ReadOnly = true;
            this.txb_intervaltimer.Size = new System.Drawing.Size(225, 29);
            this.txb_intervaltimer.TabIndex = 2;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(745, 304);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "AMR Protocol";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.fsw_reponse)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox txb_pathrequest;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txb_logrequest;
        private System.Windows.Forms.TextBox txb_pathresponse;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txb_logresponse;
        private System.Windows.Forms.Timer tmr_request;
        private System.IO.FileSystemWatcher fsw_reponse;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txb_intervaltimer;
    }
}

