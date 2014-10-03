<%@ Page Title="Template Upload" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TemplateUpload.aspx.cs" Inherits="APJ_RH.APJ_Payments.TemplateUpload" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
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
                <asp:DropDownList ID="SelectedTeam" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                    <%--<asp:ListItem Text="BO PFR Template" Value="BO PFR Template"></asp:ListItem>
                    <asp:ListItem Text="DGF Contact Template" Value="DGF Contact Template"></asp:ListItem>--%>
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
                    <asp:ListItem Text="Payment Template With Transaction ID" Value="Payment Template With Transaction ID"></asp:ListItem>
                    <asp:ListItem Text="Payment Template Without Transaction ID" Value="Payment Template Without Transaction ID"></asp:ListItem>
                    <asp:ListItem Text="India Payment Template" Value="India Payment Template"></asp:ListItem>
                    <asp:ListItem Text="MDF NextGen Payment Template" Value="MDF NextGen Payment Template"></asp:ListItem>
                    
                </asp:DropDownList>
                <asp:LinkButton
                    ID="FormatofUploadLinkBtn" runat="server" OnClick="FormatofUploadLink_Click">Get the format of File</asp:LinkButton>
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
                <HeaderStyle BackColor="#0096D6" ForeColor="White" />
                </asp:GridView>
            </td>
            <td valign="right"  class="style1">
                <asp:Button ID="ErrorExportToExcelBtn" runat="server" Text="Export to Excel" Style="font-family: HP Simplified"
                    Onclick ="ErrorExportToExcelBtn_Click" Visible="False" />
            </td>
        </tr>
    </table>
</asp:Content>
