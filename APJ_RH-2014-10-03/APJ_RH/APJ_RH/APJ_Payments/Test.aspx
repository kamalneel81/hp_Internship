<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="APJ_RH.APJ_Payments.Test" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  

   <%-- <asp:GridView ID="GridView1" runat="server" DataKeyNames = "name" 
        OnRowEditing = "GridView1_RowEditing" OnRowUpdating = "GridView1_RowUpdating" 
        OnRowCancelingEdit ="GridView1_RowCancelingEdit" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        AutoGenerateColumns="False" Width="353px">
    <Columns>
       
       
        <asp:CommandField ShowEditButton="true" />
       
       
        <asp:BoundField DataField="name" HeaderText="name"/>
        <asp:BoundField DataField="dept" HeaderText="dept"/>
        <asp:BoundField DataField="grade" HeaderText="grade"/>
        <asp:BoundField DataField="cluster" HeaderText="cluster"/>
        <asp:BoundField DataField="salary" HeaderText="salary"/>
        <asp:BoundField DataField="manager" HeaderText="manager"/>
        <asp:BoundField DataField="teamleader" HeaderText="teamleader"/>
        <asp:BoundField DataField="team" HeaderText="team"/>
        <asp:BoundField DataField="opsmanager" HeaderText="opsmanger"/>
        <asp:BoundField DataField="functionalmanager" HeaderText="functionalmanager"/>
        


        </Columns>
    
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    
    </asp:GridView>--%>
  
    <asp:DropDownList ID="DropDownList1" runat="server" onselectedindexchanged="ddloption_SelectedIndexChanged" AutoPostBack="True">
       <asp:ListItem></asp:ListItem>
       <asp:ListItem>FC</asp:ListItem>
       <asp:ListItem>CI</asp:ListItem>  
    </asp:DropDownList>
  
    <%--<asp:Button ID="LHExtractandUploadBtn" runat="server" 
        onclick="LHExtractandUploadBtn_Click" Text="LHExtractandUploadBtn" />--%>
  
  <asp:Label ID="lblresult" runat="server"></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" Visible = "false" >
    <asp:ListItem>select program</asp:ListItem>
    </asp:DropDownList>

</asp:Content>
