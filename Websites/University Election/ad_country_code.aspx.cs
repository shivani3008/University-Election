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
            databind_country_code();
        }
    }

    protected void databind_country_code()
    {
        DataSet ds = bl.get_country_code();
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        int i = bl.insert_country_code(txt_country_code.Text, txt_country_name.Text);
        if(i > 0)
        {
            txt_country_code.Text = "";
            txt_country_name.Text = "";
            databind_country_code();
        }
    }

    protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        databind_country_code();
    }

    protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        databind_country_code();
    }

    protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        //int city_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row= (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbl_id = (Label)row.FindControl("lbl_eccid");
        TextBox txt_ccode = (TextBox)row.FindControl("txt_ccode");
        TextBox txt_cname = (TextBox)row.FindControl("txt_cname");
        GridView1.EditIndex = -1;
        int i = bl.update_country_code(Convert.ToInt32(lbl_id.Text), txt_ccode.Text, txt_cname.Text);
        databind_country_code();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        databind_country_code();
    }
}