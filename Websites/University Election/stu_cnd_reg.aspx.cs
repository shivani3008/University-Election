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
        if (Convert.ToString(Session["reg_id"]) == "")
        {
            Response.Redirect("stu_login.aspx");
        }
        if (Convert.ToString(Session["cnd_id"]) != "")
        {
            Response.Redirect("stu_cnd_view.aspx");
        }
        if (!IsPostBack)
        {
            drp_post.Items.Add(new ListItem("Select Post", "0", true));

            DataSet ds = bl.get_post();
            ds.Tables[0].DefaultView.Sort = "post_name";
            drp_post.DataSource = ds.Tables[0];
            drp_post.DataTextField = "post_name";
            drp_post.DataValueField = "post_id";
            drp_post.DataBind();
            ds.Clear();
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string profile_photo_url = "";
        int reg_id = Convert.ToInt32(Session["reg_id"].ToString());
        string currentDateTime = string.Format("{0:mmddyyhhmmss}", DateTime.UtcNow);
        if (fu_profile_photo.HasFile)
        {
            profile_photo_url = "~/Lib/images/" + reg_id + "_" + currentDateTime + ".jpg";
            fu_profile_photo.SaveAs(Server.MapPath(profile_photo_url));
        }
        int i = bl.insert_candidate(reg_id, txt_unions.Text, Convert.ToInt32(drp_post.SelectedValue), Convert.ToInt32(txt_percentage.Text), profile_photo_url);
        if(i > 0)
        {
            lbl_request.Visible = true;
        }
       // int cnd_id = bl.get_cnd_id(reg_id);
       // Session["cnd_id"] = cnd_id;

       // Response.Redirect("stu_cnd_view.aspx");
    }
}