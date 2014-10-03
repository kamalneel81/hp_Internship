<%@ Page Title="Query Wizard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QueryWizard.aspx.cs" Inherits="APJ_RH.QueryWizard" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- The jQuery UI theme that will be used by the grid -->
    <link rel="stylesheet" type="text/css" media="screen" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.0/themes/redmond/jquery-ui.css" />
    <script src="../Scripts/jquery.js" type="text/javascript"></script>
    <!-- jQuery runtime minified -->
    <script src="../Scripts/bootstrap.js" type="text/javascript"></script>
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

    <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            
            if (confirm("Do you want to add WHERE conditions?")) {
               
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            
            document.forms[0].appendChild(confirm_value);
        }
    </script>
</asp:Content>

<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
    
   <asp:ScriptManager runat="server"></asp:ScriptManager>       
   <asp:UpdatePanel id="UpdatePanel1" runat="server">
   
   <ContentTemplate>
        <asp:Table ID="buttonsTable" runat="server" Width="28%" Visible = "true" 
            Height="28px">
            <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="SelectTeamLbl" runat="server" class="widthcomp" Style="font-family: HP Simplified"
                    Text="Select The Table Name:"></asp:Label>
             </asp:TableCell>
             <%--Width="9%"--%>
                <asp:TableCell>
                    <asp:DropDownList id="SelectTableNameList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="SelectTableNameList_SelectedIndexChanged" class="widthcomp" Style="font-family: HP Simplified; white-space:nowrap" ></asp:DropDownList>
                </asp:TableCell>
                 
                 </asp:TableRow>
                </asp:Table>
                
                <asp:Table ID="whereconditiontable" runat="server" class="widthcomp" Visible = "true" Height="28px">
            <asp:TableRow>
                <%--<asp:TableCell>
                <asp:Label ID="SelectColumnNamelbl" runat="server" class="widthcomp" Style="font-family: HP Simplified" visible = "false" Text="Select The Column Name:"></asp:Label>
             </asp:TableCell>--%>
                <asp:TableCell>
                    <asp:DropDownList id="SelectColumnNameList" runat="server" AutoPostBack="true" Visible="false" class="widthcomp" Style="font-family: HP Simplified" align="Right"></asp:DropDownList>
                </asp:TableCell>
                
                <asp:TableCell>
                    <asp:DropDownList id="DropDownList2" runat="server" AutoPostBack="true" Visible="false" class="widthcomp" Style="font-family: HP Simplified" align="Right" >
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>=</asp:ListItem>
                        <asp:ListItem><</asp:ListItem>
                        <asp:ListItem>></asp:ListItem>
                        <asp:ListItem><=</asp:ListItem>
                        <asp:ListItem>>=</asp:ListItem>
                        <asp:ListItem>LIKE</asp:ListItem>
                        <asp:ListItem>NOT LIKE</asp:ListItem>    
                        <asp:ListItem>IN</asp:ListItem>    
                        <asp:ListItem>BETWEEN</asp:ListItem>                
                    </asp:DropDownList>
                </asp:TableCell>
            
            <asp:TableCell>
                    <asp:TextBox ID="condTxtBox" class="widthcomp" Style="font-family: HP Simplified" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell>
             
             <asp:TableCell>
                    <asp:Button id="Button1" runat="server" visible="false" class="widthcomp1" Style="font-family: HP Simplified" Text="Add Where" OnClick="add_WhereBtn_Click" />
                </asp:TableCell>
              
            
            </asp:TableRow>
           
           
         
            </asp:Table>
          <asp:Table ID="ExecuteTbl" runat="server" Width="28%" Visible = "true" 
            Height="28px">
            <asp:TableRow>
              <asp:TableCell>
                    <asp:Button id="Button2" runat="server" visible="false" class="widthcomp1" Style="font-family: HP Simplified" Text="Execute" OnClick="executeBtn_Click" />
                </asp:TableCell> 
            </asp:TableRow>
            </asp:Table>    
            


                
                
                
                
                
              
        <asp:Table ID="columnTable" runat="server" Width="75%" BorderStyle="Solid" 
            BorderColor="#0096D6" BorderWidth="2px" Visible = "False">
            <asp:TableRow>
                <asp:TableCell ColumnSpan="7" Style="vertical-align: top;" >
                    <div style="height: 350px; width: 100%; overflow: auto;">
                        <asp:GridView ID="gvtableColumn" runat="server" Visible="true" Width="100%" style="white-space:nowrap" Font-Size="Small">
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="20px" ItemStyle-HorizontalAlign="Center">

                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);" />
                                        <%-- <asp:CheckBox ID="chkboxSelectAll" runat="server" onclick="SelectAll(this);" />--%>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CB" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#0096D6" ForeColor="White" />
                        </asp:GridView>
                    </div>       
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button id="add_Columnbtn" runat="server" visible="true" class="widthcomp1" Style="font-family: HP Simplified" 
                        Text="Add Column" OnClick = "add_ColumnbtnBtn_Click" OnClientClick="Confirm()"/>                    
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Table ID="gvTable" runat="server" Width="75%" BorderStyle="Solid" BorderColor="#0096D6" BorderWidth="2px" Visible = "false">
            <asp:TableRow>
                <asp:TableCell ColumnSpan="7" Style="vertical-align: top;">
                   <div style="height: 350px; width: 1424px; overflow: auto; ">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true" Visible="true" Width="75%" overflow ="auto" AllowPaging="true" PageIndex="10" OnPageIndexChanging="gvPageIndexChanging" style="white-space:nowrap" Font-Size="Small">                            
                        <HeaderStyle BackColor="#0096D6" ForeColor="White" />
                        </asp:GridView>                        
                        <%--<asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server"></asp:TextBox>--%>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
        
        </asp:Table>
    <asp:Button id="ExporttoExcelBtn" runat="server" visible="false" class="widthcomp1" Style="font-family: HP Simplified" 
                        Text="Export To Excel" OnClick = "ExporttoExcelBtn_Click"  />                    
                
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:content>
