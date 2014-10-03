using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;  

namespace APJ_RH
{
    public class Global : System.Web.HttpApplication
    {
        RHcls rh = new RHcls();
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup

        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void Session_Start(object sender, EventArgs e)
        {
        //    // Code that runs when a new session is started
           string testname = System.Threading.Thread.CurrentPrincipal.Identity.Name;

           //string username = "varunan";
           //DataTable dtuser = rh.getData11("select * from UserRights where ntlogin = '" + testname + "'");
           SqlCommand cmd = new SqlCommand("select * from UserRights where ntlogin = '" + testname + "'");
           DataTable dtuser = rh.getData11(cmd);
           if (dtuser.Rows.Count < 1)
           {
        //        //int a = 4;
        //        //int b = 0;
        //        //int c = a / b;
               Response.Redirect("~/APJ_Payments/RequestAccess.aspx");
               

        //        //Session.Abandon();

           }
            else
            {
        //        //Response.Write("success till here");
                Session["GlobalName"] = dtuser.Rows[0]["UserName"].ToString();
                Session["GlobalUserID"] = dtuser.Rows[0]["ntlogin"].ToString();
                Session["GlobalUserType"] = dtuser.Rows[0]["UserType"].ToString();
                Session["GlobalEmailID"] = dtuser.Rows[0]["EmailID"].ToString();

          }


        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }

    }
}
