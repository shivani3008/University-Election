using System;
using BAL;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{
    BLayer bl = new BLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["clg_ad_id"] != null)
            {
                Response.Redirect("clg_ad_request.aspx");
            }
        }
    }
}