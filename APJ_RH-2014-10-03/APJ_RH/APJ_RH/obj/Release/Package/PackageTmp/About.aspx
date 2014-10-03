<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="APJ_RH.About" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Button ID="CloseSplitPaymentStatusBtn" runat="server" class="widthcomp1" Style="font-family: HP Simplified"
                        Text="Close Split Payment Status"  href="#CloseSplitStatusModal" data-toggle="modal" Visible="true"  OnClick="CloseSplitPaymentStatusBtn_Click"/>
    
    <div class="modal hide fade" data-backdrop="false" id="CloseSplitStatusModal" tabindex="-1"
        role="dialog" aria-labelledby="CloseSplitStatusModalLabel" aria-hidden="true" onload = "Page_Load">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button><h3>
                            Close Split Payment Status Comments </h3></div><div class="modal-body">
                    <asp:Label ID="Label1" class="widthcomp" Style="font-family: HP Simplified"
                        runat="server">Choose the Team Name</asp:Label><br />
                    <asp:DropDownList ID="SelectTeamList" class="widthcomp" Style="font-family: HP Simplified"
                    runat="server">
                        <asp:ListItem></asp:ListItem>
                    <asp:ListItem>FC Payments</asp:ListItem>
                    <asp:ListItem>CI Payments</asp:ListItem>
                </asp:DropDownList>
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
