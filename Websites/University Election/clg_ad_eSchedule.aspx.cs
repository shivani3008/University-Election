using System;
using System.Linq;
using BAL;
using System.Data;


public partial class clg_ad_aSchedule : System.Web.UI.Page
{

    BLayer bl = new BLayer();
    BLayer.CollegeAdmin clg_ad_obj = new BLayer.CollegeAdmin();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["es_id"]) != "")
        {
            Response.Redirect("clg_ad_eSchedule_view.aspx");
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        int clg_ad_id = Convert.ToInt32(Session["clg_ad_id"]);
        int clg_id = Convert.ToInt32(Session["clg_id"]);
        int i = clg_ad_obj.addElectionSchedule(clg_id, txt_date.Text, txt_start_time.Text, txt_end_time.Text);
        if (i > 0)
        {
            DataSet ds = clg_ad_obj.getElectionSchedule_by_clg_id(clg_id);
            if(ds.Tables[0].Rows.Count > 0)
            {
                Session["es_id"] = ds.Tables[0].Rows[0]["es_id"].ToString();
                Response.Redirect("clg_ad_eSchedule_view.aspx");
            }
        }
    }
}