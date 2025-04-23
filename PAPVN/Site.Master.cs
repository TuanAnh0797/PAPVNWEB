using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PAPVN
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string lang = "en";

            if (Request.Cookies["lang"] != null)
            {
                lang = Request.Cookies["lang"].Value;
            }
            if (lang == "en")
            {
                linkVietnameseLang.Visible = true;
                linkEnglishLang.Visible = false;
            }
            else
            {
                linkEnglishLang.Visible = true;
                linkVietnameseLang.Visible = false;
            }
        }
        protected void linkEnglishLang_ServerClick(object sender, EventArgs e)
        {
            HttpCookie langCookie = new HttpCookie("lang");
            langCookie.Value = "en";
            langCookie.Expires = DateTime.Now.AddYears(5);
            Response.Cookies.Add(langCookie);
            Response.Redirect(Request.RawUrl);
        }
        protected void linkVietnameseLang_ServerClick(object sender, EventArgs e)
        {
            HttpCookie langCookie = new HttpCookie("lang");
            langCookie.Value = "vi";
            langCookie.Expires = DateTime.Now.AddYears(5);
            Response.Cookies.Add(langCookie);
            Response.Redirect(Request.RawUrl);
        }
    }
}