using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace APJ_RH
{
    public partial class APJSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //String ntName = (String)Session["GlobalName"];
            //Label1.Text = "Welcome " + ntName;
        }

        public string MasterPageLabel
        {
            get { return Label1.Text; }
            set { Label1.Text = value; }
        }
        public string MasterPageLabel1
        {
            get { return Label2.Text; }
            set { Label2.Text = value; }
        }
    }
}