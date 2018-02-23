using System;
using BAL;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class stu_login : System.Web.UI.Page
{
    BLayer bl = new BLayer();
    BLayer.CollegeAdmin clg_ad_obj = new BLayer.CollegeAdmin();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            drp_city.Items.Add(new ListItem("Select City", "0", true));
            drp_clg.Items.Add(new ListItem("Select College", "0", true));

            DataSet ds = bl.get_city();
            ds.Tables[0].DefaultView.Sort = "city_name";
            drp_city.DataSource = ds.Tables[0];
            drp_city.DataTextField = "city_name";
            drp_city.DataValueField = "city_id";
            drp_city.DataBind();
            ds.Clear();
        }
    }

    protected void drp_city_SelectedIndexChanged(object sender, EventArgs e)
    {
        drp_clg.Items.Clear();
        drp_clg.Items.Add(new ListItem("Select College", "0", true));
        DataSet ds = bl.get_selected_clg(Convert.ToInt32(drp_city.SelectedValue));
        ds.Tables[0].DefaultView.Sort = "clg_name";
        ds.Tables[0].Columns.Add("clg_name_code");
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i][4] = ds.Tables[0].Rows[i][3] + " (" + ds.Tables[0].Rows[i][2] + ")";
        }
        drp_clg.DataSource = ds.Tables[0];
        drp_clg.DataTextField = "clg_name_code";
        drp_clg.DataValueField = "clg_id";
        drp_clg.DataBind();
        ds.Clear();
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        DataSet ds = clg_ad_obj.get_all_clg_ad(Convert.ToInt32(drp_clg.SelectedValue), txt_pswd.Text);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["clg_ad_id"] = ds.Tables[0].Rows[0][0].ToString();
            Session["clg_id"] = ds.Tables[0].Rows[0][1].ToString();
            ds.Clear();

            ds = clg_ad_obj.getElectionSchedule_by_clg_id(Convert.ToInt32(Session["clg_id"]));
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["es_id"] = ds.Tables[0].Rows[0]["es_id"].ToString();
            }

            Response.Redirect("clg_ad_request.aspx");
        }
        else
        {
            Response.Write("<script>alert('Invalid Email or Password')</script>");
        }
    }
}