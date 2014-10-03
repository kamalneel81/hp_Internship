using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace APJ_RH
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            String ntName = (String)Session["GlobalName"];
            Master.MasterPageLabel = "Welcome ";
            Master.MasterPageLabel1 = ntName;

           


        }

        

        
        
    }
}
