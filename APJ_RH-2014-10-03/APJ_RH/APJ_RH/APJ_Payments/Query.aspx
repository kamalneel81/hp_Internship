<%@ Page Title="Query" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Query.aspx.cs" Inherits="APJ_RH.APJ_Payments.Query" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<!-- The jQuery UI theme that will be used by the grid -->
    <link rel="stylesheet" type="text/css" media="screen" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.0/themes/redmond/jquery-ui.css" />
    <script src="../Scripts/jquery.js" type="text/javascript"></script>
    <!-- jQuery runtime minified -->
    <script src="../Scripts/bootstrap.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server"> 
  </asp:ToolkitScriptManager>
   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
   
   <ContentTemplate>
  
   
   <asp:TextBox ID="QueryTxtBox" runat="server" rows="30" cols="80" textmode="MultiLine" Width="98%" Height="50"></asp:TextBox>
  
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell >
                <asp:Button ID="ExecuteBtn" runat="server" class="widthcomp1" OnClick = "ExecuteBtn_Click"  Style="font-family: HP Simplified"  Text="Execute" /></asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="ExporttoExcelBtn" runat="server"  class="widthcomp1" OnClick = "ExporttoExcelBtn_Click"  Style="font-family: HP Simplified" Text="Export to Excel" />
            </asp:TableCell>
        <asp:TableCell> <asp:Label ID="CountLbl" runat="server" class="widthcomp" Style="font-family: HP Simplified" Text=""></asp:Label></asp:TableCell>
        </asp:TableRow>

    </asp:Table>

 <%--   <table width="98%" >
    
    <tr >
    <td>--%>
    <asp:Table ID="GridTable" runat="server" Width="75%" BorderStyle="Solid" BorderColor="#0096D6" BorderWidth="2px" Visible = "false">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="7" Style="vertical-align: top;">
    <div style="height: 350px; width: 1475px; overflow: auto;">
   
    <asp:GridView ID="QueryGridView" runat="server" CaptionAlign="Left" Width="70%" BackColor="White"  BorderColor="Tan" BorderWidth="1px" 
    CellPadding="2" ForeColor="Black" GridLines="Both"  ShowFooter="true"
                        Visible="true" Font-Size="Small" HeaderStyle-Wrap="False" AlternatingRowStyle-Wrap="False"
                        EditRowStyle-Wrap="False" EmptyDataRowStyle-Wrap="False" RowStyle-Wrap="False"
                        SortedDescendingHeaderStyle-Wrap="False"
    AllowSorting="true" OnSorting="GridView1_Sorting" AllowPaging="true"  
    PageSize="12" OnPageIndexChanging="GridView1_PageIndexChanging" OnClientClick="form1.target='_self';">

   <HeaderStyle BackColor="#0096D6" ForeColor="White" />
   
    </asp:GridView>
    <alternatingrowstyle-wrap="False" width="98%" />
    </div>
    <%--</td>
    </tr>--%>
    <%-- </table>--%>
    </asp:TableCell>
    </asp:TableRow>
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
</asp:Content>
