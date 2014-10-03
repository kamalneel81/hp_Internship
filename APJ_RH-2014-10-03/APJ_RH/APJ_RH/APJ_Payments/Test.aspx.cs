using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Microsoft.VisualBasic;
using System.Diagnostics;
using Excel = Microsoft.Office.Interop.Excel;

using System.IO;

namespace APJ_RH.APJ_Payments
{
    public partial class Test : System.Web.UI.Page
    {
        RHcls rh = new RHcls();
        //string strdiv = "";
        //test comments
        private string constring()
        {
            return ConfigurationManager.ConnectionStrings["BPDOConnectionString"].ConnectionString;
        }
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
             
            //if (!IsPostBack)
            //{
            //    gvbind ();
            //}
            
            
        }

        protected void ddloption_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.Visible = true;  
        }
        
        
        
  //      protected void gvbind()
  //           {
  //               SqlConnection conn = new SqlConnection(constring());
                 
  //          conn.Open();
  //          SqlCommand cmd = new SqlCommand("SELECT * FROM [APAC]", conn);
  //          SqlDataAdapter da = new SqlDataAdapter(cmd);
  //          DataSet ds = new DataSet();
  //          da.Fill(ds);
  //          conn.Close();
  //          if (ds.Tables[0].Rows.Count > 0)
  //          {
  //              GridView1.DataSource = ds;
  //              GridView1.DataBind();
  //          }
  //          else
  //          {
  //              ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
  //              GridView1.DataSource = ds;
  //              GridView1.DataBind();
  //              int columncount = GridView1.Rows[0].Cells.Count;
  //              GridView1.Rows[0].Cells.Clear();
  //              GridView1.Rows[0].Cells.Add(new TableCell());
  //              GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
  //              GridView1.Rows[0].Cells[0].Text = "No Records Found";
  //          }

          
  //     }
  //      protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
  //      {
  //          GridView1.EditIndex = e.NewEditIndex;
  //          gvbind();
  //      }
  //      protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
            
  //      {
  //          int userid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
  //          GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
  //          Label lblID = (Label)row.FindControl("lblID");
  //          //INVOICE_DATE = ((TextBox)r.FindControl("TextINVOICE_DATE")).Text;
  //          //TextBox txtname=(TextBox)gr.cell[].control[];
  ////Name12 = ((TextBox)row.FindControl("dept")).Text;
  //          TextBox textdept = (TextBox)row.Cells[2].Controls[0];
  //          TextBox textgrade = (TextBox)row.Cells[3].Controls[0];
  //          TextBox textcluster = (TextBox)row.Cells[4].Controls[0];
  //          TextBox textsalary = (TextBox)row.Cells[5].Controls[0];
             
  //          Convert.ToInt32(textsalary.Text);   
  //          TextBox textmanager = (TextBox)row.Cells[6].Controls[0];
  //          TextBox textteamleader = (TextBox)row.Cells[7].Controls[0];
  //          TextBox textteam = (TextBox)row.Cells[8].Controls[0];
  //          TextBox textopsmanager = (TextBox)row.Cells[9].Controls[0];
  //          TextBox textfunctionalmanager = (TextBox)row.Cells[10].Controls[0];
        

  //          //TextBox textc = (TextBox)row.Cells[2].Controls[0];
  //          //TextBox textadd = (TextBox)row.FindControl("txtadd");
  //          //TextBox textc = (TextBox)row.FindControl("txtc");
  //          GridView1.EditIndex = -1;
  //          SqlConnection conn = new SqlConnection(constring());
  //          conn.Open();
  //          //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);
  //          SqlCommand cmd = new SqlCommand("update apac set dept='" + textdept.Text + "',grade='" +textgrade.Text+"',cluster='"+textcluster.Text+"',salary='"+textsalary.Text+"',manager='"+textmanager.Text+"',teamleader='"+textteamleader.Text+"',team='"+textteam.Text +"',opsmanager='"+textopsmanager.Text +"',functionalmanager='"+textfunctionalmanager.Text+"' where name='" + userid + "'", conn);
  //          cmd.ExecuteNonQuery();
  //          conn.Close();
  //          gvbind();
  //          //GridView1.DataBind();
  //      }
  //      protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
  //      {
  //          GridView1.EditIndex = -1;
  //          gvbind();
  //      }
        
  //      protected void KillProcess(string processName)
  //      {
  //          System.Diagnostics.Process myproc = new System.Diagnostics.Process();
  //          try
  //          {
  //              foreach (Process thisproc in Process.GetProcessesByName(processName))
  //              {
  //                  if (!thisproc.CloseMainWindow())
  //                  {
  //                      thisproc.Kill();
  //                  }
  //              } // next proc
  //          }
  //          catch (Exception Exc)
  //          {
  //              string msg = Exc.Message;
  //          }
  //      }

  //      protected void LHExtractandUploadBtn_Click(object sender, EventArgs e)
  //      {
  //          KillProcess("EXCEL");
  //          Excel.Application ExcelApp = new Excel.Application();
  //          ExcelApp.Application.DisplayAlerts = false;
  //          ExcelApp.DisplayAlerts = false;
  //          Excel.Workbook ExcelWb = ExcelApp.Workbooks.Open(Server.MapPath("docs/") + "SAP_Wizard_LH.xlsm");
  //          Excel.Worksheet ExcelWs = ExcelWb.Worksheets[1];
  //          DataTable dt1 = new DataTable();
  //          dt1 = rh.getData("SELECT * FROM [APAC]"); 
  //          string filename = "C:\\EMEA_PAY_SAP_WIZARD\\" + 123 + "_" + 12 + ".xlsm";
  //          string fname = 123 + "_" +12 + ".xlsm";
  //          ExcelWb.SaveAs(filename);
  //          ExcelApp.DisplayAlerts = false;
  //          ExcelWb.Save();
  //          ExcelWb.Close();
  //          ExcelWs = null;
  //          ExcelWb = null;
  //          ExcelApp.Application.Quit();
  //          ExcelApp.Quit();
  //          Response.AppendHeader("Content-Disposition", "attachment; filename=" + fname);
  //          //Response.RedirectLocation = @"C:\Temp";
  //          //Response.TransmitFile(Server.MapPath("docs/") + "SAP_Wizard.xlsm");
  //          Response.TransmitFile(filename);
  //          Response.End();


  //      }
  //      public System.Data.DataTable getData(string strQuery)
  //      {
  //          System.Data.DataTable dt = new System.Data.DataTable();
  //          SqlConnection conn = new SqlConnection(constring());
  //          try
  //          {
  //              conn.Open();
  //              SqlCommand cmd = new SqlCommand(strQuery, conn);
  //              SqlDataAdapter adp = new SqlDataAdapter(cmd);
  //              adp.Fill(dt);
  //              return dt;
  //          }
  //          catch (Exception ex)
  //          {
  //              dt.Columns.Add("Error", typeof(string));
  //              DataRow dr = dt.NewRow();
  //              dr["Error"] = ex.Message.ToString();
  //              dt.Rows.Add(dr);
  //              return dt;
  //          }
  //          finally
  //          {
  //              conn.Close();
  //          }
  //      }
    }
}