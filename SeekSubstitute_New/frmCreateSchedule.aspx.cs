using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SeekSubstitute_New
{
    public partial class frmCreateSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtCountry.Text = "";
            txtSchool.Text = "";
            txtSubject.Text = "";
        }
    }
}