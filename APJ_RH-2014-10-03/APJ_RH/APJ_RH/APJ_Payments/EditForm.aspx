<%@ Page Title="Edit Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditForm.aspx.cs" Inherits="APJ_RH.APJ_Payments.EditForm" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<%--<script> src="http://code.jquery.com/jquery-1.10.1.min.js"></script>--%>
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
                <asp:Label ID="EditTypeLbl" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                    Text="Select Edit Table:"></asp:Label></asp:TableCell>
               <%--Width="9%"--%>
               <asp:TableCell> 
                <asp:DropDownList ID="SelectStatusList" class="widthcomp" Style="font-family: HP Simplified"
                   align = "left" runat="server">
                   <asp:ListItem>Select the Status</asp:ListItem>
                    <asp:ListItem>PAYMENT MASTER</asp:ListItem>
                    <asp:ListItem>ALT_NAME_APACPAY</asp:ListItem>
                    <asp:ListItem>WWAS_LIMITS_MASTER_APACPAY</asp:ListItem>
                    <asp:ListItem>PPRO_VENID_MATCH_APACPPP</asp:ListItem>
                    <asp:ListItem>PAYMENT_METHOD_TBL</asp:ListItem>
                    <asp:ListItem>PAYMENT_MODE_TBL</asp:ListItem>
                    <asp:ListItem>SPL_HANDLING_TBL</asp:ListItem>
                    <asp:ListItem>Default_Spl_Hndl</asp:ListItem>
                    <asp:ListItem>WWAS_EX_RATE</asp:ListItem>
                    <asp:ListItem>TRESHOLD_MATRIX</asp:ListItem>
                    </asp:DropDownList>
           </asp:TableCell>
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
           <asp:Label ID="PaymentModelbl" aligh="left" class="widthcomp" Style=" font-family: HP Simplified"
                    runat="server" Text="Select Payment Mode: " ></asp:Label> </asp:TableCell>
                <%-- ColumnSpan="5" Width="9%"--%>
                <asp:TableCell>
                <asp:DropDownList ID="SelectPaymentModeList" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                    align="Right">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>CREDIT NOTES</asp:ListItem>
                    <asp:ListItem>CHEQUE/TT</asp:ListItem>
                    <asp:ListItem>TT</asp:ListItem>
                    <asp:ListItem>CHEQUE</asp:ListItem>
                    <asp:ListItem>GIRO</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell> 
            <asp:TableCell>
                <asp:Label ID="SelectPayoutIDLbl" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server" Text="Payout ID: " ></asp:Label></asp:TableCell>
                <%--Width="9%"--%>
              <asp:TableCell>
                <asp:TextBox ID="SelectPayoutIDTxtBox" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server"></asp:TextBox> </asp:TableCell> 
                
            </asp:TableRow>
           <asp:TableRow>
           
            <asp:TableCell>
                <asp:Label ID="SelectPartnerIDLbl" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server" Text="Partner ID: " ></asp:Label></asp:TableCell>
                <%--Width="9%"--%>
                <asp:TableCell> 
                  <asp:TextBox ID="SelectPartnerIDTxtBox" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                <asp:Label ID="SelectWWASEmailIdLbl" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server" Text="WWAS EMAIL ID: " ></asp:Label></asp:TableCell>
                <%--Width="9%"--%>
                <asp:TableCell> 
                  <asp:TextBox ID="SelectWWASEmailIdTxt" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server"></asp:TextBox>
                </asp:TableCell>
           <%--Width="9%"--%>
           <asp:TableCell>
             <asp:Label ID="Label1" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server" Text=" " ></asp:Label></asp:TableCell>
           
           <%--Width="9%"--%>
          <asp:TableCell>
          
          <asp:Button ID="SearchBtn" runat="server" class = "widthcomp" Style="font-family: HP Simplified"
                    Text="Search" align="center" OnClick="SearchBtn_Click"/>
          </asp:TableCell> 
           
           </asp:TableRow> 
 
        <asp:TableRow>
            <asp:TableCell ColumnSpan="8">
                <asp:Panel ID="Panel1" Width="100%" runat="server" Style="margin-right: 25px">
                    
                        <asp:Button ID="UpdatePaymentMasterBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified" 
                        Text="Update"  Visible="False"/>
                        <asp:Button ID="UploadBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Upload" href="#UploadModal" data-toggle="modal" Visible= "false" OnClick = "UploadBtn_Click" />
                        <asp:Button ID="DeletePaymentMasterBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Delete" Visible="False" OnClick = "Delete_PaymentMasterBtn_Click" OnClientClick = "javascript:return confirm('Are you sure you want to delete the checked records?');"  />
                        <asp:Button ID="Delete__GVALT_NAME_APACPAYBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Delete" Visible="False" OnClick = "Delete__GVALT_NAME_APACPAY_Click" OnClientClick = "javascript:return confirm('Are you sure you want to delete the checked records?');"  />
                        <asp:Button ID="Delete__GVWWAS_LIMITS_MASTER_APACPAYBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Delete" Visible="False" OnClick = "Delete__GVWWAS_LIMITS_MASTER_APACPAY_Click" OnClientClick = "javascript:return confirm('Are you sure you want to delete the checked records?');"/>
                        <asp:Button ID="Delete_GVPPRO_VENID_MATCH_APACPPBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Delete" Visible="False" OnClick = "Delete__GVPPRO_VENID_MATCH_APACPP_Click" OnClientClick = "javascript:return confirm('Are you sure you want to delete the checked records?');" />
                        <asp:Button ID="Delete_PAYMENT_METHOD_TBLBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Delete" Visible="False" OnClick = "Delete_PAYMENT_METHOD_TBL_Click" OnClientClick = "javascript:return confirm('Are you sure you want to delete the checked records?');"  />
                        <asp:Button ID="Delete_GVPAYMENT_MODE_TBLBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Delete" Visible="False" OnClick = "Delete_PAYMENT_MODE_TBL_Click" OnClientClick = "javascript:return confirm('Are you sure you want to delete the checked records?');" />
                        <asp:Button ID="Delete_GVSPL_HANDLING_TBLBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Delete" Visible="False" OnClick = "Delete_SPL_HANDLING_TBL_Click" OnClientClick = "javascript:return confirm('Are you sure you want to delete the checked records?');"  />
                        <asp:Button ID="Delete_GVWWAS_EX_RATEBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Delete" Visible="False" OnClick = "Delete_WWAS_EX_RATE_Click" OnClientClick = "javascript:return confirm('Are you sure you want to delete the checked records?');"  />
                         <asp:Button ID="Delete_GVDefault_Spl_HndllBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Delete" Visible="False" OnClick = "Delete_GVDefault_Spl_Hndll_Click" OnClientClick = "javascript:return confirm('Are you sure you want to delete the checked records?');"  />
                        <asp:Button ID="Delete_GV_Threshold_MatrixBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Delete" Visible="False" OnClick = "Delete_GV_Threshold_Matrix_Click" OnClientClick = "javascript:return confirm('Are you sure you want to delete the checked records?');"  />
                        


                        
                      
                        </asp:Panel>
                        </asp:TableCell>
                        </asp:TableRow>
                        </asp:Table> 
<%--Grid for PAYMENT_MASTER--%>
<%--<table id ="gridtable" runat = "server"  width="75%" borderstyle="solid" bordercolor="#0096D6" borderwidth="2px" Visible = "false"  >

    
    <tr >
    <td>--%>
    <asp:Table ID="gridtable" runat="server" Width="75%" BorderStyle="Solid" BorderColor="#0096D6" BorderWidth="2px" Visible = "false">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="7" Style="vertical-align: top;">
    <div style="height: 350px; width: 1475px; overflow: auto;">
   
    <asp:GridView ID="SearchGV" runat="server" CaptionAlign="Left" Width="70%" BackColor="White"  BorderColor="Tan" BorderWidth="1px" DataKeyNames = "REF_NO"
    CellPadding="2" ForeColor="Black" GridLines="Both"  ShowFooter="true" Visible="true" Font-Size="Small" HeaderStyle-Wrap="False" AlternatingRowStyle-Wrap="False"
    EditRowStyle-Wrap="False" EmptyDataRowStyle-Wrap="False" RowStyle-Wrap="False" SortedDescendingHeaderStyle-Wrap="False" AllowSorting="false" AllowPaging="true"  
    PageSize="12" OnPageIndexChanging="GridViewSS_PageIndexChanging" OnRowEditing = "SearchGV_RowEditing" OnRowUpdating = "SearchGV_RowUpdating" 
        OnRowCancelingEdit ="SearchGV_RowCancelingEdit" OnClientClick="form1.target='_self';">

<HeaderStyle BackColor="#0096D6" ForeColor="White" />
   <Columns>
                        <asp:TemplateField ItemStyle-Width="20px">
                        <HeaderTemplate>
                                    <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);"/>
                                    <%-- <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);" />--%>
                                </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CB" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="REF_NO" SortExpression="REF_NO" Visible = "false" >
                                <ItemTemplate>
           
                                    
                                    <asp:Label ID="lblpartner_pro_id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "REF_NO") %>'></asp:Label>
                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" />
                   </Columns>
    </asp:GridView>

    
    <%--Grid for ALT_NAME_APACPAY--%>

    <asp:GridView ID="GVALT_NAME_APACPAY" runat="server" CaptionAlign="Left" Width="70%" BackColor="White"  BorderColor="Tan" BorderWidth="1px" DataKeyNames = "REF_NO"
    CellPadding="2" ForeColor="Black" GridLines="Both"  ShowFooter="true" Visible="true" Font-Size="Small" HeaderStyle-Wrap="False" AlternatingRowStyle-Wrap="False"
    EditRowStyle-Wrap="False" EmptyDataRowStyle-Wrap="False" RowStyle-Wrap="False" SortedDescendingHeaderStyle-Wrap="False" AllowSorting="false" AllowPaging="true"  
    PageSize="12" OnPageIndexChanging="GVALT_NAME_APACPAY_PageIndexChanging" OnRowEditing = "GVALT_NAME_APACPAY_RowEditing" OnRowUpdating = "GVALT_NAME_APACPAY_RowUpdating" 
        OnRowCancelingEdit ="GVALT_NAME_APACPAY_RowCancelingEdit" OnClientClick="form1.target='_self';">

<HeaderStyle BackColor="#0096D6" ForeColor="White" />
   <Columns>
                        <asp:TemplateField ItemStyle-Width="20px">
                        <HeaderTemplate>
                                    <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);"/>
                                    <%-- <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);" />--%>
                                </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CB" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="REF_NO" SortExpression="REF_NO" Visible = "false" >
                                <ItemTemplate>
           
                                    
                                    <asp:Label ID="lblpartner_pro_id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "REF_NO") %>'></asp:Label>
                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" />
                   </Columns>
                     <HeaderStyle CssClass="GridviewScrollHeader" /> 
                                <RowStyle CssClass="GridviewScrollItem" /> 
                                <PagerStyle CssClass="GridviewScrollPager" />
    </asp:GridView>

    <%--Grid for WWAS_LIMITS_MASTER_APACPAY--%>

    <asp:GridView ID="GVWWAS_LIMITS_MASTER_APACPAY" runat="server" CaptionAlign="Left" Width="70%" BackColor="White"  BorderColor="Tan" BorderWidth="1px" DataKeyNames = "REF_NO"
    CellPadding="2" ForeColor="Black" GridLines="Both"  ShowFooter="true" Visible="true" Font-Size="Small" HeaderStyle-Wrap="False" AlternatingRowStyle-Wrap="False"
    EditRowStyle-Wrap="False" EmptyDataRowStyle-Wrap="False" RowStyle-Wrap="False" SortedDescendingHeaderStyle-Wrap="False" AllowSorting="false" AllowPaging="true"  
    PageSize="12" OnPageIndexChanging="GVWWAS_LIMITS_MASTER_APACPAY_PageIndexChanging" OnRowEditing = "GVWWAS_LIMITS_MASTER_APACPAY_RowEditing" OnRowUpdating = "GVWWAS_LIMITS_MASTER_APACPAY_RowUpdating" 
        OnRowCancelingEdit ="GVWWAS_LIMITS_MASTER_APACPAY_RowCancelingEdit" OnClientClick="form1.target='_self';">

<HeaderStyle BackColor="#0096D6" ForeColor="White" />
   <Columns>
                        <asp:TemplateField ItemStyle-Width="20px">
                        <HeaderTemplate>
                                    <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);"/>
                                    <%-- <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);" />--%>
                                </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CB" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="REF_NO" SortExpression="REF_NO" Visible = "false" >
                                <ItemTemplate>
           
                                    
                                    <asp:Label ID="lblpartner_pro_id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "REF_NO") %>'></asp:Label>
                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" />
                   </Columns>
                     <HeaderStyle CssClass="GridviewScrollHeader" /> 
                                <RowStyle CssClass="GridviewScrollItem" /> 
                                <PagerStyle CssClass="GridviewScrollPager" />
    </asp:GridView>

   <%-- Grid for PPRO_VENID_MATCH_APACPPP--%>

    <asp:GridView ID="GVPPRO_VENID_MATCH_APACPP" runat="server" CaptionAlign="Left" Width="70%" BackColor="White"  BorderColor="Tan" BorderWidth="1px" DataKeyNames = "PARTNER_PRO_ID"
    CellPadding="2" ForeColor="Black" GridLines="Both"  ShowFooter="true" Visible="true" Font-Size="Small" HeaderStyle-Wrap="False" AlternatingRowStyle-Wrap="False"
    EditRowStyle-Wrap="False" EmptyDataRowStyle-Wrap="False" RowStyle-Wrap="False" SortedDescendingHeaderStyle-Wrap="False" AllowSorting="false"  AllowPaging="true"  
    PageSize="12" OnPageIndexChanging="GVPPRO_VENID_MATCH_APACPP_PageIndexChanging" OnRowEditing = "GVPPRO_VENID_MATCH_APACPP_RowEditing" OnRowUpdating = "GVPPRO_VENID_MATCH_APACPP_RowUpdating" 
        OnRowCancelingEdit ="GVPPRO_VENID_MATCH_APACPP_RowCancelingEdit" OnClientClick="form1.target='_self';">

<HeaderStyle BackColor="#0096D6" ForeColor="White" />
   <Columns>
                        <asp:TemplateField ItemStyle-Width="20px">
                        <HeaderTemplate>
                                    <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);"/>
                                    <%-- <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);" />--%>
                                </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CB" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PARTNER_PRO_ID" SortExpression="PARTNER_PRO_ID" Visible = "false" >
                                <ItemTemplate>
           
                                    
                                    <asp:Label ID="lblpartner_pro_id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "PARTNER_PRO_ID") %>'></asp:Label>
                                    
                                </ItemTemplate>
                                 
                            </asp:TemplateField>
                   <asp:CommandField ShowEditButton="true" />
                   </Columns>
                  
                     <HeaderStyle CssClass="GridviewScrollHeader" /> 
                                <RowStyle CssClass="GridviewScrollItem" /> 
                                <PagerStyle CssClass="GridviewScrollPager" />
</asp:GridView>

<%--Grid for PAYMENT_METHOD_TBL--%>

    <asp:GridView ID="GVPAYMENT_METHOD_TBL" runat="server" CaptionAlign="Left" Width="70%" BackColor="White"  BorderColor="Tan" BorderWidth="1px" DataKeyNames = "REF_NO"
    CellPadding="2" ForeColor="Black" GridLines="Both"  ShowFooter="true" Visible="true" Font-Size="Small" HeaderStyle-Wrap="False" AlternatingRowStyle-Wrap="False"
    EditRowStyle-Wrap="False" EmptyDataRowStyle-Wrap="False" RowStyle-Wrap="False" SortedDescendingHeaderStyle-Wrap="False" AllowSorting="false" AllowPaging="true"  
    PageSize="12" OnPageIndexChanging="GVPAYMENT_METHOD_TBL_PageIndexChanging" OnRowEditing = "GVPAYMENT_METHOD_TBL_RowEditing" OnRowUpdating = "GVPAYMENT_METHOD_TBL_RowUpdating" 
        OnRowCancelingEdit ="GVPAYMENT_METHOD_TBL_RowCancelingEdit" OnClientClick="form1.target='_self';">

<HeaderStyle BackColor="#0096D6" ForeColor="White" />
   <Columns>
                        <asp:TemplateField ItemStyle-Width="20px">
                        <HeaderTemplate>
                                    <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);"/>
                                    <%-- <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);" />--%>
                                </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CB" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="REF_NO" SortExpression="REF_NO" Visible = "false" >
                                <ItemTemplate>
           
                                    
                                    <asp:Label ID="lblpartner_pro_id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "REF_NO") %>'></asp:Label>
                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" />
                   </Columns>
                     <HeaderStyle CssClass="GridviewScrollHeader" /> 
                                <RowStyle CssClass="GridviewScrollItem" /> 
                                <PagerStyle CssClass="GridviewScrollPager" />
    </asp:GridView>

    <%--Grid for PAYMENT_MODE_TBL--%>

    <asp:GridView ID="GVPAYMENT_MODE_TBL" runat="server" CaptionAlign="Left" Width="70%" BackColor="White"  BorderColor="Tan" BorderWidth="1px" DataKeyNames = "REF_NO"
    CellPadding="2" ForeColor="Black" GridLines="Both"  ShowFooter="true" Visible="true" Font-Size="Small" HeaderStyle-Wrap="False" AlternatingRowStyle-Wrap="False"
    EditRowStyle-Wrap="False" EmptyDataRowStyle-Wrap="False" RowStyle-Wrap="False" SortedDescendingHeaderStyle-Wrap="False" AllowSorting="false" AllowPaging="true"  
    PageSize="12" OnPageIndexChanging="GVPAYMENT_MODE_TBL_PageIndexChanging" OnRowEditing = "GVPAYMENT_MODE_TBL_RowEditing" OnRowUpdating = "GVPAYMENT_MODE_TBL_RowUpdating" 
        OnRowCancelingEdit ="GVPAYMENT_MODE_TBL_RowCancelingEdit" OnClientClick="form1.target='_self';">

<HeaderStyle BackColor="#0096D6" ForeColor="White" />
   <Columns>
                        <asp:TemplateField ItemStyle-Width="20px">
                        <HeaderTemplate>
                                    <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);"/>
                                    <%-- <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);" />--%>
                                </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CB" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="REF_NO" SortExpression="REF_NO" Visible = "false" >
                                <ItemTemplate>
           
                                    
                                    <asp:Label ID="lblpartner_pro_id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "REF_NO") %>'></asp:Label>
                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" />
                   </Columns>
                     <HeaderStyle CssClass="GridviewScrollHeader" /> 
                                <RowStyle CssClass="GridviewScrollItem" /> 
                                <PagerStyle CssClass="GridviewScrollPager" />
    </asp:GridView>
    <%--Grid for SPL_HANDLING_TBL--%>
    <asp:GridView ID="GVSPL_HANDLING_TBL" runat="server" CaptionAlign="Left" Width="70%" BackColor="White"  BorderColor="Tan" BorderWidth="1px" DataKeyNames = "REF_ID"
    CellPadding="2" ForeColor="Black" GridLines="Both"  ShowFooter="true" Visible="true" Font-Size="Small" HeaderStyle-Wrap="False" AlternatingRowStyle-Wrap="False"
    EditRowStyle-Wrap="False" EmptyDataRowStyle-Wrap="False" RowStyle-Wrap="False" SortedDescendingHeaderStyle-Wrap="False" AllowSorting="false" AllowPaging="true"  
    PageSize="12" OnPageIndexChanging="GVSPL_HANDLING_TBL_PageIndexChanging" OnRowEditing = "GVSPL_HANDLING_TBL_RowEditing" OnRowUpdating = "GVSPL_HANDLING_TBL_RowUpdating" 
        OnRowCancelingEdit ="GVSPL_HANDLING_TBL_RowCancelingEdit" OnClientClick="form1.target='_self';">

<HeaderStyle BackColor="#0096D6" ForeColor="White" />
   <Columns>
                        <asp:TemplateField ItemStyle-Width="20px">
                        <HeaderTemplate>
                                    <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);"/>
                                    <%-- <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);" />--%>
                                </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CB" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="REF_ID" SortExpression="REF_ID" Visible = "false" >
                                <ItemTemplate>
           
                                    
                                    <asp:Label ID="lblpartner_pro_id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "REF_ID") %>'></asp:Label>
                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" />
                   </Columns>
                     <HeaderStyle CssClass="GridviewScrollHeader" /> 
                                <RowStyle CssClass="GridviewScrollItem" /> 
                                <PagerStyle CssClass="GridviewScrollPager" />
    </asp:GridView>

    <asp:GridView ID="GVWWAS_EX_RATE" runat="server" CaptionAlign="Left" Width="70%" BackColor="White"  BorderColor="Tan" BorderWidth="1px" DataKeyNames = "ID"
    CellPadding="2" ForeColor="Black" GridLines="Both"  ShowFooter="true" Visible="true" Font-Size="Small" HeaderStyle-Wrap="False" AlternatingRowStyle-Wrap="False"
    EditRowStyle-Wrap="False" EmptyDataRowStyle-Wrap="False" RowStyle-Wrap="False" SortedDescendingHeaderStyle-Wrap="False" AllowSorting="false" AllowPaging="true"  
    PageSize="12" OnPageIndexChanging="GVWWAS_EX_RATE_PageIndexChanging" OnRowEditing = "GVWWAS_EX_RATE_RowEditing" OnRowUpdating = "GVWWAS_EX_RATE_RowUpdating" 
        OnRowCancelingEdit ="GVWWAS_EX_RATE_RowCancelingEdit" OnClientClick="form1.target='_self';">

<HeaderStyle BackColor="#0096D6" ForeColor="White" />
   <Columns>
                        <asp:TemplateField ItemStyle-Width="20px">
                        <HeaderTemplate>
                                    <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);"/>
                                    <%-- <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);" />--%>
                                </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CB" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID" SortExpression="ID" Visible = "false" >
                                <ItemTemplate>
           
                                    
                                    <asp:Label ID="lblpartner_pro_id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ID") %>'></asp:Label>
                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" />
                   </Columns>
                     <HeaderStyle CssClass="GridviewScrollHeader" /> 
                                <RowStyle CssClass="GridviewScrollItem" /> 
                                <PagerStyle CssClass="GridviewScrollPager" />
    </asp:GridView>
       <%--Grid for Default_Spl_Hndl--%>

    <asp:GridView ID="GVDefault_Spl_Hndll" runat="server" CaptionAlign="Left" Width="70%" BackColor="White"  BorderColor="Tan" BorderWidth="1px" DataKeyNames = "Ref_no"
    CellPadding="2" ForeColor="Black" GridLines="Both"  ShowFooter="true" Visible="true" Font-Size="Small" HeaderStyle-Wrap="False" AlternatingRowStyle-Wrap="False"
    EditRowStyle-Wrap="False" EmptyDataRowStyle-Wrap="False" RowStyle-Wrap="False" SortedDescendingHeaderStyle-Wrap="False" AllowSorting="false" AllowPaging="true"  
    PageSize="12" OnPageIndexChanging="GVDefault_Spl_Hndll_PageIndexChanging" OnRowEditing = "GVDefault_Spl_Hndll_RowEditing" OnRowUpdating = "GVDefault_Spl_Hndll_RowUpdating" 
        OnRowCancelingEdit ="GVDefault_Spl_Hndll_RowCancelingEdit" OnClientClick="form1.target='_self';">

<HeaderStyle BackColor="#0096D6" ForeColor="White" />
   <Columns>
                        <asp:TemplateField ItemStyle-Width="20px">
                        <HeaderTemplate>
                                    <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);"/>
                                    <%-- <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);" />--%>
                                </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CB" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ref_no" SortExpression="Ref_no" Visible = "false" >
                                <ItemTemplate>
           
                                    
                                    <asp:Label ID="lblpartner_pro_id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Ref_no") %>'></asp:Label>
                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" />
                   </Columns>
                     <HeaderStyle CssClass="GridviewScrollHeader" /> 
                                <RowStyle CssClass="GridviewScrollItem" /> 
                                <PagerStyle CssClass="GridviewScrollPager" />
    </asp:GridView>
    
    <%--Grid for Threshold Approval Matrix--%>

    <asp:GridView ID="GV_Threshold_Matrix" runat="server" CaptionAlign="Left" Width="70%" BackColor="White"  BorderColor="Tan" BorderWidth="1px" DataKeyNames = "REF_NO"
    CellPadding="2" ForeColor="Black" GridLines="Both"  ShowFooter="true" Visible="true" Font-Size="Small" HeaderStyle-Wrap="False" AlternatingRowStyle-Wrap="False"
    EditRowStyle-Wrap="False" EmptyDataRowStyle-Wrap="False" RowStyle-Wrap="False" SortedDescendingHeaderStyle-Wrap="False" AllowSorting="false" AllowPaging="true"  
    PageSize="12" OnPageIndexChanging="GV_Threshold_Matrix_PageIndexChanging" OnRowEditing = "GV_Threshold_Matrix_RowEditing" OnRowUpdating = "GV_Threshold_Matrix_RowUpdating" 
        OnRowCancelingEdit ="GV_Threshold_Matrix_RowCancelingEdit" OnClientClick="form1.target='_self';">

<HeaderStyle BackColor="#0096D6" ForeColor="White" />
   <Columns>
                        <asp:TemplateField ItemStyle-Width="20px">
                        <HeaderTemplate>
                                    <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);"/>
                                    <%-- <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);" />--%>
                                </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CB" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="REF_NO" SortExpression="REF_NO" Visible = "false" >
                                <ItemTemplate>
           
                                    
                                    <asp:Label ID="lblpartner_pro_id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "REF_NO") %>'></asp:Label>
                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" />
                   </Columns>
                     <HeaderStyle CssClass="GridviewScrollHeader" /> 
                                <RowStyle CssClass="GridviewScrollItem" /> 
                                <PagerStyle CssClass="GridviewScrollPager" />
    </asp:GridView>
       <alternatingrowstyle-wrap="False" width="48%" />
     </div>
    <%--</td>
    </tr>--%>
    </asp:TableCell>
    </asp:TableRow> 
   
    <%--</table>--%>
    </asp:Table>
    
    






    <script src="../Scripts/jquery.js" type="text/javascript"></script>
    <script src="../Scripts/bootstrap.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui.min.js"></script> 
    <script type="text/javascript" src="../Scripts/gridviewScroll.min.js"></script> 

    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            gridviewScroll();
        });

        function gridviewScroll() {
            $('#QueryGridView').gridviewScroll({
                width: 1470,
                height: 330

            });

        } 
        </script>
        <script type="text/javascript">
            function Showalert() {
                alert('');
            }
</script> 
</ContentTemplate> 
</asp:UpdatePanel>
<div class="modal hide fade" data-backdrop="false" id="UploadModal" tabindex="-1"
        role="dialog" aria-labelledby="UploadModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Upload File</h3></div><div class="modal-body">
                    <asp:Label ID="Label17" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Choose the File Path</asp:Label><br /><asp:FileUpload ID="FileUpload1" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server" />
                    <asp:LinkButton
                    ID="FormatofUploadLinkBtn" runat="server" OnClick="FormatofUploadLink_Click">Get the format of File</asp:LinkButton>
                 </div>
                <div class="modal-footer">
                    <asp:Button ID="UpdateBtn" class="widthcomp" Style="font-family: HP Simplified"
                        Text="Update" runat="server" CssClass="btn btn-primary" OnClick="UploadBtn_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</asp:Content>
