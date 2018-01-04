using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SeekSubstitute_New
{
    public partial class MyProfile4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                name.ReadOnly = true;
                email.ReadOnly = true;
                country.ReadOnly = true;
                subject.ReadOnly = true;
                qualification.ReadOnly = true;
                txtaboutme.ReadOnly = true;
            }
        }

        protected void lnkMsg_Click(object sender, EventArgs e)
        {

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if(btnEdit.Text == "Edit")
            {
                name.ReadOnly = false;
                country.ReadOnly = false;
                subject.ReadOnly = false;
                qualification.ReadOnly = false;
                txtaboutme.ReadOnly = false;
                btnEdit.Text = "Update";
            }
            else if(btnEdit.Text == "Update")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "updateData", "updateData();", true);
            }

        }
    }
}