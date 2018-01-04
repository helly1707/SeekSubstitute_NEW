using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.IO;
using System.Net;
using System.Net.Mail;

namespace SeekSubstitute_New
{
    public partial class frmViewSchedule : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "readData", "readData();", true);
            }
        }

        private void BindListViewGoing()
        {
            ClientScript.RegisterStartupScript(this.GetType(), "readData", "readData();", true);
            string JsonString = Request.Form["demo"];
            //string JsonString = demo.Value.ToString();
            if (JsonString != "" && JsonString != "]" && JsonString != null)
            {
                DataTable dt = (DataTable)JsonConvert.DeserializeObject(JsonString, (typeof(DataTable)));
            Again:
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    DataColumnCollection columns = dt.Columns;
                    DataColumn col = dt.Columns[i];
                    if (col.ColumnName.ToLower() == "lectureid" || col.ColumnName.ToLower() == "country" || col.ColumnName.ToLower() == "going" || col.ColumnName.ToLower() == "schoolname" || col.ColumnName.ToLower() == "subject" || col.ColumnName.ToLower() == "date" || col.ColumnName.ToLower() == "time")
                    {

                    }
                    else
                    {
                        if (columns.Contains(col.ColumnName))
                        {
                            dt.Columns.Remove(col);
                            goto Again;
                        }
                    }
                    dt.AcceptChanges();
                }
                dt.Columns["country"].ColumnName = "Country";
                dt.Columns["date"].ColumnName = "Date";
                dt.Columns["time"].ColumnName = "Time";
                dt.Columns["schoolName"].ColumnName = "SchoolName";
                dt.Columns["subject"].ColumnName = "Subject";
                dt.Columns["lectureId"].ColumnName = "LectureId";
                lvSchedule.DataSource = dt;
                lvSchedule.DataBind();
                lvSchedule.Visible = true;
            }
        }

       

        protected void lvSchedule_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (String.Equals(e.CommandName, "RejectJob"))
            {
                string lectureId = e.CommandArgument.ToString();
                //ClientScript.RegisterStartupScript(this.GetType(), "RejectJob", "rejectJob('" + lectureId + "');", true);              
                string JsonString = Request.Form["emailid"].ToString();
                string str = JsonString.Remove(JsonString.Length-1).Replace("[","").Replace("\"","");
                string[] emailId = str.Split(',');
                foreach (string data in emailId)
                {
                    try
                    {
                        MailMessage umail = new MailMessage();
                        umail.To.Add(data);
                        umail.From = new MailAddress("leadingout007@gmail.com");
                        umail.Subject = "sub";

                        umail.Body = "Body";

                        umail.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
                        smtp.Credentials = new System.Net.NetworkCredential
                             ("leadingout007@gmail.com", "blue@888"); // ***use valid credentials***
                        smtp.Port = 587;

                        //Or your Smtp Email ID and Password
                        smtp.EnableSsl = true;
                        smtp.Send(umail);
                    }
                    catch (Exception ex)
                    {

                    }


                    SmtpClient smtpClient = new SmtpClient("leadingout007@gmail.com",25);

                    smtpClient.Credentials = new System.Net.NetworkCredential("leadingout007@gmail.com", "blue@888");
                    smtpClient.UseDefaultCredentials = true;
                    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtpClient.EnableSsl = true;
                    MailMessage mail = new MailMessage();

                    //Setting From , To and CC
                    mail.From = new MailAddress("leadingout007@gmail.com","Leading Out");
                    mail.To.Add(new MailAddress(data));
                    //mail.CC.Add(new MailAddress(data));

                    smtpClient.Send(mail);
                }
                BindListViewGoing();
            }
        }

        protected void lnkViewData_Click(object sender, EventArgs e)
        {
            lnkFeed.CssClass = "btn btn-primary";
            Panel1.Visible = true;
            BindListViewGoing();
        }
    }
}