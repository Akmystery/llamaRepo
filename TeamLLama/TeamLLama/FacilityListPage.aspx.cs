using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeamLLama.Controller;
using TeamLLama.Entity;


namespace TeamLLama
{
    public partial class FacilityList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bindFacility();
            }
        }

        private void bindFacility()
        {
            Facility f = new Facility();

            FacilityManagementSystem app = new FacilityManagementSystem();
            grdFacility.DataSource = app.GetFacility();
            grdFacility.DataBind();

        }

        protected void btnUpdate_click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            System.Web.UI.WebControls.Label lblFacilityID = grdFacility.Rows[i].FindControl("lblFacilityID") as System.Web.UI.WebControls.Label;
            String id = lblFacilityID.Text;
            Session["fac_id"] = id;
            Response.Redirect("UpdateFacilityPage.aspx");
        }

        protected void btnDelete_click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            System.Web.UI.WebControls.Label lblFacilityID = grdFacility.Rows[i].FindControl("lblFacilityID") as System.Web.UI.WebControls.Label;
            String id = lblFacilityID.Text;
            FacilityManagementSystem app = new FacilityManagementSystem();
            DepartmentManagementSystem dpp = new DepartmentManagementSystem();
            dpp.DeleteDepartments(id); //delete child
            app.DeleteFacility(id);
            Response.Write("<script type=\"text/javascript\">alert('Facility Deleted!');location.href='FacilityListPage.aspx'</script>");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHomePage.aspx");
        }
    }
}