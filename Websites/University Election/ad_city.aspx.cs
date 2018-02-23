using System;
using BAL;
using System.Data;
using System.Web.UI.WebControls;

public partial class stu_login : System.Web.UI.Page
{
    BLayer bl = new BLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            databind_city();
        }
    }

    protected void databind_city()
    {
        DataSet ds = bl.get_city();
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        int i = bl.insert_city(txt_city.Text.ToString());
        if(i > 0)
        {
            txt_city.Text = "";
            databind_city();
        }
    }

    protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        databind_city();
    }

    protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        databind_city();
    }

    protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        //int city_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row= (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbl_id = (Label)row.FindControl("lbl_ecity_id");
        TextBox txt_city = (TextBox)row.FindControl("txt_city_name");
        GridView1.EditIndex = -1;
        int i = bl.update_city(Convert.ToInt32(lbl_id.Text), txt_city.Text);
        databind_city();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        databind_city();
    }
}