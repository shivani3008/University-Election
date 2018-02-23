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
        if (Session["clg_id"] != null)
        {
            DataSet ds = bl.get_clg_by_clg_id(Convert.ToInt32(Session["clg_id"]));
            string clg_name = ds.Tables[0].Rows[0]["clg_name"] + " (" + ds.Tables[0].Rows[0]["clg_code"] + ")";
            lbl_clg_name.Text = clg_name;
        }
        if (!IsPostBack)
        {
            if (Session["clg_ad_id"] == null)
                Response.Redirect("clg_ad_login.aspx");
            else
            {
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
            }
        }
    }
}
