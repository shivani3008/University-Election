using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL;
using System.Data;

public partial class Request : System.Web.UI.Page
{
    BLayer.CollegeAdmin clg_ad_obj = new BLayer.CollegeAdmin();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["clg_ad_id"]) != "")
        {
            dataListBind();

          //  Label l = this.Master.FindControl("lbl_total_request") as Label;
         //   if (l != null)
          //  {
          //      l.Visible = false;
          //  }
        }
    }

    void dataListBind()
    {
        int clg_ad_id = Convert.ToInt32(Session["clg_ad_id"]);
        int clg_id = Convert.ToInt32(Session["clg_id"]);
        DataSet ds = clg_ad_obj.get_all_candidates_by_clg_id(clg_id);
        if (ds.Tables[0].Rows.Count > 0)
        {
            no_request.Visible = false;
            DataList1.DataSource = ds.Tables[0];
            DataList1.DataBind();
        }
        else
        {
            DataList1.DataSource = ds.Tables[0];
            DataList1.DataBind();
            no_request.Visible = true;
        }
    }

    protected void DataList1_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        if (e.CommandName == "onMore")
        {
            int cnd_id = Convert.ToInt32(e.CommandArgument);
            Session["req_cnd_id"] = cnd_id;
            Response.Redirect("clg_ad_view_more_details.aspx");
        }

        if (e.CommandName == "onAccept")
        {
            int cnd_id = Convert.ToInt32(e.CommandArgument);

            int i = clg_ad_obj.onClickAccept(cnd_id);
            if (i > 0)
            {
                dataListBind();
            }
        }

        if (e.CommandName == "onReject")
        {
            int cnd_id = Convert.ToInt32(e.CommandArgument);
            int i = clg_ad_obj.onClickReject(cnd_id);
            if (i > 0)
            {
                dataListBind();
            }
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        dataListBind();
    }
}