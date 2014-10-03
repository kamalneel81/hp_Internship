<%@ Page Title="Claim Processing" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClaimProcessing.aspx.cs" Inherits="APJ_RH.APJ_Payments.ClaimProcessing" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<%--<script> src="http://code.jquery.com/jquery-1.10.1.min.js"></script>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <%-- <asp:ToolkitScriptManager ID = "ToolkitScriptManager1" runat = "server" > </asp:ToolkitScriptManager>--%>
    <asp:Table ID="ConditionBottonsTable" runat="server" Width="100%">
        <asp:TableRow>
            <%--Width="100%"--%>
            <asp:TableCell>
                <asp:Label ID="SelectCountryLbl" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                    Text="Select Country:"></asp:Label></asp:TableCell>
            <%--Width="9%"--%>
            <asp:TableCell>
                <asp:DropDownList ID="SelectCountryList" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server">
                        <asp:ListItem></asp:ListItem>
                    <asp:ListItem>MY</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <%--Width="9%"--%>
            <asp:TableCell>
                <asp:Label ID="SelectProgramLbl" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                    Text="Select Program:"></asp:Label></asp:TableCell>
            <%--Width="9%"--%>
              <asp:TableCell>
               <asp:DropDownList ID="SelectProgramList" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server">
                </asp:DropDownList>
            </asp:TableCell>
            <%--Width="9%"--%>
            <asp:TableCell>
                <asp:Label ID="SelectStatusLbl" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                    Text="Select Status:"></asp:Label></asp:TableCell>
            <%--Width="9%"--%>
            <asp:TableCell>
                <asp:DropDownList ID="SelectStatusList" Width="300px" Style="font-family: HP Simplified"
                    runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Suspect Status</asp:ListItem>
                    <asp:ListItem>Not Processed Under Chapps</asp:ListItem>
                    <asp:ListItem>To be Sent To C Ops - Split Payments</asp:ListItem>
                    <asp:ListItem>Waiting For C Ops - Split Payments</asp:ListItem>
                    <asp:ListItem>To Be Sent To Local Outsource - Invoice Collection</asp:ListItem>
                    <asp:ListItem>Waiting For Local Outsource  - Invoice Collection</asp:ListItem>
                    <asp:ListItem>To Be Uploaded To Platform One</asp:ListItem>
                    <asp:ListItem>Waiting For Transaction Id</asp:ListItem>
                    <asp:ListItem>To Be Sent To APJ Team</asp:ListItem>
                    <asp:ListItem>Waiting For APJ Team</asp:ListItem>
                    <asp:ListItem>Reply Recd From APJ Team - Close Loop</asp:ListItem>
                    <asp:ListItem>All Status - Pending </asp:ListItem>
                    <asp:ListItem>Hold Payments</asp:ListItem>
                    <asp:ListItem>Closed</asp:ListItem>
                    <asp:ListItem>Suspect Validation</asp:ListItem>
                    <asp:ListItem>WWAS Approval</asp:ListItem>
                    </asp:DropDownList>
            </asp:TableCell>
            <%--Width="9%"--%>
        </asp:TableRow>
        <asp:TableRow>
            <%--Width="100%"--%>
            <asp:TableCell>
                <asp:Label ID="SelectBatchLbl" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                    Text="Select Batch:"></asp:Label></asp:TableCell>
            <%--Width="9%"--%>
            <asp:TableCell>
                <%-- <asp:TextBox ID="SelectBatchTxtBox" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server"></asp:TextBox>--%>
                <%--<asp:DropDownList ID="SelectBatchList" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server">
                   
                </asp:DropDownList>--%>
                <asp:TextBox ID="SelectBatchTxtBox" runat="server" class="widthcomp" Style="font-family: HP Simplified"></asp:TextBox>
            </asp:TableCell>
            <%--Width="9%"--%>
            <asp:TableCell>
                <asp:Label ID="SelectVendorIDLbl" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                    Text="Select Vendor ID:"></asp:Label></asp:TableCell>
            <%--Width="9%"--%>
            <asp:TableCell>
                <asp:TextBox ID="SelectVendorIDTxtBox" runat="server" class="widthcomp" Style="font-family: HP Simplified"></asp:TextBox></asp:TableCell>
            <%--Width="9%"--%>
            <asp:TableCell>
                <%--<asp:Button ID="Button1" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                    Text="Pending" OnClick="Pending_Click" />--%></asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="PendingBtn" runat="server" Width="150px" Style="font-family: HP Simplified"
                    Text="Pending" OnClick="Pending_Click" />
                
             <%--   <asp:Button ID="DisplayAllBtn" runat="server" Width="150px" Style="font-family: HP Simplified"
                    Text="Display All" OnClick="DisplayAll_Click" />--%>
                <%--O--%>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <%--Width="100%"--%>
            <asp:TableCell>
                <asp:Label ID="SelectCountryCodeLbl" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                    Text="Select Country Code:"></asp:Label></asp:TableCell>
            <%-- Width="100%"  --%>
            <asp:TableCell>
             <asp:DropDownList ID="SelectCountryCodeList" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server">
                        <asp:ListItem></asp:ListItem>
                    <asp:ListItem>MY</asp:ListItem>
                </asp:DropDownList>
             
             </asp:TableCell>
            <%--Width="9%"--%>
            <asp:TableCell ColumnSpan="3">
                <asp:Label ID="CommentsLbl" aligh="left" class="widthcomp1" Style="font-family: HP Simplified"
                    runat="server" Text="Update Comments if any: " ></asp:Label>
                <%-- ColumnSpan="5" Width="9%"--%>
                <asp:DropDownList ID="CommentsList" runat="server" Width="150px" Style="font-family: HP Simplified"
                    align="Right">
                </asp:DropDownList>
                <asp:Button ID="UpdateCommentsBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                    Text="Update" align="Right" />
                <%--OnClick="UpdateCommentsBtn_Click"--%>
            </asp:TableCell>
        </asp:TableRow>
        
        
        <asp:TableRow>
            <asp:TableCell ColumnSpan="8">
                <asp:Panel ID="Panel1" Width="100%" runat="server" Style="margin-right: 25px">
                    <asp:Button ID="GenerateFirstP1UploadFileBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Generate First P1 Upload File" href="#GenerateFirstP1UploadFile" data-toggle="modal"
                        Visible="False" />
                        <asp:Button ID="ExportToExcelBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified" OnClick = "ExporttoExcelBtn_Click"
                        Text="Export To Excel"  Visible="False"/>
                       <asp:Button ID="UploadTransactionIdFileBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Upload Transaction Id File" Visible="False" />
                       <asp:Button ID="CloseTransactionIdUploadStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Close TransactionId Upload Status"  Visible="False" />
                         <asp:Button ID="ClosePaymentStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Close Payment Status" href="#ClosePaymentStatusModal" data-toggle="modal" Visible="False" />
                        <asp:Button ID="GenerateCloseLoopFileBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Generate Close Loop File" href="#GenerateCloseLoopFileModal" data-toggle="modal" Visible="False"/>
                        <asp:Button ID="AllStatusClosedBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="All Status Closed"  Visible="False" />
                         <asp:Button ID="ClosePaymentAllStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Close Payment Status (All)"  Visible="False" />
                         <asp:Button ID="UploadSplitPaymentFileBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Upload Split Payment File"  Visible="False" />
                       
                        <asp:Button ID="GenerateSplitPaymentBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Generate Split Payment" OnClick = "GenerateSplitPaymentStatusBtn_Click " Visible="False" />
                         <asp:Button ID="GenerateInvoiceFileBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Generate Invoice File"  Visible="False" />
                        <asp:Button ID="CloseInvoiceStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Close Invoice Status"  Visible="False" />
                        <asp:Button ID="UploadInvoiceFileBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Upload Invoice File"  Visible="False" />
                         <asp:Button ID="CloseVendorIdStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Close VendorId Status"  Visible="False" />
                         <asp:Button ID="CloseSuspectStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Close Suspect Status"  href="#CloseSuspectstatusModal" data-toggle="modal" Visible="False" OnClick = "CloseSuspectstatusBtn_Click"  />
                          <asp:Button ID="CloseValidationStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Close Validation Status"  Visible="False" />
                        <asp:Button ID="GenerateMailToWWASBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Generate Mail To WWAS"  Visible="False" />
                        <asp:Button ID="UpdateNewManagerBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Update New Manager"  Visible="False" />
                        <asp:Button ID="OpenHoldPaymentStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Open Hold Payment Status"  Visible="False" />
                        <asp:Button ID="OpenPaymentStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Open Payment Status"  Visible="False" />
                        <asp:Button ID="CloseSplitPaymentStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Close Split Payment Status"  href="#CloseSplitStatusModal" data-toggle="modal" Visible="False" OnClick = "CloseSplitPaymentStatusBtn_Click"/>

              
   
                <asp:DropDownList ID="GenerateFilesList" Width="300px" Style="font-family: HP Simplified"
                    runat="server" Visible="False">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Generate LH1 File</asp:ListItem>
                    <asp:ListItem>Generate FY1 File</asp:ListItem>
                    <asp:ListItem>Generate Credit Note File</asp:ListItem>
                    </asp:DropDownList>

                </asp:Panel>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
     
 <asp:Table ID="GridTable" runat="server" Width="100%">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="7" Style="vertical-align: top;">
                <div style="height: 350px; width: 1424px; overflow: auto;">
                    <asp:TextBox ID="myTextBox" runat="server" ClientIDMode="Static" Visible="False" />

                    
                    <asp:GridView ID="gvSuspectStatus" runat="server" CaptionAlign="Left" Width="70%"
                        BackColor="White" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black"
                        GridLines="Both" AutoGenerateColumns="false" ShowFooter="true" OnRowDataBound="gvSuspectStatus_RowDataBound"
                        Visible="true" Font-Size="Small" HeaderStyle-Wrap="False" AlternatingRowStyle-Wrap="False"
                        EditRowStyle-Wrap="False" EmptyDataRowStyle-Wrap="False" RowStyle-Wrap="False"
                        SortedDescendingHeaderStyle-Wrap="False" AllowSorting="true" OnSorting="GridViewSS_Sorting"
                        AllowPaging="true" PageSize="12" OnPageIndexChanging="GridViewSS_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField ItemStyle-Width="20px">
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
                            
                            <asp:BoundField DataField="PARTNER_ID" HeaderText="PARTNER_ID" />
                            <asp:BoundField DataField="PAYOUT_ID" HeaderText="PAYOUT_ID" />
                            <asp:BoundField DataField="TRANSACTION_ID" HeaderText="TRANSACTION_ID" />
                            <asp:BoundField DataField="TRANSACTION_ID_GEN_DATE" HeaderText="TRANSACTION_ID_GEN_DATE" />
                            <asp:BoundField DataField="PROGRAM" HeaderText="PROGRAM" />
                            <asp:BoundField DataField="FISCAL_YEAR" HeaderText="FISCAL_YEAR" SortExpression="FISCAL_YEAR" />
                            <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" />
                            <asp:BoundField DataField="QUARTER" HeaderText="QUARTER" />                            
                            <asp:BoundField DataField="MONTH" HeaderText="MONTH" />
                          
                              <asp:BoundField DataField="PARTNER_NAME" HeaderText="PARTNER_NAME" />
                               <asp:BoundField DataField="PARTNER_ENG_NAME" HeaderText="PARTNER_ENG_NAME" />
                                <asp:BoundField DataField="CURR" HeaderText="CURR" />
                                 <asp:BoundField DataField="PAYOUT_DUE" HeaderText="PAYOUT_DUE" />
                                  <asp:BoundField DataField="VAT_PERCENTAGE" HeaderText="VAT_PERCENTAGE" />
                                   <asp:BoundField DataField="AMOUNT_AFTER_VAT" HeaderText="AMOUNT_AFTER_VAT" />
                                    <asp:BoundField DataField="WHT_PERCENTAGE" HeaderText="WHT_PERCENTAGE" />
                                     <asp:BoundField DataField="TOT_AMOUNT_PAYABLE" HeaderText="TOT_AMOUNT_PAYABLE" />
                                     <asp:BoundField DataField="APPROVING_MGR" HeaderText="APPROVING_MGR" />
                                     <asp:BoundField DataField="PAYMENT_MODE" HeaderText="PAYMENT_MODE" />
                                     <asp:BoundField DataField="VENDOR_NO" HeaderText="VENDOR_NO" />
                                     <asp:BoundField DataField="INVOICE_NO" HeaderText="INVOICE_NO" />
                                     <asp:BoundField DataField="INVOICE_DATE" HeaderText="INVOICE_DATE" />
                                     <asp:BoundField DataField="ECLIPSE_CODE" HeaderText="ECLIPSE_CODE" />
                                     <asp:BoundField DataField="MCC_CODE" HeaderText="MCC_CODE" />
                                     <asp:BoundField DataField="CREDIT_NOTE_PL" HeaderText="CREDIT_NOTE_PL" />
                                     <asp:BoundField DataField="REMARKS" HeaderText="REMARKS" />
                                     <asp:BoundField DataField="ENSE" HeaderText="ENSE" />
                                     <asp:BoundField DataField="DEPT" HeaderText="DEPT" />
                                     <asp:BoundField DataField="SF" HeaderText="SF" />
                                     <asp:BoundField DataField="PT" HeaderText="PT" />
                                     <asp:BoundField DataField="PL" HeaderText="PL" />
                                     <asp:BoundField DataField="SUB_PL" HeaderText="SUB_PL" />
                                     <asp:BoundField DataField="ACCT" HeaderText="ACCT" />
                                     <asp:BoundField DataField="LCL_SUB_ACCT" HeaderText="LCL_SUB_ACCT" />
                                     <asp:BoundField DataField="IC_SUB_ACCT" HeaderText="IC_SUB_ACCT" />
                                     <asp:BoundField DataField="TARGET_PARTNER_ID" HeaderText="TARGET_PARTNER_ID" />
                                      <asp:BoundField DataField="TARGET_PARTNER_ENGLISH_NAME" HeaderText="TARGET_PARTNER_ENGLISH_NAME" />
                                       <asp:BoundField DataField="INTERNAL_ORDER" HeaderText="INTERNAL_ORDER" />
                                        <asp:BoundField DataField="PROFIT_CENTER" HeaderText="PROFIT_CENTER" />
                                         <asp:BoundField DataField="LHGL_ACCOUNT" HeaderText="LHGL_ACCOUNT" />
                                          <asp:BoundField DataField="TRANSACTION_UPLOAD_DATE" HeaderText="TRANSACTION_UPLOAD_DATE" />
                                          <asp:BoundField DataField="SUSPECTS_STATUS" HeaderText="SUSPECTS_STATUS" />
                                          <asp:BoundField DataField="SPLIT_PAYMENT_SENT_STATUS" HeaderText="SPLIT_PAYMENT_SENT_STATUS" />
                                            <asp:BoundField DataField="Batch" HeaderText="Batch" />
                                           

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
                        runat="server">Input your Comments</asp:Label><br />
                    <asp:TextBox ID="CloseSuspectstatusCommentsTxt" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br />
                    <%--Width="80%"--%>
                </div>
                <div class="modal-footer">
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
                        runat="server">Input your Comments</asp:Label><br />
                    <asp:TextBox ID="CloseSplitStatusCommentsTxt" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server"></asp:TextBox><br />
                    <%--Width="80%"--%>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="CloseSplitPaymentStatusModalBtn" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update Comments" runat="server" CssClass="btn btn-primary" OnClick="CloseSplitPaymentStatusBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>










       <script src="../Scripts/jquery.js" type="text/javascript"></script>
    <script src="../Scripts/bootstrap.js" type="text/javascript"></script>
            </asp:Content>