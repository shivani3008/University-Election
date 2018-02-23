using System;
using BAL;
using System.Data;

public partial class stu_login : System.Web.UI.Page
{
    BLayer bl = new BLayer();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lnk_reg_Click(object sender, EventArgs e)
    {
        Response.Redirect("stu_registration.aspx");
    }

    protected void lnk_forget_pswd_Click(object sender, EventArgs e)
    {
        Response.Redirect("stu_forget_pswd.aspx");
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        DataSet ds = bl.get_student(txt_enroll_no.Text, txt_pswd.Text);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["reg_id"] = ds.Tables[0].Rows[0][0].ToString();
            Session["enroll_no"] = ds.Tables[0].Rows[0][1].ToString();
            Session["fn"] = ds.Tables[0].Rows[0][2].ToString();
            Session["ln"] = ds.Tables[0].Rows[0][3].ToString();
            int clg_id = Convert.ToInt32(ds.Tables[0].Rows[0]["clg_id"]);
            Session["clg_id"] = clg_id.ToString();
            Session["email"] = ds.Tables[0].Rows[0][11].ToString();
            ds.Clear();

            ds = bl.get_candidate_reg_id(Convert.ToInt32(Session["reg_id"]));
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (Convert.ToInt32(ds.Tables[0].Rows[0]["active"]) == 1)
                {
                    Session["cnd_id"] = ds.Tables[0].Rows[0]["cnd_id"].ToString();
                }
            }

            BLayer.CollegeAdmin clg_ad_obj = new BLayer.CollegeAdmin();
            ds = clg_ad_obj.getElectionSchedule_by_clg_id(clg_id);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["es_id"] = ds.Tables[0].Rows[0]["es_id"].ToString();
            }

            ds.Clear();
            Response.Redirect("stu_vote.aspx");
        }
        else
        {
            Response.Write("<script>alert('Invalid Email or Password')</script>");
        }
    }
}