using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.OracleClient;
using System.Configuration;
using System.Collections;
using Microsoft.VisualBasic;
using System.Diagnostics;
using Excel = Microsoft.Office.Interop.Excel;
using System.Drawing;
using System.Web.Security;
using System.Xml.Linq;
using System.IO;
using System.Data.SqlTypes;
using System.Text;
using CodeEngine.Framework.QueryBuilder;
using CodeEngine.Framework.QueryBuilder.Enums;
using System.Data.Common;


namespace APJ_RH
{
    
    public partial class QueryWizard : System.Web.UI.Page
    {
        RHcls rh = new RHcls();
       static SelectQueryBuilder qryBuilder = new SelectQueryBuilder();
        
        private string constring()
        {
            return ConfigurationManager.ConnectionStrings["BPDOConnectionString"].ConnectionString;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            String ntName = (String)Session["GlobalName"];
            Master.MasterPageLabel = "Logged in as: ";
            Master.MasterPageLabel1 = ntName;
            string usertype = Session["GlobalUserType"].ToString();
            if (usertype == "ADMIN")
            {

            }
            else
            {
                Response.Redirect("~/APJ_Payments/RequestAccess.aspx");
            }

            ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
            scriptManager.RegisterPostBackControl(this.ExporttoExcelBtn);
            if (!IsPostBack)
            {
                
                //Dim table As DataTable = connection.GetSchema("Tables")
                
                String qry = "SELECT * FROM sys.tables";
                SqlCommand cmd = new SqlCommand(qry);
                DataTable dt = rh.getData11(cmd);
                SelectTableNameList.DataSource = dt;
                SelectTableNameList.DataTextField = "name";
                SelectTableNameList.DataValueField = "name";
                SelectTableNameList.DataBind();
                SelectTableNameList.Items.Insert(0, "Select the Table Name");
            }
        }

        protected void SelectTableNameList_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvTable.Visible = false;
            whereconditiontable.Visible = false;
            Button2.Visible = false;
            ExporttoExcelBtn.Visible = false; 
            columnTable.Visible = true;
            add_Columnbtn.Visible = true;
            
            //String qry = "SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('" + SelectTableNameList.SelectedItem.Text + "')";
            SqlCommand cmdTest = new SqlCommand("SELECT distinct TABLE_SCHEMA FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '" + SelectTableNameList.SelectedItem.Text + "'");
            DataTable dtTest = rh.getData11(cmdTest);
            String schemaName = dtTest.Rows[0][0].ToString();
            Session["tableSchemaName"]=schemaName;
            String qry = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '" + SelectTableNameList.SelectedItem.Text + "' ORDER BY ORDINAL_POSITION";
            SqlCommand cmd = new SqlCommand(qry);
            DataTable dt = rh.getData11(cmd);
            gvtableColumn.DataSource = dt;
            gvtableColumn.DataBind();
        }
        protected void add_ColumnbtnBtn_Click(object sender, EventArgs e)
        {
            //ExecuteTbl.Visible = false;   
                whereconditiontable.Visible = true;  
                StringBuilder strBuilder = new StringBuilder();
                qryBuilder = new SelectQueryBuilder();
                String schemaName = (String)Session["tableSchemaName"];
                qryBuilder.SelectFromTable(""+ schemaName +"." + SelectTableNameList.SelectedItem.Text + "");
                // bool isCheckedAll = ((CheckBox)gvtableColumn.Rows[i].FindControl("chk")).Checked;
                System.Web.UI.WebControls.CheckBox ChkBoxHeader = (System.Web.UI.WebControls.CheckBox)gvtableColumn.HeaderRow.FindControl("chkboxSelectAll");
                if (ChkBoxHeader.Checked)
                {
                    
                        qryBuilder.SelectAllColumns();
                }
                else
                {
                    //bool isChecked = false;
                    //int cnt = 0;
                    // Select the checkboxes from the GridView control
                    for (int i = 0; i < gvtableColumn.Rows.Count; i++)
                    {
                        GridViewRow row = gvtableColumn.Rows[i];
                        bool isChecked = ((System.Web.UI.WebControls.CheckBox)row.FindControl("CB")).Checked;

                        if (isChecked)
                        {
                            // Column 2 is the name column
                            //str.Append(GridView1.Rows[i].Cells[1].Text);
                            strBuilder.AppendFormat("{0}, ", row.Cells[1].Text);
                            //cnt++;
                        }

                    }
                    //if (isChecked == true || cnt != 0)
                    //{
                        strBuilder.Length -= 2;
                        qryBuilder.SelectColumns(strBuilder.ToString());
                    //}
                    //else
                    //{
                    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Please, Select atleast one column')", true);
                    //}
                }

                //string statement = qryBuilder.BuildQuery();
                //TextBox1.Text = statement;
                columnTable.Visible = false;
                //GridViewData.Visible = true;

                String query = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '" + SelectTableNameList.SelectedItem.Text + "' ORDER BY ORDINAL_POSITION";
                SqlCommand cmd = new SqlCommand(query);
                DataTable dt = rh.getData11(cmd);
                SelectColumnNameList.DataSource = dt;
                SelectColumnNameList.DataTextField = "COLUMN_NAME";
                SelectColumnNameList.DataValueField = "COLUMN_NAME";
                SelectColumnNameList.DataBind();
                SelectColumnNameList.Items.Insert(0, "Select the Column Name");
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')",false);

                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "Confirm();", true);
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "Confirm();", true);
                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alertMessage", "<script type='text/javascript'>Confirm();</script>", false);
                //Button b = new Button();
                //b.ID = "add_Columnbtn";
                //b.Text = "Add Column";
                //add_Columnbtn.Controls.Add(b);
                //b.Attributes.Add("onClick", "return Confirm();");
                
                string tableName = SelectTableNameList.SelectedItem.Text;
                // || (tableName != "TRANS_MASTER_BKUP_1_FC")
                string confirmValue = Request.Form["confirm_value"];
                if ((tableName == "TRANS_MASTER_BKUP_1_CI") || (tableName == "TRANS_MASTER_BKUP_1_FC"))
                {
                    confirmValue = "Yes";
                }
                else
                {
                    if (confirmValue.Substring((confirmValue.Length - 1), 1).Equals("s"))
                    {
                        confirmValue = "Yes";
                    }
                    else
                        confirmValue = "No";
                }
                
                //if ((tableName != "TRANS_MASTER_BKUP_1_CI"))
                //{
                //    confirmValue = Request.Form["confirm_value"];
                //if (confirmValue.Substring((confirmValue.Length - 1), 1).Equals("s"))
                //{
                //    confirmValue = "Yes";
                //}
                //else
                //    confirmValue = "No";
                //}
                //if ((tableName != "TRANS_MASTER_BKUP_1_FC"))
                //{
                //    confirmValue = Request.Form["confirm_value"];
                //    if (confirmValue.Substring((confirmValue.Length - 1), 1).Equals("s"))
                //    {
                //        confirmValue = "Yes";
                //    }
                //    else
                //        confirmValue = "No";
                //}
                if (confirmValue == "Yes")
                {
                    //Your logic for OK button
                    //SelectColumnNamelbl.Visible = true;  
                    Button1.Visible=true;
                    DropDownList2.Visible=true;
                    SelectColumnNameList.Visible=true;
                    condTxtBox.Visible = true;

                }
                else
                {
                    whereconditiontable.Visible = false; 
                    Button2.Visible = true;

                    //Your logic for cancel button
                }

                //Button2.Visible = false;
                
        }
        protected void add_WhereBtn_Click(object sender, EventArgs e)
        {
            
            
            if (DropDownList2.SelectedIndex > -1 && SelectColumnNameList.SelectedIndex > -1 && condTxtBox.Text != "")
            {
                if (DropDownList2.SelectedItem.ToString() == "=")
                {
                    //TextBox1.Text = "CHECK NEEL";
                    condTxtBox.ToolTip = "";
                    qryBuilder.AddWhere("" + SelectColumnNameList.SelectedItem.ToString() + "", Comparison.Equals, condTxtBox.Text);
                    SelectColumnNameList.ClearSelection();
                    DropDownList2.ClearSelection();
                    condTxtBox.Text = "";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Where condition added successfully')", true);
                    Button2.Visible = true;
                    
                                        //TextBox1.Text = qryBuilder.BuildQuery();

                }
                if (DropDownList2.SelectedItem.ToString() == "<")
                {
                    //TextBox1.Text = "CHECK NEEL";
                    qryBuilder.AddWhere("" + SelectColumnNameList.SelectedItem.ToString() + "", Comparison.LessThan, condTxtBox.Text);
                    SelectColumnNameList.ClearSelection();
                    DropDownList2.ClearSelection();
                    condTxtBox.Text = "";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Where condition added successfully')", true);
                    Button2.Visible = true;
                    //TextBox1.Text = qryBuilder.BuildQuery();

                }
                if (DropDownList2.SelectedItem.ToString() == ">")
                {
                    //TextBox1.Text = "CHECK NEEL";
                    qryBuilder.AddWhere("" + SelectColumnNameList.SelectedItem.ToString() + "", Comparison.GreaterThan, condTxtBox.Text);
                    SelectColumnNameList.ClearSelection();
                    DropDownList2.ClearSelection();
                    condTxtBox.Text = "";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Where condition added successfully')", true);
                    Button2.Visible = true;
                    //TextBox1.Text = qryBuilder.BuildQuery();

                }
                if (DropDownList2.SelectedItem.ToString() == "<=")
                {
                    //TextBox1.Text = "CHECK NEEL";
                    qryBuilder.AddWhere("" + SelectColumnNameList.SelectedItem.ToString() + "", Comparison.LessOrEquals, condTxtBox.Text);
                    SelectColumnNameList.ClearSelection();
                    DropDownList2.ClearSelection();
                    condTxtBox.Text = "";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Where condition added successfully')", true);
                    Button2.Visible = true;
                    //TextBox1.Text = qryBuilder.BuildQuery();

                }
                if (DropDownList2.SelectedItem.ToString() == ">=")
                {
                    //TextBox1.Text = "CHECK NEEL";
                    qryBuilder.AddWhere("" + SelectColumnNameList.SelectedItem.ToString() + "", Comparison.GreaterOrEquals, condTxtBox.Text);
                    SelectColumnNameList.ClearSelection();
                    DropDownList2.ClearSelection();
                    condTxtBox.Text = "";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Where condition added successfully')", true);
                    Button2.Visible = true;
                    //TextBox1.Text = qryBuilder.BuildQuery();

                }
                else if (DropDownList2.SelectedItem.ToString() == "LIKE")
                {
                    //TextBox1.Text = "CHECK NEEL";
                    qryBuilder.AddWhere("" + SelectColumnNameList.SelectedItem.ToString() + "", Comparison.Like, "%" + condTxtBox.Text + "%");
                    SelectColumnNameList.ClearSelection();
                    DropDownList2.ClearSelection();
                    condTxtBox.Text = "";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Where condition added successfully')", true);
                    Button2.Visible = true;
                    //TextBox1.Text = qryBuilder.BuildQuery();

                }
                if (DropDownList2.SelectedItem.ToString() == "NOT LIKE")
                {
                    //TextBox1.Text = "CHECK NEEL";
                    String txt = condTxtBox.Text;
                    qryBuilder.AddWhere("" + SelectColumnNameList.SelectedItem.ToString() + "", Comparison.NotLike, "%" + condTxtBox.Text + "%");
                    SelectColumnNameList.ClearSelection();
                    DropDownList2.ClearSelection();
                    condTxtBox.Text = "";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Where condition added successfully')", true);
                    Button2.Visible = true;
                    //TextBox1.Text = qryBuilder.BuildQuery();

                }

                if (DropDownList2.SelectedItem.ToString() == "IN")
                {
                    //TextBox1.Text = "CHECK NEEL";
                    //ToolTip toolTip1 = new ToolTip();
                    //toolTip1.ShowAlways = true;
                    //toolTip1.SetToolTip(this.condTxtBox, "eg. 101,102");
                    condTxtBox.ToolTip = "eg. 101,102";
                    String creatingInOperator = "";
                    string[] list = condTxtBox.Text.Split(',');
                    foreach (string str in list)
                    {
                        creatingInOperator += "'" + str + "', ";
                    }
                    creatingInOperator = creatingInOperator.Substring(0,creatingInOperator.Length-2);
                    qryBuilder.AddWhere("" + SelectColumnNameList.SelectedItem.ToString() + "", Comparison.In, creatingInOperator);
                    condTxtBox.Text = "";
                    SelectColumnNameList.ClearSelection();
                    DropDownList2.ClearSelection();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Where condition added successfully')", true);
                    Button2.Visible = true;
                    //TextBox1.Text = qryBuilder.BuildQuery();

                }
                if (DropDownList2.SelectedItem.ToString() == "BETWEEN")
                {
                    //String creatingBTWoperator = "";
                    string[] arr = condTxtBox.Text.Split(',');
                    if (arr.Length == 2)
                    {
                        qryBuilder.AddWhere("" + SelectColumnNameList.SelectedItem.ToString() + "", Comparison.Between, arr);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Where condition added successfully')", true);
                        Button2.Visible = true;

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "showalert", "alert('Please enter correct input');", true);
                        //Response.Redirect("QueryWizard.aspx");
                        condTxtBox.Text = "";  


                    }

                }


                
            }

            
        }
        protected void executeBtn_Click(object sender, EventArgs e)
        {
            ExporttoExcelBtn.Visible = true;  
            //TextBox1.Text = qryBuilder.BuildQuery();
            qryBuilder.SetDbProviderFactory(DbProviderFactories.GetFactory("System.Data.SqlClient"));
            DbCommand command = qryBuilder.BuildCommand();
            SqlCommand cmd = new SqlCommand();
            cmd = (SqlCommand)command;
            DataTable dtExecuted = rh.getData11(cmd);
            Session["qryDt"]=dtExecuted;
            if (dtExecuted.Rows.Count > 0)
            {
                GridView1.Visible = true;
                gvTable.Visible = true;
                GridView1.DataSource = dtExecuted;
                GridView1.DataBind();
            }
            else
            {
                //dtExecuted.Tables[0].Rows.Add(dtExecuted.Tables[0].NewRow());
                GridView1.Visible = true;
                gvTable.Visible = true;
                dtExecuted.Rows.Add(dtExecuted.NewRow());
                GridView1.DataSource = dtExecuted;
                GridView1.DataBind();
                int columncount = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells[0].Text = "No Records Found";
            }
            
            //columnTable.Visible = true;
           
        }

        //protected SelectQueryBuilder Store(String qry)
        //{

        //}

        protected void gvPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            
            DataTable dt = ((DataTable)Session["qryDt"]);
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            
        }

        protected void ExporttoExcelBtn_Click(object sender, EventArgs e)
        {
            
            {

                DataTable dt = ((DataTable)Session["qryDt"]);
                string excelfilename = Server.MapPath("ExportToExcelFiles/") + Session["GlobalName"] + ".xlsx";
                string excelfname = Session["GlobalName"] + ".xlsx";
                if (File.Exists(excelfilename))
                {
                    File.Delete(excelfilename);

                }
                string imported = rh.ExportToExcel(dt, excelfilename);
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + excelfname);
                //Response.ContentType = ("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
                Response.TransmitFile(excelfilename);
                Response.AppendHeader("X-Download-Options", "noopen");
                Response.End();

            }
        }
    }
}