using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.VisualBasic;
using System.Windows.Forms;
using System.IO;


namespace APJ_RH.APJ_Payments
{
    public partial class Query : System.Web.UI.Page
    {
        RHcls rh = new RHcls();
     
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
            scriptManager.RegisterPostBackControl(this.ExporttoExcelBtn);
            
            
            if (!IsPostBack)
            {
               
            }

        }


        //private void binddata(string strQuery, GridView gv)
        ////{
        ////    //DataTable dt = rh.getData(strQuery);
        ////    for (int i = 0; i < dt.Rows.Count; i++)
        ////    {
        ////        //if (i == 0) { dt.Columns.Add("PARTNER_PRO_ID_Link", typeof(string)); dt.Rows[i]["PARTNER_PRO_ID_Link"] = "<a href=JavaScript:divexpandcollapse('div" + dt.Rows[i]["PARTNER_PRO_ID"].ToString() + "');Test</a>"; }
        ////        //if (i == 0) { dt.Columns.Add("PARTNER_PRO_ID_Link", typeof(string)); dt.Rows[i]["PARTNER_PRO_ID_Link"] = "JavaScript:divexpandcollapse('div" + dt.Rows[i]["PARTNER_PRO_ID"].ToString() + "');"; }
        ////        //if (i > 0) { dt.Rows[i]["PARTNER_PRO_ID_Link"] = "JavaScript:divexpandcollapse('div" + dt.Rows[i]["PARTNER_PRO_ID"].ToString() + "');"; }

        ////    }


        ////    gv.DataSource = dt;
        ////    gv.DataBind();


        ////}

        //protected void ExecuteBtn_Click(object sender, EventArgs e)
        //{
        //    GridTable.Visible = true;  
        //    CountLbl.Text = "";
        //    DataTable dt;
        //    String str = QueryTxtBox.Text.ToString().ToLower();
        //    int Climit =str.IndexOf("select", 0);

        //    if (Climit >= 0)
        //    {
        //    dt = rh.getData(QueryTxtBox.Text.ToString());
        //    Session["dt"] = dt;
        //    QueryGridView.DataSource = dt;
        //    QueryGridView.DataBind();
        //    int Count = dt.Rows.Count;
        //    CountLbl.Text = Count.ToString() + " Rows selected";
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Only Select Statements Can be Excecuted');", true);
        //    }

        //}
        protected void ExporttoExcelBtn_Click(object sender, EventArgs e)
        {



            DataTable dt = (DataTable)Session["dt"];
            string excelfilename = Server.MapPath("ExportToExcelFiles/") + Session["GlobalName"] + ".xlsx";
            string excelfname = Session["GlobalName"] + ".xlsx";

            if (File.Exists(excelfilename))
            {
                File.Delete(excelfilename);

            }


            string imported = rh.ExportToExcel(dt, excelfilename);
            Show(imported);

            Response.AppendHeader("Content-Disposition", "attachment; filename=" + excelfname);
            Response.TransmitFile(excelfilename);
            Response.AppendHeader("X-Download-Options", "noopen");
            Response.End();
        
        }
        public static void Show(string message)
        {
            string cleanMessage = message.Replace("'", "\'");
            Page page = HttpContext.Current.CurrentHandler as Page;
            string script = string.Format("alert('{0}');", cleanMessage);
            if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert"))
            {
                page.ClientScript.RegisterClientScriptBlock(page.GetType(), "alert", script, true /* addScriptTags */);
            }
        }

        private string GetSortDirection(string column)
        {
            string sortDirection = "DESC";
            string sortExpression = ViewState["SortExpression"] as string;

            if (sortExpression != null)
            {
                if (sortExpression == column)
                {
                    string lastDirection = ViewState["SortDirection"] as string;
                    if ((lastDirection != null) && (lastDirection == "DESC"))
                    {
                        sortDirection = "ASC";
                    }
                }
            }

            ViewState["SortDirection"] = sortDirection;
            ViewState["SortExpression"] = column;

            return sortDirection;
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dt = ((DataTable)Session["dt"]);
            dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
            QueryGridView.DataSource = dt;
            QueryGridView.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DataTable dt = ((DataTable)Session["dt"]);
            QueryGridView.PageIndex = e.NewPageIndex;

            //rebind your gridview - GetSource(),Datasource of your GirdView
            QueryGridView.DataSource = dt;
            QueryGridView.DataBind();
        }

    }
}