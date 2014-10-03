<%@ Page Title="RH Documentation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RHDocumentation.aspx.cs" Inherits="APJ_RH.APJ_Payments.RHDocumentation" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<p ><strong style="font-size :xx-large;color:#0096D6 ">RH Documentation</strong> </p>

<p>
<strong style="font-size :large" >TEMPLATE UPLOAD Page:</strong><br />
&nbsp;&nbsp;1. All templates should be in a standard format.<br />
&nbsp;&nbsp;2. Sheet name of each template should be in a standard format.<br />
&nbsp;&nbsp;3. User can download the sample template from Template upload page by selecting the template type and click on Get the Format of File.<br />
&nbsp;&nbsp;4. There are 3 types of access provided in RH<br />
&nbsp;&nbsp;    i. USER: USER access provided to all team members, where they can process the payments.<br />
&nbsp;&nbsp;	ii. SME: SME access provided to SME in team, where they can process the payments and they can close the status.<br />
&nbsp;&nbsp;	iii. ADMIN: ADMIN access provided to SENIOR Member in team, where they can process the payments, close the status and they can edit, delete, update and insert the records in to database.<br />
&nbsp;&nbsp;5.	RH compatibility is for .xls, .xlsx extension excel files but not the.csv extension files.<br />
&nbsp;&nbsp;6.	User has to save all files when it is downloaded from RH. If user clicked on cancel button the file will missed and cannot retrieve.<br />
&nbsp;&nbsp;7.	User has to select the Team_Name appropriately in template upload page (First Upload File in to RH) and the same will be updated in RH Database to process further.<br />
&nbsp;&nbsp;8.	Username & Date time is captured in RH for all the activities.<br />

<strong>Payment File Rejection</strong>	<br />
&nbsp;&nbsp;1. If TRANSACTION_ID is found duplicate in PAYMENT_MASTER table then the payment file is rejected<br />
&nbsp;&nbsp;2. If COUNTRY is not mapped in APACPPP_USER.COUNTRY_CODE_MASTER_APACPPP table then the payment file is rejected.<br />
&nbsp;&nbsp;3. If CURR, COMPANY_CODE, SAP_SYSTEM (LH1 & FI1 & CREDIT NOTES) is not found APACPPP_USER.COMPANY_CODE_MASTER_APACPPP table then the payment file is rejected.<br />
&nbsp;&nbsp;4. If the user input file contains any spaces in cells & a column is found then the payment file is rejected.<br />

<strong>Points to be checked while uploading Payment Template:</strong>	<br />
&nbsp;&nbsp;1. TRESHOLD_APPROVAL_EMAIL_ID is updated based on the PL_LIMIT_USD and MANAGER_LIMIT_USD columns found in TRESHOLD_MATRIX table.<br />
&nbsp;&nbsp;2. Suspect status will be changed to O if PROGRAM, PARTNER ID, PAYOUT DUE, VENDOR ID, INVOICE NO are found duplicate.<br />
&nbsp;&nbsp;3. REF_NO is auto generated for each line item in PAYMENT_MASTER table. <br />
&nbsp;&nbsp;4. If the WWAS MANAGER & Limit is not defined in APAC_USER.WWAS_LIMITS_MASTER_APACPAY table then WWAS Status will changed to O.<br />
&nbsp;&nbsp;5. The TOTAL_AMOUNT_PAYABLE_USD column is calculated and updated based on the currency and EX_RATE columns found in WWAS_EX_RATE table.<br />
&nbsp;&nbsp;6. The Invoice & Split Status will get changed and VAT, WHT is calculated based on the country specifications found in DEFAULT_SPL_HNDL and SPL_HANDLING_TBL table.<br />
&nbsp;&nbsp;7. The PAYMENT MODE column is updated based on the PROGRAM, PARTNER ID, PAYMENT_METHOD and COUNTRY_CODE Columns for CI Payments found in PAYMENT_METHOD_TBL & PAYMENT_MODE_TBL table and for FC Payments PAYMENT MODE is updated from input file.<br />
&nbsp;&nbsp;8. The ON_CHAPP_STATUS column is updated with default value ‘Y’ for both CI Payments & FC Payments.<br />
&nbsp;&nbsp;9. The TEAM_NAME column is updated based on selection of team name in drop down list which is available in Template Upload Form while uploading the files.<br />
&nbsp;&nbsp;10.The SENT_APJ_STATUS_TYPE column is updated based on COUNTRY_CODE, CURR, COMPANY_CODE found in APACPPP_USER.COMPANY_CODE_MASTER_APACPPP table for both FC & CI Payments. <br />
&nbsp;&nbsp;11.The WHT_TAX_CODE, VAT_TAX_CODE column is updated based on TEAM_NAME, COUNTRY_CODE & PAYMENT_MODE found in DEFAULT_SPL_HNDL table and WHT_TAX_CODE, VAT_TAX_CODE column is updated based on TEAM_NAME, COUNTRY_CODE, PROGRAM, PARTNER_PRO_ID & PAYMENT_MODE found in SPL_HANDLING_TBL table for both FC & CI Payments. <br />
&nbsp;&nbsp;12.The SYSTEM_TYPE column is updated based on selection of template in drop down list which is available in Template Upload Form while uploading the files .(for e.g. – Payment Upload file with transaction id, without transaction id & India – System Type is ‘P1&India’ and for MDF Template – system type is ‘MDF’). <br />

<strong>Points to be checked while uploading Payment Template With Transaction ID:</strong>	<br />
&nbsp;&nbsp;1. If any of the following field PAYOUT ID, TRANSACTION ID, TRANSACTION ID Generated Date (MM/DD/YYYY), PROGRAM, COUNTRY, YEAR, QUARTER, PARTNER ID, PARTNER NAME, PARTNER ENGLISH NAME, ISO CURRENCY TYPE, PAYOUT DUE, APPROVING MANAGER, ENSE, DEPT,SF,PT,PL,SUB,PL,ACCT,LOCAL SUB A/C,IC SUB A/C, is null then payment file is rejected for CI Payments. <br />
&nbsp;&nbsp;2. If any of the following field PAYOUT ID, TRANSACTION ID, TRANSACTION ID Generated Date (MM/DD/YYYY), PROGRAM, COUNTRY, PARTNER ID, PARTNER NAME, PARTNER ENGLISH NAME, ISO CURRENCY TYPE, PAYOUT DUE, APPROVING MANAGER, MCC, CREDIT NOTE PL, ENSE, DEPT, SF, PT, PL, SUB-PL, ACCT, LOCAL SUB A/C, IC SUB A/C, is null then payment file is rejected for FC Payments.<br />
&nbsp;&nbsp;3. Rows are updated with the following columns VAT (%), TOTAL AMOUNT DUE AFTER VAT, WHT (%), TOTAL AMOUNT PAYABLE is found in DEFAULT_SPL_HNDL and SPL_HANDLING_TBL table according to TEAM_NAME, COUNTRY_CODE, PROGRAM and PAYMENT MODE.<br />
&nbsp;&nbsp;4. The VENDOR NO column is updated based on the PARTNER_PRO_ID & COUNTRY Columns for CI Payments & FC payments found in APACPPP_USER.PPRO_VENID_MATCH_APACPPP table.<br />

<strong>Points to be checked while uploading Payment Template Without Transaction ID:</strong>	<br />
&nbsp;&nbsp;1. If any of the following field PAYOUT ID, PROGRAM, COUNTRY, YEAR, QUARTER, PARTNER ID, PARTNER NAME, PARTNER ENGLISH NAME, ISO CURRENCY TYPE, PAYOUT DUE, APPROVING MANAGER  is null then payment file is rejected for CI Payments. <br />
&nbsp;&nbsp;2. Rows are updated with the following columns VAT (%), TOTAL AMOUNT DUE AFTER VAT, WHT (%), TOTAL AMOUNT PAYABLE is found in DEFAULT_SPL_HNDL and SPL_HANDLING_TBL table according to TEAM_NAME, COUNTRY_CODE, PROGRAM and PAYMENT MODE. <br />
&nbsp;&nbsp;3. The PAYMENT MODE column is updated based on the PROGRAM, PARTNER ID, PAYMENT_METHOD and COUNTRY_CODE Columns for CI Payments found in PAYMENT_METHOD_TBL & PAYMENT_MODE_TBL table.<br />
&nbsp;&nbsp;4. The VENDOR NO column is updated based on the PARTNER_PRO_ID & COUNTRY Columns for CI Payments found in APACPPP_USER.PPRO_VENID_MATCH_APACPPP table.<br />

<strong>Points to be checked while uploading India Payment Template:</strong>	<br />
&nbsp;&nbsp;1. If any of the following field PAYOUT ID, TRANSACTION ID, TRANSACTION ID Generated Date (MM/DD/YYYY), PROGRAM ID, COUNTRY, YEAR – PROGRAM,QUARTER-PROGRAM,
PARTNER ID-PARTNER PRO, PARTNER NAME, PARTNER ENGLISH NAME, ISO CURRENCY TYPE, PAYOUT DUE, APPROVERS EMAIL, PAYMENT MODE (AS PER PARTNER CREATION) DD / BANK TRANSFER, VENDOR ID (13 SERIES SAP ACCOUNT #), MCC (ONLY FOR CREDIT NOTES), CREDIT NOTE PL(ONLY FOR CREDIT NOTES), ENSE (TO BE GATHERED FROM FINANCE TEAM) ENTITY/SUB ENTITY, DEPT, SF, PT, PL, SUB-PL, ACCT, LOCAL SUB A/C, IC SUB A/C, is null then payment file is rejected for FC Payments & CI Payments.
 <br />
&nbsp;&nbsp;2. Once the file is received from Outsource team User has to check the PAYOUT ID is exist (or) if the PAYOUT ID is not exist user should follow according to Process. <br />
&nbsp;&nbsp;3. User has to update the following column PAYMENT MODE (AS PER PARTNER CREATION) DD / BANK TRANSFER with the values as ‘CHEQUE/TT’ (or) ‘CREDIT NOTES’ for both FC Payments & CI Payments.<br />
&nbsp;&nbsp;4. WWAS Status is not performed for Country India in FC Payments.<br />
&nbsp;&nbsp;5. Vendor ID check is not performed in RH for country India for both FC Payments & CI Payments.<br />
&nbsp;&nbsp;6. Rows are updated with the following columns VAT (%), TOTAL AMOUNT DUE AFTER VAT, WHT (%), TOTAL AMOUNT PAYABLE is found in DEFAULT_SPL_HNDL and SPL_HANDLING_TBL table according to TEAM_NAME, COUNTRY_CODE, PROGRAM and PAYMENT MODE. <br />
&nbsp;&nbsp;7. The PAYMENT MODE column is updated based on the PROGRAM, PARTNER ID, PAYMENT_METHOD and COUNTRY_CODE Columns for CI Payments found in PAYMENT_METHOD_TBL & PAYMENT_MODE_TBL table.<br />

<strong>Points to be checked while uploading MDF Nextgen Payment Template:</strong>	<br />
&nbsp;&nbsp;1. If any of the following field PAYMENT ID, CLAIM ID, PARTNER ID, PARTNER NAME, PARTNER ENGLISH NAME,FISCAL PERIOD, VENDOR ID, APPROVING MANAGER, APPROVING MANAGER EMAIL, ISO CURRENCY TYPE, COUNTRY, ACCT, LOCAL-SUB-A/C,IC-SUB-A/C, PL,PROGRAM,CLAIM APPROVED DATE,PAYOUT ID,PAYOUT DUE, NET AMOUNT IN USD,  COST CENTER, FISCAL YEAR,TOTAL AMOUNT DUE  is null then payment file is rejected for CI Payments.  <br />
&nbsp;&nbsp;2. The PAYMENT MODE column is updated based on the PROGRAM, PARTNER ID, PAYMENT_METHOD and COUNTRY_CODE Columns for CI Payments found in PAYMENT_METHOD_TBL & PAYMENT_MODE_TBL table. <br />
&nbsp;&nbsp;3. Rows are updated with the following columns VAT (%), TOTAL AMOUNT DUE AFTER VAT, WHT (%), TOTAL AMOUNT PAYABLE is found in DEFAULT_SPL_HNDL and SPL_HANDLING_TBL table according to TEAM_NAME, COUNTRY_CODE, PROGRAM and PAYMENT MODE. <br />
&nbsp;&nbsp;4. The VENDOR NO column is updated based on the PARTNER_PRO_ID & COUNTRY Columns for CI Payments found in APACPPP_USER.PPRO_VENID_MATCH_APACPPP table. <br />

<br />

<strong style="font-size :large">CLAIM PROCESSING Page:</strong><br />
<br />

<strong>Suspect Status:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about Suspect Status:</i></u> Suspect status is the status where it will check the duplicate records with the following columns of PROGRAM, PARTNER ID, PAYOUT DUE, VENDOR ID, and INVOICE NO in PAYMENT_MASTER table. If duplicate records are found the status will open as (SUSPECT_STATUS = ‘O’)<br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Open Suspect status are displayed in this status.   <br />
&nbsp;&nbsp;• <i>Close Suspect Status Button:</i> This button is having access only to SME users & Admin users which will close the Suspect status and SME User / ADMIN User can cross check the suspect data and close appropriately based on REF_NO.   <br />
&nbsp;&nbsp;• Those having User access can’t close the suspect status, Request user to forward the request to SME/ADMIN to close the suspect status.   <br />
&nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel.    <br />

<strong>WWAS Approval:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about WWAS Approval Status:</i></u> WWAS Approval is the status where it will check the APPROVING MANAGER EMAIL-ID and within the range of USD limit with the following columns of COUNTRY, MANAGER EMAIL-ID in APAC_USER.WWAS_LIMITS_MASTER_APACPAY table. If MANAGER EMAIL-ID is not exists in APAC_USER.WWAS_LIMITS_MASTER_APACPAY table (or) if it cross the range of USD limit in APAC_USER.WWAS_LIMITS_MASTER_APACPAY table then the status will open as (WWAS_STATUS = ‘O’). <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Open WWAS Approval status are displayed in this status.   <br />
&nbsp;&nbsp;• <i>Close WWAS Status Button:</i> This button is having access only to SME users & Admin users which will close the WWAS status and SME User / ADMIN User can cross check the WWAS data and close appropriately based on REF_NO.    <br />
&nbsp;&nbsp;• Those having User access can’t close the WWAS status, Request user to forward the request to SME/ADMIN to close the WWAS status.  <br />
&nbsp;&nbsp;• <i>Generate Mail to WWAS Button:</i> This button is having access to all users which will generate the standard format of WWAS Mail and users have to update where the details are colored in Yellow.     <br />
&nbsp;&nbsp;• <i>Update New WWAS Manager Button</i> This button is having access to all users which user can update the new manager email-id, date & Comments by providing the old manager email-id according to manager limits based on PAYOUT_ID. Also new manager with the limits should be updated in APAC_USER.WWAS_LIMITS_MASTER_APACPAY table then it will move to next status. If Updations are failed in APAC_USER.WWAS_LIMITS_MASTER_APACPAY table then records will not move to next status.    <br />
&nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel.    <br />

<strong>Vendor ID Status:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about Vendor ID Status:</i></u> Vendor id status is the status where it will update the VENDOR_NO with the following columns of PARTNER_PRO_ID, COUNTRY, VENDOR_ID_USD, VENDOR_ID_LC, CYSIS_ID_USD, CYSIS_ID_LC and PAYMENT_MODE found in APACPPP_USER.PPRO_VENID_MATCH_APACPPP table. If the VENDOR_NO is not exists in the APACPPP_USER.PPRO_VENID_MATCH_APACPPP table then the status will open as (VENDOR_ID_STATUS = ‘O’). <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Open Vendor ID status are displayed in this status.   <br />
&nbsp;&nbsp;• <i>Close Vendor ID Status Button</i> This button is having access only to SME users & Admin users which will close the Vendor ID status and SME User / ADMIN User can cross check the Vendor ID data and close appropriately based on REF_NO.    <br />
&nbsp;&nbsp;• Those having User access can’t close the Vendor ID status, Request user to forward the request to SME/ADMIN to close the Vendor ID status.    <br />
&nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel.     <br />

<strong>Vendor Name Mismatch Status:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about Vendor Name Mismatch Status:</i></u> Vendor name mismatch status is the status where it will check the VENDOR_NO with the following columns of PARTNER_ID, COUNTRY found in APAC_USER.ALT_NAME_APACPAY table.
If the VENDOR_NO is not exists in the APAC_USER.ALT_NAME_APACPAY table then the status will open as (VENDOR_NAME_MISMATCH_STATUS = ‘O’). <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Open Vendor name mismatch status are displayed in this status.   <br />
&nbsp;&nbsp;• <i>Close Vendor Name Mismatch Status Button:</i> This button is having access only to SME users & Admin users which will close the Vendor name mismatch status and SME User / ADMIN User can cross check the Vendor name mismatch data and close appropriately based on REF_NO.   <br />
&nbsp;&nbsp;• Those having User access can’t close the vendor name mismatch status, Request user to forward the request to SME/ADMIN to close the vendor name mismatch status.  <br />
&nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel.     <br />

<strong>Threshold Approval Status:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about Threshold Approval Status:</i></u> Threshold approval status is the status where it will check the TOTAL_AMOUNT_PAYABLE_USD amount and update the TRESHOLD_APPROVAL_EMAIL_ID with the following columns of TEAM_NAME, COUNTRY_CODE, PL_LIMIT_USD, MANAGER_LIMIT_USD, PL_EMAIL_ID and MANAGER_EMAIL_ID found in THRESHOLD_MATRIX table. For all records the status will open default as (THRESHOLD_STATUS = ‘O’). According to TRESHOLD_APPROVAL_EMAIL_ID user has to seek the approval via mail to close the status. <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Open Threshold Approval status are displayed in this status.   <br />
&nbsp;&nbsp;• <i>Close Threshold Approval status Button:</i> This button is having access to all users and which will close the Threshold Approval status based on REF_NO.      <br />
&nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel. <br />

<strong>To Be Sent To C Ops – Split Payments Status:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about To Be Sent - Split Payments Status:</i></u> This Status is only applicable to CI Payments and not applicable to FC Payments. Initially Team will receive the file with Payout_Due amount and later team will receive the split file where Payout_Due amount is splitted according to PL wise. To update the Payout_Due split amount according to PL wise user has to generate the Split file from RH and the status will open as (SPLIT_PAYMENT_SENT_STATUS= ‘O’). Once Split file is generated SPLIT_PAYMENT_SENT_STATUS is closed in RH automatically based on REF_NO. <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Open To Be Sent To C Ops – Split Payments Status are displayed in this status.   <br />
&nbsp;&nbsp;• <i>Close Split Payment status Button:</i> This button is having access only to SME users & Admin users which will close the Split Payment Status and SME User / ADMIN User can cross check the Split Payment data and close appropriately based on REF_NO.    <br />
&nbsp;&nbsp;•  Those having User access can’t close the Split Payment Status, Request user to forward the request to SME/ADMIN to close the Split Payment Status.  <br />
&nbsp;&nbsp;• <i>Generate Split Payment Button:</i> This button is having access to all users which they can generate a split Excel file from RH.   <br />
&nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel.     <br />

<strong>Waiting For C Ops – Split Payments Status:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about Waiting - Split Payments Status:</i></u>This Status is only applicable to CI Payments and not applicable to FC Payments. Initially Team will receive the file with Payout_Due amount and later team will receive the split file where Payout_Due amount is splitted according to PL wise. To update the Payout_Due split amount according to PL wise user has to upload the file into RH and the status will open as (SPLIT_PAYMENT_RECD_STATUS= ‘O’). Once Split file is Uploaded SPLIT_PAYMENT_RECD_STATUS is closed in RH automatically based on REF_NO. <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Open Waiting for C Ops – Split Payments Status are displayed in this status.   <br />
&nbsp;&nbsp;• <i>Close Split Payment status Button:</i> This button is having access only to SME users & Admin users which will close the Split Payment Status and SME User / ADMIN User can cross check the Split Payment data and close appropriately based on REF_NO.    <br />
&nbsp;&nbsp;• Those having User access can’t close the Split Payment Status, Request user to forward the request to SME/ADMIN to close the Split Payment Status.  <br />
&nbsp;&nbsp;• <i>Upload Split Payment File Button:</i> This button is having access to all users which they can upload a split Excel file in RH. Please find the split upload excel file format from below table.    <br />

<asp:Table ID="Table1" runat="server"  BorderStyle="Solid" BorderColor="Black">
    <asp:TableHeaderRow ForeColor="black" BackColor="LightBlue" >
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payout ID</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Program</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Country</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Year</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Quarter</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Partner ID</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Partner Name</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Partner English Name</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">ISO Currency Type</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payout Due</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Split Amount</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">MCC</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Credit Note PL</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">PL (Cheque/TT)</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Part No</asp:TableHeaderCell>
    </asp:TableHeaderRow> </asp:Table>
 
 &nbsp;&nbsp;• <i>Point to remember while uploading to Split File into RH:</i>     <br />    
 &nbsp;&nbsp; &nbsp;&nbsp; >PAYOUT_DUE Amount should match SPLIT AMOUNT. If it not matches the file cannot be uploaded.    <br />
 &nbsp;&nbsp; &nbsp;&nbsp; >PL (CHEQUE/TT) and Part No are optional to upload the file.    <br />
 &nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel.    <br />
 
 <strong>To Be Sent To Local Outsource – Invoice Collection Status:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about To Be Sent - Invoice Collection Status:</i></u> Initially Team will receive the file without invoice number and invoice date. Later team has to send the file to Local Outsource team to get the Invoice number and invoice date. User has to generate the file from RH to send the invoice file to Local Outsource team and the status will open as (SENT_LOS_STATUS= ‘O’). Once Invoice file is generated SENT_LOS_STATUS is closed in RH automatically based on REF_NO. <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Open To be sent to Local Outsource – Invoice Collection Status are displayed in this status.   <br />
&nbsp;&nbsp;• <i>Close Invoice status Button:</i> This button is having access only to SME users & Admin users which will close the invoice status and SME User / ADMIN User can cross check the invoice data and close appropriately based on REF_NO.   <br />
&nbsp;&nbsp;• Those having User access can’t close the invoice Status, Request user to forward the request to SME/ADMIN to close the invoice Status.   <br />
&nbsp;&nbsp;• <i>Generate Invoice File Button:</i> This button is having access to all users which they can generate invoice Excel file from RH.     <br />
&nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel    <br /> 

<strong>Waiting For Local Outsource – Invoice Collection Status:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about Waiting For - Invoice Collection Status:</i></u>Initially Team will receive the file without invoice number and invoice date. Later team has to send the file to Local Outsource team to get the Invoice number and invoice date. Once invoice file is received from Local Outsource team. User has to upload the invoice file into RH and the status will open as (RECD_LOS_STATUS ‘O’). Once Invoice file is Uploaded RECD_LOS_STATUS is closed in RH automatically based on REF_NO. <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Waiting For Local Outsource – Invoice Collection Status are displayed in this status.    <br />
&nbsp;&nbsp;• <i>Close Invoice status Button:</i> This button is having access only to SME users & Admin users which will close the invoice status and SME User / ADMIN User can cross check the invoice data and close appropriately based on REF_NO.    <br />
&nbsp;&nbsp;• Those having User access can’t close the invoice Status, Request user to forward the request to SME/ADMIN to close the invoice Status.   <br />
&nbsp;&nbsp;• <i>Upload Invoice File Button:</i> This button is having access to all users which they can upload invoice Excel file in to RH. Please find the invoice upload excel file format from below table:     <br /> 
<asp:Table ID="Table2" runat="server"  BorderStyle="Solid" BorderColor="Black">
    <asp:TableHeaderRow ForeColor="black" BackColor="LightBlue" >
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Ref_No</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payout_Id</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Transaction_Id</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Transaction_Id_Gen_Date</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Program</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Country</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Fiscal_Year</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Quarter</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Month</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Partner_Id</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Partner_Name</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Partner_Eng_Name</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Curr</asp:TableHeaderCell>
    
    
    </asp:TableHeaderRow> 
    <asp:TableHeaderRow ForeColor="black" BackColor="LightBlue" >
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payout_Due</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Vat_Percentage</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Amount_After_Vat</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Wht_Percentage</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Tot_Amt_Payable</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Approving_Mgr</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payment_Mode</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Vendor_No</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Invoice_No</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Invoice_Date</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Eclipse_Code</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Mcc_Code</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Credit_Note_PL</asp:TableHeaderCell>
  
  
   
    </asp:TableHeaderRow> 
    <asp:TableHeaderRow ForeColor="black" BackColor="LightBlue" >
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Remarks</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">ENSE</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">DEPT</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">SF</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">PT</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">PL</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Sub_PL</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Acct</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Lcl_Sub_Acct</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Ic_Sub_Acct</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Sap_Doc_No</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payment Currency Type</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payment Amount (After Tax)</asp:TableHeaderCell>
    </asp:TableHeaderRow>
    <asp:TableHeaderRow ForeColor="black" BackColor="LightBlue" >
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payment Date (MM/DD/YYYY)</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Remarks_Frm_Pmt_Office</asp:TableHeaderCell>
    </asp:TableHeaderRow>
    </asp:Table>
     &nbsp;&nbsp;• <i>Point to remember while uploading to invoice File into RH:</i>     <br />    
 &nbsp;&nbsp; &nbsp;&nbsp; >For FC Payments INVOICE_NO, INVOICE_DATE and REMARKS are updated in RH. After Updations in RH, INVOICE_NO will be concatenated with ‘CY’.    <br />
 &nbsp;&nbsp; &nbsp;&nbsp; >For CI Payments PAYOUT_DUE, VAT_PERCENTAGE, AMOUNT_AFTER_VAT, WHT_PERCENTAGE, TOT_AMOUNT_PAYABLE, INVOICE_NO, INVOICE_DATE and REMARKS are updated in RH. After Updations in RH, INVOICE_NO will be concatenated with ‘PROGRAM, QUARTER, and FISCAL_YEAR’. <br />
 &nbsp;&nbsp; &nbsp;&nbsp; >For CI Payments PAYOUT_DUE amount should match with First upload file when uploading the invoice file. If it not matches the file cannot be uploaded. <br />
 &nbsp;&nbsp; &nbsp;&nbsp; >If INVOICE_NO is found duplicate with the following columns of WWAS_FLAG in the PAYMENT_MASTER table then the records will fall under SUSPECT_STATUS.  <br />
 &nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel.    <br />

 <strong>To Be Uploaded To Platform One Status:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about To Be Uploaded To Platform One Status: </i></u>When Split & Invoice status is closed and where team can generate the P1 File from RH and the status will open as (FIRST_UPLOAD_P1_STATUS = ‘O’). Once P1 file is generated FIRST_UPLOAD_P1_STATUS is closed in RH automatically based on REF_NO. User will upload the P1 File in to P1 System. <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Open To Be Uploaded To Platform One Status are displayed in this status.    <br />
&nbsp;&nbsp;• <i>Generate First P1 Upload File Button:</i> This button is having access to all users which they can generate P1 Excel file from RH for CI Payments. For FC Payments only SME & ADMIN User is having access to generate P1 Excel file from RH.    <br />
&nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel.    <br />

<strong>Waiting For Transaction Id Status:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about Waiting For Transaction Id Status:</i></u> This status is only applicable to CI Payments and not applicable to FC Payments. Initially Team will receive the file without Transaction Id and later team will receive the file from P1 with Transaction Id. To update the Transaction Id, user has to upload the file in to RH and the status will open as (TRANSACTION_ID_UPlOAD_STATUS = ‘O’). Once Transaction Id is Uploaded TRANSACTION_ID_UPlOAD_STATUS is closed in RH automatically based on REF_NO. <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Open Waiting for Transaction Id Status are displayed in this status   <br />
&nbsp;&nbsp;• <i>Upload Transaction Id File Button:</i> This button is having access to all users which user can upload the transaction id Excel file into RH. Please find the transaction id upload excel file format from below table:    <br />
<asp:Table ID="Table3" runat="server"  BorderStyle="Solid" BorderColor="Black">
    <asp:TableHeaderRow ForeColor="black" BackColor="LightBlue" >
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Ref_No</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payout_Id</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Transaction_Id</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Transaction_Id_Gen_Date</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Program</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Country</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Fiscal_Year</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Quarter</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Month</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Partner_Id</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Partner_Name</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Curr</asp:TableHeaderCell>
    
    </asp:TableHeaderRow> 
    <asp:TableHeaderRow ForeColor="black" BackColor="LightBlue" >
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payout_Due</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Vat_Percentage</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Tot_Amt_Payable</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Approving_Mgr</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payment_Mode</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Vendor_No</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Invoice_No</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Eclipse_Code</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Mcc_Code</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Credit_Note_PL</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Remarks</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">ENSE</asp:TableHeaderCell>
    
    
    
   
    </asp:TableHeaderRow> 
    <asp:TableHeaderRow ForeColor="black" BackColor="LightBlue" >
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">DEPT</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">SF</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">PT</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">PL</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Sub_PL</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Acct</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Lcl_Sub_Acct</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Ic_Sub_Acct</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Sap_Doc_No</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payment Currency Type</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payment Amount (After Tax)</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payment Date (MM/DD/YYYY)</asp:TableHeaderCell>
    
    
   
    </asp:TableHeaderRow>
 
    <asp:TableHeaderRow ForeColor="black" BackColor="LightBlue" >
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Remarks_Frm_Pmt_Office</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Status</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">TARGET_PARTNER_ID</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">TARGET_PARTNER_ENGLISH_NAME</asp:TableHeaderCell>
    </asp:TableHeaderRow>

    </asp:Table>
    &nbsp;&nbsp;• <i>Point to remember while uploading to Transaction id File into RH:</i>     <br />    
 &nbsp;&nbsp; &nbsp;&nbsp; >User has to check the values of TRANSACTION_ID and PAYOUT_ID should be unique while uploading the Transaction id file.    <br />
 &nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel.    <br />

 <strong>To Be Sent to APJ Team Status:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about To Be Sent to APJ Team Status:</i></u>To Be Sent to APJ Team Status is the Status where team will post the records in to SAP. Once Posting is done, the Payment will be paid to partners.
For CI Payments When P1 status is closed and where team can generate the LH1, FY1 and Credit Note File and for FC payments when invoice status is closed where team can generate the LH1, FY1 and when P1 status is closed where team can generate Credit Note File from RH and the status will open as (RECD_APJ_DOC_NO_STATUS = ‘O’) .Once LH1, FY1 and Credit Note File is generated RECD_APJ_DOC_NO_STATUS will not closed in RH automatically. User has to run the SAP WIZARD macro to generate 19 series number then the status RECD_APJ_DOC_NO_STATUS is closed automatically in RH based on REF_NO. <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Open To Be Sent to APJ Team Status are displayed in this status.    <br />
&nbsp;&nbsp;• <i>Close To Be Sent to APJ Team Status Button:</i> This button is having access only to SME users & Admin users which will close To Be Sent to APJ Team status and SME User / ADMIN User can cross check the To Be Sent to APJ Team data and close appropriately based on REF_NO.   <br />
&nbsp;&nbsp;• Those having User access can’t close the To Be Sent to APJ Team Status, Request user to forward the request to SME/ADMIN to close the To Be Sent to APJ Team Status.   <br />
&nbsp;&nbsp;• <i>Generate LH1 File Button:</i> This button is having access to all users which they can generate LH1 Macro file with data from RH.     <br />
&nbsp;&nbsp;• <i>Generate FI1 File Button:</i> This button is having access to all users which they can generate FI1 Macro file with data from RH.    <br />
&nbsp;&nbsp;• <i>Generate Credit Note File Button:</i> This button is having access to all users which they can generate Credit Note Excel file with data from RH.     <br />
   &nbsp;&nbsp;• <i>Point to check while generating the To Be Sent to APJ Team Status files from RH:</i>     <br />    
 &nbsp;&nbsp; &nbsp;&nbsp; >For Non-Invoice countries INVOICE_NO will be generated automatically from RH according to country specifications.    <br />
 &nbsp;&nbsp; &nbsp;&nbsp; >For KR, VN & ID Net Amount, Vat Amount, Sum (Gross Amount) will be rounded off in LH1 Macro file for both teams.    <br />
 &nbsp;&nbsp; &nbsp;&nbsp; >For COMPANY_CODE = ‘ID99’, Period Short will be considered as ‘REMARKS’ from RH in LH1 Macro files for both teams.    <br />
 &nbsp;&nbsp; &nbsp;&nbsp; >For JP Net Amount, Vat Amount, Sum (Gross Amount) will be rounded off in FI1 Macro file for CI Payment team.    <br />
 &nbsp;&nbsp; &nbsp;&nbsp; >19 series numbers are updated in RH for the following column (SAP_DOC_NO) and POSTING_DT is the date when you posted the file in SAP is captured in RH automatically.    <br />
 &nbsp;&nbsp; &nbsp;&nbsp; >If there is any SAP error while posting the payments the error is captured in SAP Macro in Column T and in RH for the following column (RECD_APJ_DOC_NO_STATUS_COMMENTS)    <br />
 &nbsp;&nbsp; &nbsp;&nbsp;> For FC Payments RH is not checking the First P1 Upload Status whether the status is open (or) closed to generate the LH1,FI1 & Credit Note Files.    <br />
 &nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel.    <br />

 <strong>Waiting for APJ Team Status:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about Waiting for APJ Team Status:</i></u> Waiting for APJ Team Status is the status where payment is ready for close loop LH1, FY1 & CREDIT NOTES and the status will open as  (RECD_APJ_CLOSE_LOOP_STATUS = ‘O’). ). Once Credit Note File is Uploaded the status RECD_APJ_CLOSE_LOOP_STATUS is closed in RH automatically. For LH1 & FY1 User has to run the Close Loop Macro to generate the 2 series number then the status will closed automatically in RH based on REF_NO. <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Open Waiting for APJ Team Status are displayed in this status. <br />
&nbsp;&nbsp;• <i>Close Waiting for APJ Team Status Button:</i> This button is having access only to SME users & Admin users which will close Waiting for APJ Team status and SME User / ADMIN User can cross check the Waiting for APJ Team data and close appropriately based on REF_NO.    <br />
&nbsp;&nbsp;• Those having User access can’t close the Waiting for APJ Team Status, Request user to forward the request to SME/ADMIN to close the Waiting for APJ Team Status.   <br />
&nbsp;&nbsp;• <i>Upload Credit Note File Button:</i>This button is having access to all users which they can upload Credit Note Excel file into RH. Please find the credit note upload excel file format from below table:     <br />
<asp:Table ID="Table4" runat="server"  BorderStyle="Solid" BorderColor="Black">
    <asp:TableHeaderRow ForeColor="black" BackColor="LightBlue" >
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Ref_No</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payout_Id</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Transaction_Id</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Transaction_Id_Gen_Date</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Program</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Country</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Fiscal_Year</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Month</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Partner_Id</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Partner_Name</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Partner_Eng_Name</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Curr</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payout_Due</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Vat_Percentage</asp:TableHeaderCell>
    </asp:TableHeaderRow> 
    <asp:TableHeaderRow ForeColor="black" BackColor="LightBlue" >
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Wht_Percentage</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Tot_Amt_Payable</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Approving_Mgr</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Payment_Mode</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Vendor_No</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Eclipse_Code</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Mcc_Code</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Remarks</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Credit Note No</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Credit Note Date (MM/DD/YYYY) </asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Order Ref No</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Credit Note Currency Type</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Credit Note Amount (After Tax)</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Remarks from ITH/CRO</asp:TableHeaderCell>
   </asp:TableHeaderRow> 
   </asp:Table>
 &nbsp;&nbsp;• <i>Close Loop Macro:</i> This macro file is available with SME Users & Admin users. Please contact them to get the Close Loop Macro file to generate the 2 series number for LH1 & FY1.    <br />   
 &nbsp;&nbsp;• <i>Point to check while uploading in to Close Loop Macro:</i>     <br />    
 &nbsp;&nbsp; &nbsp;&nbsp; >Posting_Date and Clearing_Date should be in (DD.MM.YYYY) format for LH1.   <br />
 &nbsp;&nbsp; &nbsp;&nbsp; >For LH1 user has to fill the data in close loop macro file and for FY1 data takes automatically from SAP.    <br />
 &nbsp;&nbsp; &nbsp;&nbsp; >2 series numbers are updated in RH for the following column (CLEARING_DOC_NO).     <br />
 &nbsp;&nbsp; &nbsp;&nbsp; >VALUE_DATE and CHECK_REFERENCE are updated in RH automatically.    <br />
 &nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel.    <br />

 <strong>Reply Recd From APJ Team – Close Loop Status:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about Reply Recd From APJ Team – Close Loop Status:</i></u> When To Be Sent to APJ Team and Waiting for APJ Team status is closed where team has to generate the P1 & India and MDF file from RH and the status will open as (UPLOADED_TO_P1_STATUS = ‘O’) Once P1 & India and MDF file is generated from RH the UPLOADED_TO_P1_STATUS status is closed in RH automatically based on REF_NO. <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Open Reply Recd from APJ Team – Close Loop Status are displayed in this status.    <br />
&nbsp;&nbsp;• <i>All Status Closed Button:</i> This button is having access only to SME users & Admin users which will close All Status and SME User / ADMIN User can cross check the All Status data and close appropriately based on REF_NO.   <br />
&nbsp;&nbsp;• Those having User access can’t close the All Status, Request user to forward the request to SME/ADMIN to close the All Status.   <br />
&nbsp;&nbsp;• <i>Generate P1& India File Button:</i> This button is having access to all users which they can generate P1& India File with data from RH.    <br />
&nbsp;&nbsp;• <i>Generate MDF File Button:</i> This button is having access to all users which they can generate MDF file with data from RH.  <br />
&nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel.    <br />

<strong>All Status Pending:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about All Status Pending:</i></u> All status pending is the status where the team can view the all open records to process and the status will open as (ALL_STATUS = ‘O’). <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Open All Status Pending are displayed in this status.    <br />
&nbsp;&nbsp;• <i>All Status Closed Button:</i> This button is having access only to SME users & Admin users which will close All Status and SME User / ADMIN User can cross check the All Status data and close appropriately based on REF_NO.   <br />
&nbsp;&nbsp;• Those having User access can’t close the All Status, Request user to forward the request to SME/ADMIN to close the All Status.  <br />
&nbsp;&nbsp;• <i>Hold Payment Status Button:</i> This button is having access to all users which they can hold the payments based on Payout-Id and status will open as (ALL_STATUS = ‘H’).     <br />
&nbsp;&nbsp;• <i>Processing Comments Button:</i> This button is having access to all users which they can update the processing comments based on Ref_No.     <br />
&nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel.     <br />

<strong>Hold Payments:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about Hold Payments:</i></u> Hold Payments status is the status where the team can view the hold payments records and the status will open as (ALL_STATUS = ‘H’). <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Open Hold Status Pending are displayed in this status.   <br />
&nbsp;&nbsp;• <i>Open Payment Status Button:</i> This button is having access to all users which they can open the hold payments based on PAYOUT-ID and status will open as (ALL_STATUS = ‘O’).    <br />
&nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel.    <br />

<strong>Closed Status:</strong>	<br />
&nbsp;&nbsp;<u><i>Brief about Closed Status:</i></u> Closed Status is the status where the team can view the closed status records and the status will open as (ALL_STATUS = ‘C’). <br />
&nbsp;&nbsp;• <i>Pending Button:</i> Records with Closed Status are displayed in this status.   <br />
&nbsp;&nbsp;• <i>Open Payment Status Button:</i> This button is having access to all users which they can open the All Status based on Payout-Id and status will open as (ALL_STATUS = ‘O’).    <br />
&nbsp;&nbsp;• <i>Point to check after All Status is closed:</i>     <br />
 &nbsp;&nbsp; &nbsp;&nbsp; >For IN, User has to run the AWB Macro to update AWB_NUMBER and PHYSICAL_CHECK_NO in RH for FC Payments.   <br />
&nbsp;&nbsp;• <i>Export to Excel button:</i> All users can extract the data from RH in to Excel.    <br />

<br />

<strong style="font-size :large">QUERY Page:</strong><br />
<br />
&nbsp;&nbsp;• Executes the User provided only SELECT SQL Query and displays the records in Data Grid.   <br />
&nbsp;&nbsp;• Data in Grid can be Export to Excel.   <br />
&nbsp;&nbsp;• Find the table names and descriptions from below table:  <br />
<asp:Table ID="Table5" runat="server"  BorderStyle="Solid" BorderColor="Black">
    <asp:TableHeaderRow ForeColor="black" BackColor="LightBlue" >
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Table_Name</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Description</asp:TableHeaderCell>
    </asp:TableHeaderRow>
       <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">APAC_USER.ALT_NAME_APACPAY</asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Vendor Id Mismatch table</asp:TableCell>
    </asp:TableRow>
         <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">APAC_USER.WWAS_LIMITS_MASTER_APACPAY </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">WWAS table</asp:TableCell>
    </asp:TableRow>
         <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">APACPPP_USER.COMPANY_CODE_MASTER_APACPPP </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Company Code table</asp:TableCell>
    </asp:TableRow>
    <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">APACPPP_USER.COUNTRY_CODE_MASTER_APACPPP </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Country Code Table</asp:TableCell>
    </asp:TableRow>
    <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">APACPPP_USER.PPRO_VENID_MATCH_APACPPP </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Vendor id table</asp:TableCell>
    </asp:TableRow>
    <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Default_Spl_Hndl </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Special Handling Table (combination of PROGRAM_TYPE, COUNTRY_CODE,PAYMENT_MODE)</asp:TableCell>
    </asp:TableRow>
    <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">PAYMENT_MASTER </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Master Data Table</asp:TableCell>
    </asp:TableRow>
    <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Payment_Method_Tbl </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Payment Method Table</asp:TableCell>
    </asp:TableRow>
     <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">PAYMENT_MODE_TBL </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Payment Mode Table</asp:TableCell>
    </asp:TableRow>
    <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Spl_Handling_Tbl </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Special Handling Table (combination of PROGRAM_TYPE, COUNTRY_CODE, PROGRAM, PARTNER_PRO_ID, PAYMENT_MODE)</asp:TableCell>
    </asp:TableRow>
    <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">TRESHOLD_MATRIX </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Treshold data table</asp:TableCell>
    </asp:TableRow>
     <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">WWAS_EX_RATE </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">WWAS Exchange Rate Table</asp:TableCell>
    </asp:TableRow>
    </asp:Table>
    <strong style="font-size :large">Syntax SQL Query:</strong><br />
    &nbsp;&nbsp;• For ex: SELECT * FROM PAYMENT_MASTER WHERE REF_NO =’123’   <br />
    &nbsp;&nbsp;• For ex: SELECT * FROM PAYMENT_MASTER WHERE REF_NO in (’123’,’124’)   <br />
    <br />

<strong style="font-size :large">EDIT DETAILS Page:</strong><br />
<br />
 &nbsp;&nbsp;• This Page access will be given to the admin user only.    <br />
 &nbsp;&nbsp;• Search criteria given for TEAM_NAME, COUNTRY_CODE, PROGRAM, PAYMENT_MODE, PAYOUT _ID, PARTNER_ID and WWAS_EMAIL_ID.   <br />
 &nbsp;&nbsp;• Admin user can upload / update / edit & delete the records from this page.  <br />
 &nbsp;&nbsp;• Admin user can select edit table from drop down list. Please find the edit tables names and descriptions from below table.    <br />
 <asp:Table ID="Table6" runat="server"  BorderStyle="Solid" BorderColor="Black">
    <asp:TableHeaderRow ForeColor="black" BackColor="LightBlue" >
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Table_Name</asp:TableHeaderCell>
    <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black">Description</asp:TableHeaderCell>
    </asp:TableHeaderRow>
       <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">PAYMENT_MASTER</asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Master Data details found in the table</asp:TableCell>
    </asp:TableRow>
         <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">ALT_NAME_APACPAY </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Vendor Id Mismatch details found in the table</asp:TableCell>
    </asp:TableRow>
         <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">WWAS_LIMITS_MASTER_APACPAY</asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">WWAS details found in the table</asp:TableCell>
    </asp:TableRow>
    <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">PPRO_VENID_MATCH_APACPPP </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Vendor id details found in the table</asp:TableCell>
    </asp:TableRow>
    <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Payment_Method_Tbl </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Payment Method details found in the Table</asp:TableCell>
    </asp:TableRow>
    <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">PAYMENT_MODE_TBL</asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Payment Mode details found in the Table</asp:TableCell>
    </asp:TableRow>
    <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Spl_Handling_Tbl </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Special Handling (combination of PROGRAM_TYPE, COUNTRY_CODE, PROGRAM, PARTNER_PRO_ID, PAYMENT_MODE) details found in the table</asp:TableCell>
    </asp:TableRow>
    <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Default_Spl_Hndl </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Special Handling Table (combination of PROGRAM_TYPE, COUNTRY_CODE, PAYMENT_MODE) details found in the table</asp:TableCell>
    </asp:TableRow>
     <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">WWAS_EX_RATE </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">WWAS Exchange Rate details found in the Table</asp:TableCell>
    </asp:TableRow>
    <asp:TableRow BorderWidth="0.5px" BorderStyle="Solid" BorderColor="Black">    
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">TRESHOLD_MATRIX </asp:TableCell>
    <asp:TableCell BorderStyle="Solid" BorderColor="Black">Treshold data details found in the table.</asp:TableCell>
    </asp:TableRow>
    </asp:Table>
 &nbsp;&nbsp;• To upload / update / edit & delete in these 2 (APACPPP_USER.COMPANY_CODE_MASTER_APACPPP and APACPPP_USER.COUNTRY_CODE_MASTER_APACPPP) tables. Admin user has to raise the support ticket.     <br />
 &nbsp;&nbsp;• Check all option is available to delete the records and not to update the records.  <br />
 &nbsp;&nbsp;• Records are updated / Edited based on REF_NO and check box option is not available for update / Edit.   <br />
</asp:Content>
