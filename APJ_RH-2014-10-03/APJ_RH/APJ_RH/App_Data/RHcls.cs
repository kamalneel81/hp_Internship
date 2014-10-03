using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.OracleClient;
using System.Data.OleDb;
using System.Net.Mail;
using System.IO;
using Microsoft.Office.Interop.Word;
using outlook = Microsoft.Office.Interop.Outlook;
using Excel = Microsoft.Office.Interop.Excel;
using DocumentFormat.OpenXml.Spreadsheet;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml;
using System.Web.UI;
using System.Windows.Forms;
//using Oracle.DataAccess.Client;

namespace APJ_RH
{
    public class RHcls
    {

        string partnerproid = "";
        private string constring()
        {
            return ConfigurationManager.ConnectionStrings["BPDOConnectionString"].ConnectionString;
        }

        private string constringNonComp()
        {
            return ConfigurationManager.ConnectionStrings["BPDOConnectionString"].ConnectionString;
        }
        //private string constringNonComp()
        //{
          //  return ConfigurationManager.ConnectionStrings["NonComp"].ConnectionString;
        //}
        

        private string constringMDF()
        {
            return ConfigurationManager.ConnectionStrings["MDF"].ConnectionString;
        }

        //public System.Data.DataTable getData(string strQuery)
        //{
        //    System.Data.DataTable dt = new System.Data.DataTable();
        //    SqlConnection conn = new SqlConnection(constring());
        //    try
        //    {
        //        conn.Open();
        //        SqlCommand cmd = new SqlCommand(strQuery, conn);
        //        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //        adp.Fill(dt);
        //        return dt;
        //    }
        //    catch (Exception ex)
        //    {
        //        dt.Columns.Add("Error", typeof(string));
        //        DataRow dr = dt.NewRow();
        //        dr["Error"] = ex.Message.ToString();
        //        dt.Rows.Add(dr);
        //        return dt;
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //}
        public System.Data.DataTable getData11(SqlCommand  cmd)
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            SqlConnection conn = new SqlConnection(constring());
            try
            {
                conn.Open();
                //DataTable testDt=new System.Data.DataTable
               //System.Data.DataTable testDt = conn.GetSchema();
                cmd.Connection = conn;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                dt.Columns.Add("Error", typeof(string));
                DataRow dr = dt.NewRow();
                dr["Error"] = ex.Message.ToString();
                dt.Rows.Add(dr);
                return dt;
            }
            finally
            {
                conn.Close();
            }
        }

        public System.Data.DataTable readData(string strQuery, string tbl)
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(constring());
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(strQuery, conn);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds, tbl);
                dt = ds.Tables[tbl];
                //adp.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                dt.Columns.Add("Error", typeof(string));
                DataRow dr = dt.NewRow();
                dr["Error"] = ex.Message.ToString();
                dt.Rows.Add(dr);
                return dt;
            }
            finally
            {
                conn.Close();
            }
        }


        //public string getDataOracleNonCompInserttoSQL(string strQuery, string updatequery)
        //{
        //    System.Data.DataTable dt = new System.Data.DataTable();
        //    string constr = "Data Source=(DESCRIPTION = (ADDRESS_LIST =(ADDRESS = (PROTOCOL = TCP)(HOST = pashasye3)(PORT = 1521)))(CONNECT_DATA = (SERVER=DEDICATED)(SERVICE_NAME = bpdo)));User Id=rcbs_user;Password=hello";
        //    //System.Data.OracleClient.OracleConnection conn = new System.Data.OracleClient.OracleConnection(constringNonComp());
        //    //OracleConnection conn = new OracleConnection(constr);
        //    try
        //    {
        //        conn.Open();
        //        OracleCommand cmd = new OracleCommand(strQuery, conn);
        //        OracleDataAdapter adp = new OracleDataAdapter(cmd);
        //        adp.Fill(dt);

        //        SqlBulkCopy sbc = new SqlBulkCopy(constring());
        //        sbc.DestinationTableName = "dbo.STAGING_TRANS_MASTER_RCBS_PN";
        //        sbc.ColumnMappings.Add("PERIOD_SHORT", "PERIOD_SHORT");
        //        sbc.ColumnMappings.Add("PARTNER_PRO_ID", "PARTNER_PRO_ID");
        //        sbc.ColumnMappings.Add("VENDOR_NAME", "VENDOR_NAME");
        //        sbc.ColumnMappings.Add("CURRENCY", "CURRENCY");
        //        sbc.ColumnMappings.Add("GROSS_AMOUNT", "GROSS_AMOUNT");
        //        sbc.ColumnMappings.Add("VAT_PER", "VAT_PER");
        //        sbc.ColumnMappings.Add("NET_AMOUNT", "NET_AMOUNT");
        //        sbc.ColumnMappings.Add("PAYMENT_METHOD", "PAYMENT_METHOD");
        //        sbc.ColumnMappings.Add("VENDOR_NUMBER", "VENDOR_NUMBER");
        //        sbc.ColumnMappings.Add("INVOICE_NUMBER", "INVOICE_NUMBER");
        //        sbc.ColumnMappings.Add("INVOICE_DATE", "INVOICE_DATE");
        //        sbc.ColumnMappings.Add("PROGRAM_NAME", "PROGRAM_NAME");
        //        sbc.ColumnMappings.Add("DOCUMENT_NUMBER", "DOCUMENT_NUMBER");
        //        sbc.ColumnMappings.Add("PAYMENT_NOTIFICATION_STATUS", "PAYMENT_NOTIFICATION_STATUS");
        //        sbc.ColumnMappings.Add("INVOICE_NUMBER1", "INVOICE_NUMBER1");
        //        sbc.ColumnMappings.Add("CHECK_NUMBER", "CHECK_NUMBER");
        //        sbc.ColumnMappings.Add("CHECK_DATE", "CHECK_DATE");

        //        sbc.WriteToServer(dt);

        //        //Need to Test
        //        OracleCommand cmd1 = new OracleCommand(updatequery, conn);

        //        cmd1.ExecuteNonQuery();
        //        int count = dt.Rows.Count;
        //        return "";
        //    }
        //    catch (Exception ex)
        //    {
        //        return ex.Message.ToString();
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //}

        //public string getDataOracleMDFInserttoSQL(string strQuery, string updatequery)
        //{
        //    System.Data.DataTable dt = new System.Data.DataTable();
        //    OracleConnection conn = new OracleConnection(constringMDF());

        //    try
        //    {
        //        conn.Open();
        //        OracleCommand cmd = new OracleCommand(strQuery, conn);
        //        OracleDataAdapter adp = new OracleDataAdapter(cmd);
        //        adp.Fill(dt);

        //        SqlBulkCopy sbc = new SqlBulkCopy(constring());
        //        sbc.DestinationTableName = "dbo.STAGING_TRANS_MASTER_MDFDATA";
        //        sbc.ColumnMappings.Add("PERIOD_SHORT", "PERIOD_SHORT");
        //        sbc.ColumnMappings.Add("PARTNER_PRO_ID", "PARTNER_PRO_ID");
        //        sbc.ColumnMappings.Add("VENDOR_NAME", "VENDOR_NAME");
        //        sbc.ColumnMappings.Add("CURRENCY", "CURRENCY");
        //        sbc.ColumnMappings.Add("GROSS_AMOUNT", "GROSS_AMOUNT");
        //        sbc.ColumnMappings.Add("VAT_PER", "VAT_PER");
        //        sbc.ColumnMappings.Add("NET_AMOUNT", "NET_AMOUNT");
        //        sbc.ColumnMappings.Add("PAYMENT_MODE", "PAYMENT_MODE");
        //        sbc.ColumnMappings.Add("VENDOR_NUMBER", "VENDOR_NUMBER");
        //        sbc.ColumnMappings.Add("INVOICE_NUMBER", "INVOICE_NUMBER");
        //        sbc.ColumnMappings.Add("INVOICE_DATE", "INVOICE_DATE");
        //        sbc.ColumnMappings.Add("INVOICE_PROGRAM_NAME", "INVOICE_PROGRAM_NAME");
        //        sbc.ColumnMappings.Add("DOCUMENT_NUMBER", "DOCUMENT_NUMBER");
        //        sbc.ColumnMappings.Add("PAYMENT_NOTIFICATION_STATUS", "PAYMENT_NOTIFICATION_STATUS");
        //        sbc.ColumnMappings.Add("INVOICE_NUMBER1", "INVOICE_NUMBER1");
        //        sbc.ColumnMappings.Add("CHECK_NUMBER", "CHECK_NUMBER");
        //        sbc.ColumnMappings.Add("CHECK_DATE", "CHECK_DATE");

        //        sbc.WriteToServer(dt);

        //        ////Need to Test
        //        //OracleCommand cmd1 = new OracleCommand(updatequery, conn);
        //        //cmd1.ExecuteNonQuery();

        //        return "";
        //    }
        //    catch (Exception ex)
        //    {
        //        return ex.Message.ToString();
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //}

        public System.Data.DataTable doValidations(string strSPName)
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            SqlConnection conn = new SqlConnection(constring());
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = strSPName;

                
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                dt.Columns.Add("Error", typeof(string));
                DataRow dr = dt.NewRow();
                dr["Error"] = ex.Message.ToString();
                dt.Rows.Add(dr);
                return dt;
            }
            finally
            {
                conn.Close();
            }
        }

        public System.Data.DataTable doValidationsbatch(string strSPName, string batchname)
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            SqlConnection conn = new SqlConnection(constring());
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = strSPName;
                cmd.Parameters.AddWithValue("@batch", batchname);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                dt.Columns.Add("Error", typeof(string));
                DataRow dr = dt.NewRow();
                dr["Error"] = ex.Message.ToString();
                dt.Rows.Add(dr);
                return dt;
            }
            finally
            {
                conn.Close();
            }
        }

        //public string ReadExcelFile1(string strFilePath, string strSheetName, Boolean BolInvoiceTypecheck, string templatetype, string UserID)
        //{
        //    //if (BolInvoiceTypecheck == true)
        //    //{

        //    //}

        //    System.Data.DataTable dt = new System.Data.DataTable();
        //    OleDbConnection oConn = new OleDbConnection(strFilePath);
        //    try
        //    {
        //        oConn.Open();
        //        OleDbCommand oCmd = new OleDbCommand();
        //        oCmd.Connection = oConn;
        //        oCmd.CommandType = CommandType.Text;
        //        oCmd.CommandText = "Select * From [" + strSheetName + "$]";
        //        //oCmd.CommandText = "Select * into Temp2 From [" + strSheetName + "$]";
        //        //oCmd.ExecuteNonQuery();
        //        OleDbDataAdapter oAdp = new OleDbDataAdapter(oCmd);
        //        oAdp.Fill(dt);
        //        UserID = "NTLogingID";
        //        return insertExcelData(dt, BolInvoiceTypecheck, templatetype, UserID);
        //    }
        //    catch (Exception ex)
        //    {
        //        //dt.Columns.Add("Error", typeof(string));
        //        //DataRow dr = dt.NewRow();
        //        //dr["Error"] = ex.Message.ToString();
        //        //dt.Rows.Add(dr);
        //        //return dt;
        //        return ex.Message.ToString();
        //    }
        //    finally
        //    {
        //        oConn.Close();
        //    }
        //}

        public System.Data.DataTable ReadExcelFile(string strFilePath, string strSheetName, Boolean BolInvoiceTypecheck, string templatetype)
        {
            //if (BolInvoiceTypecheck == true)
            //{

            //}

            System.Data.DataTable dt = new System.Data.DataTable();
            OleDbConnection oConn = new OleDbConnection(strFilePath);


            try
            {
                if (oConn.State == ConnectionState.Closed)
                {
                    oConn.Open();
                }
                OleDbCommand oCmd = new OleDbCommand();
                oCmd.Connection = oConn;
                oCmd.CommandType = CommandType.Text;
                oCmd.CommandText = "Select * From [" + strSheetName + "$]";


                //Shasha Code
                //oCmd.CommandText = "Select * into Temp2 From [" + strSheetName + "$]";
                //oCmd.ExecuteNonQuery();
                OleDbDataAdapter oAdp = new OleDbDataAdapter(oCmd);

                //shasha code
                oAdp.FillSchema(dt, SchemaType.Source);
                oAdp.Fill(dt);
                oCmd.Dispose();
                oCmd.CommandText = null;
                oAdp.Dispose();
                oAdp = null;
                oConn.Close();
                oConn.Dispose();
                oConn = null;


                return dt;
                //Shsha modified


            }

            catch (Exception ex)
            {
                dt.Columns.Add("Error", typeof(string));
                DataRow dr = dt.NewRow();
                dr["Error"] = ex.Message.ToString();
                dt.Rows.Add(dr);
                return dt;
            }
            finally
            {


            }
        }

        public System.Data.DataTable ReadExcelFilePProID(string strFilePath, string strSheetName, Boolean BolInvoiceTypecheck, string templatetype, string ppid)
        {
            //if (BolInvoiceTypecheck == true)
            //{

            //}

            System.Data.DataTable dt = new System.Data.DataTable();
            OleDbConnection oConn = new OleDbConnection(strFilePath);


            try
            {
                if (oConn.State == ConnectionState.Closed)
                {
                    oConn.Open();
                }
                OleDbCommand oCmd = new OleDbCommand();
                oCmd.Connection = oConn;
                oCmd.CommandType = CommandType.Text;
                oCmd.CommandText = "Select * From [" + strSheetName + "$]"; 


                //Shasha Code
                //oCmd.CommandText = "Select * into Temp2 From [" + strSheetName + "$]";
                //oCmd.ExecuteNonQuery();
                OleDbDataAdapter oAdp = new OleDbDataAdapter(oCmd);

                //shasha code
                oAdp.FillSchema(dt, SchemaType.Source);
                oAdp.Fill(dt);
                oCmd.Dispose();
                oCmd.CommandText = null;
                oAdp.Dispose();
                oAdp = null;
                oConn.Close();
                oConn.Dispose();
                oConn = null;


                return dt;
                //Shsha modified


            }

            catch (Exception ex)
            {
                dt.Columns.Add("Error", typeof(string));
                DataRow dr = dt.NewRow();
                dr["Error"] = ex.Message.ToString();
                dt.Rows.Add(dr);
                return dt;
            }
            finally
            {


            }
        }


        public System.Data.DataTable ReadExcelFileHPORGTemplate(string strFilePath, string strSheetName, Boolean BolInvoiceTypecheck, string templatetype)
        {
            //if (BolInvoiceTypecheck == true)
            //{

            //}

            System.Data.DataTable dt = new System.Data.DataTable();
            OleDbConnection oConn = new OleDbConnection(strFilePath);


            try
            {
                if (oConn.State == ConnectionState.Closed)
                {
                    oConn.Open();
                }
                OleDbCommand oCmd = new OleDbCommand();
                oCmd.Connection = oConn;
                oCmd.CommandType = CommandType.Text;
                oCmd.CommandText = "Select * From [" + strSheetName + "$] where COUNTRY_CODE <> ''";


                //Shasha Code
                //oCmd.CommandText = "Select * into Temp2 From [" + strSheetName + "$]";
                //oCmd.ExecuteNonQuery();
                OleDbDataAdapter oAdp = new OleDbDataAdapter(oCmd);

                //shasha code
                oAdp.FillSchema(dt, SchemaType.Source);
                oAdp.Fill(dt);
                oCmd.Dispose();
                oCmd.CommandText = null;
                oAdp.Dispose();
                oAdp = null;
                oConn.Close();
                oConn.Dispose();
                oConn = null;


                return dt;
                //Shsha modified


            }

            catch (Exception ex)
            {
                dt.Columns.Add("Error", typeof(string));
                DataRow dr = dt.NewRow();
                dr["Error"] = ex.Message.ToString();
                dt.Rows.Add(dr);
                return dt;
            }
            finally
            {


            }
        }

        public string insertExcelData(System.Data.DataTable excelData, Boolean BolInvoiceTypecheck, string templatetype, string UserID,string batch, string Team_nm)
        {
            string result = "";
            DataColumn newCol = new DataColumn("NTLoginID", typeof(string));
            //newCol.DefaultValue = @"asiapacific\pashasye";
            newCol.DefaultValue = UserID;
            excelData.Columns.Add(newCol);

            //string TeamNm = Session["ProgramType"];

           
            if (templatetype == "1")
            {
                newCol = new DataColumn("Team_Name", typeof(string));
                newCol.DefaultValue = Team_nm.ToString(); ;
                excelData.Columns.Add(newCol);

                newCol = new DataColumn("Batch", typeof(string));
                newCol.DefaultValue = batch.ToString();
                excelData.Columns.Add(newCol);

                newCol = new DataColumn("SYSTEM_TYPE", typeof(string));
                newCol.DefaultValue = "P1";
                excelData.Columns.Add(newCol);
                                
                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.BulkCopyTimeout = 180;

                sbc.DestinationTableName = "dbo.STAGING_PAYMENT_MASTER";//"dbo.STAGING_PAYMENT_MASTER";
                sbc.ColumnMappings.Add("Payout ID", "PAYOUT_ID");
                sbc.ColumnMappings.Add("Transaction ID", "TRANSACTION_ID");
                sbc.ColumnMappings.Add("Transaction ID Generated Date (MM/DD/YYYY)", "TRANSACTION_ID_GEN_DATE");
                sbc.ColumnMappings.Add("Program", "PROGRAM");
                sbc.ColumnMappings.Add("Country", "COUNTRY");
                //sbc.ColumnMappings.Add("Year", "FISCAL_YEAR");
                //sbc.ColumnMappings.Add("Quarter", "QUARTER");
                //sbc.ColumnMappings.Add("Month", "MONTH");
                sbc.ColumnMappings.Add("Partner ID", "PARTNER_ID");
                sbc.ColumnMappings.Add("Partner Name", "PARTNER_NAME");
                sbc.ColumnMappings.Add("Partner English Name", "PARTNER_ENG_NAME");
                sbc.ColumnMappings.Add("ISO Currency Type", "CURR");
                sbc.ColumnMappings.Add("Payout Due", "PAYOUT_DUE");
                sbc.ColumnMappings.Add("Approving Manager", "APPROVING_MGR");
                sbc.ColumnMappings.Add("Payment Mode", "PAYMENT_MODE");
                sbc.ColumnMappings.Add("Vendor ID", "VENDOR_NO");
                sbc.ColumnMappings.Add("Invoice No", "INVOICE_NO");
                sbc.ColumnMappings.Add("Invoice Date (MM/DD/YYYY)", "INVOICE_DATE");
                sbc.ColumnMappings.Add("Eclipse Code", "ECLIPSE_CODE");
                sbc.ColumnMappings.Add("MCC", "MCC_CODE");
                sbc.ColumnMappings.Add("Credit Note PL", "CREDIT_NOTE_PL");
                sbc.ColumnMappings.Add("Remarks", "REMARKS");
                sbc.ColumnMappings.Add("ENSE", "ENSE");
                sbc.ColumnMappings.Add("DEPT", "DEPT");
                sbc.ColumnMappings.Add("SF", "SF");
                sbc.ColumnMappings.Add("PT", "PT");
                sbc.ColumnMappings.Add("PL", "PL");
                sbc.ColumnMappings.Add("Sub-PL", "SUB_PL");
                sbc.ColumnMappings.Add("ACCT", "ACCT");
                sbc.ColumnMappings.Add("Local Sub A/C", "LCL_SUB_ACCT");
                sbc.ColumnMappings.Add("IC Sub- A/C", "IC_SUB_ACCT");
                sbc.ColumnMappings.Add("Team_Name", "Team_Name");
                sbc.ColumnMappings.Add("Batch", "Batch");
                sbc.ColumnMappings.Add("SYSTEM_TYPE", "SYSTEM_TYPE");
                


                sbc.WriteToServer(excelData);
                result = result + "Staging Payment Template";
            }

            if (templatetype == "2")
            {
                newCol = new DataColumn("Team_Name", typeof(string));
                newCol.DefaultValue = Team_nm.ToString(); ;
                excelData.Columns.Add(newCol);

                newCol = new DataColumn("Batch", typeof(string));
                newCol.DefaultValue = batch.ToString();
                excelData.Columns.Add(newCol);

                newCol = new DataColumn("SYSTEM_TYPE", typeof(string));
                newCol.DefaultValue = "P1";
                excelData.Columns.Add(newCol);

                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.BulkCopyTimeout = 180;

                sbc.DestinationTableName = "dbo.STAGING_PAYMENT_MASTER";
                sbc.ColumnMappings.Add("Payout ID", "PAYOUT_ID");
                sbc.ColumnMappings.Add("Transaction ID", "TRANSACTION_ID");
                sbc.ColumnMappings.Add("Transaction ID Generated Date (MM/DD/YYYY)", "TRANSACTION_ID_GEN_DATE");
                sbc.ColumnMappings.Add("Program", "PROGRAM");
                sbc.ColumnMappings.Add("Country", "COUNTRY");
                sbc.ColumnMappings.Add("Year", "FISCAL_YEAR");
                sbc.ColumnMappings.Add("Quarter", "QUARTER");
                sbc.ColumnMappings.Add("Month", "MONTH");
                sbc.ColumnMappings.Add("Partner ID", "PARTNER_ID");
                sbc.ColumnMappings.Add("Partner Name", "PARTNER_NAME");
                sbc.ColumnMappings.Add("Partner English Name", "PARTNER_ENG_NAME");
                sbc.ColumnMappings.Add("ISO Currency Type", "CURR");
                sbc.ColumnMappings.Add("Payout Due", "PAYOUT_DUE");
                sbc.ColumnMappings.Add("Approving Manager", "APPROVING_MGR");
                sbc.ColumnMappings.Add("Payment Mode", "PAYMENT_MODE");
                sbc.ColumnMappings.Add("Vendor ID", "VENDOR_NO");
                sbc.ColumnMappings.Add("Invoice No", "INVOICE_NO");
                sbc.ColumnMappings.Add("Eclipse Code", "ECLIPSE_CODE");
                sbc.ColumnMappings.Add("MCC", "MCC_CODE");
                sbc.ColumnMappings.Add("Credit Note PL", "CREDIT_NOTE_PL");
                sbc.ColumnMappings.Add("Remarks", "REMARKS");
                sbc.ColumnMappings.Add("ENSE", "ENSE");
                sbc.ColumnMappings.Add("DEPT", "DEPT");
                sbc.ColumnMappings.Add("SF", "SF");
                sbc.ColumnMappings.Add("PT", "PT");
                sbc.ColumnMappings.Add("PL", "PL");
                sbc.ColumnMappings.Add("Sub-PL", "SUB_PL");
                sbc.ColumnMappings.Add("ACCT", "ACCT");
                sbc.ColumnMappings.Add("Local Sub A/C", "LCL_SUB_ACCT");
                sbc.ColumnMappings.Add("IC Sub- A/C", "IC_SUB_ACCT");
                sbc.ColumnMappings.Add("Target Partner ID", "TARGET_PARTNER_ID");
                sbc.ColumnMappings.Add("Target Partner English Name", "TARGET_PARTNER_ENGLISH_NAME");
                sbc.ColumnMappings.Add("Team_Name", "Team_Name");
                sbc.ColumnMappings.Add("Batch", "Batch");
                sbc.ColumnMappings.Add("SYSTEM_TYPE", "SYSTEM_TYPE");


                sbc.WriteToServer(excelData);
                result = result + "Staging Payment Template";
            }


            if (templatetype == "3")
            {
                newCol = new DataColumn("Team_Name", typeof(string));
                newCol.DefaultValue = Team_nm.ToString(); ;
                excelData.Columns.Add(newCol);

                newCol = new DataColumn("Batch", typeof(string));
                newCol.DefaultValue = batch.ToString();
                excelData.Columns.Add(newCol);

                newCol = new DataColumn("SYSTEM_TYPE", typeof(string));
                newCol.DefaultValue = "P1";
                excelData.Columns.Add(newCol);

                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.BulkCopyTimeout = 180;
                //without transaction ID
                sbc.DestinationTableName = "dbo.STAGING_PAYMENT_MASTER";
                sbc.ColumnMappings.Add("Payout ID", "PAYOUT_ID");
                sbc.ColumnMappings.Add("Transaction ID", "TRANSACTION_ID");
                sbc.ColumnMappings.Add("Transaction ID Generated Date (MM/DD/YYYY)", "TRANSACTION_ID_GEN_DATE");
                sbc.ColumnMappings.Add("Program", "PROGRAM");
                sbc.ColumnMappings.Add("Country", "COUNTRY");
                sbc.ColumnMappings.Add("Year", "FISCAL_YEAR");
                sbc.ColumnMappings.Add("Quarter", "QUARTER");
                sbc.ColumnMappings.Add("Month", "MONTH");
                sbc.ColumnMappings.Add("Partner ID", "PARTNER_ID");
                sbc.ColumnMappings.Add("Partner Name", "PARTNER_NAME");
                sbc.ColumnMappings.Add("Partner English Name", "PARTNER_ENG_NAME");
                sbc.ColumnMappings.Add("ISO Currency Type", "CURR");
                sbc.ColumnMappings.Add("Payout Due", "PAYOUT_DUE");
                sbc.ColumnMappings.Add("Approving Manager", "APPROVING_MGR");
                sbc.ColumnMappings.Add("Payment Mode", "PAYMENT_MODE");
                sbc.ColumnMappings.Add("Vendor ID", "VENDOR_NO");
                sbc.ColumnMappings.Add("Invoice No", "INVOICE_NO");
                sbc.ColumnMappings.Add("Invoice Date (MM/DD/YYYY)", "INVOICE_DATE");
                sbc.ColumnMappings.Add("Eclipse Code", "ECLIPSE_CODE");
                sbc.ColumnMappings.Add("MCC", "MCC_CODE");
                sbc.ColumnMappings.Add("Credit Note PL", "CREDIT_NOTE_PL");
                sbc.ColumnMappings.Add("Remarks", "REMARKS");
                sbc.ColumnMappings.Add("ENSE", "ENSE");
                sbc.ColumnMappings.Add("DEPT", "DEPT");
                sbc.ColumnMappings.Add("SF", "SF");
                sbc.ColumnMappings.Add("PT", "PT");
                sbc.ColumnMappings.Add("PL", "PL");
                sbc.ColumnMappings.Add("Sub-PL", "SUB_PL");
                sbc.ColumnMappings.Add("ACCT", "ACCT");
                sbc.ColumnMappings.Add("Local Sub A/C", "LCL_SUB_ACCT");
                sbc.ColumnMappings.Add("IC Sub- A/C", "IC_SUB_ACCT");
                sbc.ColumnMappings.Add("Target Partner ID", "TARGET_PARTNER_ID");
                sbc.ColumnMappings.Add("Target Partner English Name", "TARGET_PARTNER_ENGLISH_NAME");
                sbc.ColumnMappings.Add("Team_Name", "Team_Name");
                sbc.ColumnMappings.Add("Batch", "Batch");
                sbc.ColumnMappings.Add("SYSTEM_TYPE", "SYSTEM_TYPE");

                sbc.WriteToServer(excelData);
                result = result + "Staging Payment Template";
            }
            if (templatetype == "4")
            {
                newCol = new DataColumn("Team_Name", typeof(string));
                newCol.DefaultValue = Team_nm.ToString(); ;
                excelData.Columns.Add(newCol);

                newCol = new DataColumn("Batch_nm", typeof(string));
                newCol.DefaultValue = batch.ToString();
                excelData.Columns.Add(newCol);

                newCol = new DataColumn("SYSTEM_TYPE", typeof(string));
                newCol.DefaultValue = "P1";
                excelData.Columns.Add(newCol);

                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.BulkCopyTimeout = 180;
                //without transaction ID
                sbc.DestinationTableName = "dbo.STAGING_PAYMENT_MASTER";
                sbc.ColumnMappings.Add("Payout ID", "PAYOUT_ID");
                sbc.ColumnMappings.Add("TransactionID(ApprovalReq#-NIPR#)", "TRANSACTION_ID");
                sbc.ColumnMappings.Add("Transaction ID Generated Date (MM/DD/YYYY)", "TRANSACTION_ID_GEN_DATE");
                sbc.ColumnMappings.Add("Program ID", "PROGRAM");
                sbc.ColumnMappings.Add("Country", "COUNTRY");
                sbc.ColumnMappings.Add("Year - Program", "FISCAL_YEAR");
                sbc.ColumnMappings.Add("Quarter - Program", "QUARTER");
                sbc.ColumnMappings.Add("Month - Program", "MONTH");
                sbc.ColumnMappings.Add("Partner ID - partner Pro", "PARTNER_ID");
                sbc.ColumnMappings.Add("Partner Name", "PARTNER_NAME");
                sbc.ColumnMappings.Add("Partner English Name", "PARTNER_ENG_NAME");
                sbc.ColumnMappings.Add("ISO Currency Type (INR)", "CURR");
                sbc.ColumnMappings.Add("Payout Due", "PAYOUT_DUE");
                sbc.ColumnMappings.Add("VAT(%) - 0%", "VAT_PERCENTAGE");
                sbc.ColumnMappings.Add("Total Amount Due after VAT", "AMOUNT_AFTER_VAT");
                sbc.ColumnMappings.Add("WHT(%)", "WHT_PERCENTAGE");
                sbc.ColumnMappings.Add("Total Amount Payable", "TOT_AMOUNT_PAYABLE");
                sbc.ColumnMappings.Add("Approvers Email", "APPROVING_MGR");
                sbc.ColumnMappings.Add("Payment Mode (As per partner creation) DD / Bank transfer", "PAYMENT_MODE");
                sbc.ColumnMappings.Add("Vendor ID (13 Series SAP account #)", "VENDOR_NO");                
                sbc.ColumnMappings.Add("Eclipse Code (Only for credit notes)", "ECLIPSE_CODE");
                sbc.ColumnMappings.Add("MCC (Only for credit notes)", "MCC_CODE");
                sbc.ColumnMappings.Add("Credit Note PL (Only for credit notes)", "CREDIT_NOTE_PL");
                sbc.ColumnMappings.Add("Remarks (Not mandatory) - Mention if ORC & include ", "REMARKS");
                sbc.ColumnMappings.Add("ENSE ( To be gathered from Finance Team) Entity / Sub Entity", "ENSE");
                sbc.ColumnMappings.Add("DEPT", "DEPT");
                sbc.ColumnMappings.Add("SF", "SF");
                sbc.ColumnMappings.Add("PT", "PT");
                sbc.ColumnMappings.Add("PL", "PL");
                sbc.ColumnMappings.Add("Sub-PL", "SUB_PL");
                sbc.ColumnMappings.Add("ACCT", "ACCT");
                sbc.ColumnMappings.Add("Local Sub A/C", "LCL_SUB_ACCT");
                sbc.ColumnMappings.Add("IC Sub- A/C", "IC_SUB_ACCT");
                sbc.ColumnMappings.Add("Team_Name", "Team_Name");
                sbc.ColumnMappings.Add("Batch_nm", "Batch");
                sbc.ColumnMappings.Add("SYSTEM_TYPE", "SYSTEM_TYPE");


                sbc.WriteToServer(excelData);
                result = result + "Staging Payment Template";
            }

           if (templatetype == "5")
           {
               newCol = new DataColumn("Team_Name", typeof(string));
               newCol.DefaultValue = Team_nm.ToString(); ;
               excelData.Columns.Add(newCol);

               newCol = new DataColumn("Batch", typeof(string));
               newCol.DefaultValue = batch.ToString();
               excelData.Columns.Add(newCol);

               newCol = new DataColumn("SYSTEM_TYPE", typeof(string));
               newCol.DefaultValue = "MDF";
               excelData.Columns.Add(newCol);


                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.DestinationTableName = "dbo.STAGING_PAYMENT_MASTER";
                sbc.ColumnMappings.Add("PaymentId","TRANSACTION_ID");
                sbc.ColumnMappings.Add("Claim Id","PAYOUT_ID");
                sbc.ColumnMappings.Add("Partner ID","PARTNER_ID");
                sbc.ColumnMappings.Add("Partner Name","PARTNER_NAME");
                sbc.ColumnMappings.Add("Partner English Name","PARTNER_ENG_NAME");
                sbc.ColumnMappings.Add("Fiscal Period","FISCAL_YEAR");
                sbc.ColumnMappings.Add("Vendor ID","VENDOR_NO");
                sbc.ColumnMappings.Add("Approving Manager Email","APPROVING_MGR");
                sbc.ColumnMappings.Add("ISO Currency Type","CURR");
                sbc.ColumnMappings.Add("Country","COUNTRY");
                sbc.ColumnMappings.Add("ACCT","ACCT");
                sbc.ColumnMappings.Add("Local_Sub_A/C","LCL_SUB_ACCT");
                sbc.ColumnMappings.Add("IC_Sub-_A/C","IC_SUB_ACCT");
                sbc.ColumnMappings.Add("PL","PL");
                sbc.ColumnMappings.Add("Credit Note PL","CREDIT_NOTE_PL");
                sbc.ColumnMappings.Add("Program","PROGRAM");
                sbc.ColumnMappings.Add("Claim Approved Date","TRANSACTION_ID_GEN_DATE");
                sbc.ColumnMappings.Add("Payout Due","PAYOUT_DUE");
                sbc.ColumnMappings.Add("Payment Mode","PAYMENT_MODE");
                sbc.ColumnMappings.Add("Profit Center", "PROFIT_CENTER");
                sbc.ColumnMappings.Add("Cost Center","ENSE");


                sbc.ColumnMappings.Add("Team_Name", "Team_Name");
                sbc.ColumnMappings.Add("Batch", "Batch");
                sbc.ColumnMappings.Add("SYSTEM_TYPE", "SYSTEM_TYPE");

                sbc.WriteToServer(excelData); 
                result = result + "Staging Payment Template"; 
            }

            //varun needed and should copy to guru
            
            if (templatetype == "6")
            {
                newCol = new DataColumn("Batch", typeof(string));
                newCol.DefaultValue = batch.ToString();
                excelData.Columns.Add(newCol);


                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.DestinationTableName = "dbo.STAGING_PAYMENT_MASTER";
                sbc.ColumnMappings.Add("REF_NO", "REF_NO");
                sbc.ColumnMappings.Add("PAYOUT_ID", "PAYOUT_ID");
                sbc.ColumnMappings.Add("TRANSACTION_ID", "TRANSACTION_ID");
                sbc.ColumnMappings.Add("TRANSACTION_ID_GEN_DATE", "TRANSACTION_ID_GEN_DATE");
                sbc.ColumnMappings.Add("PAYOUT_DUE", "PAYOUT_DUE");
                sbc.ColumnMappings.Add("PROGRAM", "PROGRAM");
                sbc.ColumnMappings.Add("ENSE", "ENSE");
                sbc.ColumnMappings.Add("DEPT", "DEPT");
                sbc.ColumnMappings.Add("SF", "SF");
                sbc.ColumnMappings.Add("PT", "PT");
                sbc.ColumnMappings.Add("PL", "PL");
                sbc.ColumnMappings.Add("SUB_PL", "SUB_PL");
                sbc.ColumnMappings.Add("ACCT", "ACCT");
                sbc.ColumnMappings.Add("LCL_SUB_ACCT", "LCL_SUB_ACCT");
                sbc.ColumnMappings.Add("IC_SUB_ACCT", "IC_SUB_ACCT");
                sbc.ColumnMappings.Add("Batch", "Batch");


                sbc.WriteToServer(excelData);
                result = result + "Staging Payment Template"; 
            }

            if (templatetype == "7")
            {
                newCol = new DataColumn("Batch", typeof(string));
                newCol.DefaultValue = batch.ToString();
                excelData.Columns.Add(newCol);


                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.DestinationTableName = "dbo.STAGING_PAYMENT_MASTER";
                sbc.ColumnMappings.Add("REF_NO", "REF_NO");
                sbc.ColumnMappings.Add("PAYOUT_ID", "PAYOUT_ID");
                sbc.ColumnMappings.Add("INVOICE_NO", "INVOICE_NO");
                sbc.ColumnMappings.Add("INVOICE_NO", "WWAS_FLAG");
                sbc.ColumnMappings.Add("INVOICE_DATE", "INVOICE_DATE");
                sbc.ColumnMappings.Add("VAT_PERCENTAGE", "VAT_PERCENTAGE");
                sbc.ColumnMappings.Add("WHT_PERCENTAGE", "WHT_PERCENTAGE");
                sbc.ColumnMappings.Add("PAYOUT_DUE", "PAYOUT_DUE");
                sbc.ColumnMappings.Add("Batch", "Batch");
                sbc.ColumnMappings.Add("REMARKS", "REMARKS");


                sbc.WriteToServer(excelData);
                result = result + "Staging Payment Template"; 
            }

            if (templatetype == "8")
            {
                newCol = new DataColumn("Batch", typeof(string));
                newCol.DefaultValue = batch.ToString();
                excelData.Columns.Add(newCol);


                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.DestinationTableName = "dbo.STAGING_PAYMENT_MASTER";
                sbc.ColumnMappings.Add("REF_NO", "REF_NO");
                sbc.ColumnMappings.Add("PAYOUT_ID", "PAYOUT_ID");
                sbc.ColumnMappings.Add("Credit Note No", "CLEARING_DOC_NO");
                sbc.ColumnMappings.Add("Credit Note No", "CHECK_REFERENCE");
                sbc.ColumnMappings.Add("Batch", "Batch");
                sbc.ColumnMappings.Add("Credit Note Date (MM/DD/YYYY)", "CLEARING_DATE");
                sbc.ColumnMappings.Add("Credit Note Date (MM/DD/YYYY)", "VALUE_DATE");
                sbc.ColumnMappings.Add("Order Ref No", "SAP_DOC_NO");
                sbc.ColumnMappings.Add("Remarks from ITH/CRO", "REMARKS_FRM_PMT_OFFICE");
         

                sbc.WriteToServer(excelData);
                result = result + "Staging Payment Template"; 
            }

            if (templatetype == "9")
            {
                newCol = new DataColumn("Batch", typeof(string));
                newCol.DefaultValue = batch.ToString();
                excelData.Columns.Add(newCol);


                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.DestinationTableName = "dbo.STAGING_PAYMENT_MASTER";
                sbc.ColumnMappings.Add("Payout ID", "PAYOUT_ID");
                sbc.ColumnMappings.Add("Program", "PROGRAM");
                sbc.ColumnMappings.Add("Country", "COUNTRY");
                sbc.ColumnMappings.Add("Year", "FISCAL_YEAR");
                sbc.ColumnMappings.Add("Quarter", "QUARTER");
                sbc.ColumnMappings.Add("Partner ID", "PARTNER_ID");
                sbc.ColumnMappings.Add("Partner Name", "PARTNER_NAME");
                sbc.ColumnMappings.Add("Partner English Name", "PARTNER_ENG_NAME");
                sbc.ColumnMappings.Add("ISO Currency Type", "CURR");
                sbc.ColumnMappings.Add("Split Amount", "PAYOUT_DUE");
                sbc.ColumnMappings.Add("MCC", "MCC_CODE");
                sbc.ColumnMappings.Add("Credit Note PL", "CREDIT_NOTE_PL");
                sbc.ColumnMappings.Add("PL (Cheque/TT)", "PL");
                sbc.ColumnMappings.Add("Part No", "REMARKS");
                sbc.ColumnMappings.Add("Payout Due", "AMOUNT_AFTER_VAT");
                sbc.ColumnMappings.Add("Batch", "Batch");

                sbc.WriteToServer(excelData);
                result = result + "Staging Payment Template"; 
            }
            if (templatetype == "10")
            {
                //newCol = new DataColumn("UPDATED_DATE", typeof(DateTime));
                //newCol.DefaultValue = DateTime.Today.ToString("MM/dd/yyyy");
                //excelData.Columns.Add(newCol);

                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.DestinationTableName = "APAC_USER.ALT_NAME_APACPAY";
                sbc.ColumnMappings.Add("COUNTRY", "COUNTRY");
                sbc.ColumnMappings.Add("VENDOR_NO", "VENDOR_NO");
                sbc.ColumnMappings.Add("PARTNER_ID", "PARTNER_ID");
               

                sbc.WriteToServer(excelData);
                result = "APAC_USER.ALT_NAME_APACPAY Template";
            }
            if (templatetype == "11")
            {
                //newCol = new DataColumn("UPDATED_DATE", typeof(DateTime));
                //newCol.DefaultValue = DateTime.Today.ToString("MM/dd/yyyy");
                //excelData.Columns.Add(newCol);

                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.DestinationTableName = "APAC_USER.WWAS_LIMITS_MASTER_APACPAY";
                sbc.ColumnMappings.Add("MANAGER_NAME", "MANAGER_NAME");
                sbc.ColumnMappings.Add("MANAGER_EMAIL_ID", "MANAGER_EMAIL_ID");
                sbc.ColumnMappings.Add("LIMIT_USD", "LIMIT_USD");
                sbc.ColumnMappings.Add("LIMIT_LOCAL_CURR", "LIMIT_LOCAL_CURR");
                sbc.ColumnMappings.Add("COUNTRY", "COUNTRY");
                


                sbc.WriteToServer(excelData);
                result = "APAC_USER.WWAS_LIMITS_MASTER_APACPAY Template";
            }

            if (templatetype == "12")
            {

                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.DestinationTableName = "APACPPP_USER.PPRO_VENID_MATCH_APACPPP";
                sbc.ColumnMappings.Add("PARTNER_PRO_ID", "PARTNER_PRO_ID");
                sbc.ColumnMappings.Add("CYSIS_ID_USD", "CYSIS_ID_USD");
                sbc.ColumnMappings.Add("CYSIS_ID_LC", "CYSIS_ID_LC");
                sbc.ColumnMappings.Add("VENDOR_ID_USD", "VENDOR_ID_USD");
                sbc.ColumnMappings.Add("VENDOR_ID_LC", "VENDOR_ID_LC");
                sbc.ColumnMappings.Add("COUNTRY", "COUNTRY");
                sbc.ColumnMappings.Add("PAYMENT_MODE", "PAYMENT_MODE");
                sbc.ColumnMappings.Add("REMARKS", "REMARKS");
                
                

                sbc.WriteToServer(excelData);
                result = "APACPPP_USER.PPRO_VENID_MATCH_APACPPP Template";
            }

            if (templatetype == "13")
            {

                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.DestinationTableName = "dbo.Payment_Method_Tbl";
                sbc.ColumnMappings.Add("Program_Type", "Program_Type");
                sbc.ColumnMappings.Add("Country_Code", "Country_Code");
                sbc.ColumnMappings.Add("Payment_Mode", "Payment_Mode");
                sbc.ColumnMappings.Add("Payment_Method", "Payment_Method");
                
               

                sbc.WriteToServer(excelData);
                result = "Payment_Method_Tbl Template";
            }

            if (templatetype == "14")
            {
                //newCol = new DataColumn("UPDATED_DATE", typeof(DateTime));
                //newCol.DefaultValue = DateTime.Today.ToString("MM/dd/yyyy");
                //excelData.Columns.Add(newCol);

                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.DestinationTableName = "dbo.PAYMENT_MODE_TBL";
                sbc.ColumnMappings.Add("Program_Type", "Program_Type");
                sbc.ColumnMappings.Add("COUNTRY_CODE", "COUNTRY_CODE");
                sbc.ColumnMappings.Add("PROGRAM", "PROGRAM");
                sbc.ColumnMappings.Add("PARTNER_PRO_ID", "PARTNER_PRO_ID");
                sbc.ColumnMappings.Add("PAYMENT_MODE", "PAYMENT_MODE");
                
               

                sbc.WriteToServer(excelData);
                result = "PAYMENT_MODE_TBL Template";
            }
           
            if (templatetype == "15")
            {
                //newCol = new DataColumn("UPDATED_DATE", typeof(DateTime));
                //newCol.DefaultValue = DateTime.Today.ToString("MM/dd/yyyy");
                //excelData.Columns.Add(newCol);

                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.DestinationTableName = "dbo.Spl_Handling_Tbl";
                sbc.ColumnMappings.Add("Program_Type", "Program_Type");
                sbc.ColumnMappings.Add("COUNTRY_CODE", "COUNTRY_CODE");
                sbc.ColumnMappings.Add("PROGRAM", "PROGRAM");
                sbc.ColumnMappings.Add("PARTNER_PRO_ID", "PARTNER_PRO_ID");
                sbc.ColumnMappings.Add("PAYMENT_MODE", "PAYMENT_MODE");
                sbc.ColumnMappings.Add("Curr", "Curr");
                sbc.ColumnMappings.Add("VAT", "VAT");
                sbc.ColumnMappings.Add("WHT", "WHT");
                sbc.ColumnMappings.Add("VAT_Code", "VAT_Code");
                sbc.ColumnMappings.Add("WHT_Code", "WHT_Code");
                sbc.ColumnMappings.Add("REMARKS", "REMARKS");
                sbc.ColumnMappings.Add("INVOICE", "INVOICE");
                sbc.ColumnMappings.Add("SPLIT", "SPLIT");
                



                sbc.WriteToServer(excelData);
                result = "Spl_Handling_Tbl Template";
            }
            if (templatetype == "16")
            {
                //newCol = new DataColumn("UPDATED_DATE", typeof(DateTime));
                //newCol.DefaultValue = DateTime.Today.ToString("MM/dd/yyyy");
                //excelData.Columns.Add(newCol);

                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.DestinationTableName = "dbo.Default_Spl_Hndl";
                sbc.ColumnMappings.Add("Program_Type", "Program_Type");
                sbc.ColumnMappings.Add("COUNTRY_CODE", "COUNTRY_CODE");
                sbc.ColumnMappings.Add("PAYMENT_MODE", "PAYMENT_MODE");
                sbc.ColumnMappings.Add("VAT", "VAT");
                sbc.ColumnMappings.Add("WHT", "WHT");
                sbc.ColumnMappings.Add("VAT_Code", "VAT_Code");
                sbc.ColumnMappings.Add("WHT_Code", "WHT_Code");
                sbc.ColumnMappings.Add("REMARKS", "REMARKS");
                sbc.ColumnMappings.Add("INVOICE", "INVOICE");
                sbc.ColumnMappings.Add("SPLIT", "SPLIT");

                sbc.WriteToServer(excelData);
                result = "Default_Spl_Hndl Template";
            }
            if (templatetype == "17")
            {
                //newCol = new DataColumn("UPDATED_DATE", typeof(DateTime));
                //newCol.DefaultValue = DateTime.Today.ToString("MM/dd/yyyy");
                //excelData.Columns.Add(newCol);

                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.DestinationTableName = "dbo.WWAS_EX_RATE";
                sbc.ColumnMappings.Add("COUNTRY", "COUNTRY");
                sbc.ColumnMappings.Add("CURRENCY", "CURRENCY");
                sbc.ColumnMappings.Add("EX_RATE", "EX_RATE");




                sbc.WriteToServer(excelData);
                result = "WWAS_EX_RATE Template";
            }
            if (templatetype == "18")
            {
                //newCol = new DataColumn("UPDATED_DATE", typeof(DateTime));
                //newCol.DefaultValue = DateTime.Today.ToString("MM/dd/yyyy");
                //excelData.Columns.Add(newCol);

                SqlBulkCopy sbc = new SqlBulkCopy(constring());
                sbc.DestinationTableName = "dbo.TRESHOLD_MATRIX";
                sbc.ColumnMappings.Add("Team_Name", "Team_Name");
                sbc.ColumnMappings.Add("COUNTRY_CODE", "COUNTRY_CODE");
                sbc.ColumnMappings.Add("PL_LIMIT_USD", "PL_LIMIT_USD");
                sbc.ColumnMappings.Add("MANAGER_LIMIT_USD", "MANAGER_LIMIT_USD");
                sbc.ColumnMappings.Add("PL_EMAIL_ID", "PL_EMAIL_ID");
                sbc.ColumnMappings.Add("MANAGER_EMAIL_ID", "MANAGER_EMAIL_ID");
               




                sbc.WriteToServer(excelData);
                result = "TRESHOLD_MATRIX Template";
            }
            return result;
        }

        public string SendMail1(string tomailId, string fromId, string subject, string bodyText, string attach)
        {
            try
            {

                System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                message.From = new MailAddress(fromId);
                message.To.Add(new MailAddress(tomailId));
                Attachment item = new Attachment(attach);
                message.Attachments.Add(item);
                message.Subject = subject;
                message.Body = bodyText;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient();
                client.Host = "smtp1.hp.com";
                client.Port = 25;
                client.Send(message);
                return "successfull";
            }
            catch (Exception e)
            {
                return e.Message.ToString();
            }
        }

        //public string SendMail(string tomailId, string fromId, string subject, string bodyText, string attach)
        //{

        //Word.Document doc = Globals.ThisAddIn.Application.ActiveDocument;

        ////check if there is a document open within the currenct application
        //if (doc == null)
        //{
        //    return;
        //}

        ////create a new document which need to be saved as html document lateer
        //Word.Document docHTML = Globals.ThisAddIn.Application.Documents.Add();
        //doc.Content.Copy();
        //Word.Range rngHTML = docHTML.Content;
        //rngHTML.Paste();

        //string fullName = doc.Path + @"\Temp.htm";
        //docHTML.SaveAs2(fullName, Word.WdSaveFormat.wdFormatHTML);

        //docHTML.Close();
        //docHTML = null;


        ////configure the message and client objects
        //string server = "smtp.gmail.com";
        //SmtpClient client = new SmtpClient(server, 587);
        //string fromAddress = "mygmailaccount@gmail.com";
        //MailAddress from = new MailAddress(fromAddress);
        //MailMessage message = new MailMessage();
        //message.From = from;
        //message.To.Add(new MailAddress("myhotmailaccount@hotmail.com"));

        //message.Subject = "Report from Word";

        ////specify this property to true
        //message.IsBodyHtml = true;
        //message.Body = RetrieveStream(fullName);
        //client.EnableSsl = true;
        //client.Credentials = new System.Net.NetworkCredential(fromAddress, "password of gmail account");


        //client.Send(message);
        //message.Dispose();

        ////delete the temp file after all the procedures has been done
        //File.Delete(fullName);

        //}

        //the method to read html document

        public string RetrieveStream(string FullName)
        {
            string stream = null;
            using (StreamReader sr = new StreamReader(FullName))
            {
                string line = null;
                while ((line = sr.ReadLine()) != null)
                {
                    stream += line;
                }
            }

            return stream;
        }

        public System.Data.DataTable ReadTextFile(string strFilePath)
        {
            System.Data.DataTable dt = new System.Data.DataTable();

            StreamReader sr = new StreamReader(strFilePath);
            int cnt = 0;
            int colcnt = 0;
            while ((sr.ReadLine()) != null)
            {

                string rowValue = sr.ReadLine();
                string[] str = rowValue.Split('\t');
                if (cnt == 0)
                {
                    for (int i = 0; i < str.Length; i++)
                    {
                        dt.Columns.Add(str[i].ToString(), typeof(string));
                        colcnt++;
                    }
                    cnt++;
                }
                if (cnt > 0)
                {
                    DataRow dr = dt.NewRow();
                    for (int j = 0; j < colcnt; j++)
                    {
                        dr["TestFileData"] = sr.ReadLine();
                    }
                    dt.Rows.Add(dr);
                }
            }
            sr.Close();
            return dt;
        }
        //Modified on 7th-Nov-2013
        //public string getPDFInvoice(string pproid, string batch, string country, string CountryCode, string fullpath, string InvoiceMethod, string PaymentMethodPrg, string fullpathAttach)
        //{
        //    RHcls rh = new RHcls();
        //    string WordFileName = "";
        //    System.Data.DataTable dt = new System.Data.DataTable();
        //    if (PaymentMethodPrg == "SPS")
        //    {

        //    }
        //    dt = rh.getData("SELECT WORD_NAME FROM ASP_USER.COMMUNICATION_MASTER_TEMPLATE WHERE COUNTRY ='" + country + "' AND PROGRAM ='" + PaymentMethodPrg + "' AND INVOICE_METHOD ='" + InvoiceMethod + "'");
        //    WordFileName = dt.Rows[0]["WORD_NAME"].ToString();


        //    Microsoft.Office.Interop.Word.Application wrdApp = new Microsoft.Office.Interop.Word.Application();
        //    Document wrdObject = new Microsoft.Office.Interop.Word.Document();
        //    ParagraphFormat wrdParaFrmt = new Microsoft.Office.Interop.Word.ParagraphFormat();
        //    WdTabAlignment tab = new Microsoft.Office.Interop.Word.WdTabAlignment();
        //    object filename = fullpath + WordFileName;
        //    //object filename = "C:\\WORK_FOLDER\\RH_WEB_SOURCE\\RH3T\\Test\\Comp\\docs\\" + WordFileName;


        //    object missing = System.Reflection.Missing.Value;

        //    //Query to get the payment details
        //    string strPaymentDetailsQuery = "Select VENDOR_NUMBER,VENDOR_NAME,COUNTRY, INVOICE_NUMBER, INVOICE_NUMBER1, PARTNER_PRO_ID, PROGRAM_NAME, PERIOD_SHORT, TARGET, ACTUAL, BONUS, CURRENCY, VAT_PER, PROGRAM_SUMMARY, SUM(GROSS_AMOUNT) AS GROSS_AMOUNT, SUM(GROSS_AMOUNT) - SUM(NET_AMOUNT) AS VAT_AMOUNT, SUM(NET_AMOUNT) AS NET_AMOUNT, PAYMENT_METHOD from ASP_USER.TRANS_MASTER_EMEAPAY where PARTNER_PRO_ID = '" + pproid + "' and BATCH = '" + batch + "' GROUP BY VENDOR_NAME, COUNTRY,PARTNER_PRO_ID, PROGRAM_NAME, PERIOD_SHORT, CURRENCY, VAT_PER, PROGRAM_SUMMARY, TARGET, ACTUAL,PAYMENT_METHOD, VENDOR_NUMBER,BONUS, INVOICE_NUMBER, INVOICE_NUMBER1 ORDER BY PERIOD_SHORT";
        //    System.Data.DataTable PaymentDt = getData(strPaymentDetailsQuery);
        //    //rh.getData(strPaymentDetailsQuery);
        //    Double TotalGrossAmount = 0;
        //    Double TotalNetAmount = 0;
        //    Double TotalVATAmount = 0;
        //    for (int i = 0; i < PaymentDt.Rows.Count; i++)
        //    {
        //        TotalGrossAmount = TotalGrossAmount + Convert.ToDouble(PaymentDt.Rows[i]["GROSS_AMOUNT"].ToString());
        //        TotalNetAmount = TotalNetAmount + Convert.ToDouble(PaymentDt.Rows[i]["NET_AMOUNT"].ToString());
        //        TotalVATAmount = TotalVATAmount + Convert.ToDouble(PaymentDt.Rows[i]["VAT_AMOUNT"].ToString());
        //    }
        //    System.Data.DataTable VendorDt = new System.Data.DataTable();
        //    //Query to get the Vendor contact details and Bank details
        //    if (CountryCode == "CH00")
        //    {
        //        string strVendorDetailsQuery = "Select PARTNER_EMAIL_ID, PARTNER_EMAIL_ID1, VENDOR_NAME,ADDRESS1,ADDRESS2,ADDRESS3, BANK_NAME, CONTACT_PERSON_FNAME, CONTACT_PERSON_LNAME, CONTACT_PERSON_GREETING,PARTNER_VAT_NUMBER,SWIFT_CODE,IBAN, SWIFT_CODE, BANK_ID, DOMICILE, COMPANY_ID, TAX_ID, ACCOUNT_NUMBER, COUNTRY FROM ASP_USER.VENDOR_MASTER_EMEAPAY WHERE PARTNER_PRO_ID = '" + pproid + "'";
        //        VendorDt = getData(strVendorDetailsQuery);
        //    }
        //    else
        //    {
        //        string strVendorDetailsQuery = "Select PARTNER_EMAIL_ID, PARTNER_EMAIL_ID1, VENDOR_NAME,ADDRESS1,ADDRESS2,ADDRESS3, BANK_NAME, CONTACT_PERSON_FNAME, CONTACT_PERSON_LNAME, CONTACT_PERSON_GREETING,PARTNER_VAT_NUMBER,SWIFT_CODE,IBAN, SWIFT_CODE, BANK_ID, DOMICILE, COMPANY_ID, TAX_ID, ACCOUNT_NUMBER, COUNTRY FROM ASP_USER.VENDOR_MASTER_EMEAPAY_LOCAL WHERE PARTNER_PRO_ID = '" + pproid + "'";
        //        VendorDt = getData(strVendorDetailsQuery);
        //    }

        //    //rh.getData(strVendorDetailsQuery);

        //    //Query to get the HP Organization details
        //    string strHPOrgQuery = "Select * FROM ASP_USER.HP_ORG_MASTER WHERE COUNTRY = '" + country + "' and COUNTRY_CODE = '" + CountryCode + "'";
        //    System.Data.DataTable HPOrgDt = getData(strHPOrgQuery);
        //    //rh.getData(strHPOrgQuery);

        //    string VendorName = PaymentDt.Rows[0]["VENDOR_NAME"].ToString();
        //    string VendorNumber = PaymentDt.Rows[0]["VENDOR_NUMBER"].ToString();
        //    string PeriodShort = PaymentDt.Rows[0]["PERIOD_SHORT"].ToString();
        //    string PaymentMethod = PaymentDt.Rows[0]["PAYMENT_METHOD"].ToString();
        //    string InvoiceNumber = PaymentDt.Rows[0]["INVOICE_NUMBER"].ToString();
        //    string InvoiceNumber1 = PaymentDt.Rows[0]["INVOICE_NUMBER1"].ToString();
        //    string Address1 = VendorDt.Rows[0]["ADDRESS1"].ToString();
        //    string Address2 = VendorDt.Rows[0]["ADDRESS2"].ToString();
        //    string Address3 = VendorDt.Rows[0]["ADDRESS3"].ToString();
        //    string VendorNameLegal = VendorDt.Rows[0]["VENDOR_NAME"].ToString();
        //    string Country = VendorDt.Rows[0]["COUNTRY"].ToString();
        //    string PartnerVATNumber = VendorDt.Rows[0]["PARTNER_VAT_NUMBER"].ToString();
        //    string BankName = VendorDt.Rows[0]["BANK_NAME"].ToString();
        //    string IBAN = VendorDt.Rows[0]["IBAN"].ToString();
        //    string SwiftCode = VendorDt.Rows[0]["SWIFT_CODE"].ToString();
        //    string AccountNumber = VendorDt.Rows[0]["ACCOUNT_NUMBER"].ToString();
        //    string Currency = PaymentDt.Rows[0]["CURRENCY"].ToString();
        //    string HPEntity = HPOrgDt.Rows[0]["CUSTOMER_NAME"].ToString();
        //    string EntityAddress1 = HPOrgDt.Rows[0]["ADDRESS1"].ToString();
        //    string EntityAddress2 = HPOrgDt.Rows[0]["ADDRESS2"].ToString();
        //    string EntityAddress3 = HPOrgDt.Rows[0]["ADDRESS3"].ToString();
        //    string HPVATID = HPOrgDt.Rows[0]["VAT_ID"].ToString();
        //    string ToID = VendorDt.Rows[0]["PARTNER_EMAIL_ID"].ToString();
        //    string CCID = VendorDt.Rows[0]["PARTNER_EMAIL_ID1"].ToString();
        //    string FromID = "";
        //    string InvNum = "";
        //    if (InvoiceNumber1 == "0")
        //    {
        //        InvNum = InvoiceNumber;
        //    }
        //    else
        //    {
        //        InvNum = InvoiceNumber + InvoiceNumber1;
        //    }

        //    int adddays5 = 0;
        //    int adddays15 = 0;
        //    string day = DateTime.Today.ToString("ddd");

        //    if (day == "Mon")
        //    {
        //        adddays5 = 4;
        //        adddays15 = 11;
        //    }
        //    if (day == "Sun")
        //    {
        //        adddays5 = 5;
        //        adddays15 = 12;
        //    }
        //    if (day != "Mon" || day != "Sun")
        //    {
        //        adddays5 = 6;
        //        adddays15 = 13;
        //    }

        //    //string TodaysDate = DateTime.Today.ToString("dd-MMM-yyyy");
        //    //string TodaysDate5workdays = DateTime.Today.AddDays(adddays5).ToString("dd-MMM-yyyy");
        //    //string TodaysDate15workdays = DateTime.Today.AddDays(adddays15).ToString("dd-MMM-yyyy");

        //    string TodaysDate = DateTime.Today.ToString("dd-MMM-yyyy");
        //    string TodaysDate5workdays = DateTime.Today.AddDays(7).ToString("dd-MMM-yyyy");
        //    string TodaysDate15workdays = DateTime.Today.AddDays(15).ToString("dd-MMM-yyyy");


        //    try
        //    {

        //        wrdObject = wrdApp.Documents.Open(filename);
        //        //wrdObject = wrdApp.Documents.Open(filename, ReadOnly:true);
        //        //wrdApp.Visible = true;
        //        //wrdApp.ActiveDocument.PageSetup.LeftMargin = 50;
        //        //wrdApp.ActiveDocument.PageSetup.RightMargin = 50;
        //        //wrdApp.ActiveDocument.PageSetup.TopMargin = 50;
        //        //wrdApp.ActiveDocument.PageSetup.BottomMargin = 50;
        //        //wrdApp.Selection.MoveRight();
        //        //wrdApp.Selection.MoveRight();
        //        //wrdApp.Selection.Font.Name = "HP Simplified";
        //        //wrdApp.Selection.Font.Size = 14;
        //        //wrdApp.Selection.ParagraphFormat.Alignment = WdParagraphAlignment.wdAlignParagraphLeft;
        //        //wrdApp.Selection.TypeText(Text: "VendorName : Partner pro ID");

        //        wrdApp.Selection.WholeStory();
        //        wrdApp.Selection.Font.Name = "HP Simplified";
        //        wrdApp.Selection.Find.ClearFormatting();

        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<CurrentDate>>";
        //            pp.Replacement.Text = TodaysDate;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<VendorName>>";
        //            pp.Replacement.Text = VendorNameLegal;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<Address1>>";
        //            pp.Replacement.Text = Address1;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<Address2>>";
        //            pp.Replacement.Text = Address2;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<Address3>>";
        //            pp.Replacement.Text = Address3;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<Country>>";
        //            pp.Replacement.Text = Country;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<PartnerVATNumber>>";
        //            pp.Replacement.Text = PartnerVATNumber;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));

        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<BankName>>";
        //            pp.Replacement.Text = BankName;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<IBAN>>";
        //            pp.Replacement.Text = IBAN;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<SwiftCode>>";
        //            pp.Replacement.Text = SwiftCode;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<AccountNumber>>";
        //            pp.Replacement.Text = AccountNumber;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<CCurrency>>";
        //            pp.Replacement.Text = Currency;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<HPEntity>>";
        //            pp.Replacement.Text = HPEntity;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<EntityAddress1>>";
        //            pp.Replacement.Text = EntityAddress1;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<EntityAddress2>>";
        //            pp.Replacement.Text = EntityAddress2;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<EntityAddress3>>";
        //            pp.Replacement.Text = EntityAddress3;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<HPVATID>>";
        //            pp.Replacement.Text = HPVATID;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<TodaysDate>>";
        //            pp.Replacement.Text = TodaysDate;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<VendorNumber>>";
        //            pp.Replacement.Text = VendorNumber;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<InvoiceNumber>>";
        //            pp.Replacement.Text = InvNum;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<DateDue>>";
        //            pp.Replacement.Text = TodaysDate15workdays;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<PartnerProID>>";
        //            pp.Replacement.Text = pproid;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<PeriodShort>>";
        //            pp.Replacement.Text = PeriodShort;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<TotalNetAmount>>";
        //            pp.Replacement.Text = Convert.ToString(TotalNetAmount);
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<TotalVATAmount>>";
        //            pp.Replacement.Text = Convert.ToString(TotalVATAmount);
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        //{
        //        //    var pp = wrdApp.Selection.Find;
        //        //    pp.Text = "<<TotalGrossAmount>>";
        //        //    pp.Replacement.Text = Convert.ToString(TotalGrossAmount);
        //        //}
        //        //wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        //{
        //        //    var pp = wrdApp.Selection.Find;
        //        //    pp.Text = "<<Currency>>";
        //        //    pp.Replacement.Text = Currency;
        //        //}
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<TotalGrossAmount>>";
        //            pp.Replacement.Text = Convert.ToString(TotalGrossAmount);
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "ProgramLoop";
        //            pp.Replacement.Text = "";
        //        }
        //        wrdApp.Selection.Find.Execute();

        //        wrdApp.Selection.Delete();
        //        //wrdApp.Selection.MoveRight();
        //        //wrdApp.Selection.MoveRight();

        //        for (int i = 0; i < PaymentDt.Rows.Count; i++)
        //        {
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["PROGRAM_NAME"].ToString()));
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["PERIOD_SHORT"].ToString()));
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["TARGET"].ToString()));
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["ACTUAL"].ToString()));
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["BONUS"].ToString()));
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["VAT_PER"].ToString()));
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["GROSS_AMOUNT"].ToString()));
        //            wrdApp.Selection.InsertRowsBelow(1);
        //            wrdApp.Selection.MoveLeft();
        //        }
        //        wrdApp.Selection.SelectRow();
        //        wrdApp.Selection.Cells.Merge();

        //        string strfilename = fullpath + pproid + "_" + PeriodShort + ".pdf";
        //        string strfilename1 = fullpathAttach + pproid + "_" + PeriodShort + ".pdf";
        //        string strpdfname = pproid + "_" + PeriodShort + ".pdf";

        //        string fileattachpath = pproid + "_" + PeriodShort + ".pdf";
        //        //wrdApp.Selection.WholeStory();
        //        //wrdApp.Selection.Copy();

        //        wrdApp.ActiveDocument.SaveAs(strfilename1, FileFormat: WdExportFormat.wdExportFormatPDF);

        //        return strfilename1 + "|" + PeriodShort + "|" + PaymentMethod + "|" + VendorName + "|" + strpdfname + "|" + fileattachpath;
        //        //wrdApp.ActiveDocument.Close(SaveChanges:(false));

        //        //attach.Text = partnerproid + "_" + PaymentMethod + "_" + PeriodShort + ".pdf";
        //        ////attach.NavigateUrl = "http://localhost:64739/Comp/docs/" + partnerproid + ".doc";
        //        //attach.NavigateUrl = "http://localhost:64739/Comp/docs/" + partnerproid + "_" + PeriodShort + ".pdf";

        //        //HFPPID.Value = partnerproid;
        //    }
        //    catch (System.Exception ex)
        //    {
        //        return ex.Message.ToString();
        //    }
        //    finally
        //    {
        //        wrdObject.Close(SaveChanges: (false));
        //        wrdApp.Quit();

        //    }
        //}

        //public string getCreditNote(string pproid, string batch, string country, string CountryCode, string fullpath, string InvoiceMethod, string PaymentMethodPrg, string fullpathAttach, string invNum1, string invNum)
        //{
        //    RHcls rh = new RHcls();
        //    string WordFileName = "";
        //    System.Data.DataTable dt = new System.Data.DataTable();

        //    dt = rh.getData("SELECT WORD_NAME FROM ASP_USER.COMMUNICATION_MASTER_TEMPLATE WHERE COUNTRY ='" + country + "' AND PROGRAM ='CREDITNOTE'");
        //    WordFileName = dt.Rows[0]["WORD_NAME"].ToString();


        //    Microsoft.Office.Interop.Word.Application wrdApp = new Microsoft.Office.Interop.Word.Application();
        //    Document wrdObject = new Microsoft.Office.Interop.Word.Document();
        //    ParagraphFormat wrdParaFrmt = new Microsoft.Office.Interop.Word.ParagraphFormat();
        //    WdTabAlignment tab = new Microsoft.Office.Interop.Word.WdTabAlignment();
        //    object filename = fullpath + WordFileName;
        //    //object filename = "C:\\WORK_FOLDER\\RH_WEB_SOURCE\\RH3T\\Test\\Comp\\docs\\" + WordFileName;


        //    object missing = System.Reflection.Missing.Value;

        //    //Query to get the payment details
        //    string strPaymentDetailsQuery = "SELECT EMAIL_ID, SUM(GROSS_AMOUNT) - SUM(NET_AMOUNT) AS VAT_AMOUNT, replace(convert(varchar(11), INVOICE_REQ_SENT_DATE, 106),' ','-') as INVOICE_REQ_SENT_DATE,  VENDOR_NAME, VALUE_DATE, PARTNER_PRO_ID, PROGRAM_NAME, PERIOD_SHORT, CONTACT_PERSON, SUM(NET_AMOUNT) AS NET_AMOUNT, SUM(GROSS_AMOUNT) AS GROSS_AMOUNT FROM ASP_USER.TRANS_MASTER_EMEAPAY WHERE INVOICE_NUMBER = '" + invNum + "' AND INVOICE_NUMBER1 = '" + invNum1 + "' AND PROCESSING_STATUS = 'C' AND CREDIT_NOTE_SENT_STATUS = 'O' GROUP BY EMAIL_ID, INVOICE_REQ_SENT_DATE,  VENDOR_NAME, VALUE_DATE, PERIOD_SHORT, PARTNER_PRO_ID, PROGRAM_NAME, CONTACT_PERSON ORDER BY PROGRAM_NAME";
        //    System.Data.DataTable PaymentDt = rh.getData(strPaymentDetailsQuery);
        //    //rh.getData(strPaymentDetailsQuery);
        //    Double TotalGrossAmount = 0;
        //    Double TotalNetAmount = 0;
        //    Double TotalVATAmount = 0;
        //    for (int i = 0; i < PaymentDt.Rows.Count; i++)
        //    {
        //        TotalGrossAmount = TotalGrossAmount + Convert.ToDouble(PaymentDt.Rows[i]["GROSS_AMOUNT"].ToString());
        //        TotalNetAmount = TotalNetAmount + Convert.ToDouble(PaymentDt.Rows[i]["NET_AMOUNT"].ToString());
        //        TotalVATAmount = TotalVATAmount + Convert.ToDouble(PaymentDt.Rows[i]["VAT_AMOUNT"].ToString());
        //    }
        //    System.Data.DataTable VendorDt = new System.Data.DataTable();
        //    //Query to get the Vendor contact details and Bank details
        //    if (CountryCode == "CH00")
        //    {
        //        string strVendorDetailsQuery = "Select PARTNER_EMAIL_ID, PARTNER_EMAIL_ID1, VENDOR_NAME,ADDRESS1,ADDRESS2,ADDRESS3, BANK_NAME, CONTACT_PERSON_FNAME, CONTACT_PERSON_LNAME, CONTACT_PERSON_GREETING,PARTNER_VAT_NUMBER,SWIFT_CODE,IBAN, SWIFT_CODE, BANK_ID, DOMICILE, COMPANY_ID, TAX_ID, ACCOUNT_NUMBER, COUNTRY FROM ASP_USER.VENDOR_MASTER_EMEAPAY WHERE PARTNER_PRO_ID = '" + pproid + "'";
        //        VendorDt = getData(strVendorDetailsQuery);
        //    }
        //    else
        //    {
        //        string strVendorDetailsQuery = "Select PARTNER_EMAIL_ID, PARTNER_EMAIL_ID1, VENDOR_NAME,ADDRESS1,ADDRESS2,ADDRESS3, BANK_NAME, CONTACT_PERSON_FNAME, CONTACT_PERSON_LNAME, CONTACT_PERSON_GREETING,PARTNER_VAT_NUMBER,SWIFT_CODE,IBAN, SWIFT_CODE, BANK_ID, DOMICILE, COMPANY_ID, TAX_ID, ACCOUNT_NUMBER, COUNTRY FROM ASP_USER.VENDOR_MASTER_EMEAPAY_LOCAL WHERE PARTNER_PRO_ID = '" + pproid + "'";
        //        VendorDt = getData(strVendorDetailsQuery);
        //    }

        //    //rh.getData(strVendorDetailsQuery);

        //    //Query to get the HP Organization details
        //    string strHPOrgQuery = "Select * FROM ASP_USER.HP_ORG_MASTER WHERE COUNTRY = '" + country + "' and COUNTRY_CODE = '" + CountryCode + "'";
        //    System.Data.DataTable HPOrgDt = getData(strHPOrgQuery);
        //    //rh.getData(strHPOrgQuery);

        //    string VendorName = PaymentDt.Rows[0]["VENDOR_NAME"].ToString();
        //    //string VendorNumber = PaymentDt.Rows[0]["VENDOR_NUMBER"].ToString();
        //    string PeriodShort = PaymentDt.Rows[0]["PERIOD_SHORT"].ToString();
        //    //string PaymentMethod = PaymentDt.Rows[0]["PAYMENT_METHOD"].ToString();
        //    //string InvoiceNumber = PaymentDt.Rows[0]["INVOICE_NUMBER"].ToString();
        //    //string InvoiceNumber1 = PaymentDt.Rows[0]["INVOICE_NUMBER1"].ToString();
        //    string ValueDate = PaymentDt.Rows[0]["VALUE_DATE"].ToString();
        //    string Address1 = VendorDt.Rows[0]["ADDRESS1"].ToString();
        //    string Address2 = VendorDt.Rows[0]["ADDRESS2"].ToString();
        //    string Address3 = VendorDt.Rows[0]["ADDRESS3"].ToString();
        //    string VendorNameLegal = VendorDt.Rows[0]["VENDOR_NAME"].ToString();
        //    string Country = VendorDt.Rows[0]["COUNTRY"].ToString();
        //    string PartnerVATNumber = VendorDt.Rows[0]["PARTNER_VAT_NUMBER"].ToString();
        //    string BankName = VendorDt.Rows[0]["BANK_NAME"].ToString();
        //    string IBAN = VendorDt.Rows[0]["IBAN"].ToString();
        //    string SwiftCode = VendorDt.Rows[0]["SWIFT_CODE"].ToString();
        //    string AccountNumber = VendorDt.Rows[0]["ACCOUNT_NUMBER"].ToString();
        //    string TaxID = VendorDt.Rows[0]["TAX_ID"].ToString();
        //    //string Currency = PaymentDt.Rows[0]["CURRENCY"].ToString();
        //    string HPEntity = HPOrgDt.Rows[0]["CUSTOMER_NAME"].ToString();
        //    string EntityAddress1 = HPOrgDt.Rows[0]["ADDRESS1"].ToString();
        //    string EntityAddress2 = HPOrgDt.Rows[0]["ADDRESS2"].ToString();
        //    string EntityAddress3 = HPOrgDt.Rows[0]["ADDRESS3"].ToString();
        //    string HPVATID = HPOrgDt.Rows[0]["VAT_ID"].ToString();
        //    string GMBEmailID = HPOrgDt.Rows[0]["GMB_EMAIL_ID"].ToString();
        //    string ToID = VendorDt.Rows[0]["PARTNER_EMAIL_ID"].ToString();
        //    string CCID = VendorDt.Rows[0]["PARTNER_EMAIL_ID1"].ToString();
        //    string FromID = "";
        //    string InvNum = "";
        //    //if (InvoiceNumber1 == "0")
        //    //{
        //    //    InvNum = InvoiceNumber;
        //    //}
        //    //else
        //    //{
        //    //    InvNum = InvoiceNumber + InvoiceNumber1;
        //    //}

        //    int adddays5 = 0;
        //    int adddays15 = 0;
        //    string day = DateTime.Today.ToString("ddd");

        //    if (day == "Mon")
        //    {
        //        adddays5 = 4;
        //        adddays15 = 11;
        //    }
        //    if (day == "Sun")
        //    {
        //        adddays5 = 5;
        //        adddays15 = 12;
        //    }
        //    if (day != "Mon" || day != "Sun")
        //    {
        //        adddays5 = 6;
        //        adddays15 = 13;
        //    }

        //    //string TodaysDate = DateTime.Today.ToString("dd-MMM-yyyy");
        //    //string TodaysDate5workdays = DateTime.Today.AddDays(adddays5).ToString("dd-MMM-yyyy");
        //    //string TodaysDate15workdays = DateTime.Today.AddDays(adddays15).ToString("dd-MMM-yyyy");

        //    string TodaysDate = DateTime.Today.ToString("dd-MMM-yyyy");
        //    string TodaysDate5workdays = DateTime.Today.AddDays(7).ToString("dd-MMM-yyyy");
        //    string TodaysDate15workdays = DateTime.Today.AddDays(15).ToString("dd-MMM-yyyy");


        //    try
        //    {

        //        wrdObject = wrdApp.Documents.Open(filename);


        //        wrdApp.Selection.WholeStory();
        //        wrdApp.Selection.Font.Name = "HP Simplified";
        //        wrdApp.Selection.Find.ClearFormatting();

        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<CurrentDate>>";
        //            pp.Replacement.Text = TodaysDate;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<VendorName>>";
        //            pp.Replacement.Text = VendorNameLegal;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<Address1>>";
        //            pp.Replacement.Text = Address1;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<Address2>>";
        //            pp.Replacement.Text = Address2;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<Address3>>";
        //            pp.Replacement.Text = Address3;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<Country>>";
        //            pp.Replacement.Text = Country;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<PartnerVATNumber>>";
        //            pp.Replacement.Text = PartnerVATNumber;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<TaxID>>";
        //            pp.Replacement.Text = TaxID;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<GMBEmailID>>";
        //            pp.Replacement.Text = GMBEmailID;
        //        }

        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<BankName>>";
        //            pp.Replacement.Text = BankName;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<IBAN>>";
        //            pp.Replacement.Text = IBAN;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<SwiftCode>>";
        //            pp.Replacement.Text = SwiftCode;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<ValueDate>>";
        //            pp.Replacement.Text = ValueDate;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<AccountNumber>>";
        //            pp.Replacement.Text = AccountNumber;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        //{
        //        //    var pp = wrdApp.Selection.Find;
        //        //    pp.Text = "<<CCurrency>>";
        //        //    pp.Replacement.Text = Currency;
        //        //}
        //        //wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<HPEntity>>";
        //            pp.Replacement.Text = HPEntity;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<EntityAddress1>>";
        //            pp.Replacement.Text = EntityAddress1;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<EntityAddress2>>";
        //            pp.Replacement.Text = EntityAddress2;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<EntityAddress3>>";
        //            pp.Replacement.Text = EntityAddress3;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<HPVATID>>";
        //            pp.Replacement.Text = HPVATID;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<TodaysDate>>";
        //            pp.Replacement.Text = TodaysDate;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        //{
        //        //    var pp = wrdApp.Selection.Find;
        //        //    pp.Text = "<<VendorNumber>>";
        //        //    pp.Replacement.Text = VendorNumber;
        //        //}
        //        //wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<InvoiceNumber>>";
        //            pp.Replacement.Text = InvNum;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<DateDue>>";
        //            pp.Replacement.Text = TodaysDate15workdays;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<PartnerProID>>";
        //            pp.Replacement.Text = pproid;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<PeriodShort>>";
        //            pp.Replacement.Text = PeriodShort;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<TotalNetAmount>>";
        //            pp.Replacement.Text = Convert.ToString(TotalNetAmount);
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<TotalVATAmount>>";
        //            pp.Replacement.Text = Convert.ToString(TotalVATAmount);
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        //{
        //        //    var pp = wrdApp.Selection.Find;
        //        //    pp.Text = "<<TotalGrossAmount>>";
        //        //    pp.Replacement.Text = Convert.ToString(TotalGrossAmount);
        //        //}
        //        //wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        //{
        //        //    var pp = wrdApp.Selection.Find;
        //        //    pp.Text = "<<Currency>>";
        //        //    pp.Replacement.Text = Currency;
        //        //}
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<TotalGrossAmount>>";
        //            pp.Replacement.Text = Convert.ToString(TotalGrossAmount);
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "ProgramLoop";
        //            pp.Replacement.Text = "";
        //        }
        //        wrdApp.Selection.Find.Execute();

        //        wrdApp.Selection.Delete();
        //        //wrdApp.Selection.MoveRight();
        //        //wrdApp.Selection.MoveRight();

        //        for (int i = 0; i < PaymentDt.Rows.Count; i++)
        //        {
        //            wrdApp.Selection.TypeText(Text: "1");
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["PROGRAM_NAME"].ToString()));
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["INVOICE_REQ_SENT_DATE"].ToString()));
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["NET_AMOUNT"].ToString()));
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["NET_AMOUNT"].ToString()));

        //            wrdApp.Selection.InsertRowsBelow(1);
        //            wrdApp.Selection.MoveLeft();
        //        }
        //        wrdApp.Selection.SelectRow();
        //        wrdApp.Selection.Cells.Merge();

        //        string strfilename = fullpath + pproid + "_" + PeriodShort + ".pdf";
        //        string strfilename1 = fullpathAttach + pproid + "_" + PeriodShort + ".pdf";
        //        string strpdfname = pproid + "_" + PeriodShort + ".pdf";

        //        string fileattachpath = pproid + "_" + PeriodShort + ".pdf";
        //        //wrdApp.Selection.WholeStory();
        //        //wrdApp.Selection.Copy();

        //        wrdApp.ActiveDocument.SaveAs(strfilename1, FileFormat: WdExportFormat.wdExportFormatPDF);

        //        return strfilename1 + "|" + PeriodShort + "|" + VendorName + "|" + strpdfname + "|" + fileattachpath;
        //        //wrdApp.ActiveDocument.Close(SaveChanges:(false));

        //        //attach.Text = partnerproid + "_" + PaymentMethod + "_" + PeriodShort + ".pdf";
        //        ////attach.NavigateUrl = "http://localhost:64739/Comp/docs/" + partnerproid + ".doc";
        //        //attach.NavigateUrl = "http://localhost:64739/Comp/docs/" + partnerproid + "_" + PeriodShort + ".pdf";

        //        //HFPPID.Value = partnerproid;
        //    }
        //    catch (System.Exception ex)
        //    {
        //        return ex.Message.ToString();
        //    }
        //    finally
        //    {
        //        wrdObject.Close(SaveChanges: (false));
        //        wrdApp.Quit();

        //    }
        //}

        //public string WordDisplay(string pproid, string batch, string country, string CountryCode, string fullpath, string InvoiceMethod, string PaymentMethodPrg)
        //{
        //    RHcls rh = new RHcls();
        //    string WordFileName = "";
        //    System.Data.DataTable dt = new System.Data.DataTable();
        //    if (PaymentMethodPrg == "SPS")
        //    {

        //    }
        //    dt = rh.getData("SELECT WORD_NAME FROM ASP_USER.COMMUNICATION_MASTER_TEMPLATE WHERE COUNTRY ='" + country + "' AND PROGRAM ='" + PaymentMethodPrg + "' AND INVOICE_METHOD ='" + InvoiceMethod + "'");
        //    WordFileName = dt.Rows[0]["WORD_NAME"].ToString();

        //    Microsoft.Office.Interop.Word.Application wrdApp = new Microsoft.Office.Interop.Word.Application();
        //    Document wrdObject = new Microsoft.Office.Interop.Word.Document();
        //    ParagraphFormat wrdParaFrmt = new Microsoft.Office.Interop.Word.ParagraphFormat();
        //    WdTabAlignment tab = new Microsoft.Office.Interop.Word.WdTabAlignment();
        //    object filename = fullpath + WordFileName;
        //    //object filename = "C:\\WORK_FOLDER\\RH_WEB_SOURCE\\RH3T\\Test\\Comp\\docs\\" + WordFileName;


        //    object missing = System.Reflection.Missing.Value;

        //    //Query to get the payment details
        //    string strPaymentDetailsQuery = "Select VENDOR_NUMBER,VENDOR_NAME,COUNTRY, INVOICE_NUMBER, INVOICE_NUMBER1, PARTNER_PRO_ID, PROGRAM_NAME, PERIOD_SHORT, TARGET, ACTUAL, BONUS, CURRENCY, VAT_PER, PROGRAM_SUMMARY, SUM(GROSS_AMOUNT) AS GROSS_AMOUNT, SUM(GROSS_AMOUNT) - SUM(NET_AMOUNT) AS VAT_AMOUNT, SUM(NET_AMOUNT) AS NET_AMOUNT, PAYMENT_METHOD from ASP_USER.TRANS_MASTER_EMEAPAY where PARTNER_PRO_ID = '" + pproid + "' and BATCH = '" + batch + "' GROUP BY VENDOR_NAME, COUNTRY,PARTNER_PRO_ID, PROGRAM_NAME, PERIOD_SHORT, CURRENCY, VAT_PER, PROGRAM_SUMMARY, TARGET, ACTUAL,PAYMENT_METHOD, VENDOR_NUMBER,BONUS, INVOICE_NUMBER, INVOICE_NUMBER1 ORDER BY PERIOD_SHORT";
        //    System.Data.DataTable PaymentDt = getData(strPaymentDetailsQuery);
        //    //rh.getData(strPaymentDetailsQuery);
        //    Double TotalGrossAmount = 0;
        //    Double TotalNetAmount = 0;
        //    Double TotalVATAmount = 0;
        //    for (int i = 0; i < PaymentDt.Rows.Count; i++)
        //    {
        //        TotalGrossAmount = TotalGrossAmount + Convert.ToDouble(PaymentDt.Rows[i]["GROSS_AMOUNT"].ToString());
        //        TotalNetAmount = TotalNetAmount + Convert.ToDouble(PaymentDt.Rows[i]["NET_AMOUNT"].ToString());
        //        TotalVATAmount = TotalVATAmount + Convert.ToDouble(PaymentDt.Rows[i]["VAT_AMOUNT"].ToString());
        //    }

        //    //Query to get the Vendor contact details and Bank details
        //    string strVendorDetailsQuery = "Select PARTNER_EMAIL_ID, PARTNER_EMAIL_ID1, VENDOR_NAME,ADDRESS1,ADDRESS2,ADDRESS3, BANK_NAME, CONTACT_PERSON_FNAME, CONTACT_PERSON_LNAME, CONTACT_PERSON_GREETING,PARTNER_VAT_NUMBER,SWIFT_CODE,IBAN, SWIFT_CODE, BANK_ID, DOMICILE, COMPANY_ID, TAX_ID, ACCOUNT_NUMBER, COUNTRY FROM ASP_USER.VENDOR_MASTER_EMEAPAY WHERE PARTNER_PRO_ID = '" + pproid + "'";
        //    System.Data.DataTable VendorDt = getData(strVendorDetailsQuery);
        //    //rh.getData(strVendorDetailsQuery);

        //    //Query to get the HP Organization details
        //    string strHPOrgQuery = "Select * FROM ASP_USER.HP_ORG_MASTER WHERE COUNTRY = '" + country + "' and COUNTRY_CODE = '" + CountryCode + "'";
        //    System.Data.DataTable HPOrgDt = getData(strHPOrgQuery);
        //    //rh.getData(strHPOrgQuery);

        //    string VendorName = PaymentDt.Rows[0]["VENDOR_NAME"].ToString();
        //    string VendorNumber = PaymentDt.Rows[0]["VENDOR_NUMBER"].ToString();
        //    string PeriodShort = PaymentDt.Rows[0]["PERIOD_SHORT"].ToString();
        //    string PaymentMethod = PaymentDt.Rows[0]["PAYMENT_METHOD"].ToString();
        //    string InvoiceNumber = PaymentDt.Rows[0]["INVOICE_NUMBER"].ToString();
        //    string InvoiceNumber1 = PaymentDt.Rows[0]["INVOICE_NUMBER1"].ToString();
        //    string Address1 = VendorDt.Rows[0]["ADDRESS1"].ToString();
        //    string Address2 = VendorDt.Rows[0]["ADDRESS2"].ToString();
        //    string Address3 = VendorDt.Rows[0]["ADDRESS3"].ToString();
        //    string Country = VendorDt.Rows[0]["COUNTRY"].ToString();
        //    string PartnerVATNumber = VendorDt.Rows[0]["PARTNER_VAT_NUMBER"].ToString();
        //    string BankName = VendorDt.Rows[0]["BANK_NAME"].ToString();
        //    string IBAN = VendorDt.Rows[0]["IBAN"].ToString();
        //    string SwiftCode = VendorDt.Rows[0]["SWIFT_CODE"].ToString();
        //    string AccountNumber = VendorDt.Rows[0]["ACCOUNT_NUMBER"].ToString();
        //    string Currency = PaymentDt.Rows[0]["CURRENCY"].ToString();
        //    string HPEntity = HPOrgDt.Rows[0]["CUSTOMER_NAME"].ToString();
        //    string EntityAddress1 = HPOrgDt.Rows[0]["ADDRESS1"].ToString();
        //    string EntityAddress2 = HPOrgDt.Rows[0]["ADDRESS2"].ToString();
        //    string EntityAddress3 = HPOrgDt.Rows[0]["ADDRESS3"].ToString();
        //    string HPVATID = HPOrgDt.Rows[0]["VAT_ID"].ToString();
        //    string ToID = VendorDt.Rows[0]["PARTNER_EMAIL_ID"].ToString();
        //    string CCID = VendorDt.Rows[0]["PARTNER_EMAIL_ID1"].ToString();
        //    string FromID = "ToGetfromMasterTable";
        //    string InvNum = "";
        //    if (InvoiceNumber1 == "0")
        //    {
        //        InvNum = InvoiceNumber;
        //    }
        //    else
        //    {
        //        InvNum = InvoiceNumber + InvoiceNumber1;
        //    }

        //    int adddays5 = 0;
        //    int adddays15 = 0;
        //    string day = DateTime.Today.ToString("ddd");

        //    if (day == "Mon")
        //    {
        //        adddays5 = 4;
        //        adddays15 = 11;
        //    }
        //    if (day == "Sun")
        //    {
        //        adddays5 = 5;
        //        adddays15 = 12;
        //    }
        //    if (day != "Mon" || day != "Sun")
        //    {
        //        adddays5 = 6;
        //        adddays15 = 13;
        //    }

        //    string TodaysDate = DateTime.Today.ToString("dd-MMM-yyyy");
        //    string TodaysDate5workdays = DateTime.Today.AddDays(adddays5).ToString("dd-MMM-yyyy");
        //    string TodaysDate15workdays = DateTime.Today.AddDays(adddays15).ToString("dd-MMM-yyyy");
        //    try
        //    {

        //        wrdObject = wrdApp.Documents.Open(filename);
        //        //wrdObject = wrdApp.Documents.Open(filename, ReadOnly:true);
        //        //wrdApp.Visible = true;
        //        //wrdApp.ActiveDocument.PageSetup.LeftMargin = 50;
        //        //wrdApp.ActiveDocument.PageSetup.RightMargin = 50;
        //        //wrdApp.ActiveDocument.PageSetup.TopMargin = 50;
        //        //wrdApp.ActiveDocument.PageSetup.BottomMargin = 50;
        //        //wrdApp.Selection.MoveRight();
        //        //wrdApp.Selection.MoveRight();
        //        //wrdApp.Selection.Font.Name = "HP Simplified";
        //        //wrdApp.Selection.Font.Size = 14;
        //        //wrdApp.Selection.ParagraphFormat.Alignment = WdParagraphAlignment.wdAlignParagraphLeft;
        //        //wrdApp.Selection.TypeText(Text: "VendorName : Partner pro ID");

        //        wrdApp.Selection.WholeStory();
        //        wrdApp.Selection.Font.Name = "HP Simplified";
        //        wrdApp.Selection.Find.ClearFormatting();

        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<CurrentDate>>";
        //            pp.Replacement.Text = TodaysDate;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<VendorName>>";
        //            pp.Replacement.Text = VendorName;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<Address1>>";
        //            pp.Replacement.Text = Address1;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<Address2>>";
        //            pp.Replacement.Text = Address2;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<Address3>>";
        //            pp.Replacement.Text = Address3;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<Country>>";
        //            pp.Replacement.Text = Country;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<PartnerVATNumber>>";
        //            pp.Replacement.Text = PartnerVATNumber;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));

        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<BankName>>";
        //            pp.Replacement.Text = BankName;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<IBAN>>";
        //            pp.Replacement.Text = IBAN;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<SwiftCode>>";
        //            pp.Replacement.Text = SwiftCode;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<AccountNumber>>";
        //            pp.Replacement.Text = AccountNumber;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<Currency>>";
        //            pp.Replacement.Text = Currency;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<HPEntity>>";
        //            pp.Replacement.Text = HPEntity;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<EntityAddress1>>";
        //            pp.Replacement.Text = EntityAddress1;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<EntityAddress2>>";
        //            pp.Replacement.Text = EntityAddress2;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<EntityAddress3>>";
        //            pp.Replacement.Text = EntityAddress3;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<HPVATID>>";
        //            pp.Replacement.Text = HPVATID;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<TodaysDate>>";
        //            pp.Replacement.Text = TodaysDate;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<VendorNumber>>";
        //            pp.Replacement.Text = VendorNumber;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<InvoiceNumber>>";
        //            pp.Replacement.Text = InvNum;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<DateDue>>";
        //            pp.Replacement.Text = TodaysDate15workdays;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<PartnerProID>>";
        //            pp.Replacement.Text = partnerproid;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<PeriodShort>>";
        //            pp.Replacement.Text = PeriodShort;
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<TotalNetAmount>>";
        //            pp.Replacement.Text = Convert.ToString(TotalNetAmount);
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<TotalVATAmount>>";
        //            pp.Replacement.Text = Convert.ToString(TotalVATAmount);
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        //{
        //        //    var pp = wrdApp.Selection.Find;
        //        //    pp.Text = "<<TotalGrossAmount>>";
        //        //    pp.Replacement.Text = Convert.ToString(TotalGrossAmount);
        //        //}
        //        //wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        //{
        //        //    var pp = wrdApp.Selection.Find;
        //        //    pp.Text = "<<Currency>>";
        //        //    pp.Replacement.Text = Currency;
        //        //}
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "<<TotalGrossAmount>>";
        //            pp.Replacement.Text = Convert.ToString(TotalGrossAmount);
        //        }
        //        wrdApp.Selection.Find.Execute(Replace: (WdReplace.wdReplaceAll));
        //        {
        //            var pp = wrdApp.Selection.Find;
        //            pp.Text = "ProgramLoop";
        //            pp.Replacement.Text = "";
        //        }
        //        wrdApp.Selection.Find.Execute();

        //        wrdApp.Selection.Delete();
        //        //wrdApp.Selection.MoveRight();
        //        //wrdApp.Selection.MoveRight();

        //        for (int i = 0; i < PaymentDt.Rows.Count; i++)
        //        {
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["PROGRAM_NAME"].ToString()));
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["PERIOD_SHORT"].ToString()));
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["TARGET"].ToString()));
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["ACTUAL"].ToString()));
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["BONUS"].ToString()));
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["VAT_PER"].ToString()));
        //            wrdApp.Selection.MoveRight(Unit: (WdUnits.wdCell));
        //            wrdApp.Selection.TypeText(Text: (PaymentDt.Rows[i]["GROSS_AMOUNT"].ToString()));
        //            wrdApp.Selection.InsertRowsBelow(1);
        //            wrdApp.Selection.MoveLeft();
        //        }
        //        wrdApp.Selection.SelectRow();
        //        wrdApp.Selection.Cells.Merge();

        //        string strfilename = fullpath + pproid + "_" + PeriodShort + ".pdf";
        //        string strpdfname = pproid + "_" + PeriodShort + ".pdf";

        //        //wrdApp.Selection.WholeStory();
        //        //wrdApp.Selection.Copy();
        //        //wrdApp.Visible = true;
        //        wrdApp.ActiveDocument.SaveAs(strfilename, FileFormat: WdExportFormat.wdExportFormatPDF);
        //        return strfilename + "|" + PeriodShort + "|" + PaymentMethod + "|" + VendorName + "|" + strpdfname;
        //        //wrdApp.ActiveDocument.Close(SaveChanges:(false));

        //        //attach.Text = partnerproid + "_" + PaymentMethod + "_" + PeriodShort + ".pdf";
        //        ////attach.NavigateUrl = "http://localhost:64739/Comp/docs/" + partnerproid + ".doc";
        //        //attach.NavigateUrl = "http://localhost:64739/Comp/docs/" + partnerproid + "_" + PeriodShort + ".pdf";

        //        //HFPPID.Value = partnerproid;

        //    }
        //    catch (System.Exception ex)
        //    {
        //        return ex.Message.ToString();
        //    }
        //    finally
        //    {
        //        wrdObject.Close(SaveChanges: (false));
        //        wrdApp.Quit();
        //    }
        //}


        //public String generateExcel(System.Data.DataTable YourdTName, string YourExcelfileName)
        //{
        //    // Create cell reference array 
        //    string[] CellReferenceArray = new string[] { "A", "B", "C", "D", "E","F","G" };
        //    //Open your saved excel file that you have created using template file.
        //    using (SpreadsheetDocument myDoc = SpreadsheetDocument.Open(YourExcelfileName, true))
        //    {
        //        // Create reference of main Workbook part, which contains all reference.
        //        WorkbookPart objworkbook = myDoc.WorkbookPart;

        //        // Create style sheet object that will be used for applying styling.
        //        Stylesheet objstyleSheet = objworkbook.WorkbookStylesPart.Stylesheet;

        //        // pick up first worksheet
        //        WorksheetPart objworksheet = objworkbook.WorksheetParts.First();

        //        // will be used in end while creating sheet data
        //        string objorigninalSheetId = objworkbook.GetIdOfPart(objworksheet);
        //        WorksheetPart objreplacementPart = objworkbook.AddNewPart<WorksheetPart>();
        //        string objreplacementPartId = objworkbook.GetIdOfPart(objreplacementPart);

        //        // Create object reader to read from excel file.
        //        OpenXmlReader objreader = OpenXmlReader.Create(objworksheet);

        //        // create writer object to write in excel sheet.
        //        OpenXmlWriter objOpenXmwriter = OpenXmlWriter.Create(objreplacementPart);

        //        int i = 0;
        //        DocumentFormat.OpenXml.Spreadsheet.Row r = new DocumentFormat.OpenXml.Spreadsheet.Row();
        //        DocumentFormat.OpenXml.Spreadsheet.Cell c = new DocumentFormat.OpenXml.Spreadsheet.Cell();
        //        DocumentFormat.OpenXml.Spreadsheet.Columns col1 = new DocumentFormat.OpenXml.Spreadsheet.Columns();
        //        UInt32 index = 1;

        //        while (objreader.Read())
        //        {
        //            if (objreader.ElementType == typeof(SheetData))
        //            {
        //                if (objreader.IsEndElement)
        //                    continue;

        //                objOpenXmwriter.WriteStartElement(new SheetData());
        //                objOpenXmwriter.WriteStartElement(r);

        //                // Loop to insert header
        //                foreach (DataColumn colHead in YourdTName.Columns)
        //                {
        //                    c = new DocumentFormat.OpenXml.Spreadsheet.Cell
        //                    {
        //                        DataType = CellValues.String,
        //                        CellReference = CellReferenceArray[i] + Convert.ToString(index)
        //                    };
        //                    CellValue v1 = new CellValue(colHead.ColumnName.ToString());
        //                    c.Append(v1);
        //                    objOpenXmwriter.WriteElement(c);
        //                    i += 1;
        //                }
        //                objOpenXmwriter.WriteEndElement();
        //                index += 1;

        //                //Loop to insert datatable row in excel	
        //                foreach (DataRow dr in YourdTName.Rows)
        //                {
        //                    objOpenXmwriter.WriteStartElement(r);
        //                    i = 1;
        //                    foreach (DataColumn col in YourdTName.Columns)
        //                    {
        //                        c = new DocumentFormat.OpenXml.Spreadsheet.Cell
        //                        {
        //                            DataType = CellValues.String,
        //                            CellReference = CellReferenceArray[i] + Convert.ToString(index)
        //                        };
        //                        CellValue v1 = new CellValue(dr[col].ToString());
        //                        c.AppendChild(v1);
        //                        objOpenXmwriter.WriteElement(c);
        //                        i += 1;
        //                    }
        //                    objOpenXmwriter.WriteEndElement();
        //                    index += 1;
        //                }
        //                objOpenXmwriter.WriteEndElement();
        //            }
        //        }
        //        //close all objects
        //        objreader.Close();
        //        objOpenXmwriter.Close();

        //        Sheet sheet = objworkbook.Workbook.Descendants<Sheet>().Where(s => s.Id.Value.Equals(objorigninalSheetId)).First();
        //        sheet.Id.Value = objreplacementPartId;
        //        objworkbook.DeletePart(objworksheet);

        //    }
        //    //download created excel sheet.
        //    return "Imported";

        //}


        public String ExportToExcel(System.Data.DataTable dt, String Path)
        {


            Microsoft.Office.Interop.Excel.Application excelApp = null;
            try
            {
                // instantiating the excel application class
                excelApp = new Microsoft.Office.Interop.Excel.Application();
                Microsoft.Office.Interop.Excel.Workbook currentWorkbook = excelApp.Workbooks.Add(Type.Missing);
                Microsoft.Office.Interop.Excel.Worksheet currentWorksheet = (Microsoft.Office.Interop.Excel.Worksheet)currentWorkbook.ActiveSheet;
                currentWorksheet.Columns.ColumnWidth = 18;
                object[,] arr = new object[dt.Rows.Count, dt.Columns.Count];

                if (dt.Rows.Count > 0)
                {
                    //currentWorksheet.Cells[1, 1] = DateTime.Now.ToString("s");
                    int i = 1;
                    foreach (DataColumn dc in dt.Columns)
                    {
                        // Excel work sheet indexing starts with 1
                        currentWorksheet.Cells[1, i] = dc.ColumnName;
                        ++i;
                    }
                    Microsoft.Office.Interop.Excel.Range headerColumnRange = currentWorksheet.get_Range("A1", "XFD1");
                    headerColumnRange.Font.Bold = true;
                    headerColumnRange.Font.Color = 0xFF0000;
                    //headerColumnRange.EntireColumn.AutoFit();
                    int rowIndex = 0;
                    for (rowIndex = 0; rowIndex < dt.Rows.Count; rowIndex++)
                    {
                        DataRow dr = dt.Rows[rowIndex];
                        int cellIndex = 0;
                        foreach (DataColumn col in dt.Columns)
                        {
                            arr[rowIndex, cellIndex] = dr[col];
                            //currentWorksheet.Cells[rowIndex + 3, cellIndex + 1] = dr[col];
                            cellIndex = cellIndex + 1;
                        }

                    }

                    object[] arr1 = new object[dt.Columns.Count];
                    int cellindex = 0;

                    foreach (DataColumn col in dt.Columns)
                    {
                        arr1[cellindex] = col.DataType;
                        //currentWorksheet.Cells[rowIndex + 3, cellIndex + 1] = dr[col];
                        cellindex = cellindex + 1;

                    }






                    Microsoft.Office.Interop.Excel.Range c1 = (Microsoft.Office.Interop.Excel.Range)currentWorksheet.Cells[2, 1];
                    Microsoft.Office.Interop.Excel.Range c2 = (Microsoft.Office.Interop.Excel.Range)currentWorksheet.Cells[2 + dt.Rows.Count - 1, dt.Columns.Count];
                    Microsoft.Office.Interop.Excel.Range range = currentWorksheet.get_Range(c1, c2);
                    range.NumberFormat = "@";
                    range.Value2 = arr;


                    int j = 1;
                    foreach (DataColumn col in dt.Columns)
                    {
                        string test = col.DataType.ToString();
                        if (col.DataType.Name == "DateTime")
                        {
                            Microsoft.Office.Interop.Excel.Range C1 = (Microsoft.Office.Interop.Excel.Range)currentWorksheet.Cells[2, j];
                            Microsoft.Office.Interop.Excel.Range C2 = (Microsoft.Office.Interop.Excel.Range)currentWorksheet.Cells[2 + dt.Rows.Count - 1, j];
                            Microsoft.Office.Interop.Excel.Range R = currentWorksheet.get_Range(C1, C2);

                            R.NumberFormat = "[$-409]d-mmm-yy;@";
                        }

                        j = j + 1;

                    }




                    //for (i = 0; i < cellindex; i++)
                    //{

                    //    if (arr1[i] == "Syestem.DateTime")
                    //    {
                    //        Microsoft.Office.Interop.Excel.Range C1 = (Microsoft.Office.Interop.Excel.Range)currentWorksheet.Cells[3, i];
                    //        Microsoft.Office.Interop.Excel.Range C2 = (Microsoft.Office.Interop.Excel.Range)currentWorksheet.Cells[3 + dt.Rows.Count - 1, i];
                    //        Microsoft.Office.Interop.Excel.Range R= currentWorksheet.get_Range(C1, C2);

                    //        R.NumberFormat = "[$-409]d-mmm-yy;@";


                    //    }



                    //}



                    Microsoft.Office.Interop.Excel.Range fullTextRange = currentWorksheet.get_Range("A1", "BA" + (rowIndex + 1).ToString());
                    fullTextRange.WrapText = true;
                    fullTextRange.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignLeft;
                }
                else
                {
                    string timeStamp = DateTime.Now.ToString("s");
                    timeStamp = timeStamp.Replace(':', '-');
                    timeStamp = timeStamp.Replace("T", "__");
                    currentWorksheet.Cells[1, 1] = timeStamp;
                    currentWorksheet.Cells[1, 2] = "No error occured";
                }


                
                string fullFileName = Path;

                currentWorkbook.SaveAs(fullFileName, Microsoft.Office.Interop.Excel.XlFileFormat.xlOpenXMLWorkbook, System.Reflection.Missing.Value, System.Reflection.Missing.Value, false, false, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlNoChange, Microsoft.Office.Interop.Excel.XlSaveConflictResolution.xlUserResolution, true, System.Reflection.Missing.Value, System.Reflection.Missing.Value, System.Reflection.Missing.Value);
                currentWorkbook.Saved = true;
                currentWorkbook.Close();


                //using (SaveFileDialog exportSaveFileDialog = new SaveFileDialog())
                //{
                //    exportSaveFileDialog.Title = "Select Excel File";
                //    exportSaveFileDialog.Filter = "Microsoft Office Excel Workbook(*.xlsx)|*.xlsx";

                //    if (DialogResult.OK == exportSaveFileDialog.ShowDialog())
                //    {
                //        string fullFileName = exportSaveFileDialog.FileName;
                //        // currentWorkbook.SaveCopyAs(fullFileName);
                //        // indicating that we already saved the workbook, otherwise call to Quit() will pop up
                //        // the save file dialogue box

                //        currentWorkbook.SaveAs(fullFileName, Microsoft.Office.Interop.Excel.XlFileFormat.xlOpenXMLWorkbook, System.Reflection.Missing.Value, System.Reflection.Missing.Value, false, false, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlNoChange, Microsoft.Office.Interop.Excel.XlSaveConflictResolution.xlUserResolution, true, System.Reflection.Missing.Value, System.Reflection.Missing.Value, System.Reflection.Missing.Value);
                //        currentWorkbook.Saved = true;
                //        //MessageBox.Show("Data exported successfully", "Exported to Excel", MessageBoxButtons.OK, MessageBoxIcon.Information);

                //    }
                //}
                return "Completed";
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message, "Exception", MessageBoxButtons.OK, MessageBoxIcon.Error);
                if (excelApp != null)
                {
                    excelApp.Quit();
                }
                return ex.ToString();

            }
            finally
            {
                if (excelApp != null)
                {
                    excelApp.Quit();
                }
            }



        }


        public String ExportToExcel1(System.Data.DataTable dt, String Path)
        {


            Microsoft.Office.Interop.Excel.Application excelApp = null;
            try
            {
                // instantiating the excel application class
                excelApp = new Microsoft.Office.Interop.Excel.Application();
                Microsoft.Office.Interop.Excel.Workbook currentWorkbook = excelApp.Workbooks.Add(Type.Missing);
                Microsoft.Office.Interop.Excel.Worksheet currentWorksheet = (Microsoft.Office.Interop.Excel.Worksheet)currentWorkbook.ActiveSheet;
                currentWorksheet.Name = "PAYMENT ADVICE";
                    //
                currentWorksheet.Columns.ColumnWidth = 18;
                object[,] arr = new object[dt.Rows.Count, dt.Columns.Count];

                if (dt.Rows.Count > 0)
                {
                    //currentWorksheet.Cells[1, 1] = DateTime.Now.ToString("s");
                    int i = 1;
                    foreach (DataColumn dc in dt.Columns)
                    {
                        // Excel work sheet indexing starts with 1
                        currentWorksheet.Cells[1, i] = dc.ColumnName;
                        ++i;
                    }
                    Microsoft.Office.Interop.Excel.Range headerColumnRange = currentWorksheet.get_Range("A1", "BA1");
                    headerColumnRange.Font.Bold = true;
                    headerColumnRange.Font.Color = 0xFF0000;
                    //headerColumnRange.EntireColumn.AutoFit();
                    int rowIndex = 0;
                    for (rowIndex = 0; rowIndex < dt.Rows.Count; rowIndex++)
                    {
                        DataRow dr = dt.Rows[rowIndex];
                        int cellIndex = 0;
                        foreach (DataColumn col in dt.Columns)
                        {
                            arr[rowIndex, cellIndex] = dr[col];
                            //currentWorksheet.Cells[rowIndex + 3, cellIndex + 1] = dr[col];
                            cellIndex = cellIndex + 1;
                        }

                    }

                    object[] arr1 = new object[dt.Columns.Count];
                    int cellindex = 0;

                    foreach (DataColumn col in dt.Columns)
                    {
                        arr1[cellindex] = col.DataType;
                        //currentWorksheet.Cells[rowIndex + 3, cellIndex + 1] = dr[col];
                        cellindex = cellindex + 1;

                    }






                    Microsoft.Office.Interop.Excel.Range c1 = (Microsoft.Office.Interop.Excel.Range)currentWorksheet.Cells[2, 1];
                    Microsoft.Office.Interop.Excel.Range c2 = (Microsoft.Office.Interop.Excel.Range)currentWorksheet.Cells[2 + dt.Rows.Count - 1, dt.Columns.Count];
                    Microsoft.Office.Interop.Excel.Range range = currentWorksheet.get_Range(c1, c2);
                    range.NumberFormat = "@";
                    range.Value2 = arr;


                    int j = 1;
                    foreach (DataColumn col in dt.Columns)
                    {
                        string test = col.DataType.ToString();
                        if (col.DataType.Name == "DateTime")
                        {
                            Microsoft.Office.Interop.Excel.Range C1 = (Microsoft.Office.Interop.Excel.Range)currentWorksheet.Cells[2, j];
                            Microsoft.Office.Interop.Excel.Range C2 = (Microsoft.Office.Interop.Excel.Range)currentWorksheet.Cells[2 + dt.Rows.Count - 1, j];
                            Microsoft.Office.Interop.Excel.Range R = currentWorksheet.get_Range(C1, C2);

                            R.NumberFormat = "[$-409]d-mmm-yy;@";
                        }

                        j = j + 1;

                    }




                    //for (i = 0; i < cellindex; i++)
                    //{

                    //    if (arr1[i] == "Syestem.DateTime")
                    //    {
                    //        Microsoft.Office.Interop.Excel.Range C1 = (Microsoft.Office.Interop.Excel.Range)currentWorksheet.Cells[3, i];
                    //        Microsoft.Office.Interop.Excel.Range C2 = (Microsoft.Office.Interop.Excel.Range)currentWorksheet.Cells[3 + dt.Rows.Count - 1, i];
                    //        Microsoft.Office.Interop.Excel.Range R= currentWorksheet.get_Range(C1, C2);

                    //        R.NumberFormat = "[$-409]d-mmm-yy;@";


                    //    }



                    //}



                    Microsoft.Office.Interop.Excel.Range fullTextRange = currentWorksheet.get_Range("A1", "BA" + (rowIndex + 1).ToString());
                    fullTextRange.WrapText = true;
                    fullTextRange.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignLeft;
                }
                else
                {
                    string timeStamp = DateTime.Now.ToString("s");
                    timeStamp = timeStamp.Replace(':', '-');
                    timeStamp = timeStamp.Replace("T", "__");
                    currentWorksheet.Cells[1, 1] = timeStamp;
                    currentWorksheet.Cells[1, 2] = "No error occured";
                }



                string fullFileName = Path;

                currentWorkbook.SaveAs(fullFileName, Microsoft.Office.Interop.Excel.XlFileFormat.xlOpenXMLWorkbook, System.Reflection.Missing.Value, System.Reflection.Missing.Value, false, false, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlNoChange, Microsoft.Office.Interop.Excel.XlSaveConflictResolution.xlUserResolution, true, System.Reflection.Missing.Value, System.Reflection.Missing.Value, System.Reflection.Missing.Value);
                currentWorkbook.Saved = true;
                currentWorkbook.Close();


                //using (SaveFileDialog exportSaveFileDialog = new SaveFileDialog())
                //{
                //    exportSaveFileDialog.Title = "Select Excel File";
                //    exportSaveFileDialog.Filter = "Microsoft Office Excel Workbook(*.xlsx)|*.xlsx";

                //    if (DialogResult.OK == exportSaveFileDialog.ShowDialog())
                //    {
                //        string fullFileName = exportSaveFileDialog.FileName;
                //        // currentWorkbook.SaveCopyAs(fullFileName);
                //        // indicating that we already saved the workbook, otherwise call to Quit() will pop up
                //        // the save file dialogue box

                //        currentWorkbook.SaveAs(fullFileName, Microsoft.Office.Interop.Excel.XlFileFormat.xlOpenXMLWorkbook, System.Reflection.Missing.Value, System.Reflection.Missing.Value, false, false, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlNoChange, Microsoft.Office.Interop.Excel.XlSaveConflictResolution.xlUserResolution, true, System.Reflection.Missing.Value, System.Reflection.Missing.Value, System.Reflection.Missing.Value);
                //        currentWorkbook.Saved = true;
                //        //MessageBox.Show("Data exported successfully", "Exported to Excel", MessageBoxButtons.OK, MessageBoxIcon.Information);

                //    }
                //}
                return "Completed";
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message, "Exception", MessageBoxButtons.OK, MessageBoxIcon.Error);
                if (excelApp != null)
                {
                    excelApp.Quit();
                }
                return ex.ToString();

            }
            finally
            {
                if (excelApp != null)
                {
                    excelApp.Quit();
                }
            }



        }




        //public static void Show(string message)
        //{
        //    string cleanMessage = message.Replace("'", "\'");
        //    Page page = HttpContext.Current.CurrentHandler as Page;
        //    string script = string.Format("alert('{0}');", cleanMessage);
        //    if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert"))
        //    {
        //        page.ClientScript.RegisterClientScriptBlock(page.GetType(), "alert", script, true /* addScriptTags */);
        //    }
        //} 


        
    }
}