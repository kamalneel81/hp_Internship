using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Windows.Forms;
using System.Configuration;

namespace APJ_RH.APJ_Payments
{
    public partial class TemplateUpload : System.Web.UI.Page
    {
        RHcls rh = new RHcls();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["GlobalName"] = "Guru";
            String ntName = (String)Session["GlobalName"];
            Master.MasterPageLabel = "Logged in as: ";
            Master.MasterPageLabel1 = ntName;
      
      }
            
        protected void Upload_Click(object sender, EventArgs e)
        {
            //new code

            //new code
            ErrorLogListBox.Items.Clear();
            string[] validFileTypes = { "xls", "xlsx" };
            string pt=System.Environment.GetFolderPath(System.Environment.SpecialFolder.ProgramFiles);
            

            if (FileUpload1.HasFile)
            {
                string username = Session["GlobalName"].ToString();
                string ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
                string filePath = username + "_" + FileUpload1.FileName.ToString();
                string timeStamp = DateTime.Now.ToString("s");
                timeStamp = timeStamp.Replace(':', '-');
                timeStamp = timeStamp.Replace("T", "__");
                string batch = username + timeStamp;



                FileUpload1.SaveAs(Server.MapPath("UploadFiles/First_Upload_Files/" + filePath).ToString());

                string filePath1 = Server.MapPath("UploadFiles/First_Upload_Files/" + filePath).ToString();


                string strFileCon = "";
                bool isValidFile = false;
                //StatusLabel.Text = filePath1;
                for (int i = 0; i < validFileTypes.Length; i++)
                {
                    if (ext == "." + validFileTypes[i])
                    {
                        //if (validFileTypes[i] == "xls") { strFileCon = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filePath + ";Extended Properties=" + "Excel 8.0;HDR=YES;"; }
                        if (validFileTypes[i] == "xls") { strFileCon = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filePath1 + ";Extended Properties= \"Excel 8.0;HDR=Yes;IMEX=1\";"; }
                        //if (validFileTypes[i] == "xls") { strFileCon = "@Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + filePath + "; Extended Properties=""Excel 8.0;HDR=YES;IMEX=1";}
                        if (validFileTypes[i] == "xlsx") { strFileCon = @"Provider=Microsoft.ACE.OLEDB.12.0;Persist Security Info=False;Data Source=" + filePath1 + ";Extended Properties=\"Excel 12.0;HDR=Yes;\";"; }
                        if (validFileTypes[i] == "txt") { strFileCon = filePath; }
                        isValidFile = true;
                        break;
                    }

                }
                if (isValidFile)
                {
                    DataTable dtnull = new DataTable();
                    GridView1.DataSource = dtnull;
                    GridView1.DataBind();
                    ErrorExportToExcelBtn.Visible = false;
                    Boolean InvoiceTypecheck = false;
                    if (SelectthetypeofTemplateList.SelectedValue == "")
                    {
                        ErrorLogListBox.Items.Add("Please select the file type");
                    }


                    ErrorLogListBox.Items.Add("Reading Excel file");


                    string processor = Session["GlobalUserID"].ToString();

                    string Team_nm;
                    
                    string formtType;
                    if (SelectedTeam.SelectedValue == "FC Payments")
                    {
                        Team_nm = "FC Payments";
                        formtType = "1";
                    }
                    else
                    {
                        Team_nm = "CI Payments";
                        formtType = "2";
                    }

                    if (SelectthetypeofTemplateList.SelectedValue == "Payment Template With Transaction ID")
                    {
                        //To delete the data from staging table
                        //System.Data.DataTable dtDeleteStaging = new System.Data.DataTable();
                        //dtDeleteStaging = rh.getData("delete from dbo.staging_trans_master_emeapay");

                        InvoiceTypecheck = false;
                        System.Data.DataTable dtnew = new System.Data.DataTable();




                        dtnew = rh.ReadExcelFilePProID(strFileCon, "Payment Advice", InvoiceTypecheck, formtType, "PARTNER_PRO_ID");
                        string batchname = batch;//dtnew.Rows[0]["BATCH"].ToString();

                        int rows = dtnew.Rows.Count;
                        //Response.WriteFile(batchname);
                        ErrorLogListBox.Items.Add("Reading Excel Complete");
                        string result = rh.insertExcelData(dtnew, InvoiceTypecheck, formtType, processor, batch,Team_nm);

                        ErrorLogListBox.Items.Add(result);

                        //To Validate the input data
                        GridView1.DataSource = null;
                        //string param = "ValidateUploadedRows @batch ='" + batchname + "'";
                        string proc;
                        if (SelectedTeam.SelectedValue == "FC Payments")
                        {
                           proc = "UploadRowValidation";
                        }
                        else
                        {
                            proc = "CI_Withtrans_UploadRowValidation";
                            
                        }

                        DataTable dtValidation = rh.doValidationsbatch(proc, batch);
                            GridView1.DataSource = dtValidation;
                            GridView1.DataBind();
                            Session["dtValidation"] = dtValidation;

                        
                        //GridView1.DataBind();
                        //Session["dtValidation"] = dtValidation;
                        //////Calling procedures to Update invoice numbers for self invoicing countries **Not required for Non Comp**
                        ////DataTable dtUpdateInvoiceNumbers = rh.doValidations("UpdateInvoiceNumber");

                        //Calling procedure to Change the Vendor name to single vendor name if there are multiple vendor names
                        //DataTable dtChangeName = rh.doValidationsbatch("ChangeVendorNameRCBS", batchname);

                        //////Calling procedures to Check Low Value Payments **Not required for Non Comp**
                        ////DataTable dtLowVal = rh.doValidations("LowValuePayment");

                        //////Calling procedures to hold 25% records of value between USD 50000 and 250000 for QC in Approval Check status **Not required for Non Comp**
                        ////DataTable dtCheckApproval25 = rh.doValidations("CheckApproval25Percent");

                        if (GridView1.Rows.Count > 0)
                        {
                            ErrorExportToExcelBtn.Visible = true;
                        }

                        if (dtValidation.Rows.Count > 0)
                        {
                            ErrorLogListBox.Items.Add("Error found, refer the below error details");
                        }
                        else
                        {
                            ErrorLogListBox.Items.Add("Uploaded " + rows + " rows into Payment_Master Table");
                        }
                    }



                    // COmmen
                    else if (SelectthetypeofTemplateList.SelectedValue == "Payment Template Without Transaction ID")
                    {
                        System.Data.DataTable dtnew = new System.Data.DataTable();
                        dtnew = rh.ReadExcelFilePProID(strFileCon, "Payment Ready for Processing", InvoiceTypecheck, "3", "");
                        int rows = dtnew.Rows.Count;
                        string result = rh.insertExcelData(dtnew, InvoiceTypecheck, "3", processor, batch,Team_nm);
                        ErrorLogListBox.Items.Add(result);

                        //Run procedure which Checks if Partner Pro ID exists and UPdate or Insert accordingly
                        GridView1.DataSource = null;
                        DataTable dtValidation = rh.doValidationsbatch("CI_WithoutTrans_UploadRowValidation", batch);
                        

                        GridView1.DataSource = dtValidation;
                        GridView1.DataBind();
                        Session["dtValidation"] = dtValidation;
                        if (GridView1.Rows.Count > 0)
                        {
                            ErrorExportToExcelBtn.Visible = true;
                        }

                        if (dtValidation.Rows.Count > 0)
                        {
                            ErrorLogListBox.Items.Add("Error found, refer the below error details");
                        }
                        else
                        {
                            ErrorLogListBox.Items.Add("Uploaded " + rows + " rows into Payment_Master Table");
                        }

                    }
                    else if (SelectthetypeofTemplateList.SelectedValue == "India Payment Template")
                    {
                        System.Data.DataTable dtnew = new System.Data.DataTable();
                        dtnew = rh.ReadExcelFilePProID(strFileCon, "Sheet1", false, "4", "PARTNER_ID_DGF");
                        int rows = dtnew.Rows.Count;
                        string result = rh.insertExcelData(dtnew, false, "4", processor, batch, Team_nm);
                        ErrorLogListBox.Items.Add(result);
                        GridView1.DataSource = null;
                        //Run procedure which Checks if Partner Pro ID exists and UPdate or Insert accordingly
                        DataTable dtValidation = rh.doValidationsbatch("IN_UploadRowValidation", batch);
                        GridView1.DataSource = dtValidation;
                        GridView1.DataBind();
                        Session["dtValidation"] = dtValidation;
                        if (GridView1.Rows.Count > 0)
                        {
                            ErrorExportToExcelBtn.Visible = true;
                        }

                        if (dtValidation.Rows.Count > 0)
                        {
                            ErrorLogListBox.Items.Add("Error found, refer the below error details");
                        }
                        else
                        {
                            ErrorLogListBox.Items.Add("Uploaded " + rows + " rows into Payment_Master Table");
                        }

                    }
                    else if (SelectthetypeofTemplateList.SelectedValue == "MDF NextGen Payment Template")
                    {
                        System.Data.DataTable dtnew = new System.Data.DataTable();
                        dtnew = rh.ReadExcelFilePProID(strFileCon, "Sheet1", false, "5", "PARTNER_ID");
                        int rows = dtnew.Rows.Count;
                        string result = rh.insertExcelData(dtnew, false, "5", processor, batch, Team_nm);
                        ErrorLogListBox.Items.Add(result);
                        GridView1.DataSource = null;
                        //Run procedure which Checks if Partner Pro ID exists and UPdate or Insert accordingly
                        DataTable dtValidation = rh.doValidationsbatch("MDF_UploadRowValidation", batch);
                        GridView1.DataSource = dtValidation;
                        GridView1.DataBind();
                        Session["dtValidation"] = dtValidation;
                        if (GridView1.Rows.Count > 0)
                        {
                            ErrorExportToExcelBtn.Visible = true;
                        }

                        if (dtValidation.Rows.Count > 0)
                        {
                            ErrorLogListBox.Items.Add("Error found, refer the below error details");
                        }
                        else
                        {
                            ErrorLogListBox.Items.Add("Uploaded " + rows + " rows into Payment_Master Table");
                        }

                    }
                        //****************************************************************************************************************************************************************
                    



                }
                else
                {
                    ErrorLogListBox.Items.Add("Please select excel files only");
                }
            }
            else
            {
                ErrorLogListBox.Items.Add("Please select atleast one file");
            }
        }

        protected void ErrorExportToExcelBtn_Click(object sender, EventArgs e)
        {
            DataTable dtValidation = (DataTable)Session["dtValidation"];
            if (dtValidation.Rows.Count > 0)
            {
                string filename = "ErrorLog.xls";
                System.IO.StringWriter tw = new System.IO.StringWriter();
                System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
                System.Web.UI.WebControls.DataGrid dgGrid = new System.Web.UI.WebControls.DataGrid();
                dgGrid.DataSource = dtValidation;
                dgGrid.DataBind();

                //Get the HTML for the control.
                dgGrid.RenderControl(hw);
                //Write the HTML back to the browser.
                //Response.ContentType = application/vnd.ms-excel;
                Response.ContentType = "application/vnd.ms-excel";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + "");
                this.EnableViewState = false;
                Response.Write(tw.ToString());
                Response.End();
            }

            
        }





        protected void FormatofUploadLink_Click(object sender, EventArgs e)
        {

            string fname = "";
            
            
            
            
                if ((SelectedTeam.SelectedValue == "") || (SelectthetypeofTemplateList.SelectedValue == ""))
                
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert ('Please Select The Team Name and Template Type');", true);
                    return;
                }


                if (SelectedTeam.SelectedValue == "FC Payments")
                {
                    if (SelectthetypeofTemplateList.SelectedValue == "Payment Template With Transaction ID")
                    {
                        fname = "IC PADV File.xlsx";

                    }
                    else if (SelectthetypeofTemplateList.SelectedValue == "Payment Template Without Transaction ID")
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "showalert", "alert ('Team doesn't have a Template Without Transaction ID');", true);
                        return;

                    }
                    else if (SelectthetypeofTemplateList.SelectedValue == "India Payment Template")
                    
                    {
                        fname = "IC India PADV File.xlsx";

                    }
                    else if (SelectthetypeofTemplateList.SelectedValue == "MDF NextGen Payment Template")
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "showalert", "alert ('Team doesn't have a MDF NextGen Payment Template');", true);
                        return;

                    }
                }

                    if (SelectedTeam.SelectedValue == "CI Payments")
                    {
                        if (SelectthetypeofTemplateList.SelectedValue == "Payment Template With Transaction ID")
                        {
                            fname = "AP PADV File.xlsx";

                        }
                        else if (SelectthetypeofTemplateList.SelectedValue == "Payment Template Without Transaction ID")
                        {
                            fname = "AP PADV File(wo trans).xlsx";

                        }
                        
                        else if (SelectthetypeofTemplateList.SelectedValue == "India Payment Template")
                        {
                            fname = "AP India PADV File.xlsx";

                        }
                        else if (SelectthetypeofTemplateList.SelectedValue == "MDF NextGen Payment Template")
                        {
                            fname = "AP Next Gen MDF File.xlsx";

                        }

                     }
                    string filename = "E:\\APJRHITG\\APJ_Payments\\First Template Upload Formats\\" + fname;

                    //Response.TransmitFile(Server.MapPath("TemplateFormats/") + "BO PFR EXPORT CONTACT.xlsx");
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + fname);
                    //Response.TransmitFile("E:\\UAT90\\Comp\\TemplateFormats\\BO PFR EXPORT CONTACT.xlsx");
                    Response.TransmitFile(filename);
                    Response.End();
        }
            
   }

}
