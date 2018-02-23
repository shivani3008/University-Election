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
        if (!IsPostBack)
        {
            drp_city.Items.Add(new ListItem("Select City", "0", true));
            drp_clg.Items.Add(new ListItem("Select College", "0", true));
            drp_country_code.Items.Add(new ListItem("Select Country Code", "0", true));

            DataSet ds = bl.get_city();
            ds.Tables[0].DefaultView.Sort = "city_name";
            drp_city.DataSource = ds.Tables[0];
            drp_city.DataTextField = "city_name";
            drp_city.DataValueField = "city_id";
            drp_city.DataBind();
            ds.Clear();

            ds = bl.get_country_code();
            ds.Tables[0].DefaultView.Sort = "country_name";
            ds.Tables[0].Columns.Add("name_code");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ds.Tables[0].Rows[i][3] = ds.Tables[0].Rows[i][2] + " (" + ds.Tables[0].Rows[i][1] + ")";
            }
            drp_country_code.DataSource = ds.Tables[0];
            drp_country_code.DataTextField = "name_code";
            drp_country_code.DataValueField = "country_code_id";
            drp_country_code.DataBind();
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

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        bool isLegal = bl.is_legal_student(txt_enroll_no.Text, txt_fn.Text, txt_ln.Text, Convert.ToInt32(drp_clg.SelectedValue), txt_mob_no.Text, txt_email.Text);
        if (isLegal)
        {
            int i = bl.insert_student(txt_enroll_no.Text, txt_fn.Text, txt_ln.Text, Convert.ToInt32(drp_city.SelectedValue), Convert.ToInt32(drp_clg.SelectedValue), txt_dept.Text, txt_sem.Text, Convert.ToInt32(drp_country_code.SelectedValue), txt_mob_no.Text, rb_gender.SelectedValue, txt_email.Text, txt_pswd.Text);
            if (i > 0)
            {
                Response.Redirect("stu_login.aspx");
            }
        }
        else
        {
            Response.Write("<script>alert('Please enter correct information')</script>");
        }
    }
}