<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailPage.aspx.cs" Inherits="APJ_RH.APJ_Payments.MailPage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<script src="../tiny_mce/tiny_mce.js" type="text/javascript"></script>
<script type="text/javascript">
    tinyMCE.init({

        mode: "textareas",
        theme: "simple",
        plugins: "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount"


    }); 
</script>
<head runat="server">
<a href="MailPage.aspx">MailPage.aspx</a>
    <title></title>
</head>
<body>
    <form id="MailPage" runat="server">
      <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div>
     <table border="1" width="100%">
            <tr>
                <td rowspan="7" style="vertical-align: top;" Width = "5%">
                   <asp:Button ID="SendBtn" runat="server" Text="Send" valign="Bottom" Width="55px"
                        Height="140px" OnClick="SendBtn_Click" /><asp:HiddenField ID="HFPPID" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Fromlbl" runat="server" Text="From:" Width="10%"></asp:Label>
                    <asp:TextBox ID="FromTxt" runat="server" Width="85%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Tolbl" runat="server" Text="To:" Width="10%"></asp:Label>
                    <asp:TextBox ID="ToTxt" runat="server" Width="85%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="CClbl" runat="server" Text="CC:" Width="10%"></asp:Label>
                    <asp:TextBox ID="CCTxt" runat="server" Width="85%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="BCClbl" runat="server" Text="BCC:" Width="10%"></asp:Label>
                    <asp:TextBox ID="BCCTxt" runat="server" Width="85%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Subjectlbl" runat="server" Text="Subject:" Width="10%"></asp:Label>
                    <asp:TextBox ID="SubjectTxt" runat="server" Width="85%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="AttachMentlbl" runat="server" Text="Attachment" Width="5%"></asp:Label>
                    <asp:HyperLink ID="attach" runat="server"  Width="5%" Target="_blank" ></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="8">
                    <table id="mailBody" cellpadding="0" cellspacing="0" width="100%" border="1">
                        <tr>
                            <td width="100%">
                                <%--<asp:Label ID="Label1" runat="server" Text="Compensation Bonus Letter"></asp:Label>--%>
                                <%--<asp:TextBox ID="RichTextBox1" runat="server" rows="30" cols="80" 
                                    textmode="MultiLine" Width="100%"/><br> 
--%>
                                    <%--<cc1:Editor ID="Rich_TextBox" runat="server" Height="400px" 
                                     Width="100%" />--%>
                              <%--  <asp:TextBox ID="TextBox1" runat="server" rows="30" cols="80" 
                                    textmode="MultiLine" Width="1415px"></asp:TextBox>--%>
                                <div id="dtest" runat="server" style= "width:auto">
                                
                                </div>
                                    
                                   <%-- <asp:ListBox ID="lstmess" runat="server" Width="1415px">
                                        <asp:ListItem></asp:ListItem>
                                    </asp:ListBox>--%>

                                   <%-- <asp:ComboBox ID="TextBox1" runat="server" Height="400px" Width="100%" 
                                    DropDownStyle="Simple"></asp:ComboBox>--%>
                                     <%--<asp:HtmlEditorExtender ID="HtmlEditorExtender1" 
            TargetControlID="TextBox1" DisplaySourceTab="true" 
            runat="server" EnableSanitization="False" />
            <Toolbar> 
                                <br />
                <ajaxToolkit:Undo />
                <ajaxToolkit:Redo />
                <ajaxToolkit:Bold />
                <ajaxToolkit:Italic />
                <ajaxToolkit:Underline />
                <ajaxToolkit:StrikeThrough />
                <ajaxToolkit:Subscript />
                <ajaxToolkit:Superscript />
                <ajaxToolkit:JustifyLeft />
                <ajaxToolkit:JustifyCenter />
                <ajaxToolkit:JustifyRight />
                <ajaxToolkit:JustifyFull />
                <ajaxToolkit:InsertOrderedList />
                <ajaxToolkit:InsertUnorderedList />
                <ajaxToolkit:CreateLink />
                <ajaxToolkit:UnLink />
                <ajaxToolkit:RemoveFormat />
                <ajaxToolkit:SelectAll />
                <ajaxToolkit:UnSelect />
                <ajaxToolkit:Delete />
                <ajaxToolkit:Cut />
                <ajaxToolkit:Copy />
                <ajaxToolkit:Paste />
                <ajaxToolkit:BackgroundColorSelector />
                <ajaxToolkit:ForeColorSelector />
                <ajaxToolkit:FontNameSelector />
                <ajaxToolkit:FontSizeSelector />
                <ajaxToolkit:Indent />
                <ajaxToolkit:Outdent />
                <ajaxToolkit:InsertHorizontalRule />
                <ajaxToolkit:HorizontalSeparator />
                <ajaxToolkit:InsertImage />
            </Toolbar>
        </asp:HtmlEditorExtender>--%>
                            </td>
                           
                        </tr>
                       
                    </table>
                </td>
            </tr>
        </table>

    </div>
    </form>
</body>
</html>
