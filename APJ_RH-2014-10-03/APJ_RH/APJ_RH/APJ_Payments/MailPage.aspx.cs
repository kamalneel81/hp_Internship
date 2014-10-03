using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.Office.Interop.Word;
using outlook = Microsoft.Office.Interop.Outlook;
using System.Net.Mail;
using Microsoft.Office.Interop.Excel;
using Aspose.Email;
using Aspose.Email.Mail;
using Aspose.Email.Outlook;
namespace APJ_RH.APJ_Payments
{
    public partial class MailPage : System.Web.UI.Page
    {
        RHcls rh = new RHcls();
        //string pproid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Msg_oft = Server.MapPath("MailTemplate/" + "ManagersApprovalforID.oft");
                Aspose.Email.Mail.MailMessage message = Aspose.Email.Mail.MailMessage.Load(Msg_oft, MesageLoadOptions.DefaultMsg);


                // Set the sender and recipients information

                string senderEmailAddress = "syed.sikandar-pasha@hp.com";
                string recipientEmailAddress = "syed.sikandar-pasha@hp.com";
                string CCEmailAddress = "syed.sikandar-pasha@hp.com";
                //string test;
                message.From = new Aspose.Email.Mail.MailAddress(senderEmailAddress);
                message.To.Add(new Aspose.Email.Mail.MailAddress(recipientEmailAddress));
                message.CC.Add(new Aspose.Email.Mail.MailAddress(CCEmailAddress));
                message.IsBodyHtml = true;
                SendBtn.Enabled = false;
                BCCTxt.Text = Session["GlobalEmailID"].ToString();
                //FromTxt.Text = FromID;
                //ToTxt.Text = ToID;
                //CCTxt.Text = CCID;
                SubjectTxt.Text = "";
                dtest.InnerHtml = message.HtmlBody;

            }
        }


        public string RetrieveStream(string FullName)
        {
            string stream = null;
            using (StreamReader sr = new StreamReader(FullName))
            {
                string line = null;
                while ((line = sr.ReadLine()) != null)
                {
                    stream += line;
                }
            }

            return stream;
        }

        protected void SendBtn_Click(object sender, EventArgs e)
        {
            string ToID = ToTxt.Text;
            string FromID = FromTxt.Text;
            string CCID = CCTxt.Text;
            string Subject = SubjectTxt.Text;
            //string body = TextBox1.Text;
            //string result = rh.SendMail1("syed.sikandar-pasha@hp.com", "syed.sikandar-pasha@hp.com", "Check", body, Server.MapPath("/Comp/docs/" + HFPPID.Value.ToString() + ".pdf"));
        }
        
             
    



    }
}