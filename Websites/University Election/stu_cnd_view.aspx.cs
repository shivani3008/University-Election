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
        if (!IsPostBack)
        {
            int reg_id = Convert.ToInt32(Session["reg_id"]);
            int cnd_id = Convert.ToInt32(Session["cnd_id"]);

            DataSet ds = bl.view_candidate(cnd_id);
            ds.Tables[0].Columns.Add("fn");
            ds.Tables[0].Columns.Add("ln");

            if (ds.Tables[0].Rows.Count > 0)
            {
                ds.Tables[0].Rows[0][4] = Session["fn"];
                ds.Tables[0].Rows[0][5] = Session["ln"];
                DataList1.DataSource = ds.Tables[0];
                DataList1.DataBind();
            }
            ds.Clear();
        }
    }
}