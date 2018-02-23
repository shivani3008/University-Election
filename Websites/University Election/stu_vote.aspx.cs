using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL;
using System.Data;
using System.Drawing;

public partial class stu_vote : System.Web.UI.Page
{
    BLayer.Student stu_obj = new BLayer.Student();
    BLayer bl = new BLayer();
    string already_voted = "You have already voted for this post";
    string es_not_declare = "Election Schedule is not declared yet";
    string voting_soon = "Voting will be commenced soon";
    string no_cnd = "No candidates";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if(Session["es_id"] == null)
            {
                lbl_msg.Text = es_not_declare;
                lbl_msg.ForeColor = Color.Red;
                drp_post.Visible = false;
            }
            else
            { 
                BLayer.CollegeAdmin clg_ad_obj = new BLayer.CollegeAdmin();
                string year = DateTime.Now.Year.ToString();
                string month = DateTime.Now.Month.ToString();
                if (Convert.ToInt32(month) < 10)
                {
                    month = "0" + month;
                }
                string day = DateTime.Now.Day.ToString();
                if (Convert.ToInt32(day) < 10)
                {
                    day = "0" + day;
                }
                string minute = DateTime.Now.TimeOfDay.Minutes.ToString();
                if (Convert.ToInt32(minute) < 10)
                {
                    minute = "0" + minute;
                }
                string hour = DateTime.Now.TimeOfDay.Hours.ToString();
                if (Convert.ToInt32(hour) < 10)
                {
                    hour = "0" + hour;
                }


                string date = year + "-" + month + "-" + day;
                string time = hour + ":" + minute;

                int clg_id = Convert.ToInt32(Session["clg_id"]);
                DataSet ds = clg_ad_obj.getElectionSchedule_by_clg_id_date(clg_id, date, time);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ds = bl.get_post();
                    ds.Tables[0].DefaultView.Sort = "post_name";
                    drp_post.DataSource = ds.Tables[0];
                    drp_post.DataTextField = "post_name";
                    drp_post.DataValueField = "post_id";
                    drp_post.DataBind();
                    drp_post.Visible = true;
                    ds.Clear();
                }
                else
                {
                    int i = clg_ad_obj.checkElectionScheduleResult(clg_id, date, time);
                    if (i == 0)
                    {
                        lbl_msg.Text = voting_soon;
                        lbl_msg.ForeColor = Color.ForestGreen;
                        drp_post.Visible = false;
                        ds.Clear();
                    }
                    else if(i == 1)
                    {
                        Response.Redirect("stu_final_result.aspx");
                    }
                }
            }
        }
    }

    void dataListBind()
    {
        int reg_id = Convert.ToInt32(Session["reg_id"]);
        DataSet ds1 = stu_obj.isAlreadyVoted(reg_id, Convert.ToInt32(drp_post.SelectedValue));
        if (ds1.Tables[0].Rows.Count > 0)
        {
            lbl_msg.Text = already_voted;
            lbl_msg.ForeColor = Color.Red;
            drp_post.Visible = true;
            DataList1.DataSource = null;
            DataList1.DataBind();
        }
        else
        {
            int clg_id = Convert.ToInt32(Session["clg_id"]);
            DataSet ds = stu_obj.get_candidates_by_clg_id_post_id(clg_id, Convert.ToInt32(drp_post.SelectedValue));
            if (ds.Tables[0].Rows.Count > 0)
            {
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
    }

    protected void DataList1_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        if (e.CommandName == "onMore")
        {
            int cnd_id = Convert.ToInt32(e.CommandArgument);
            Session["req_cnd_id"] = cnd_id;
            Response.Redirect("stu_view_more_details.aspx");
        }

        if (e.CommandName == "onVote")
        {
            int reg_id = Convert.ToInt32(Session["reg_id"]);
            int cnd_id = Convert.ToInt32(e.CommandArgument);

            int post_id = -1;
            DataSet ds = stu_obj.get_post_name_by_cnd_id(cnd_id);
            if (ds.Tables[0].Rows.Count > 0)
            {
                post_id = Convert.ToInt32(ds.Tables[0].Rows[0]["post_id"]);
            }

            int i = stu_obj.onAddVote(reg_id, cnd_id, post_id);
            if (i > 0)
            {
                dataListBind();
            }
        }
    }

    protected void drp_post_SelectedIndexChanged(object sender, EventArgs e)
    {
        dataListBind();
    }
}