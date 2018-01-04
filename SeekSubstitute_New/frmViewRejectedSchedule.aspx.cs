using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SeekSubstitute_New
{
    public partial class frmViewRejectedSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "readRejectedData", "readRejectedData();", true);
                BindListViewRejected();
            }

        }

        private void BindListViewRejected()
        {
            ClientScript.RegisterStartupScript(this.GetType(), "readRejectedData", "readRejectedData();", true);
            string JsonString = Request.Form["demoReject"];
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
                lvNotGoingSchedule.DataSource = dt;
                lvNotGoingSchedule.DataBind();
                lvNotGoingSchedule.Visible = true;
            }
        }
        protected void lnkAlert_Click(object sender, EventArgs e)
        {
            lnkAlert.CssClass = "btn btn-primary";
            Panel2.Visible = true;
            BindListViewRejected();
        }

        protected void lvNotGoingSchedule_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (String.Equals(e.CommandName, "AcceptJob"))
            {
                string lectureId = e.CommandArgument.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "AcceptJob", "acceptJob('" + lectureId + "');", true);
                BindListViewRejected();
            }
        }
    }
}