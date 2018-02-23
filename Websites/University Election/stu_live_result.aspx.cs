using System;
using BAL;
using System.Data;
using System.Drawing;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class stu_live_result : System.Web.UI.Page
{
    BLayer.Student stu_obj = new BLayer.Student();
    BLayer bl = new BLayer();
    string es_not_declare = "Election Schedule is not declared yet";
    string no_cnd = "No candidates";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["es_id"] == null)
            {
                lbl_msg.Text = es_not_declare;
                lbl_msg.ForeColor = Color.Red;
                drp_post.Visible = false;
            }
            else
            {
                BLayer.CollegeAdmin clg_ad_obj = new BLayer.CollegeAdmin();
                int clg_id = Convert.ToInt32(Session["clg_id"]);
                DataSet ds = bl.get_post();
                ds.Tables[0].DefaultView.Sort = "post_name";
                drp_post.DataSource = ds.Tables[0];
                drp_post.DataTextField = "post_name";
                drp_post.DataValueField = "post_id";
                drp_post.DataBind();
                drp_post.Visible = true;
                ds.Clear();
            }
        }
    }

    void dataListBind()
    {
        int reg_id = Convert.ToInt32(Session["reg_id"]);
        int clg_id = Convert.ToInt32(Session["clg_id"]);
        DataSet ds = stu_obj.get_candidates_by_clg_id_post_id(clg_id, Convert.ToInt32(drp_post.SelectedValue));
        ds.Tables[0].Columns.Add("total_votes");
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                int cnd_id = Convert.ToInt32(ds.Tables[0].Rows[i]["cnd_id"]);
                DataSet ds_res = stu_obj.get_live_result_by_cnd(Convert.ToInt32(drp_post.SelectedValue), cnd_id);
                if (ds_res.Tables[0].Rows.Count > 0)
                {
                    ds.Tables[0].Rows[i]["total_votes"] = ds_res.Tables[0].Rows[0]["total_votes"];
                }
            }
            DataList1.DataSource = ds.Tables[0];
            DataList1.DataBind();

            lbl_msg.Text = "";
        }
        else
        {
            DataList1.DataSource = ds.Tables[0];
            DataList1.DataBind();
            lbl_msg.Text = no_cnd;
            lbl_msg.ForeColor = Color.Gray;
            drp_post.Visible = true;
        }
    }

    protected void DataList1_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        if (e.CommandName == "onMore")
        {
            int cnd_id = Convert.ToInt32(e.CommandArgument);
            Session["req_cnd_id"] = cnd_id;
            Response.Redirect("stu_view_more_details.aspx");
        }
    }

    protected void drp_post_SelectedIndexChanged(object sender, EventArgs e)
    {
        dataListBind();
    }
}