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
            DataSet ds = bl.get_city();
            drp_city.DataSource = ds;
            drp_city.DataTextField = "city_name";
            drp_city.DataValueField = "city_id";
            drp_city.DataBind();

            databind_clg();
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        int i = bl.insert_clg(Convert.ToInt32(drp_city.SelectedValue), txt_clg_code.Text, txt_clg.Text);
        if (i > 0)
        {
            txt_clg.Text = "";
            txt_clg_code.Text = "";
            databind_clg();
        }
    }

    protected void databind_clg()
    {
        DataSet ds = bl.get_clg();
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        databind_clg();

        GridViewRow row = (GridViewRow)GridView1.Rows[e.NewEditIndex];
        DropDownList drp_city = (DropDownList)row.FindControl("drp_city_name");
        DataSet ds = bl.get_city();
        drp_city.DataSource = ds;
        drp_city.DataTextField = "city_name";
        drp_city.DataValueField = "city_id";
        drp_city.DataBind();
    }

    protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        databind_clg();
    }

    protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        //int city_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbl_id = (Label)row.FindControl("lbl_eclg_id");
        DropDownList drp_city = (DropDownList)row.FindControl("drp_city_name");
        TextBox txt_code = (TextBox)row.FindControl("txt_clg_code");
        TextBox txt_clg = (TextBox)row.FindControl("txt_clg_name");
        GridView1.EditIndex = -1;
        int i = bl.update_clg(Convert.ToInt32(lbl_id.Text), Convert.ToInt32(drp_city.SelectedValue), Convert.ToInt32(txt_code.Text), txt_clg.Text);
        databind_clg();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        databind_clg();
    }
}
