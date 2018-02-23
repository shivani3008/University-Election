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
            DataSet ds = stu_obj.get_live_result();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DataSet ds1 = stu_obj.get_result_by_cnd_id(Convert.ToInt32(ds.Tables[0].Rows[i]["cnd_id"]));
                if (ds1.Tables[0].Rows.Count > 0)
                {}
                else
                {
                    stu_obj.insert_result(Convert.ToInt32(ds.Tables[0].Rows[i]["cnd_id"]), Convert.ToInt32(ds.Tables[0].Rows[i]["post_id"]), Convert.ToInt32(ds.Tables[0].Rows[i]["vote_count"]));
                }
            }

            DataSet ds_extra = stu_obj.get_final_result();
            for (int i = 0; i < ds_extra.Tables[0].Rows.Count; i++)
            {
                DataSet ds1 = stu_obj.get_final_result_by_cnd_id(Convert.ToInt32(ds_extra.Tables[0].Rows[i]["cnd_id"]));
                if (ds1.Tables[0].Rows.Count > 0)
                { }
                else
                {
                    stu_obj.insert_final_result(Convert.ToInt32(ds_extra.Tables[0].Rows[i]["cnd_id"]), Convert.ToInt32(ds_extra.Tables[0].Rows[i]["post_id"]), Convert.ToInt32(ds_extra.Tables[0].Rows[i]["vote_count"]));
                }
            }
            dataListBind();
        }
    }

    void dataListBind()
    {
        int reg_id = Convert.ToInt32(Session["reg_id"]);
        int clg_id = Convert.ToInt32(Session["clg_id"]);
        DataSet ds = stu_obj.get_final_result_by_clg_id(clg_id);
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
    
}