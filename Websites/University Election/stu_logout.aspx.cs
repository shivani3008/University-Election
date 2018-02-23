using System;
using System.Web.UI;

public partial class logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Session.Abandon();
            Response.Redirect("stu_login.aspx");
        }
    }
}