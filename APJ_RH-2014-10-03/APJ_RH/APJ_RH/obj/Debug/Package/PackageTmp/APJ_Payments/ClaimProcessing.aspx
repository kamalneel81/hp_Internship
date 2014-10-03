<%@ Page Title="Claim Processing" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClaimProcessing.aspx.cs" Inherits="APJ_RH.APJ_Payments.ClaimProcessing" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/> 
<%--<script> src="http://code.jquery.com/jquery-1.10.1.min.js"> </script>--%>
   <%-- <script src="../Scripts/jquery-1.11.1.js" type="text/javascript"></script>--%>
    <script type="text/javascript">

        function SelectAll(chkbox) {

            var frm = document.forms['aspnetForm'];

            for (var i = 0; i < document.forms[0].length; i++) {
                if (document.forms[0].elements[i].id.indexOf('CB') != -1) {

                    document.forms[0].elements[i].checked = chkbox.checked;

                }
            }
        }

  </script>

       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"> </asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    
      
    
    <ContentTemplate>

    <asp:Table ID="ConditionBottonsTable" runat="server" Width="100%">
        <asp:TableRow>
            <%--Width="100%"--%>
            <asp:TableCell>
                <asp:Label ID="SelectTeamLbl" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                    Text="Select Team:"></asp:Label></asp:TableCell>
            <%--Width="9%"--%>
            <asp:TableCell>
                <asp:DropDownList ID="SelectTeamList" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server" onselectedindexchanged="SelectTeamList_SelectedIndexChanged" AutoPostBack="True">  
                        <asp:ListItem>Select the Team Name</asp:ListItem>
                    <asp:ListItem>FC Payments</asp:ListItem>
                    <asp:ListItem>CI Payments</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <%--Width="9%"--%>
            <asp:TableCell>
                <asp:Label ID="SelectCountryCodeLbl" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                    Text="Select Country Code:" ></asp:Label></asp:TableCell>
             <%--Width="9%"--%>
            <asp:TableCell>
             <asp:DropDownList ID="SelectCountryCodeList" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server" onselectedindexchanged="SelectCountryCodeList_SelectedIndexChanged" AutoPostBack="True" >
                    <%--    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>MY</asp:ListItem>--%>
                </asp:DropDownList>
             </asp:TableCell>
            <%--Width="9%"--%>
            <asp:TableCell>
                <asp:Label ID="SelectStatusLbl" runat="server" width="100px" Style="font-family: HP Simplified"
                    Text="Select Status:"></asp:Label>
      
                <asp:DropDownList ID="SelectStatusList" class="widthcomp" Style="font-family: HP Simplified"
                   align = "left" runat="server">
                   <asp:ListItem>Select the Status</asp:ListItem>
                    <asp:ListItem>Suspect Status</asp:ListItem>
                    <asp:ListItem>WWAS Approval</asp:ListItem>
                    <asp:ListItem>Vendor Id Status</asp:ListItem>
                    <asp:ListItem>Vendor Name Mismatch Status</asp:ListItem>
                    <asp:ListItem>Threshold Approval Status</asp:ListItem>
                    <asp:ListItem>To be Sent To C Ops - Split Payments</asp:ListItem>
                    <asp:ListItem>Waiting For C Ops - Split Payments</asp:ListItem>
                    <asp:ListItem>To Be Sent To Local Outsource - Invoice Collection</asp:ListItem>
                    <asp:ListItem>Waiting For Local Outsource  - Invoice Collection</asp:ListItem>
                    <asp:ListItem>To Be Uploaded To Platform One</asp:ListItem>
                    <asp:ListItem>Waiting For Transaction Id</asp:ListItem>
                    <asp:ListItem>To Be Sent To APJ Team</asp:ListItem>
                    <asp:ListItem>Waiting For APJ Team</asp:ListItem>
                    <asp:ListItem>Reply Recd From APJ Team - Close Loop</asp:ListItem>
                    <asp:ListItem>All Status - Pending</asp:ListItem>
                    <asp:ListItem>Hold Payments</asp:ListItem>
                    <asp:ListItem>Closed</asp:ListItem>
                    
                    

                </asp:DropDownList>
           </asp:TableCell>
          <%--Width="9%"--%>
         </asp:TableRow>
        <asp:TableRow>
            <%--Width="100%"--%>
            <asp:TableCell>
                <asp:Label ID="SelectProgramLbl" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                    Text="Select Program:"></asp:Label></asp:TableCell>
            <%--Width="9%"--%>
              <asp:TableCell>
               <asp:DropDownList ID="SelectProgramList" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server">
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="CommentsLbl" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server" Text="Payment Mode: " ></asp:Label></asp:TableCell>
                <%--Width="9%"--%>
                <asp:TableCell>
                <asp:DropDownList ID="SelectPaymentModeList" runat="server" class="widthcomp" Style="font-family: HP Simplified">
                    <asp:ListItem>Select the Payment Mode</asp:ListItem>
                    <asp:ListItem>CREDIT NOTES</asp:ListItem>
                    <asp:ListItem>CHEQUE/TT</asp:ListItem>
                    <asp:ListItem>TT</asp:ListItem>
                    <asp:ListItem>CHEQUE</asp:ListItem>
                    <asp:ListItem>GIRO</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            <%--Width="9%"--%>
           <asp:TableCell>
           <asp:Button ID="PendingBtn" runat="server" class = "widthcomp" Style="font-family: HP Simplified"
                    Text="Pending" OnClick="Pending_Click"/>
           </asp:TableCell>
            <%--Width="9%"--%> 
           </asp:TableRow>
        
        
        <asp:TableRow>
            <asp:TableCell ColumnSpan="8">
                <asp:Panel ID="Panel1" Width="100%" runat="server" Style="margin-right: 25px">
                    
                        <asp:Button ID="ExportToExcelBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified" OnClick = "ExporttoExcelBtn_Click"
                        Text="Export To Excel"  Visible="False"/>
                        <asp:Button ID="GenerateFirstP1UploadFileBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Generate First P1 Upload File" Visible="False" OnClick = "GenerateFirstP1UploadFileBtn_Click"/>
                       <asp:Button ID="UploadTransactionIdFileBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Upload Transaction Id File" href="#UploadTransactionIdFileModal" data-toggle="modal" Visible="False" />
                        
                      
                       <asp:Button ID="AllStatusClosedBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="All Status Closed" href="#AllStatusClosedModal" data-toggle="modal" Visible="False" OnClick = "AllStatusClosedBtn_Click" />
                         <asp:Button ID="ClosePaymentAllStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Close Payment Status (All)"  Visible="False" />
                        <asp:Button ID="CloseSplitPaymentStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Close Split Payment Status"  href="#CloseSplitStatusModal" data-toggle="modal" Visible="False" OnClick = "CloseSplitPaymentStatusBtn_Click"/>
                       <asp:Button ID="GenerateSplitPaymentBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Generate Split Payment" OnClick = "GenerateSplitPaymentStatusBtn_Click " Visible="False" />
                         <asp:Button ID="UploadSplitPaymentFileBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Upload Split Payment File"  Visible="False" href="#UploadSplitPaymentFileModal" data-toggle="modal" OnClick = "UploadSplitPaymentFileBtn_Click"  />
                        <asp:Button ID="CloseInvoiceStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Close Invoice Status" href="#CloseInvoiceStatusModal" data-toggle="modal" Visible="False" OnClick = "CloseInvoiceStatusBtn_Click" />
                         <asp:Button ID="GenerateInvoiceFileBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Generate Invoice File"  Visible="False" OnClick = "GenerateInvoiceFileBtn_Click" />
                        <asp:Button ID="CloseVendorIdStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Close VendorId Status"  Visible="False" href="#CloseVendorIdModal" data-toggle="modal" OnClick = "CloseVendorIdStatusBtn_Click" />
                         <asp:Button ID="CloseSuspectStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Close Suspect Status"  href="#CloseSuspectstatusModal" data-toggle="modal" Visible="False" OnClick = "CloseSuspectstatusBtn_Click"  />
                        <asp:Button ID="CloseValidationStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Close Validation Status"  Visible="False" />
                        <asp:Button ID="CloseWWASStatusBtn" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Close WWAS Status" href="#WWASStatusModal" data-toggle="modal" Visible="False" OnClick = "CloseWWASStatusBtn_Click"/>
                      
                      <asp:Button ID="GenerateMailToWWASBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Generate Mail To WWAS"  Visible="False" OnClick = "GenerateMailToWWASBtn_Click"  />

                        <asp:Button ID="UpdateNewWWASManagerBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Update New WWAS Manager" href="#UpdateNewWWASManagerModal" data-toggle="modal"  Visible="False" />
                        <asp:Button ID="OpenHoldPaymentStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Hold Payment Status"  Visible="False" href="#OpenHoldPaymentStatusModal" data-toggle="modal" OnClick = "OpenHoldPaymentStatusBtn_Click"  />
                        
                         <asp:Button ID="ProcessingCommentsBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Processing Comments"  Visible="False" href="#ProcessingCommentsModal" data-toggle="modal" OnClick = "ProcessingCommentsBtn_Click"  />
                        
                        <asp:Button ID="OpenPaymentStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Open Payment Status"  Visible="False"  href="#OpenPaymentStatusModal" data-toggle="modal" OnClick = "OpenPaymentStatusBtn_Click"/>
                       
                        <asp:Button ID="UploadInvoiceFileBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Upload Invoice File"  Visible="False" href="#UploadInvoiceFileModal" data-toggle="modal" OnClick = "UploadInvoiceFileBtn_Click" />
                         <asp:Button ID="CloseVendorIdMismatchStatusBtn" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Close Vendor Name Mismatch Status"  Visible="False" href="#CloseVendorIdMismatchStatusModal" data-toggle="modal" OnClick = "CloseVendorIdMismatchStatusBtn_Click"  />
                       
                        <asp:Button ID="CloseWaitingForAPJStatusBtn" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Close Waiting For APJ Status" Visible="False" href="#CloseWaitingForAPJStatusModal" data-toggle="modal" OnClick = "CloseWaitingForAPJStatusBtn_Click" />
                        <asp:Button ID="UploadCreditNoteFileBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Upload Credit Note File"  Visible="False" href="#UploadCreditNoteFileModal" data-toggle="modal" OnClick = "UploadCreditNoteFileBtn_Click"/>
                       
              <asp:Button ID="CloseToBeSentToAPJStatusBtn" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Close To Be Sent To APJ Status" href="#CloseToBeSentToAPJStatusModal" data-toggle="modal" Visible="False" OnClick = "CloseToBeSentToAPJStatusBtn_Click"  />
                         <asp:Button ID="ThresholdApprovalStatusBtn" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Close Threshold Approval Status"  Visible="False" OnClick = "ThresholdApprovalStatusBtn_Click"  />
   

                
                <asp:DropDownList ID="GenerateFilesList" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server" Visible="False">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>LH1 FILE</asp:ListItem>
                    <asp:ListItem>FI1 FILE</asp:ListItem>
                    <asp:ListItem>CREDIT NOTES</asp:ListItem>
                    </asp:DropDownList>
                       <asp:Button ID="GenerateFilesBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Generate"  Visible="False" OnClick = "GenerateFilesBtn_Click"  />
                     
                     
                  <asp:DropDownList ID="GenerateCloseLoopFilesList" class="widthcomp1" Style="font-family: HP Simplified"
                    runat="server" Visible="False">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>P1 & India</asp:ListItem>
                    <asp:ListItem>MDF</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="GenerateCloseLoopFileBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Generate" Visible="False" OnClick = "GenerateCloseLoopFileBtn_Click"  />
                </asp:Panel>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
     
 <asp:Table ID="GridTable" runat="server" Width="75%" BorderStyle="Solid" BorderColor="#0096D6" BorderWidth="2px" Visible = "false">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="7" Style="vertical-align: top;">
                <div style="height: 350px; width: 1424px; overflow: auto;">
                    <asp:TextBox ID="myTextBox" runat="server"  Visible="False" />
                    
                    
                    <asp:GridView ID="gvSuspectStatus" runat="server" CaptionAlign="Left" Width="75%" 
                        BackColor="White" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black"
                        GridLines="Both" AutoGenerateColumns="false" ShowFooter="true" 
                        Visible="true" Font-Size="Small" HeaderStyle-Wrap="False" AlternatingRowStyle-Wrap="False"
                        EditRowStyle-Wrap="False" EmptyDataRowStyle-Wrap="False" RowStyle-Wrap="False"
                        SortedDescendingHeaderStyle-Wrap="False" AllowSorting="true" OnSorting="GridViewSS_Sorting" 
                        AllowPaging="true" PageSize="12" OnPageIndexChanging="GridViewSS_PageIndexChanging"  BorderStyle="Solid" 
  OnClientClick="form1.target='_self';">
                        <Columns>
                            <asp:TemplateField ItemStyle-Width="20px">
                            <HeaderTemplate>
                                    <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);"/>
                                    <%-- <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);" />--%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CB" runat="server" />
                                </ItemTemplate>
                                <ItemStyle Width="20px" VerticalAlign="Middle"></ItemStyle>
                            </asp:TemplateField>
                           <%--<asp:BoundField DataField="REF_NO" HeaderText="REF_NO" SortExpression="REF_NO" />--%>
                            
                            <asp:TemplateField HeaderText="REF_NO" SortExpression="REF_NO">
                            
                      
                      <ItemTemplate>
           
                                    
                                    <asp:Label ID="lblpartner_pro_id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "REF_NO") %>'></asp:Label>
                                   
                                </ItemTemplate>
                                
                            </asp:TemplateField>
                             
                            
                           
                            <asp:BoundField DataField="PAYOUT_ID" HeaderText="PAYOUT_ID" SortExpression="PAYOUT_ID" />
                            <asp:BoundField DataField="TRANSACTION_ID" HeaderText="TRANSACTION_ID" SortExpression="TRANSACTION_ID"  />
                            <asp:BoundField DataField="TRANSACTION_ID_GEN_DATE" HeaderText="TRANSACTION_ID_GEN_DATE" SortExpression="TRANSACTION_ID_GEN_DATE" />
                            <asp:BoundField DataField="PROGRAM" HeaderText="PROGRAM" SortExpression="PROGRAM" />
                             <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
                            <asp:BoundField DataField="FISCAL_YEAR" HeaderText="FISCAL_YEAR" SortExpression="FISCAL_YEAR" />
                           <asp:BoundField DataField="QUARTER" HeaderText="QUARTER" SortExpression="QUARTER" />                            
                            <asp:BoundField DataField="MONTH" HeaderText="MONTH" SortExpression="MONTH" />
                            <asp:BoundField DataField="PARTNER_ID" HeaderText="PARTNER_ID" SortExpression="PARTNER_ID" />
                              <asp:BoundField DataField="PARTNER_NAME" HeaderText="PARTNER_NAME" SortExpression="PARTNER_NAME" />
                               <asp:BoundField DataField="PARTNER_ENG_NAME" HeaderText="PARTNER_ENG_NAME" SortExpression="PARTNER_ENG_NAME" />
                                <asp:BoundField DataField="CURR" HeaderText="CURR" SortExpression="CURR" />
                                 <asp:BoundField DataField="PAYOUT_DUE" HeaderText="PAYOUT_DUE" SortExpression="PAYOUT_DUE" />
                                  <asp:BoundField DataField="VAT_PERCENTAGE" HeaderText="VAT_PERCENTAGE" SortExpression="VAT_PERCENTAGE" />
                                   <asp:BoundField DataField="AMOUNT_AFTER_VAT" HeaderText="AMOUNT_AFTER_VAT" SortExpression="AMOUNT_AFTER_VAT" />
                                    <asp:BoundField DataField="WHT_PERCENTAGE" HeaderText="WHT_PERCENTAGE" SortExpression="WHT_PERCENTAGE" />
                                     <asp:BoundField DataField="TOT_AMOUNT_PAYABLE" HeaderText="TOT_AMOUNT_PAYABLE" SortExpression="TOT_AMOUNT_PAYABLE" />
                                     <asp:BoundField DataField="TOT_AMOUNT_PAYABLE_USD" HeaderText="TOT_AMOUNT_PAYABLE_USD" SortExpression="TOT_AMOUNT_PAYABLE_USD" />
                                     <asp:BoundField DataField="APPROVING_MGR" HeaderText="APPROVING_MGR" SortExpression="APPROVING_MGR" />
                                     <asp:BoundField DataField="PAYMENT_MODE" HeaderText="PAYMENT_MODE" SortExpression="PAYMENT_MODE" />
                                     <asp:BoundField DataField="VENDOR_NO" HeaderText="VENDOR_NO" SortExpression="VENDOR_NO" />
                                     <asp:BoundField DataField="INVOICE_NO" HeaderText="INVOICE_NO" SortExpression="INVOICE_NO" />
                                     <asp:BoundField DataField="INVOICE_DATE" HeaderText="INVOICE_DATE" SortExpression="INVOICE_DATE" />
                                     <asp:BoundField DataField="ECLIPSE_CODE" HeaderText="ECLIPSE_CODE" SortExpression="ECLIPSE_CODE" />
                                     <asp:BoundField DataField="MCC_CODE" HeaderText="MCC_CODE" SortExpression="MCC_CODE" />
                                     <asp:BoundField DataField="CREDIT_NOTE_PL" HeaderText="CREDIT_NOTE_PL" SortExpression="CREDIT_NOTE_PL" />
                                     <asp:BoundField DataField="REMARKS" HeaderText="REMARKS" SortExpression="REMARKS" />
                                     <asp:BoundField DataField="ENSE" HeaderText="ENSE" SortExpression="ENSE" />
                                     <asp:BoundField DataField="DEPT" HeaderText="DEPT" SortExpression="DEPT" />
                                     <asp:BoundField DataField="SF" HeaderText="SF" SortExpression="SF" />
                                     <asp:BoundField DataField="PT" HeaderText="PT" SortExpression="PT" />
                                     <asp:BoundField DataField="PL" HeaderText="PL" SortExpression="PL" />
                                     <asp:BoundField DataField="SUB_PL" HeaderText="SUB_PL" SortExpression="SUB_PL" />
                                     <asp:BoundField DataField="ACCT" HeaderText="ACCT" SortExpression="ACCT" />
                                     <asp:BoundField DataField="LCL_SUB_ACCT" HeaderText="LCL_SUB_ACCT" SortExpression="LCL_SUB_ACCT" />
                                     <asp:BoundField DataField="IC_SUB_ACCT" HeaderText="IC_SUB_ACCT" SortExpression="IC_SUB_ACCT" />
                                      
                                      <asp:BoundField DataField="SAP_DOC_NO" HeaderText="SAP_DOC_NO" SortExpression="SAP_DOC_NO" />
                                      <asp:BoundField DataField="CLEARING_DOC_NO" HeaderText="CLEARING_DOC_NO" SortExpression="CLEARING_DOC_NO" />
                                      <asp:BoundField DataField="CHECK_REFERENCE" HeaderText="CHECK_REFERENCE" SortExpression="CHECK_REFERENCE" />
                                      <asp:BoundField DataField="CLEARING_DATE" HeaderText="CLEARING_DATE" SortExpression="CLEARING_DATE" />
                                      <asp:BoundField DataField="VALUE_DATE" HeaderText="VALUE_DATE" SortExpression="VALUE_DATE" />
                                      <asp:BoundField DataField="POSTING_DT" HeaderText="POSTING_DT" SortExpression="POSTING_DT" />
                                      <asp:BoundField DataField="REMARKS_FRM_PMT_OFFICE" HeaderText="REMARKS_FRM_PMT_OFFICE" SortExpression="REMARKS_FRM_PMT_OFFICE" />
                                       <asp:BoundField DataField="PROCESSING_COMMENTS" HeaderText="PROCESSING_COMMENTS" SortExpression="PROCESSING_COMMENTS" />
                                      <asp:BoundField DataField="VENDOR_ID_STATUS" HeaderText="VENDOR_ID_STATUS" SortExpression="VENDOR_ID_STATUS" />
                                      <asp:BoundField DataField="VENDOR_NAME_MISMATCH_STATUS" HeaderText="VENDOR_NAME_MISMATCH_STATUS" SortExpression="VENDOR_NAME_MISMATCH_STATUS" />
                                      <asp:BoundField DataField="VENDOR_NAME_MISMATCH_STATUS_COMMENTS" HeaderText="VENDOR_NAME_MISMATCH_STATUS_COMMENTS" SortExpression="VENDOR_NAME_MISMATCH_STATUS_COMMENTS" />
                                      <asp:BoundField DataField="WWAS_STATUS" HeaderText="WWAS_STATUS" SortExpression="WWAS_STATUS" />


                                      <asp:BoundField DataField="WWAS_APPROVAL_DATE" HeaderText="WWAS_APPROVAL_DATE" SortExpression="WWAS_APPROVAL_DATE" />
                                      <asp:BoundField DataField="WWAS_COMMENTS" HeaderText="WWAS_COMMENTS" SortExpression="WWAS_COMMENTS" />
                                      <asp:BoundField DataField="WWAS_OLD_MANGER" HeaderText="WWAS_OLD_MANGER" SortExpression="WWAS_OLD_MANGER" />
                                      <asp:BoundField DataField="SPLIT_PAYMENT_SENT_STATUS" HeaderText="SPLIT_PAYMENT_SENT_STATUS" SortExpression="SPLIT_PAYMENT_SENT_STATUS" />
                                      <asp:BoundField DataField="SPLIT_PAYMENT_SENT_DATE_CLOSED_BY" HeaderText="SPLIT_PAYMENT_SENT_DATE_CLOSED_BY" SortExpression="SPLIT_PAYMENT_SENT_DATE_CLOSED_BY" />
                                      <asp:BoundField DataField="SPLIT_PAYMENT_SENT_DATE" HeaderText="SPLIT_PAYMENT_SENT_DATE" SortExpression="SPLIT_PAYMENT_SENT_DATE" />
                                      <asp:BoundField DataField="SPLIT_PAYMENT_RECD_STATUS" HeaderText="SPLIT_PAYMENT_RECD_STATUS" SortExpression="SPLIT_PAYMENT_RECD_STATUS" />
                                      <asp:BoundField DataField="SPLIT_PAYMENT_RECD_DATE" HeaderText="SPLIT_PAYMENT_RECD_DATE" SortExpression="SPLIT_PAYMENT_RECD_DATE" />
                                      <asp:BoundField DataField="SENT_LOS_STATUS" HeaderText="SENT_LOS_STATUS" SortExpression="SENT_LOS_STATUS" />
                                      <asp:BoundField DataField="SENT_LOS_DATE" HeaderText="SENT_LOS_DATE" SortExpression="SENT_LOS_DATE" />


                                      <asp:BoundField DataField="RECD_LOS_STATUS" HeaderText="RECD_LOS_STATUS" SortExpression="RECD_LOS_STATUS" />
                                      <asp:BoundField DataField="RECD_LOS_DATE" HeaderText="RECD_LOS_DATE" SortExpression="RECD_LOS_DATE" />
                                      <asp:BoundField DataField="FIRST_UPLOAD_P1_STATUS" HeaderText="FIRST_UPLOAD_P1_STATUS" SortExpression="FIRST_UPLOAD_P1_STATUS" />
                                      <asp:BoundField DataField="TRANSACTION_ID_UPlOAD_STATUS" HeaderText="TRANSACTION_ID_UPlOAD_STATUS" SortExpression="TRANSACTION_ID_UPlOAD_STATUS" />
                                      <asp:BoundField DataField="TRANSACTION_ID_UPlOAD_DATE" HeaderText="TRANSACTION_ID_UPlOAD_DATE" SortExpression="TRANSACTION_ID_UPlOAD_DATE" />
                                      <asp:BoundField DataField="TAX_INVOICE_NO" HeaderText="TAX_INVOICE_NO" SortExpression="TAX_INVOICE_NO" />
                                      
                                      <asp:BoundField DataField="COUNTRY_CODE" HeaderText="COUNTRY_CODE" SortExpression="COUNTRY_CODE" />
                                      <asp:BoundField DataField="COMPANY_CODE" HeaderText="COMPANY_CODE" SortExpression="COMPANY_CODE" />
                                      <asp:BoundField DataField="SUSPECTS_STATUS" HeaderText="SUSPECTS_STATUS" SortExpression="SUSPECTS_STATUS"/>

                                      <asp:BoundField DataField="SUSPECT_STATUS_CLOSED_DATE" HeaderText="SUSPECT_STATUS_CLOSED_DATE" SortExpression="SUSPECT_STATUS_CLOSED_DATE"/>
                                      <asp:BoundField DataField="SUSPECTS_COMMENTS" HeaderText="SUSPECTS_COMMENTS" SortExpression="SUSPECTS_COMMENTS"/>
                                      <asp:BoundField DataField="VALIDATION_STATUS" HeaderText="VALIDATION_STATUS" SortExpression="VALIDATION_STATUS"/>
                                      <asp:BoundField DataField="FALLOUT_COMMENTS" HeaderText="FALLOUT_COMMENTS" SortExpression="FALLOUT_COMMENTS"/>
                                      <asp:BoundField DataField="PHYSICAL_CHK_NO" HeaderText="PHYSICAL_CHK_NO" SortExpression="PHYSICAL_CHK_NO"/>
                                      <asp:BoundField DataField="AWB_NUMBER" HeaderText="AWB_NUMBER" SortExpression="AWB_NUMBER"/>
                                      <asp:BoundField DataField="AWB_NUMBER_DATE" HeaderText="AWB_NUMBER_DATE" SortExpression="AWB_NUMBER_DATE"/>
                                      <asp:BoundField DataField="SENT_APJ_STATUS" HeaderText="SENT_APJ_STATUS" SortExpression="SENT_APJ_STATUS" />
                                      <asp:BoundField DataField="SENT_APJ_STATUS_TYPE" HeaderText="SENT_APJ_STATUS_TYPE" SortExpression="SENT_APJ_STATUS_TYPE"/>
                                      <asp:BoundField DataField="RECD_APJ_DOC_NO_STATUS" HeaderText="RECD_APJ_DOC_NO_STATUS" SortExpression="RECD_APJ_DOC_NO_STATUS"/>
                                      <asp:BoundField DataField="RECD_APJ_DOC_NO_STATUS_COMMENTS" HeaderText="RECD_APJ_DOC_NO_STATUS_COMMENTS" SortExpression="RECD_APJ_DOC_NO_STATUS_COMMENTS"/>
                                      <asp:BoundField DataField="RECD_APJ_CLOSE_LOOP_STATUS" HeaderText="RECD_APJ_CLOSE_LOOP_STATUS" SortExpression="RECD_APJ_CLOSE_LOOP_STATUS"/>
                                      <asp:BoundField DataField="UPLOADED_TO_P1_STATUS" HeaderText="UPLOADED_TO_P1_STATUS" SortExpression="UPLOADED_TO_P1_STATUS"/>
                                      <asp:BoundField DataField="ALL_STATUS" HeaderText="ALL_STATUS" SortExpression="ALL_STATUS"/>
                                      <asp:BoundField DataField="HOLD_STATUS_CHANGE_COMMENTS" HeaderText="HOLD_STATUS_CHANGE_COMMENTS" SortExpression="HOLD_STATUS_CHANGE_COMMENTS"/>
                                      <asp:BoundField DataField="ALL_STATUS_OPEN_DATE" HeaderText="ALL_STATUS_OPEN_DATE" SortExpression="ALL_STATUS_OPEN_DATE"/>
                                      <asp:BoundField DataField="WHT_TAX_CODE" HeaderText="WHT_TAX_CODE" SortExpression="WHT_TAX_CODE"/>
                                      <asp:BoundField DataField="VAT_TAX_CODE" HeaderText="VAT_TAX_CODE" SortExpression="VAT_TAX_CODE"/>
                                      <asp:BoundField DataField="SYSTEM_TYPE" HeaderText="SYSTEM_TYPE" SortExpression="SYSTEM_TYPE"/>
                                      <asp:BoundField DataField="TRESHOLD_STATUS" HeaderText="TRESHOLD_STATUS" SortExpression="TRESHOLD_STATUS"/>
                                      <asp:BoundField DataField="TRESHOLD_APPROVAL_EMAIL_ID" HeaderText="TRESHOLD_APPROVAL_EMAIL_ID" SortExpression="TRESHOLD_APPROVAL_EMAIL_ID"/>   
                                      <asp:TemplateField>
                                <ItemTemplate>
                                    <tr>
                                        <td colspan="100%">
                                            <div id="div<%# Eval("PARTNER_ID") +""+ Eval("REF_NO") %>" style="overflow: auto;
                                                display: none; position: inherit; left: 15px; overflow: auto">
                                                
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#0096D6" ForeColor="White" />
                    </asp:GridView>
                    
                     </div>
            </asp:TableCell></asp:TableRow></asp:Table><div class="modal hide fade" data-backdrop="false" id="CloseSuspectstatusModal" tabindex="-1"
        role="dialog" aria-labelledby="CloseSuspectstatusModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Close Suspect Status Comments </h3></div><div class="modal-body">
                    <asp:Label ID="CloseSuspectstatusCommentsLbl" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Input your Comments</asp:Label><br /><asp:TextBox ID="CloseSuspectstatusCommentsTxt" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br /><%--Width="80%"--%></div><div class="modal-footer">
                    <asp:Button ID="CloseSuspectstatusModalBtn" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update Comments" runat="server" CssClass="btn btn-primary" OnClick="CloseSuspectstatusBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

     <div class="modal hide fade" data-backdrop="false" id="CloseSplitStatusModal" tabindex="-1"
        role="dialog" aria-labelledby="CloseSplitStatusModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Close Split Payment Status Comments </h3></div><div class="modal-body">
                    <asp:Label ID="Label1" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Input your Comments</asp:Label><br /><asp:TextBox ID="CloseSplitStatusCommentsTxt" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br /><%--Width="80%"--%></div><div class="modal-footer">
                    <asp:Button ID="CloseSplitPaymentStatusModalBtn" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update Comments" runat="server" CssClass="btn btn-primary" OnClick="CloseSplitPaymentStatusBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <div class="modal hide fade" data-backdrop="false" id="CloseInvoiceStatusModal" tabindex="-1"
        role="dialog" aria-labelledby="CloseInvoiceStatusModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Close Invoice Status Comments </h3></div><div class="modal-body">
                    <asp:Label ID="Label2" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Input your Comments</asp:Label><br /><asp:TextBox ID="CloseInvoiceStatusCommentsTxt" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br /><%--Width="80%"--%></div><div class="modal-footer">
                    <asp:Button ID="Button1" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update Comments" runat="server" CssClass="btn btn-primary" OnClick="CloseInvoiceStatusBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

   <div class="modal hide fade" data-backdrop="false" id="UpdateNewWWASManagerModal" tabindex="-1"
        role="dialog" aria-labelledby="UpdateNewWWASManagerLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Update New WWAS Manager Email Id </h3></div><div class="modal-body">
                        <asp:Table ID="UpdateNewWWASManagertable" runat="server" Width="100%">
                        <asp:TableRow>
                        <asp:TableCell>
                       <asp:Label ID="Label5" class="widthcomp1" Style="font-family: HP Simplified"
                        runat="server">Old WWAS Manager Email Id</asp:Label>&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="OldWWASManagerEmaildtxt" class="widthcomp1" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br /></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                         <asp:TableCell>  
                        <asp:Label ID="Label6" class="widthcomp1" Style="font-family: HP Simplified"
                        runat="server">New WWAS Manager Email Id</asp:Label>&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="NewWWASManagerEmaildtxt" class="widthcomp1" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br /></asp:TableCell> 
                       </asp:TableRow>
                       <asp:TableRow> 
                       <asp:TableCell> 
                       <asp:Label ID="Label7" class="widthcomp1" Style="font-family: HP Simplified"
                        runat="server">Approval Received Date</asp:Label></asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtWWASApprovalReceivedDate"
                            class="widthcomp1" Style="font-family: HP Simplified" runat="server"></asp:TextBox><asp:CalendarExtender
                                ID="CalendarExtender1" TargetControlID="txtWWASApprovalReceivedDate" runat="server" /></asp:TableCell></asp:TableRow><asp:TableRow>
                                <asp:TableCell>
                                <asp:Label ID="Label8" class="widthcomp1" Style="font-family: HP Simplified"
                        runat="server">Input WWAS Comments</asp:Label><br /></asp:TableCell> 
                      <asp:TableCell><asp:TextBox ID="WWASManagerCommentstxt" class="widthcomp1" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br /></asp:TableCell>
                                
                                </asp:TableRow>  
                        </asp:Table>
                        
                 </div>
              
                <div class="modal-footer">
                    <asp:Button ID="Button4" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update" runat="server" CssClass="btn btn-primary" OnClick="UpdateWWASManagerBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <div class="modal hide fade" data-backdrop="false" id="CloseVendorIdModal" tabindex="-1"
        role="dialog" aria-labelledby="CloseVendorIdModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Close Vendor Id Status Comments </h3></div><div class="modal-body">
                    <asp:Label ID="Label9" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Input your Comments</asp:Label><br /><asp:TextBox ID="CloseVendorIdStatustxt" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br /><%--Width="80%"--%></div><div class="modal-footer">
                    <asp:Button ID="Button5" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update Comments" runat="server" CssClass="btn btn-primary" OnClick="CloseVendorIdStatusBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
     <div class="modal hide fade" data-backdrop="false" id="CloseVendorIdMismatchStatusModal" tabindex="-1"
        role="dialog" aria-labelledby="CloseVendorIdMismatchStatusModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Close Vendor Id Mismatch Status Comments </h3></div><div class="modal-body">
                    <asp:Label ID="Label10" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Input your Comments</asp:Label><br /><asp:TextBox ID="CloseVendorIdMismatchStatusCommentstxt" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br /><%--Width="80%"--%></div><div class="modal-footer">
                    <asp:Button ID="Button6" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update Comments" runat="server" CssClass="btn btn-primary" OnClick="CloseVendorIdMismatchStatusBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal hide fade" data-backdrop="false" id="CloseToBeSentToAPJStatusModal" tabindex="-1"
        role="dialog" aria-labelledby="CloseToBeSentToAPJStatusModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Close To Be Sent To APJ Status Comments </h3></div><div class="modal-body">
                    <asp:Label ID="Label11" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Input your Comments</asp:Label><br /><asp:TextBox ID="CloseToBeSentToAPJStatustxt" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br /><%--Width="80%"--%></div><div class="modal-footer">
                    <asp:Button ID="Button7" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update Comments" runat="server" CssClass="btn btn-primary" OnClick="CloseToBeSentToAPJStatusBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal hide fade" data-backdrop="false" id="CloseWaitingForAPJStatusModal" tabindex="-1"
        role="dialog" aria-labelledby="CloseWaitingForAPJStatusModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Close Waiting For APJ Status Comments </h3></div><div class="modal-body">
                    <asp:Label ID="Label12" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Input your Comments</asp:Label><br /><asp:TextBox ID="CloseWaitingForAPJStatustxt" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br /><%--Width="80%"--%></div><div class="modal-footer">
                    <asp:Button ID="Button8" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update Comments" runat="server" CssClass="btn btn-primary" OnClick="CloseWaitingForAPJStatusBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
  <div class="modal hide fade" data-backdrop="false" id="AllStatusClosedModal" tabindex="-1"
        role="dialog" aria-labelledby="AllStatusClosedModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            All Status Closed Comments </h3></div><div class="modal-body">
                    <asp:Label ID="Label14" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Input your Comments</asp:Label><br /><asp:TextBox ID="AllStatusClosedtxt" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br /><%--Width="80%"--%></div><div class="modal-footer">
                    <asp:Button ID="Button10" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update Comments" runat="server" CssClass="btn btn-primary" OnClick="AllStatusClosedBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal hide fade" data-backdrop="false" id="OpenHoldPaymentStatusModal" tabindex="-1"
        role="dialog" aria-labelledby="OpenHoldPaymentStatusModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Open Hold Payment Status Comments </h3></div><div class="modal-body">
                    <asp:Label ID="Label15" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Input your Comments</asp:Label><br /><asp:TextBox ID="OpenHoldPaymentStatustxt" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br /><%--Width="80%"--%></div><div class="modal-footer">
                    <asp:Button ID="Button11" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update Comments" runat="server" CssClass="btn btn-primary" OnClick="OpenHoldPaymentStatusBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal hide fade" data-backdrop="false" id="OpenPaymentStatusModal" tabindex="-1"
        role="dialog" aria-labelledby="OpenPaymentStatusModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Open Payment Status Comments </h3></div><div class="modal-body">
                    <asp:Label ID="Label16" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Input your Comments</asp:Label><br /><asp:TextBox ID="OpenPaymentStatustxt" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br /><%--Width="80%"--%></div><div class="modal-footer">
                    <asp:Button ID="Button12" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update Comments" runat="server" CssClass="btn btn-primary" OnClick="OpenPaymentStatusBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal hide fade" data-backdrop="false" id="WWASStatusModal" tabindex="-1"
        role="dialog" aria-labelledby="WWASStatusModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Close WWAS Status Comments </h3></div><div class="modal-body">
                    <asp:Label ID="Label18" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Input your Comments</asp:Label><br /><asp:TextBox ID="CloseWWASStatustxt" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br /><%--Width="80%"--%></div><div class="modal-footer">
                    <asp:Button ID="Button14" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update Comments" runat="server" CssClass="btn btn-primary" OnClick="CloseWWASStatusBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
     <div class="modal hide fade" data-backdrop="false" id="ProcessingCommentsModal" tabindex="-1"
        role="dialog" aria-labelledby="ProcessingCommentsModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Processing Comments </h3></div><div class="modal-body">
                    <asp:Label ID="Label19" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Input your Comments</asp:Label><br /><asp:TextBox ID="ProcessingCommentstxt" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br /><%--Width="80%"--%></div><div class="modal-footer">
                    <asp:Button ID="Button15" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update Comments" runat="server" CssClass="btn btn-primary" OnClick="ProcessingCommentsBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
      </ContentTemplate>
              </asp:UpdatePanel>

  <div class="modal hide fade" data-backdrop="false" id="UploadTransactionIdFileModal" tabindex="-1"
        role="dialog" aria-labelledby="UploadTransactionIdFileLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Upload Transaction Id File </h3></div><div class="modal-body">
                    <asp:Label ID="Label4" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Choose the File Path</asp:Label><br /><asp:FileUpload ID="FileUpload1" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server" />
                 </div>
                <div class="modal-footer">
                    <asp:Button ID="Button3" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update" runat="server" CssClass="btn btn-primary" OnClick="UploadTransactionIdFileBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <div class="modal hide fade" data-backdrop="false" id="UploadInvoiceFileModal" tabindex="-1"
        role="dialog" aria-labelledby="UploadInvoiceFileLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Upload Invoice File </h3></div><div class="modal-body">
                    <asp:Label ID="Label3" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Choose the File Path</asp:Label><br /><asp:FileUpload ID="FileUpload2" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server" />
                 </div>
                <div class="modal-footer">
                    <asp:Button ID="Button2" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update" runat="server" CssClass="btn btn-primary" OnClick="UploadInvoiceFileBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

     <div class="modal hide fade" data-backdrop="false" id="UploadCreditNoteFileModal" tabindex="-1"
        role="dialog" aria-labelledby="UploadCreditNoteFileModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Upload Credit Note File </h3></div><div class="modal-body">
                    <asp:Label ID="Label13" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Choose the File Path</asp:Label><br /><asp:FileUpload ID="FileUpload3" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server" />
                 </div>
                <div class="modal-footer">
                    <asp:Button ID="Button9" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update" runat="server" CssClass="btn btn-primary" OnClick="UploadCreditNoteFileBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal hide fade" data-backdrop="false" id="UploadSplitPaymentFileModal" tabindex="-1"
        role="dialog" aria-labelledby="UploadSplitPaymentFileModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Upload Split Payment File</h3></div><div class="modal-body">
                    <asp:Label ID="Label17" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Choose the File Path</asp:Label><br /><asp:FileUpload ID="FileUpload4" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server" />
                  </div>
                <div class="modal-footer">
                    <asp:Button ID="Button13" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update" runat="server" CssClass="btn btn-primary" OnClick="UploadSplitPaymentFileBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<%--<head id="Head1" runat="server">--%>
<title>Call Javascript functions and show alert message from code behind file in asp.net Page</title>
<script type="text/javascript">
    function Showalert() {
        alert('');
    }
</script>



       <script src="../Scripts/jquery.js" type="text/javascript"></script>
    <script src="../Scripts/bootstrap.js" type="text/javascript"></script>
                 
                   
 
            </asp:Content>
            