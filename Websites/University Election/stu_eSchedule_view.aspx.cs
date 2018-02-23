using System;
using BAL;
using System.Data;
using System.Web.UI.WebControls;

public partial class stu_eSchedule_view : System.Web.UI.Page
{
    BLayer.CollegeAdmin clg_ad_obj = new BLayer.CollegeAdmin();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["es_id"]) == "")
        {
            lbl_es.Visible = true;
        }
        if (!IsPostBack)
        {
            databind_es();
        }
    }

    protected void databind_es()
    {
        int clg_id = Convert.ToInt32(Session["clg_id"]);
        DataSet ds = clg_ad_obj.getElectionSchedule_by_clg_id(clg_id);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lbl_es.Visible = false;
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
    }
    protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        databind_es();
    }

    protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        databind_es();
    }

    protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label es_id = (Label)row.FindControl("lbl_ees_id");
        //Label clg_id = (Label)row.FindControl("lbl_eclg_id");
        TextBox date = (TextBox)row.FindControl("txt_date");
        TextBox start_time = (TextBox)row.FindControl("txt_start_time");
        TextBox end_time = (TextBox)row.FindControl("txt_end_time");
        GridView1.EditIndex = -1;
        int i = clg_ad_obj.updateElectionSchedule(Convert.ToInt32(es_id.Text), date.Text, start_time.Text, end_time.Text);
        databind_es();
    }
}