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
        if (Convert.ToString(Session["cnd_id"]) != "")
        {
            Response.Redirect("stu_cnd_view.aspx");
        }
        else
        {
            int reg_id = Convert.ToInt32(Session["reg_id"]);

            DataSet ds = bl.get_candidate_reg_id(reg_id);

            if (ds.Tables[0].Rows.Count > 0)
            {
                if (Convert.ToInt32(ds.Tables[0].Rows[0]["active"]) == 1)
                {
                    Session["cnd_id"] = ds.Tables[0].Rows[0]["cnd_id"].ToString();
                    Response.Redirect("stu_cnd_view.aspx");
                }
                else if (Convert.ToInt32(ds.Tables[0].Rows[0]["active"]) == 0)
                {
                    lbl_request.Visible = true;
                    lbl_not_eligible.Visible = false;
                }
                else
                {
                    lbl_not_eligible.Visible = true;
                    lbl_request.Visible = false;
                }
            }
            else
            {
                Response.Redirect("stu_cnd_reg.aspx");
            }
        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Page_Load(sender, e);
    }
}