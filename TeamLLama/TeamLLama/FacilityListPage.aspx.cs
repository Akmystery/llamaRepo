﻿using System;
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
            Account a = new Account();
            a = (Account)Session["Account"];

            if (a == null)
            {
                Response.Redirect("LoginPage.aspx");
            }
            if (!a.accountType.Equals("admin"))
            {
                Response.Redirect("LoginPage.aspx");
            }
            if (!Page.IsPostBack)
            {
                bindFacility();
            }
        }

        private void bindFacility()
        {
            Facility f = new Facility();

            grdFacility.DataSource = FacilityManagementSystem.GetFacility();
            grdFacility.DataBind();

        }

        protected void grdFacility_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdFacility.PageIndex = e.NewPageIndex;
            bindFacility();
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
            //String id = lblFacilityID.Text;
            lbl_id.Text = lblFacilityID.Text;
            deletePopup.Show();
            
        }
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            String id = lbl_id.Text;
            DepartmentManagementSystem.DeleteDepartments(id); //delete child
            FacilityManagementSystem.DeleteFacility(id);
            Response.Write("<script type=\"text/javascript\">alert('Facility Deleted!');location.href='FacilityListPage.aspx'</script>");
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHomePage.aspx");
        }
    }
}