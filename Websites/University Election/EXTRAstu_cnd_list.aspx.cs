using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

using System.Web.UI.WebControls;
using System.Data;
using BAL;
public partial class stu_login : System.Web.UI.Page
{
    BLayer bl = new BLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["reg_id"]) == "")
        {
            Response.Redirect("stu_login.aspx");
        }
        if (!IsPostBack)
        {
            Label1.Text = Session["reg_id"].ToString() + "  " + Session["enroll_no"] + "  " + Session["fn"] + " " + Session["ln"];
        }
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "OnMore")
        {
            int other_cnd_id = Convert.ToInt32(e.CommandArgument);
            Session["other_cnd_id"] = other_cnd_id;
            Response.Redirect("other_cnd_details.aspx");
        }
    }
}