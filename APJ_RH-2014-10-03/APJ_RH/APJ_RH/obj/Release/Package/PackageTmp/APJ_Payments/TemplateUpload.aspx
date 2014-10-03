<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TemplateUpload.aspx.cs" Inherits="APJ_RH.APJ_Payments.TemplateUpload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
        .style1
        {
            width: 425px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<asp:Table ID="Table1" runat="server" Width="50%">
        <asp:TableRow>
            <asp:TableCell Width="9%">
                <asp:Label ID="Label1" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                    Text="Select The Team:"></asp:Label></asp:TableCell>
            <asp:TableCell Width="9%">
                <asp:DropDownList ID="DropDownList1" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                    <asp:ListItem Text="FC Payments" Value="FC Payments"></asp:ListItem>
                   <asp:ListItem Text="CI Payments" Value="CI Payments"></asp:ListItem>
                    </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
  
        <asp:TableRow>
            <asp:TableCell Width="9%">
                <asp:Label ID="SelectTemplatetypeLbl" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                    Text="Select Template type:"></asp:Label></asp:TableCell>
            <asp:TableCell Width="9%">
                <asp:DropDownList ID="SelectthetypeofTemplateList" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                    <%--<asp:ListItem Text="BO PFR Template" Value="BO PFR Template"></asp:ListItem>
                    <asp:ListItem Text="DGF Contact Template" Value="DGF Contact Template"></asp:ListItem>--%>
                    <asp:ListItem Text="Payment Template" Value="Payment Template"></asp:ListItem>
                    <%--<asp:ListItem Text="PN Contact Template" Value="PN Contact Template"></asp:ListItem>
                    <asp:ListItem Text="Local Vendor Template" Value="Local Vendor Template"></asp:ListItem>
                    <asp:ListItem Text="SPS Commision Template" Value="SPS Commision Template"></asp:ListItem>--%>
                    <asp:ListItem Text="Vendor Template" Value="Vendor Template"></asp:ListItem>
                    <asp:ListItem Text="Country Master RCBS" Value="Country Master RCBS"></asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Width="9%">
                <asp:Label ID="SelecttheTemplateLbl" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                    Text="Select the Template: "></asp:Label></asp:TableCell>
            <asp:TableCell>
                <asp:FileUpload ID="FileUpload1" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Width="9%">
                <asp:CheckBox ID="CheckBox1" class="widthcomp" Style="font-family: HP Simplified"
                    Text="Close Inv Req Sent Status After Upload" runat="server" />
            </asp:TableCell><asp:TableCell Width="9%">
                <asp:Button ID="ValidateanduploadthefileBtn" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                    Text="Validate and upload the file" OnClick="Upload_Click" />
                <%--<asp:Button ID="TestUpload" runat="server" Width="100%" font ="hp simplified" Text="Test Upload" OnClick="TestUpload_Click" /> --%>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table ID="Table2" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="ErrorLogLbl" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                    Text="Error Log:"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <%--<asp:TextBox ID="ErrorLogTxtBox" Width="74%" lenght="70%" runat="server" 
        Height="294px"></asp:TextBox>--%>
    <asp:ListBox ID="ErrorLogListBox" Width="80%" lenght="10%" Style="font-family: HP Simplified"
        runat="server"></asp:ListBox>
    <table width="100%">
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
            </td>
            <td valign="right"  class="style1">
                <asp:Button ID="ErrorExportToExcelBtn" runat="server" Text="Export to Excel" Style="font-family: HP Simplified"
                    Onclick ="ErrorExportToExcelBtn_Click" Visible="False" />
            </td>
        </tr>
    </table>
</asp:Content>
